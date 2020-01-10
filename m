From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 20:02:42 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/docker-engine:
 security bump to 19.03.5
Message-ID: <20200110193543.DA46788777@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=032f18ee79280ce2ea0b8952561416b4f0f58354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-14271: In Docker 19.03.x before 19.03.1 linked against the GNU C
  Library (aka glibc), code injection can occur when the nsswitch facility
  dynamically loads a library inside a chroot that contains the contents of
  the container

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0161899ae56d2c886df890ae352665bb07c88869)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-Fix-faulty-runc-version-commit-scrape.patch | 45 ----------------------
 package/docker-engine/docker-engine.hash           |  2 +-
 package/docker-engine/docker-engine.mk             |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch b/package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch
deleted file mode 100644
index dc47a8f9ef..0000000000
--- a/package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 324e7be4b252c13002bca6a9d82e7b2e43664634 Mon Sep 17 00:00:00 2001
-From: Christian Stewart <christian@paral.in>
-Date: Mon, 26 Nov 2018 22:59:32 -0800
-Subject: [PATCH] Fix faulty runc version commit scrape
-
-This commit replaces faulty logic to determine the runc version commit hash.
-
-The original logic takes the second line of the output of "runc --version" and
-does not work if there are a different number of lines printed from the command
-than expected. The buildroot version of runc outputs two lines instead of the
-expected three, causing the error:
-
-unknown output format: runc version commit: ...
-
-This patch replaces this logic with a simple scan of the "runc --version"
-output, searching for the "runc version commit" prefixed line.
-
-Signed-off-by: Christian Stewart <christian@paral.in>
----
- daemon/info_unix.go | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/daemon/info_unix.go b/daemon/info_unix.go
-index 60b2f99870..688a510796 100644
---- a/daemon/info_unix.go
-+++ b/daemon/info_unix.go
-@@ -32,10 +32,11 @@ func (daemon *Daemon) fillPlatformInfo(v *types.Info, sysInfo *sysinfo.SysInfo)
- 	defaultRuntimeBinary := daemon.configStore.GetRuntime(v.DefaultRuntime).Path
- 	if rv, err := exec.Command(defaultRuntimeBinary, "--version").Output(); err == nil {
- 		parts := strings.Split(strings.TrimSpace(string(rv)), "\n")
--		if len(parts) == 3 {
--			parts = strings.Split(parts[1], ": ")
--			if len(parts) == 2 {
--				v.RuncCommit.ID = strings.TrimSpace(parts[1])
-+		for _, pt := range parts {
-+			ptKv := strings.Split(pt, ":")
-+			if strings.HasSuffix(strings.TrimSpace(ptKv[0]), "commit") {
-+				v.RuncCommit.ID = strings.TrimSpace(ptKv[1])
-+				break
- 			}
- 		}
- 
--- 
-2.18.1
-
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index b89310f993..59c9204285 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	fa3a9e998627418d648495d06d168c4d26ed07859c9370d5fddbfd29c26d8592  docker-engine-18.09.9.tar.gz
+sha256	bc5d1ac503e44593be8003ed0ad9c75bf0da535db19837a9338429c438bd4637  docker-engine-19.03.5.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 6a225ee5f0..24022f7107 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 18.09.9
+DOCKER_ENGINE_VERSION = 19.03.5
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
