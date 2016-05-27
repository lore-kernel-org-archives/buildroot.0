From: Christian Stewart <christian@paral.in>
Date: Thu, 26 May 2016 21:52:56 -0700
Subject: [Buildroot] [PATCH v4 2/3] docker-containerd: new package
In-Reply-To: <1464324777-5364-1-git-send-email-christian@paral.in>
References: <1464324777-5364-1-git-send-email-christian@paral.in>
Message-ID: <1464324777-5364-3-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker-containerd is a daemon and API for controlling and managing runC
containers.

https://containerd.tools/

Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes since v3:
 - Don't depend on runc at compile-time
 - Add threading dependency
 - Use HOST_GO_TARGET_ENV, partially
 - Cleanup compile commands
 - Include patch to fix arm64 compilation

---

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                                |   1 +
 package/docker-containerd/0001-arm64-fixes.patch | 184 +++++++++++++++++++++++
 package/docker-containerd/Config.in              |  12 ++
 package/docker-containerd/docker-containerd.hash |   2 +
 package/docker-containerd/docker-containerd.mk   |  45 ++++++
 5 files changed, 244 insertions(+)
 create mode 100644 package/docker-containerd/0001-arm64-fixes.patch
 create mode 100644 package/docker-containerd/Config.in
 create mode 100644 package/docker-containerd/docker-containerd.hash
 create mode 100644 package/docker-containerd/docker-containerd.mk

