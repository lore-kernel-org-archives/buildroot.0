From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun, 22 May 2016 22:29:35 +0200
Subject: [Buildroot] [PATCH v2] Fix for GIT cross-compilation.
Message-ID: <1463948975-21495-1-git-send-email-mc5686@mclink.it>
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
 ...nfig.mak.uname-to-allow-cross-compilation.patch | 47 ++++++++++++++++++++++
 package/git/git.mk                                 | 10 +++++
 2 files changed, 57 insertions(+)
 create mode 100644 package/git/0001-Fix-config.mak.uname-to-allow-cross-compilation.patch

diff --git a/package/git/0001-Fix-config.mak.uname-to-allow-cross-compilation.patch b/package/git/0001-Fix-config.mak.uname-to-allow-cross-compilation.patch
new file mode 100644
index 0000000..0305b67
--- /dev/null
+++ b/package/git/0001-Fix-config.mak.uname-to-allow-cross-compilation.patch
@@ -0,0 +1,47 @@
+From 9dcf7e679c441b877b63ff8e6dfc3865af6c6720 Mon Sep 17 00:00:00 2001
+From: Mauro Condarelli <mc5686@mclink.it>
+Date: Sun, 22 May 2016 20:44:26 +0200
+Subject: [PATCH 1/1] Fix config.mak.uname to allow cross-compilation
+
+Current implementation imperatively sets variables from "uname" output.
+This breaks cross-compilation because uname is run on host while target
+configuration may be different.
+
+Make current behavior a non-imperative default, so it's possible to
+force different values setting make variables.
+
+To cross-compile it will be necessary to explicitly set the various
+uname_X variables to values compatible with target.
+No change is needed with normal host compilation.
+Patch is trivial.
+
+Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
+---
+ config.mak.uname | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/config.mak.uname b/config.mak.uname
+index 40d6b29..d933b23 100644
+--- a/config.mak.uname
++++ b/config.mak.uname
+@@ -1,11 +1,11 @@
+ # Platform specific Makefile tweaks based on uname detection
+ 
+-uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
+-uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
+-uname_O := $(shell sh -c 'uname -o 2>/dev/null || echo not')
+-uname_R := $(shell sh -c 'uname -r 2>/dev/null || echo not')
+-uname_P := $(shell sh -c 'uname -p 2>/dev/null || echo not')
+-uname_V := $(shell sh -c 'uname -v 2>/dev/null || echo not')
++uname_S ?= $(shell sh -c 'uname -s 2>/dev/null || echo not')
++uname_M ?= $(shell sh -c 'uname -m 2>/dev/null || echo not')
++uname_O ?= $(shell sh -c 'uname -o 2>/dev/null || echo not')
++uname_R ?= $(shell sh -c 'uname -r 2>/dev/null || echo not')
++uname_P ?= $(shell sh -c 'uname -p 2>/dev/null || echo not')
++uname_V ?= $(shell sh -c 'uname -v 2>/dev/null || echo not')
+ 
+ ifdef MSVC
+ 	# avoid the MingW and Cygwin configuration sections
+-- 
+2.1.4
+
diff --git a/package/git/git.mk b/package/git/git.mk
index db26036..294b864 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -63,4 +63,14 @@ GIT_CONF_ENV += \
 	ac_cv_fread_reads_directories=yes \
 	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
 
+# git has make-time configuration based on uname; pass over specific
+# values to be used in config.mak.uname unstead of `uname -#` output
+GIT_MAKE_OPTS += \
+	uname_S="Linux" \
+	uname_M=$(BR2_ARCH) \
+	uname_O="GNU/Linux" \
+	uname_R=$(BR2_LINUX_KERNEL_VERSION) \
+	uname_P="unknown" \
+	uname_V="BuildRoot Linux $(patsubst "%",%,$(BR2_LINUX_KERNEL_VERSION))"
+
 $(eval $(autotools-package))
-- 
2.1.4
