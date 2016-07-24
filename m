From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 14:10:28 -0700
Subject: [Buildroot] [PATCH v11 2/2] docker-engine: new package
In-Reply-To: <1469394628-19412-1-git-send-email-christian@paral.in>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
Message-ID: <1469394628-19412-2-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker is a platform to build, ship, and run applications in portable
containers.

Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes since v1:
 - use call github to build source URL
Changes since v3:
 - fix help indentation in Config.in
 - use HOST_GO_TARGET_ENV as a base for build env vars
 - cleanup build commands
 - cleanup GOPATH and vendor directory setup
 - Remove selections for graph drivers. Docker will gracefully degrade
   at runtime to the best available graphdriver. It is unnecessary to
   disable these at build time, or to pull in any other dependencies
   like aufs-util or btrfs tools. The daemon will use whatever is
   available at runtime.
Changes since v4:
 - remove commit hash from version scheme
Changes since v5:
 - re-introduce graphdriver selections
 - these selections are required for btrfs and devicemapper
 - there are buildtime dependencies on headers.
 - bump to v1.12.0-rc3
 - remove hack/vendor.sh call, it is unnecessary, dependencies are
   pre-vendored into the source tree.
Changes since v6:
 - remove build-time dependency on docker-containerd and runc
 - install dockerd only if daemon is enabled
 - move all daemon dependencies into daemon selection
 - only install sysv, users, etc if daemon is enabled
 - add a proper sysv init file
 - remove DOCKER_OPTS in init file
 - remove test for $BASH as bash is never used for init
 - use hash for documentation link in sysv init file
 - remove unnecessary path change in sysv init file
 - remove exit on error line in sysv init file
 - remove init info comment from sysv init file
Changes since v7:
 - remove "-static" cgo flag which fixes build of btrfs and other
   additional filesystem drivers.
 - build + run test with alternate filesystem drivers.
Changes since v8:
 - Bump to v1.12.0-rc4
Changes since v9:
 - Introduce patch to fix docker log file rotation issue
 - Restructure build targets to use a foreach loop
 - Remove "select" duplicates from docker-containerd
 - Added BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 - Rename docker.init to S61docker
 - Add -static if BR2_STATIC_LIBS is enabled.
 - Remove sysv init file to be added in later patch
Changes since v10:
 - Add note about reason for extra patch
 - Remove requirement on MMU and WCHAR
 - Fix indentation on foreach loop
 - Select docker-containerd
 - Remove CPATH modification due to btrfs-progs patch
---
 package/Config.in                                  |   1 +
 ...-issues-with-tailing-rotated-jsonlog-file.patch | 297 +++++++++++++++++++++
 package/docker-engine/Config.in                    |  64 +++++
 package/docker-engine/docker-engine.hash           |   2 +
 package/docker-engine/docker-engine.mk             | 108 ++++++++
 5 files changed, 472 insertions(+)
 create mode 100644 package/docker-engine/0001-Fix-issues-with-tailing-rotated-jsonlog-file.patch
 create mode 100644 package/docker-engine/Config.in
 create mode 100644 package/docker-engine/docker-engine.hash
 create mode 100644 package/docker-engine/docker-engine.mk

