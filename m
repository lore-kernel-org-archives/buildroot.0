Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330B0CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097CC60AFD;
	Fri, 12 Jun 2026 11:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxlCzwqB06ET; Fri, 12 Jun 2026 11:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A738610A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263393;
	bh=Hp2TM47sB1EkBzRR9JpUjwN4XM0vf/XG8vRD7+hVt08=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YdrPs6ct3pE38tZCvlDYnmi+7GTce24/bRCtF9ZuLgL6IzeqV7blqpT0G/fiGmDS7
	 ECR04kXiEPYZoFVqW/LKxr9NXt4dGYuYPpRud0DETZycdFNmh5X6SpL24FJFIzi0fG
	 hQ6MC0Siu1dEFlRuW951GMBhpl1zKCkTGNp8G4QtjK0X648PviGmhZvWb+OGXxiUwH
	 +k1TbqTvVw7IvuxScGiP7Qa+Z2ifsMklq0HLMYGkEkR+q4BLWVDHF4chgGtHA9xzzf
	 le2ELrBx2cxmZNhfW6iCpZsLy3dHFTS4aJYEgiAIo5s0HajyNCDlaWSsB1B43m9G0T
	 8wD9QR2R10f7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A738610A1;
	Fri, 12 Jun 2026 11:23:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B96F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E0B8329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTuN_9NybQ59 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8097D82CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8097D82CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58D6A880E9; Fri, 12 Jun 2026 11:22:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 14:42:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6f9ab7ffaa98314efbbc7779398b7c86bdf3dbcd
X-Git-Newrev: 00e39e64b2e8922c026178436639ebd789504a90
X-Patchwork-Hint: ignore
Message-Id: <20260612112220.58D6A880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/runc: fix
 regression with kernel without user namespace
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00e39e64b2e8922c026178436639ebd789504a90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since the runc security bump to version 1.3.5 [1], the TestOci fail due
to missing user namespace support in the kernel:

    proc/self/setgroups: no such file or directory

The test was working well with runc 1.3.0. The regression is caused by
this commit [2] from the 1.3.3 security release.

The regression is fixed by a refactoring from the 1.4.1 release [3].

Backport this commit on top of runc 1.3.5 (fixing some conflicts).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14696525946 (TestOci)

[1] e013e2df84fb36985261d7b3c6e6af06afd40f93
[2] https://github.com/opencontainers/runc/commit/7762edc82c36ba69a4ea88b86483fcdcac93f5a2
[3] https://github.com/opencontainers/runc/commit/323a54ef0d91a20f7d5be4308e5e65a98886bf4b

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 94b2cc09e2bbc5c43f3374aa8c884dccf3c5cc93)
[thomas: rebase patch]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Is-error-checking-functions-with-their-er.patch | 401 +++++++++++++++++++++
 1 file changed, 401 insertions(+)