diff --git a/package/Config.in b/package/Config.in
index 6c513ba..c8365f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1631,6 +1631,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 endif
+	source "package/docker-containerd/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/emlog/Config.in"
diff --git a/package/docker-containerd/0001-arm64-fixes.patch b/package/docker-containerd/0001-arm64-fixes.patch
new file mode 100644
index 0000000..488822a
--- /dev/null
+++ b/package/docker-containerd/0001-arm64-fixes.patch
@@ -0,0 +1,184 @@
+From f6f54370d154b0ce5f35319d878048d7db8db89c Mon Sep 17 00:00:00 2001
+From: Lei Jitang <leijitang@huawei.com>
+Date: Tue, 5 Apr 2016 23:17:30 -0400
+Subject: [PATCH] arm64 fixes
+
+This commit is a combination of a few cherry-picked commits from the
+current master (0.3.0 candidate) of docker-containerd, which
+specifically address issues under arm64.
+
+move epoll syscall to arch specific to enable containerd run on arm64
+Rename epoll_amd64.go to epoll.go
+Signed-off-by: Lei Jitang <leijitang@huawei.com>
+
+archutils: epoll_aarch64: fix C formatting
+Signed-off-by: Aleksa Sarai <asarai@suse.de>
+
+archutils: fix build on aarch64
+Signed-off-by: Aleksa Sarai <asarai@suse.de>
+
+Use flag for aarch64 EpollCreate1
+Signed-off-by: Qiang Huang <h.huangqiang@huawei.com>
+
+Correct build flag for arm64
+Signed-off-by: Qiang Huang <h.huangqiang@huawei.com>
+---
+ archutils/epoll.go          | 19 ++++++++++++
+ archutils/epoll_arm64.go    | 70 +++++++++++++++++++++++++++++++++++++++++++++
+ supervisor/monitor_linux.go |  9 +++---
+ 3 files changed, 94 insertions(+), 4 deletions(-)
+ create mode 100644 archutils/epoll.go
+ create mode 100644 archutils/epoll_arm64.go
+
+diff --git a/archutils/epoll.go b/archutils/epoll.go
+new file mode 100644
+index 0000000..c8ade64
+--- /dev/null
++++ b/archutils/epoll.go
+@@ -0,0 +1,19 @@
++// +build linux,!arm64
++
++package archutils
++
++import (
++	"syscall"
++)
++
++func EpollCreate1(flag int) (int, error) {
++	return syscall.EpollCreate1(flag)
++}
++
++func EpollCtl(epfd int, op int, fd int, event *syscall.EpollEvent) error {
++	return syscall.EpollCtl(epfd, op, fd, event)
++}
++
++func EpollWait(epfd int, events []syscall.EpollEvent, msec int) (int, error) {
++	return syscall.EpollWait(epfd, events, msec)
++}
+diff --git a/archutils/epoll_arm64.go b/archutils/epoll_arm64.go
+new file mode 100644
+index 0000000..00abc68
+--- /dev/null
++++ b/archutils/epoll_arm64.go
+@@ -0,0 +1,70 @@
++// +build linux,arm64
++
++package archutils
++
++// #include <sys/epoll.h>
++/*
++int EpollCreate1(int flag) {
++	return epoll_create1(flag);
++}
++
++int EpollCtl(int efd, int op,int sfd, int events, int fd) {
++	struct epoll_event event;
++	event.events = events;
++	event.data.fd = fd;
++
++	return epoll_ctl(efd, op, sfd, &event);
++}
++
++struct event_t {
++	uint32_t events;
++	int fd;
++};
++
++struct epoll_event events[128];
++int run_epoll_wait(int fd, struct event_t *event) {
++	int n, i;
++	n = epoll_wait(fd, events, 128, -1);
++	for (i = 0; i < n; i++) {
++		event[i].events = events[i].events;
++		event[i].fd = events[i].data.fd;
++	}
++	return n;
++}
++*/
++import "C"
++
++import (
++	"fmt"
++	"syscall"
++	"unsafe"
++)
++
++func EpollCreate1(flag int) (int, error) {
++	fd := int(C.EpollCreate1(C.int(flag)))
++	if fd < 0 {
++		return fd, fmt.Errorf("failed to create epoll, errno is %d", fd)
++	}
++	return fd, nil
++}
++
++func EpollCtl(epfd int, op int, fd int, event *syscall.EpollEvent) error {
++	errno := C.EpollCtl(C.int(epfd), C.int(syscall.EPOLL_CTL_ADD), C.int(fd), C.int(event.Events), C.int(event.Fd))
++	if errno < 0 {
++		return fmt.Errorf("Failed to ctl epoll")
++	}
++	return nil
++}
++
++func EpollWait(epfd int, events []syscall.EpollEvent, msec int) (int, error) {
++	var c_events [128]C.struct_event_t
++	n := int(C.run_epoll_wait(C.int(epfd), (*C.struct_event_t)(unsafe.Pointer(&c_events))))
++	if n < 0 {
++		return int(n), fmt.Errorf("Failed to wait epoll")
++	}
++	for i := 0; i < n; i++ {
++		events[i].Fd = int32(c_events[i].fd)
++		events[i].Events = uint32(c_events[i].events)
++	}
++	return int(n), nil
++}
+diff --git a/supervisor/monitor_linux.go b/supervisor/monitor_linux.go
+index adf4ffd..b176585 100644
+--- a/supervisor/monitor_linux.go
++++ b/supervisor/monitor_linux.go
+@@ -5,6 +5,7 @@ import (
+ 	"syscall"
+ 
+ 	"github.com/Sirupsen/logrus"
++	"github.com/docker/containerd/archutils"
+ 	"github.com/docker/containerd/runtime"
+ )
+ 
+@@ -14,7 +15,7 @@ func NewMonitor() (*Monitor, error) {
+ 		exits:     make(chan runtime.Process, 1024),
+ 		ooms:      make(chan string, 1024),
+ 	}
+-	fd, err := syscall.EpollCreate1(0)
++	fd, err := archutils.EpollCreate1(0)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -47,7 +48,7 @@ func (m *Monitor) Monitor(p runtime.Process) error {
+ 		Fd:     int32(fd),
+ 		Events: syscall.EPOLLHUP,
+ 	}
+-	if err := syscall.EpollCtl(m.epollFd, syscall.EPOLL_CTL_ADD, fd, &event); err != nil {
++	if err := archutils.EpollCtl(m.epollFd, syscall.EPOLL_CTL_ADD, fd, &event); err != nil {
+ 		return err
+ 	}
+ 	EpollFdCounter.Inc(1)
+@@ -67,7 +68,7 @@ func (m *Monitor) MonitorOOM(c runtime.Container) error {
+ 		Fd:     int32(fd),
+ 		Events: syscall.EPOLLHUP | syscall.EPOLLIN,
+ 	}
+-	if err := syscall.EpollCtl(m.epollFd, syscall.EPOLL_CTL_ADD, fd, &event); err != nil {
++	if err := archutils.EpollCtl(m.epollFd, syscall.EPOLL_CTL_ADD, fd, &event); err != nil {
+ 		return err
+ 	}
+ 	EpollFdCounter.Inc(1)
+@@ -82,7 +83,7 @@ func (m *Monitor) Close() error {
+ func (m *Monitor) start() {
+ 	var events [128]syscall.EpollEvent
+ 	for {
+-		n, err := syscall.EpollWait(m.epollFd, events[:], -1)
++		n, err := archutils.EpollWait(m.epollFd, events[:], -1)
+ 		if err != nil {
+ 			if err == syscall.EINTR {
+ 				continue
+-- 
+2.7.3
+
diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
new file mode 100644
index 0000000..5919347
--- /dev/null
+++ b/package/docker-containerd/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DOCKER_CONTAINERD
+	bool "docker-containerd"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_RUNC
+	help
+	  containerd is a daemon to control runC.
+
+	  https://github.com/docker/containerd
+
+comment "docker-containerd needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
new file mode 100644
index 0000000..0221b69
--- /dev/null
+++ b/package/docker-containerd/docker-containerd.hash
@@ -0,0 +1,2 @@
+# Computed locally
+sha256 f9dfeaba17064f279a7dfe89f0ef6763ee45b0a57c03aa423da2af340fba198d  docker-containerd-v0.2.1.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
new file mode 100644
index 0000000..6dd61f7
--- /dev/null
+++ b/package/docker-containerd/docker-containerd.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# docker-containerd
+#
+################################################################################
+
+DOCKER_CONTAINERD_VERSION = v0.2.1
+DOCKER_CONTAINERD_VERSION_COMMIT = ca47f7e76a93e9b3768ed084d62318e85bd9f4b2
+DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
+
+DOCKER_CONTAINERD_LICENSE = Apache-2.0
+DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
+
+DOCKER_CONTAINERD_DEPENDENCIES = host-go
+
+DOCKER_CONTAINERD_GOPATH = "$(@D)/vendor"
+DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
+	CGO_ENABLED=1 \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
+
+DOCKER_CONTAINERD_GLDFLAGS = \
+	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION_COMMIT) \
+	-extldflags '-static'
+
+define DOCKER_CONTAINERD_CONFIGURE_CMDS
+	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
+	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
+	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
+	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
+endef
+
+define DOCKER_CONTAINERD_BUILD_CMDS
+	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/ctr -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./ctr
+	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd
+	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd-shim -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd-shim
+endef
+
+define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
+	ln -s $(TARGET_DIR)/usr/bin/runc $(TARGET_DIR)/usr/bin/docker-runc
+	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
+	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
