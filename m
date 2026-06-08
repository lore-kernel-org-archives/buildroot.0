Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA9FCD8C9D
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08DE784944;
	Mon,  8 Jun 2026 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aD5IVo0PTLL; Mon,  8 Jun 2026 17:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF9C8494F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780939336;
	bh=xLnslDkefAFz6YjX3aXhCpsgNF/SRF7G564l27lxKhs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TRO+FcFnmfdCKRjmJ3TaxjkRChsGohB7zR/dVArbkg99KLFD7T6rlCF+bPUCG+IpY
	 ZIg+RwTbu61V0oTsvan5kPmmJIlHHPKAmEIgpzmsDi3ZEYdHhGBfsMeZ6OvqO8NdCd
	 T2qfBTP7YQmD7+eOkxqsavrf3t+TjCdKamFKascfuniQDF+wyjG1rAqUxmdDM0gQhb
	 TaiwZZZW7K0nj6XbtNWSWzXiXFlYbn6ynsi6jz3bWaRo3Zsc2vgGgKfOpWIJXtvnWZ
	 La4y/KhGHRr6xBzpfvVkj9KckUQPI4ID28hwxb2q7kSkuzle6dZ2hPe5QFte8SGdJX
	 MDyBZ6y1cd/RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF9C8494F;
	Mon,  8 Jun 2026 17:22:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C432C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CE71412B3
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb9NYPb02JdH for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 17:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB23542977
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB23542977
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 17:22:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 737F687DCC; Mon,  8 Jun 2026 17:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jun 2026 19:18:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5df3d6493973831e45530691802cd3d8ff2826b2
X-Git-Newrev: 94b2cc09e2bbc5c43f3374aa8c884dccf3c5cc93
X-Patchwork-Hint: ignore
Message-Id: <20260608172155.737F687DCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: fix regression with kernel
 without user namespace
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94b2cc09e2bbc5c43f3374aa8c884dccf3c5cc93
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 ...Is-error-checking-functions-with-their-er.patch | 400 +++++++++++++++++++++
 1 file changed, 400 insertions(+)

