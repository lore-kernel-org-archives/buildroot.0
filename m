From: Mauro Condarelli <mc5686@mclink.it>
Date: Sat, 21 May 2016 22:16:00 +0200
Subject: [Buildroot] [PATCH 1/1] Fix for GIT cross-compilation.
Message-ID: <1463861760-12709-1-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GIT configuration partially relies on system parameters retrieved
using 'uname -?' directlly at make time.
This does not mix well with cross compilation.
This patch allows to feed canned uname results directly from git.mk.

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/git/00-Fix_uname_config.patch | 21 +++++++++++++++++++++
 package/git/git.mk                    | 10 ++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 package/git/00-Fix_uname_config.patch

diff --git a/package/git/00-Fix_uname_config.patch b/package/git/00-Fix_uname_config.patch
new file mode 100644
index 0000000..242e6cc
--- /dev/null
+++ b/package/git/00-Fix_uname_config.patch
@@ -0,0 +1,21 @@
+diff -ru git-2.6.4/config.mak.uname git-2.6.4_patched/config.mak.uname
+--- git-2.6.4/config.mak.uname	2015-12-08 23:54:24.000000000 +0100
++++ git-2.6.4_patched/config.mak.uname	2016-05-20 23:31:13.502943770 +0200
+@@ -1,11 +1,11 @@
+ # Platform specific Makefile tweaks based on uname detection
+ 
+-uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
+-uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
+-uname_O := $(shell sh -c 'uname -o 2>/dev/null || echo not')
+-uname_R := $(shell sh -c 'uname -r 2>/dev/null || echo not')
+-uname_P := $(shell sh -c 'uname -p 2>/dev/null || echo not')
+-uname_V := $(shell sh -c 'uname -v 2>/dev/null || echo not')
++uname_S := $(UNAME_S)
++uname_M := $(UNAME_M)
++uname_O := $(UNAME_O)
++uname_R := $(UNAME_R)
++uname_P := $(UNAME_P)
++uname_V := $(UNAME_V)
+ 
+ ifdef MSVC
+ 	# avoid the MingW and Cygwin configuration sections
diff --git a/package/git/git.mk b/package/git/git.mk
index db26036..db6b2b3 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -63,4 +63,14 @@ GIT_CONF_ENV += \
 	ac_cv_fread_reads_directories=yes \
 	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
 
+# git has make-time configuration based on uname; pass over specific
+# values to be used in config.mak.uname unstead of `uname -#` output
+GIT_MAKE_OPTS += \
+	UNAME_S="Linux" \
+	UNAME_M=$(BR2_ARCH) \
+	UNAME_O="GNU/Linux" \
+	UNAME_R=$(BR2_LINUX_KERNEL_VERSION) \
+	UNAME_P="unknown" \
+	UNAME_V="BuildRoot Linux $(patsubst "%",%,$(BR2_LINUX_KERNEL_VERSION))"
+
 $(eval $(autotools-package))
-- 
2.1.4
