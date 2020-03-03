From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2020 23:55:48 +0100
Subject: [Buildroot] [git commit] Config.in: drop BR2_NEEDS_HOST_{JAVAC, JAR}
Message-ID: <20200303224447.3C5748F339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22e833af5e7bc287c9898e9afd98f257cbdf721d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With classpath removed, no packages select these symbols any more - So drop
them and their corresponding logic in dependencies.sh / genrandconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                            | 10 ----------
 support/dependencies/dependencies.sh |  8 --------
 utils/genrandconfig                  |  4 ----
 3 files changed, 22 deletions(-)

diff --git a/Config.in b/Config.in
index 90403037e6..48fd36ff98 100644
--- a/Config.in
+++ b/Config.in
@@ -63,16 +63,6 @@ config BR2_HOST_GCC_AT_LEAST_9
 config BR2_NEEDS_HOST_JAVA
 	bool
 
-# Hidden boolean selected by packages in need of javac in order to build
-# (example: classpath)
-config BR2_NEEDS_HOST_JAVAC
-	bool
-
-# Hidden boolean selected by packages in need of jar in order to build
-# (example: classpath)
-config BR2_NEEDS_HOST_JAR
-	bool
-
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
 # toolchains, binary tools like SAM-BA, etc.).
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 972f055e32..98469bd70c 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -204,14 +204,6 @@ if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	fi
 fi
 
-if grep -q ^BR2_NEEDS_HOST_JAVAC=y $BR2_CONFIG ; then
-	check_prog_host "javac"
-fi
-
-if grep -q ^BR2_NEEDS_HOST_JAR=y $BR2_CONFIG ; then
-	check_prog_host "jar"
-fi
-
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	if test ! -f /lib/ld-linux.so.2 ; then
 		echo
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5b60bc21d6..c79360be89 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -206,10 +206,6 @@ def fixup_config(sysinfo, configfile):
 
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
         return False
-    if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not sysinfo.has("javac"):
-        return False
-    if "BR2_NEEDS_HOST_JAR=y\n" in configlines and not sysinfo.has("jar"):
-        return False
     # python-nfc needs bzr
     if 'BR2_PACKAGE_PYTHON_NFC=y\n' in configlines and not sysinfo.has("bzr"):
         return False