diff --git a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
new file mode 100644
index 0000000000..4e103099f9
--- /dev/null
+++ b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
@@ -0,0 +1,400 @@
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
+@@ -123,7 +123,7 @@ func (c *Container) addMaskPaths(req *criurpc.CriuReq) error {
+ 	for _, path := range c.config.MaskPaths {
+ 		fi, err := os.Stat(fmt.Sprintf("/proc/%d/root/%s", c.initProcess.pid(), path))
+ 		if err != nil {
+-			if os.IsNotExist(err) {
++			if errors.Is(err, os.ErrNotExist) {
+ 				continue
+ 			}
+ 			return err
+@@ -304,7 +304,7 @@ func (c *Container) Checkpoint(criuOpts *CriuOpts) error {
+ 
+ 	// Since a container can be C/R'ed multiple times,
+ 	// the checkpoint directory may already exist.
+-	if err := os.Mkdir(criuOpts.ImagesDirectory, 0o700); err != nil && !os.IsExist(err) {
++	if err := os.Mkdir(criuOpts.ImagesDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
+ 		return err
+ 	}
+ 
+@@ -339,7 +339,7 @@ func (c *Container) Checkpoint(criuOpts *CriuOpts) error {
+ 
+ 	// if criuOpts.WorkDirectory is not set, criu default is used.
+ 	if criuOpts.WorkDirectory != "" {
+-		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !os.IsExist(err) {
++		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
+ 			return err
+ 		}
+ 		workDir, err := os.Open(criuOpts.WorkDirectory)
+@@ -698,7 +698,7 @@ func (c *Container) Restore(process *Process, criuOpts *CriuOpts) error {
+ 	if criuOpts.WorkDirectory != "" {
+ 		// Since a container can be C/R'ed multiple times,
+ 		// the work directory may already exist.
+-		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !os.IsExist(err) {
++		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
+ 			return err
+ 		}
+ 		workDir, err := os.Open(criuOpts.WorkDirectory)
+@@ -1149,7 +1149,7 @@ func (c *Container) criuNotifications(resp *criurpc.CriuResp, process *Process,
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
+@@ -98,7 +98,7 @@ func GetDevices(path string) ([]*Device, error) {
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
+@@ -51,7 +51,7 @@ func Create(root, id string, config *configs.Config) (*Container, error) {
+ 	}
+ 	if _, err := os.Stat(stateDir); err == nil {
+ 		return nil, ErrExist
+-	} else if !os.IsNotExist(err) {
++	} else if !errors.Is(err, os.ErrNotExist) {
+ 		return nil, err
+ 	}
+ 
+@@ -154,7 +154,7 @@ func loadState(root string) (*State, error) {
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
+@@ -311,7 +311,7 @@ func finalizeNamespace(config *initConfig) error {
+ 		switch {
+ 		case err == nil:
+ 			doChdir = false
+-		case os.IsPermission(err):
++		case errors.Is(err, os.ErrPermission):
+ 			// If we hit an EPERM, we should attempt again after setting up user.
+ 			// This will allow us to successfully chdir if the container user has access
+ 			// to the directory, but the user running runc does not.
+@@ -477,7 +477,7 @@ func setupUser(config *initConfig) error {
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
+@@ -1097,7 +1097,7 @@ func TestHook(t *testing.T) {
+ 
+ 	for _, hook := range []string{"prestart", "createRuntime", "poststart"} {
+ 		fi, err := os.Stat(filepath.Join(config.Rootfs, hook))
+-		if err == nil || !os.IsNotExist(err) {
++		if err == nil || !errors.Is(err, os.ErrNotExist) {
+ 			t.Fatalf("expected file '%s to not exists, but it does", fi.Name())
+ 		}
+ 	}
+@@ -1645,7 +1645,7 @@ func TestTmpfsCopyUp(t *testing.T) {
+ }
+ 
+ func TestCGROUPPrivate(t *testing.T) {
+-	if _, err := os.Stat("/proc/self/ns/cgroup"); os.IsNotExist(err) {
++	if _, err := os.Stat("/proc/self/ns/cgroup"); errors.Is(err, os.ErrNotExist) {
+ 		t.Skip("Test requires cgroupns.")
+ 	}
+ 	if testing.Short() {
+@@ -1665,7 +1665,7 @@ func TestCGROUPPrivate(t *testing.T) {
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
+@@ -940,7 +940,7 @@ func getPipeFds(pid int) ([]string, error) {
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
+@@ -361,7 +361,7 @@ func mountCgroupV1(m mountEntry, c *mountConfig) error {
+ 			// symlink(2) is very dumb, it will just shove the path into
+ 			// the link and doesn't do any checks or relative path
+ 			// conversion. Also, don't error out if the cgroup already exists.
+-			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !os.IsExist(err) {
++			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !errors.Is(err, os.ErrExist) {
+ 				return err
+ 			}
+ 		}
+@@ -613,7 +613,7 @@ func mountToRootfs(c *mountConfig, m mountEntry) error {
+ 			return err
+ 		}
+ 		if fi, err := os.Lstat(dest); err != nil {
+-			if !os.IsNotExist(err) {
++			if !errors.Is(err, os.ErrNotExist) {
+ 				return err
+ 			}
+ 		} else if !fi.IsDir() {
+@@ -910,7 +910,7 @@ func setupDevSymlinks(rootfs string) error {
+ 			src = link[0]
+ 			dst = filepath.Join(rootfs, link[1])
+ 		)
+-		if err := os.Symlink(src, dst); err != nil && !os.IsExist(err) {
++		if err := os.Symlink(src, dst); err != nil && !errors.Is(err, os.ErrExist) {
+ 			return err
+ 		}
+ 	}
+@@ -1132,7 +1132,7 @@ func setReadonly() error {
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
+@@ -213,7 +214,7 @@ func (r *restoredState) transition(s containerState) error {
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
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