diff --git a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
new file mode 100644
index 0000000000..c7c4a791a1
--- /dev/null
+++ b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
@@ -0,0 +1,401 @@
+From 87932aa3d01294886b71f9566f3bf881cf769c66 Mon Sep 17 00:00:00 2001
+From: Curd Becker <me@curd-becker.de>
+Date: Mon, 17 Nov 2025 00:28:05 +0100
+Subject: [PATCH] Replace os.Is* error checking functions with their errors.Is
+ counterpart
+
+Signed-off-by: Curd Becker <me@curd-becker.de>
+(cherry picked from commit 536e183451b7988316fdc37eecd7afd8570dc19b)
+Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
+(cherry picked from commit 323a54ef0d91a20f7d5be4308e5e65a98886bf4b)
+
+Since the runc security bump to version 1.3.5 [1], the TestOci fail due
+to missing user namespace support in the kernel:
+
+    proc/self/setgroups: no such file or directory
+
+The test was working well with runc 1.3.0. The regression is caused by
+this commit [2] from the 1.3.3 security release.
+
+The regression is fixed by a refactoring from the 1.4.1 release [3].
+
+Backport this commit on top of runc 1.3.5 (fixing some conflicts).
+
+Upstream: https://github.com/opencontainers/runc/commit/323a54ef0d91a20f7d5be4308e5e65a98886bf4b
+
+[1] https://gitlab.com/buildroot.org/buildroot/-/commit/e013e2df84fb36985261d7b3c6e6af06afd40f93
+[2] https://github.com/opencontainers/runc/commit/7762edc82c36ba69a4ea88b86483fcdcac93f5a2
+[3] https://github.com/opencontainers/runc/commit/323a54ef0d91a20f7d5be4308e5e65a98886bf4b
+[Romain:
+  rebase on 1.3.5
+  add comments about runc 1.3.5 regression
+]
+Conflicts:
+  libcontainer/configs/validate/validator_test.go
+  libcontainer/container_linux.go
+  libcontainer/intelrdt/intelrdt.go
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+[Thomas: rebase 1.2.9]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libcontainer/configs/validate/validator.go      |  6 +++---
+ libcontainer/configs/validate/validator_test.go |  7 ++++---
+ libcontainer/criu_linux.go                      | 10 +++++-----
+ libcontainer/devices/device_unix.go             |  2 +-
+ libcontainer/factory_linux.go                   |  4 ++--
+ libcontainer/init_linux.go                      |  4 ++--
+ libcontainer/integration/exec_test.go           |  6 +++---
+ libcontainer/notify_linux.go                    |  2 +-
+ libcontainer/process_linux.go                   |  2 +-
+ libcontainer/rootfs_linux.go                    |  8 ++++----
+ libcontainer/specconv/spec_linux_test.go        |  5 +++--
+ libcontainer/state_linux.go                     |  3 ++-
+ spec.go                                         |  4 ++--
+ 13 files changed, 33 insertions(+), 30 deletions(-)
+
+diff --git a/libcontainer/configs/validate/validator.go b/libcontainer/configs/validate/validator.go
+index e0052900..3b77617b 100644
+--- a/libcontainer/configs/validate/validator.go
++++ b/libcontainer/configs/validate/validator.go
+@@ -104,7 +104,7 @@ func security(config *configs.Config) error {
+ 
+ func namespaces(config *configs.Config) error {
+ 	if config.Namespaces.Contains(configs.NEWUSER) {
+-		if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
++		if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
+ 			return errors.New("user namespaces aren't enabled in the kernel")
+ 		}
+ 		hasPath := config.Namespaces.PathOf(configs.NEWUSER) != ""
+@@ -122,13 +122,13 @@ func namespaces(config *configs.Config) error {
+ 	}
+ 
+ 	if config.Namespaces.Contains(configs.NEWCGROUP) {
+-		if _, err := os.Stat("/proc/self/ns/cgroup"); os.IsNotExist(err) {
++		if _, err := os.Stat("/proc/self/ns/cgroup"); errors.Is(err, os.ErrNotExist) {
+ 			return errors.New("cgroup namespaces aren't enabled in the kernel")
+ 		}
+ 	}
+ 
+ 	if config.Namespaces.Contains(configs.NEWTIME) {
+-		if _, err := os.Stat("/proc/self/timens_offsets"); os.IsNotExist(err) {
++		if _, err := os.Stat("/proc/self/timens_offsets"); errors.Is(err, os.ErrNotExist) {
+ 			return errors.New("time namespaces aren't enabled in the kernel")
+ 		}
+ 		hasPath := config.Namespaces.PathOf(configs.NEWTIME) != ""
+diff --git a/libcontainer/configs/validate/validator_test.go b/libcontainer/configs/validate/validator_test.go
+index d157feea..41412ba4 100644
+--- a/libcontainer/configs/validate/validator_test.go
++++ b/libcontainer/configs/validate/validator_test.go
+@@ -1,6 +1,7 @@
+ package validate
+ 
+ import (
++	"errors"
+ 	"os"
+ 	"path/filepath"
+ 	"testing"
+@@ -171,7 +172,7 @@ func TestValidateSecurityWithoutNEWNS(t *testing.T) {
+ }
+ 
+ func TestValidateUserNamespace(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires userns.")
+ 	}
+ 	config := &configs.Config{
+@@ -205,7 +206,7 @@ func TestValidateUsernsMappingWithoutNamespace(t *testing.T) {
+ }
+ 
+ func TestValidateTimeNamespace(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/time"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/time"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires timens.")
+ 	}
+ 	config := &configs.Config{
+@@ -224,7 +225,7 @@ func TestValidateTimeNamespace(t *testing.T) {
+ }
+ 
+ func TestValidateTimeNamespaceWithBothPathAndTimeOffset(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/time"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/time"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires timens.")
+ 	}
+ 	config := &configs.Config{
+diff --git a/libcontainer/criu_linux.go b/libcontainer/criu_linux.go
+index 53a0202a..ddf95445 100644
+--- a/libcontainer/criu_linux.go
++++ b/libcontainer/criu_linux.go
+@@ -121,7 +121,7 @@ func (c *Container) addMaskPaths(req *criurpc.CriuReq) error {
+ 	for _, path := range c.config.MaskPaths {
+ 		fi, err := os.Stat(fmt.Sprintf("/proc/%d/root/%s", c.initProcess.pid(), path))
+ 		if err != nil {
+-			if os.IsNotExist(err) {
++			if errors.Is(err, os.ErrNotExist) {
+ 				continue
+ 			}
+ 			return err
+@@ -297,7 +297,7 @@ func (c *Container) Checkpoint(criuOpts *CriuOpts) error {
+ 
+ 	// Since a container can be C/R'ed multiple times,
+ 	// the checkpoint directory may already exist.
+-	if err := os.Mkdir(criuOpts.ImagesDirectory, 0o700); err != nil && !os.IsExist(err) {
++	if err := os.Mkdir(criuOpts.ImagesDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
+ 		return err
+ 	}
+ 
+@@ -329,7 +329,7 @@ func (c *Container) Checkpoint(criuOpts *CriuOpts) error {
+ 
+ 	// if criuOpts.WorkDirectory is not set, criu default is used.
+ 	if criuOpts.WorkDirectory != "" {
+-		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !os.IsExist(err) {
++		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
+ 			return err
+ 		}
+ 		workDir, err := os.Open(criuOpts.WorkDirectory)
+@@ -687,7 +687,7 @@ func (c *Container) Restore(process *Process, criuOpts *CriuOpts) error {
+ 	if criuOpts.WorkDirectory != "" {
+ 		// Since a container can be C/R'ed multiple times,
+ 		// the work directory may already exist.
+-		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !os.IsExist(err) {
++		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
+ 			return err
+ 		}
+ 		workDir, err := os.Open(criuOpts.WorkDirectory)
+@@ -1144,7 +1144,7 @@ func (c *Container) criuNotifications(resp *criurpc.CriuResp, process *Process,
+ 			return err
+ 		}
+ 		if err := os.Remove(filepath.Join(c.stateDir, "checkpoint")); err != nil {
+-			if !os.IsNotExist(err) {
++			if !errors.Is(err, os.ErrNotExist) {
+ 				logrus.Error(err)
+ 			}
+ 		}
+diff --git a/libcontainer/devices/device_unix.go b/libcontainer/devices/device_unix.go
+index c533eb1c..409e58e9 100644
+--- a/libcontainer/devices/device_unix.go
++++ b/libcontainer/devices/device_unix.go
+@@ -105,7 +105,7 @@ func GetDevices(path string) ([]*Device, error) {
+ 			if errors.Is(err, ErrNotADevice) {
+ 				continue
+ 			}
+-			if os.IsNotExist(err) {
++			if errors.Is(err, os.ErrNotExist) {
+ 				continue
+ 			}
+ 			return nil, err
+diff --git a/libcontainer/factory_linux.go b/libcontainer/factory_linux.go
+index 94b55eaa..d8a2d8e3 100644
+--- a/libcontainer/factory_linux.go
++++ b/libcontainer/factory_linux.go
+@@ -50,7 +50,7 @@ func Create(root, id string, config *configs.Config) (*Container, error) {
+ 	}
+ 	if _, err := os.Stat(stateDir); err == nil {
+ 		return nil, ErrExist
+-	} else if !os.IsNotExist(err) {
++	} else if !errors.Is(err, os.ErrNotExist) {
+ 		return nil, err
+ 	}
+ 
+@@ -153,7 +153,7 @@ func loadState(root string) (*State, error) {
+ 	}
+ 	f, err := os.Open(stateFilePath)
+ 	if err != nil {
+-		if os.IsNotExist(err) {
++		if errors.Is(err, os.ErrNotExist) {
+ 			return nil, ErrNotExist
+ 		}
+ 		return nil, err
+diff --git a/libcontainer/init_linux.go b/libcontainer/init_linux.go
+index 40529200..25c135f3 100644
+--- a/libcontainer/init_linux.go
++++ b/libcontainer/init_linux.go
+@@ -315,7 +315,7 @@ func finalizeNamespace(config *initConfig) error {
+ 		switch {
+ 		case err == nil:
+ 			doChdir = false
+-		case os.IsPermission(err):
++		case errors.Is(err, os.ErrPermission):
+ 			// If we hit an EPERM, we should attempt again after setting up user.
+ 			// This will allow us to successfully chdir if the container user has access
+ 			// to the directory, but the user running runc does not.
+@@ -519,7 +519,7 @@ func setupUser(config *initConfig) error {
+ 		setgroups, err = io.ReadAll(setgroupsFile)
+ 		_ = setgroupsFile.Close()
+ 	}
+-	if err != nil && !os.IsNotExist(err) {
++	if err != nil && !errors.Is(err, os.ErrNotExist) {
+ 		return err
+ 	}
+ 
+diff --git a/libcontainer/integration/exec_test.go b/libcontainer/integration/exec_test.go
+index df99da26..14006922 100644
+--- a/libcontainer/integration/exec_test.go
++++ b/libcontainer/integration/exec_test.go
+@@ -1099,7 +1099,7 @@ func TestHook(t *testing.T) {
+ 
+ 	for _, hook := range []string{"prestart", "createRuntime", "poststart"} {
+ 		fi, err := os.Stat(filepath.Join(config.Rootfs, hook))
+-		if err == nil || !os.IsNotExist(err) {
++		if err == nil || !errors.Is(err, os.ErrNotExist) {
+ 			t.Fatalf("expected file '%s to not exists, but it does", fi.Name())
+ 		}
+ 	}
+@@ -1647,7 +1647,7 @@ func TestTmpfsCopyUp(t *testing.T) {
+ }
+ 
+ func TestCGROUPPrivate(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/cgroup"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/cgroup"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires cgroupns.")
+ 	}
+ 	if testing.Short() {
+@@ -1667,7 +1667,7 @@ func TestCGROUPPrivate(t *testing.T) {
+ }
+ 
+ func TestCGROUPHost(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/cgroup"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/cgroup"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires cgroupns.")
+ 	}
+ 	if testing.Short() {
+diff --git a/libcontainer/notify_linux.go b/libcontainer/notify_linux.go
+index a8762842..77e23157 100644
+--- a/libcontainer/notify_linux.go
++++ b/libcontainer/notify_linux.go
+@@ -51,7 +51,7 @@ func registerMemoryEvent(cgDir string, evName string, arg string) (<-chan struct
+ 			}
+ 			// When a cgroup is destroyed, an event is sent to eventfd.
+ 			// So if the control path is gone, return instead of notifying.
+-			if _, err := os.Lstat(eventControlPath); os.IsNotExist(err) {
++			if _, err := os.Lstat(eventControlPath); errors.Is(err, os.ErrNotExist) {
+ 				return
+ 			}
+ 			ch <- struct{}{}
+diff --git a/libcontainer/process_linux.go b/libcontainer/process_linux.go
+index baf3706c..6f10a6c2 100644
+--- a/libcontainer/process_linux.go
++++ b/libcontainer/process_linux.go
+@@ -950,7 +950,7 @@ func getPipeFds(pid int) ([]string, error) {
+ 			// Ignore permission errors, for rootless containers and other
+ 			// non-dumpable processes. if we can't get the fd for a particular
+ 			// file, there's not much we can do.
+-			if os.IsPermission(err) {
++			if errors.Is(err, os.ErrPermission) {
+ 				continue
+ 			}
+ 			return fds, err
+diff --git a/libcontainer/rootfs_linux.go b/libcontainer/rootfs_linux.go
+index 31d05174..abc372f3 100644
+--- a/libcontainer/rootfs_linux.go
++++ b/libcontainer/rootfs_linux.go
+@@ -360,7 +360,7 @@ func mountCgroupV1(m mountEntry, c *mountConfig) error {
+ 			// symlink(2) is very dumb, it will just shove the path into
+ 			// the link and doesn't do any checks or relative path
+ 			// conversion. Also, don't error out if the cgroup already exists.
+-			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !os.IsExist(err) {
++			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !errors.Is(err, os.ErrExist) {
+ 				return err
+ 			}
+ 		}
+@@ -612,7 +612,7 @@ func mountToRootfs(c *mountConfig, m mountEntry) error {
+ 			return err
+ 		}
+ 		if fi, err := os.Lstat(dest); err != nil {
+-			if !os.IsNotExist(err) {
++			if !errors.Is(err, os.ErrNotExist) {
+ 				return err
+ 			}
+ 		} else if !fi.IsDir() {
+@@ -909,7 +909,7 @@ func setupDevSymlinks(rootfs string) error {
+ 			src = link[0]
+ 			dst = filepath.Join(rootfs, link[1])
+ 		)
+-		if err := os.Symlink(src, dst); err != nil && !os.IsExist(err) {
++		if err := os.Symlink(src, dst); err != nil && !errors.Is(err, os.ErrExist) {
+ 			return err
+ 		}
+ 	}
+@@ -1131,7 +1131,7 @@ func setReadonly() error {
+ 
+ func setupPtmx(config *configs.Config) error {
+ 	ptmx := filepath.Join(config.Rootfs, "dev/ptmx")
+-	if err := os.Remove(ptmx); err != nil && !os.IsNotExist(err) {
++	if err := os.Remove(ptmx); err != nil && !errors.Is(err, os.ErrNotExist) {
+ 		return err
+ 	}
+ 	if err := os.Symlink("pts/ptmx", ptmx); err != nil {
+diff --git a/libcontainer/specconv/spec_linux_test.go b/libcontainer/specconv/spec_linux_test.go
+index 66359f79..88156516 100644
+--- a/libcontainer/specconv/spec_linux_test.go
++++ b/libcontainer/specconv/spec_linux_test.go
+@@ -1,6 +1,7 @@
+ package specconv
+ 
+ import (
++	"errors"
+ 	"os"
+ 	"strings"
+ 	"testing"
+@@ -609,7 +610,7 @@ func TestDupNamespaces(t *testing.T) {
+ }
+ 
+ func TestUserNamespaceMappingAndPath(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires userns.")
+ 	}
+ 
+@@ -643,7 +644,7 @@ func TestUserNamespaceMappingAndPath(t *testing.T) {
+ }
+ 
+ func TestNonZeroEUIDCompatibleSpecconvValidate(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires userns.")
+ 	}
+ 
+diff --git a/libcontainer/state_linux.go b/libcontainer/state_linux.go
+index 2b7b8b5b..1f758e2a 100644
+--- a/libcontainer/state_linux.go
++++ b/libcontainer/state_linux.go
+@@ -1,6 +1,7 @@
+ package libcontainer
+ 
+ import (
++	"errors"
+ 	"fmt"
+ 	"os"
+ 	"path/filepath"
+@@ -212,7 +213,7 @@ func (r *restoredState) transition(s containerState) error {
+ 
+ func (r *restoredState) destroy() error {
+ 	if _, err := os.Stat(filepath.Join(r.c.stateDir, "checkpoint")); err != nil {
+-		if !os.IsNotExist(err) {
++		if !errors.Is(err, os.ErrNotExist) {
+ 			return err
+ 		}
+ 	}
+diff --git a/spec.go b/spec.go
+index d03d644e..15e933eb 100644
+--- a/spec.go
++++ b/spec.go
+@@ -91,7 +91,7 @@ created by an unprivileged user.
+ 			if err == nil {
+ 				return fmt.Errorf("File %s exists. Remove it first", name)
+ 			}
+-			if !os.IsNotExist(err) {
++			if !errors.Is(err, os.ErrNotExist) {
+ 				return err
+ 			}
+ 			return nil
+@@ -117,7 +117,7 @@ created by an unprivileged user.
+ func loadSpec(cPath string) (spec *specs.Spec, err error) {
+ 	cf, err := os.Open(cPath)
+ 	if err != nil {
+-		if os.IsNotExist(err) {
++		if errors.Is(err, os.ErrNotExist) {
+ 			return nil, fmt.Errorf("JSON specification file %s not found", cPath)
+ 		}
+ 		return nil, err
+-- 
+2.54.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
