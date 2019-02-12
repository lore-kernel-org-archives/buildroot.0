From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:21:44 +0100
Subject: [Buildroot] [git commit branch/next] docker-engine: fix runc
 version check warning
Message-ID: <20190213214531.19D598A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=424a90241c07fd15cd1caadd707f751461cf11fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the startup warning from Docker:

failed to retrieve runc version: unknown output format: runc version commit ...

Introduces a patch to replace the faulty version detection logic in the Docker
engine.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-Fix-faulty-runc-version-commit-scrape.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch b/package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch
new file mode 100644
index 0000000000..dc47a8f9ef
--- /dev/null
+++ b/package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch
@@ -0,0 +1,45 @@
+From 324e7be4b252c13002bca6a9d82e7b2e43664634 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Mon, 26 Nov 2018 22:59:32 -0800
+Subject: [PATCH] Fix faulty runc version commit scrape
+
+This commit replaces faulty logic to determine the runc version commit hash.
+
+The original logic takes the second line of the output of "runc --version" and
+does not work if there are a different number of lines printed from the command
+than expected. The buildroot version of runc outputs two lines instead of the
+expected three, causing the error:
+
+unknown output format: runc version commit: ...
+
+This patch replaces this logic with a simple scan of the "runc --version"
+output, searching for the "runc version commit" prefixed line.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ daemon/info_unix.go | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/daemon/info_unix.go b/daemon/info_unix.go
+index 60b2f99870..688a510796 100644
+--- a/daemon/info_unix.go
++++ b/daemon/info_unix.go
+@@ -32,10 +32,11 @@ func (daemon *Daemon) fillPlatformInfo(v *types.Info, sysInfo *sysinfo.SysInfo)
+ 	defaultRuntimeBinary := daemon.configStore.GetRuntime(v.DefaultRuntime).Path
+ 	if rv, err := exec.Command(defaultRuntimeBinary, "--version").Output(); err == nil {
+ 		parts := strings.Split(strings.TrimSpace(string(rv)), "\n")
+-		if len(parts) == 3 {
+-			parts = strings.Split(parts[1], ": ")
+-			if len(parts) == 2 {
+-				v.RuncCommit.ID = strings.TrimSpace(parts[1])
++		for _, pt := range parts {
++			ptKv := strings.Split(pt, ":")
++			if strings.HasSuffix(strings.TrimSpace(ptKv[0]), "commit") {
++				v.RuncCommit.ID = strings.TrimSpace(ptKv[1])
++				break
+ 			}
+ 		}
+ 
+-- 
+2.18.1
+
