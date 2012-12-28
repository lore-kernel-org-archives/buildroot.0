From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 09:07:36 -0300
Subject: [Buildroot] [PATCH 2/3] pcre: bump to version 8.32
In-Reply-To: <1356696457-12445-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356696457-12445-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356696457-12445-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump PCRE to version 8.32
Also add a patch to remove compatibility bits, fixing:
http://autobuild.buildroot.net/results/e380b838296c85ff9aeaec9fa088bded69670307/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pcre/pcre-no-compat.patch |   31 +++++++++++++++++++++++++++++++
 package/pcre/pcre.mk              |    2 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 package/pcre/pcre-no-compat.patch

diff --git a/package/pcre/pcre-no-compat.patch b/package/pcre/pcre-no-compat.patch
new file mode 100644
index 0000000..7099727
--- /dev/null
+++ b/package/pcre/pcre-no-compat.patch
@@ -0,0 +1,31 @@
+Kill ABI compatibility bits, we don't need them.
+Fixes build failures on non-ELF (blackfin) targets.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura pcre-8.32.orig/pcrecpp.cc pcre-8.32/pcrecpp.cc
+--- pcre-8.32.orig/pcrecpp.cc	2012-12-28 08:32:10.193847937 -0300
++++ pcre-8.32/pcrecpp.cc	2012-12-28 08:32:26.924376180 -0300
+@@ -58,22 +58,6 @@
+ // Special object that stands-in for no argument
+ Arg RE::no_arg((void*)NULL);
+ 
+-// This is for ABI compatibility with old versions of pcre (pre-7.6),
+-// which defined a global no_arg variable instead of putting it in the
+-// RE class.  This works on GCC >= 3, at least.  It definitely works
+-// for ELF, but may not for other object formats (Mach-O, for
+-// instance, does not support aliases.)  We could probably have a more
+-// inclusive test if we ever needed it.  (Note that not only the
+-// __attribute__ syntax, but also __USER_LABEL_PREFIX__, are
+-// gnu-specific.)
+-#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__)
+-# define ULP_AS_STRING(x)            ULP_AS_STRING_INTERNAL(x)
+-# define ULP_AS_STRING_INTERNAL(x)   #x
+-# define USER_LABEL_PREFIX_STR       ULP_AS_STRING(__USER_LABEL_PREFIX__)
+-extern Arg no_arg
+-  __attribute__((alias(USER_LABEL_PREFIX_STR "_ZN7pcrecpp2RE6no_argE")));
+-#endif
+-
+ // If a regular expression has no error, its error_ field points here
+ static const string empty_string;
+ 
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 9947c4b..9e27cb5 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCRE_VERSION = 8.31
+PCRE_VERSION = 8.32
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
-- 
1.7.8.6