diff --git a/package/Config.in b/package/Config.in
index 814141f..42a9ff5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1675,6 +1675,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
+	source "package/docker-engine/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/docker-engine/0001-Fix-issues-with-tailing-rotated-jsonlog-file.patch b/package/docker-engine/0001-Fix-issues-with-tailing-rotated-jsonlog-file.patch
new file mode 100644
index 0000000..413cfd6
--- /dev/null
+++ b/package/docker-engine/0001-Fix-issues-with-tailing-rotated-jsonlog-file.patch
@@ -0,0 +1,297 @@
+From 8d6f2e3fe8851b581309da25fc4c32f8be675932 Mon Sep 17 00:00:00 2001
+From: Brian Goff <cpuguy83@gmail.com>
+Date: Mon, 11 Jul 2016 16:31:42 -0400
+Subject: [PATCH] Fix issues with tailing rotated jsonlog file
+
+Fixes a race where the log reader would get events for both an actual
+rotation as we from fsnotify (`fsnotify.Rename`).
+This issue becomes extremely apparent when rotations are fast, for
+example:
+
+```
+$ docker run -d --name test --log-opt max-size=1 --log-opt max-file=2
+busybox sh -c 'while true; do echo hello; usleep 100000; done'
+```
+
+With this change the log reader for jsonlogs can handle rotations that
+happen as above.
+
+Instead of listening for both fs events AND rotation events
+simultaneously, potentially meaning we see 2 rotations for only a single
+rotation due to channel buffering, only listen for fs events (like
+`Rename`) and then wait to be notified about rotation by the logger.
+This makes sure that we don't see 2 rotations for 1, and that we don't
+start trying to read until the logger is actually ready for us to.
+
+Signed-off-by: Brian Goff <cpuguy83@gmail.com>
+
+This commit is pending upstream commit fixing broken log tailing. The
+original commit can be found in the PR here:
+
+  - https://github.com/docker/docker/pull/24514
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ daemon/logger/jsonfilelog/read.go | 180 +++++++++++++++++++++++++-------------
+ 1 file changed, 119 insertions(+), 61 deletions(-)
+
+diff --git a/daemon/logger/jsonfilelog/read.go b/daemon/logger/jsonfilelog/read.go
+index bea83dd..0cb44af 100644
+--- a/daemon/logger/jsonfilelog/read.go
++++ b/daemon/logger/jsonfilelog/read.go
+@@ -3,11 +3,14 @@ package jsonfilelog
+ import (
+ 	"bytes"
+ 	"encoding/json"
++	"errors"
+ 	"fmt"
+ 	"io"
+ 	"os"
+ 	"time"
+ 
++	"gopkg.in/fsnotify.v1"
++
+ 	"github.com/Sirupsen/logrus"
+ 	"github.com/docker/docker/daemon/logger"
+ 	"github.com/docker/docker/pkg/filenotify"
+@@ -44,6 +47,10 @@ func (l *JSONFileLogger) ReadLogs(config logger.ReadConfig) *logger.LogWatcher {
+ func (l *JSONFileLogger) readLogs(logWatcher *logger.LogWatcher, config logger.ReadConfig) {
+ 	defer close(logWatcher.Msg)
+ 
++	// lock so the read stream doesn't get corrupted do to rotations or other log data written while we read
++	// This will block writes!!!
++	l.mu.Lock()
++
+ 	pth := l.writer.LogPath()
+ 	var files []io.ReadSeeker
+ 	for i := l.writer.MaxFiles(); i > 1; i-- {
+@@ -61,6 +68,7 @@ func (l *JSONFileLogger) readLogs(logWatcher *logger.LogWatcher, config logger.R
+ 	latestFile, err := os.Open(pth)
+ 	if err != nil {
+ 		logWatcher.Err <- err
++		l.mu.Unlock()
+ 		return
+ 	}
+ 
+@@ -80,6 +88,7 @@ func (l *JSONFileLogger) readLogs(logWatcher *logger.LogWatcher, config logger.R
+ 		if err := latestFile.Close(); err != nil {
+ 			logrus.Errorf("Error closing file: %v", err)
+ 		}
++		l.mu.Unlock()
+ 		return
+ 	}
+ 
+@@ -87,7 +96,6 @@ func (l *JSONFileLogger) readLogs(logWatcher *logger.LogWatcher, config logger.R
+ 		latestFile.Seek(0, os.SEEK_END)
+ 	}
+ 
+-	l.mu.Lock()
+ 	l.readers[logWatcher] = struct{}{}
+ 	l.mu.Unlock()
+ 
+@@ -128,92 +136,142 @@ func tailFile(f io.ReadSeeker, logWatcher *logger.LogWatcher, tail int, since ti
+ 	}
+ }
+ 
++func watchFile(name string) (filenotify.FileWatcher, error) {
++	fileWatcher, err := filenotify.New()
++	if err != nil {
++		return nil, err
++	}
++
++	if err := fileWatcher.Add(name); err != nil {
++		logrus.WithField("logger", "json-file").Warnf("falling back to file poller due to error: %v", err)
++		fileWatcher.Close()
++		fileWatcher = filenotify.NewPollingWatcher()
++
++		if err := fileWatcher.Add(name); err != nil {
++			fileWatcher.Close()
++			logrus.Debugf("error watching log file for modifications: %v", err)
++			return nil, err
++		}
++	}
++	return fileWatcher, nil
++}
++
+ func followLogs(f *os.File, logWatcher *logger.LogWatcher, notifyRotate chan interface{}, since time.Time) {
+ 	dec := json.NewDecoder(f)
+ 	l := &jsonlog.JSONLog{}
+ 
+-	fileWatcher, err := filenotify.New()
++	name := f.Name()
++	fileWatcher, err := watchFile(name)
+ 	if err != nil {
+ 		logWatcher.Err <- err
++		return
+ 	}
+ 	defer func() {
+ 		f.Close()
+ 		fileWatcher.Close()
+ 	}()
+-	name := f.Name()
+ 
+-	if err := fileWatcher.Add(name); err != nil {
+-		logrus.WithField("logger", "json-file").Warnf("falling back to file poller due to error: %v", err)
+-		fileWatcher.Close()
+-		fileWatcher = filenotify.NewPollingWatcher()
++	var retries int
++	handleRotate := func() error {
++		f.Close()
++		fileWatcher.Remove(name)
+ 
++		// retry when the file doesn't exist
++		for retries := 0; retries <= 5; retries++ {
++			f, err = os.Open(name)
++			if err == nil || !os.IsNotExist(err) {
++				break
++			}
++		}
++		if err != nil {
++			return err
++		}
+ 		if err := fileWatcher.Add(name); err != nil {
+-			logrus.Debugf("error watching log file for modifications: %v", err)
+-			logWatcher.Err <- err
+-			return
++			return err
+ 		}
++		dec = json.NewDecoder(f)
++		return nil
+ 	}
+ 
+-	var retries int
+-	for {
+-		msg, err := decodeLogLine(dec, l)
+-		if err != nil {
+-			if err != io.EOF {
+-				// try again because this shouldn't happen
+-				if _, ok := err.(*json.SyntaxError); ok && retries <= maxJSONDecodeRetry {
+-					dec = json.NewDecoder(f)
+-					retries++
+-					continue
++	errRetry := errors.New("retry")
++	errDone := errors.New("done")
++	waitRead := func() error {
++		select {
++		case e := <-fileWatcher.Events():
++			switch e.Op {
++			case fsnotify.Write:
++				dec = json.NewDecoder(f)
++				return nil
++			case fsnotify.Rename, fsnotify.Remove:
++				<-notifyRotate
++				if err := handleRotate(); err != nil {
++					return err
+ 				}
+-
+-				// io.ErrUnexpectedEOF is returned from json.Decoder when there is
+-				// remaining data in the parser's buffer while an io.EOF occurs.
+-				// If the json logger writes a partial json log entry to the disk
+-				// while at the same time the decoder tries to decode it, the race condition happens.
+-				if err == io.ErrUnexpectedEOF && retries <= maxJSONDecodeRetry {
+-					reader := io.MultiReader(dec.Buffered(), f)
+-					dec = json.NewDecoder(reader)
+-					retries++
+-					continue
++				return nil
++			}
++			return errRetry
++		case err := <-fileWatcher.Errors():
++			logrus.Debug("logger got error watching file: %v", err)
++			// Something happened, let's try and stay alive and create a new watcher
++			if retries <= 5 {
++				fileWatcher, err = watchFile(name)
++				if err != nil {
++					return err
+ 				}
+-
+-				return
++				retries++
++				return errRetry
+ 			}
++			return err
++		case <-logWatcher.WatchClose():
++			fileWatcher.Remove(name)
++			return errDone
++		}
++	}
+ 
+-			select {
+-			case <-fileWatcher.Events():
+-				dec = json.NewDecoder(f)
+-				continue
+-			case <-fileWatcher.Errors():
+-				logWatcher.Err <- err
+-				return
+-			case <-logWatcher.WatchClose():
+-				fileWatcher.Remove(name)
+-				return
+-			case <-notifyRotate:
+-				f.Close()
+-				fileWatcher.Remove(name)
+-
+-				// retry when the file doesn't exist
+-				for retries := 0; retries <= 5; retries++ {
+-					f, err = os.Open(name)
+-					if err == nil || !os.IsNotExist(err) {
+-						break
+-					}
++	handleDecodeErr := func(err error) error {
++		if err == io.EOF {
++			for err := waitRead(); err != nil; {
++				if err == errRetry {
++					// retry the waitRead
++					continue
+ 				}
++				return err
++			}
++			return nil
++		}
++		// try again because this shouldn't happen
++		if _, ok := err.(*json.SyntaxError); ok && retries <= maxJSONDecodeRetry {
++			dec = json.NewDecoder(f)
++			retries++
++			return nil
++		}
++		// io.ErrUnexpectedEOF is returned from json.Decoder when there is
++		// remaining data in the parser's buffer while an io.EOF occurs.
++		// If the json logger writes a partial json log entry to the disk
++		// while@the same time the decoder tries to decode it, the race condition happens.
++		if err == io.ErrUnexpectedEOF && retries <= maxJSONDecodeRetry {
++			reader := io.MultiReader(dec.Buffered(), f)
++			dec = json.NewDecoder(reader)
++			retries++
++			return nil
++		}
++		return err
++	}
+ 
+-				if err = fileWatcher.Add(name); err != nil {
+-					logWatcher.Err <- err
+-					return
+-				}
+-				if err != nil {
+-					logWatcher.Err <- err
++	// main loop
++	for {
++		msg, err := decodeLogLine(dec, l)
++		if err != nil {
++			if err := handleDecodeErr(err); err != nil {
++				if err == errDone {
+ 					return
+ 				}
+-
+-				dec = json.NewDecoder(f)
+-				continue
++				// we got an unrecoverable error, so return
++				logWatcher.Err <- err
++				return
+ 			}
++			// ready to try again
++			continue
+ 		}
+ 
+ 		retries = 0 // reset retries since we've succeeded
+-- 
+2.7.3
+
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
new file mode 100644
index 0000000..a22786a
--- /dev/null
+++ b/package/docker-engine/Config.in
@@ -0,0 +1,64 @@
+config BR2_PACKAGE_DOCKER_ENGINE
+	bool "docker-engine"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Docker is a platform to build, ship,
+	  and run applications as lightweight containers.
+
+	  https://github.com/docker/docker
+
+if BR2_PACKAGE_DOCKER_ENGINE
+
+config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
+	bool "docker daemon"
+	depends on BR2_USE_WCHAR # docker-containerd
+	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
+	select BR2_PACKAGE_SQLITE # runtime dependency
+	default y
+	help
+	  Build the Docker system daemon.
+	  If not selected, will build client only.
+
+config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
+	bool "build experimental features"
+
+if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
+	bool "btrfs filesystem driver"
+	depends on BR2_USE_WCHAR # btrfs-progs
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Build the btrfs filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
+	bool "devicemapper filesystem driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	help
+	  Build the devicemapper filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
+	bool "vfs filesystem driver"
+	depends on BR2_USE_WCHAR # gvfs
+	depends on BR2_USE_MMU # gvfs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
+	select BR2_PACKAGE_GVFS
+	help
+	  Build the vfs filesystem driver for Docker.
+
+endif
+
+endif
+
+comment "docker-engine needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
new file mode 100644
index 0000000..1de09f8
--- /dev/null
+++ b/package/docker-engine/docker-engine.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bc256d2a348efbf236eab991254c925fa1917dd1e29cb40586f1696f4e24852e  docker-engine-v1.12.0-rc4.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
new file mode 100644
index 0000000..359913b
--- /dev/null
+++ b/package/docker-engine/docker-engine.mk
@@ -0,0 +1,108 @@
+################################################################################
+#
+# docker-engine
+#
+################################################################################
+
+DOCKER_ENGINE_VERSION = v1.12.0-rc4
+DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+
+DOCKER_ENGINE_LICENSE = Apache-2.0
+DOCKER_ENGINE_LICENSE_FILES = LICENSE
+
+DOCKER_ENGINE_DEPENDENCIES = host-go
+
+DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
+DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
+	CGO_ENABLED=1 \
+	CGO_NO_EMULATION=1 \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
+	LIBRARY_PATH=$$LIBRARY_PATH:$(TARGET_DIR)/usr/lib/
+
+DOCKER_ENGINE_GLDFLAGS = \
+	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
+	-X main.Version=$(DOCKER_ENGINE_VERSION)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+DOCKER_ENGINE_GLDFLAGS += -extldflags '-static'
+endif
+
+DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
+DOCKER_ENGINE_BUILD_TARGETS = docker
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+DOCKER_ENGINE_BUILD_TAGS += seccomp
+DOCKER_ENGINE_DEPENDENCIES += libseccomp
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
+DOCKER_ENGINE_BUILD_TAGS += daemon
+DOCKER_ENGINE_BUILD_TARGETS += dockerd
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
+DOCKER_ENGINE_BUILD_TAGS += experimental
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
+DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
+DOCKER_ENGINE_DEPENDENCIES += lvm2
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_devicemapper
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
+DOCKER_ENGINE_DEPENDENCIES += gvfs
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_vfs
+endif
+
+define DOCKER_ENGINE_CONFIGURE_CMDS
+	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
+	cd $(@D) && \
+		GITCOMMIT="unknown" BUILDTIME="$$(date)" VERSION="$(DOCKER_ENGINE_VERSION)" \
+		bash ./hack/make/.go-autogen
+endef
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
+
+define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
+	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	ln -fs ../../../../usr/lib/systemd/system/docker.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
+endef
+
+define DOCKER_ENGINE_USERS
+	- - docker -1 * - - - Docker Application Container Framework
+endef
+
+endif
+
+define DOCKER_ENGINE_BUILD_CMDS
+	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
+		cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) \
+		$(HOST_DIR)/usr/bin/go build -v \
+			-o $(@D)/bin/$(target) \
+			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
+			-ldflags "$(DOCKER_ENGINE_GLDFLAGS)" \
+			./cmd/$(target)
+	)
+endef
+
+define DOCKER_ENGINE_INSTALL_TARGET_CMDS
+	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
+		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
