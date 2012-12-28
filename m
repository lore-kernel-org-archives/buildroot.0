From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 16:53:39 +0100
Subject: [Buildroot] [git commit] pcre: bump to version 8.32
Message-ID: <20121228155606.8F3629703D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe2ca806b00edb41d2ebbea7583537f37c96a09a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump PCRE to version 8.32
Also add a patch to remove compatibility bits, fixing:
http://autobuild.buildroot.net/results/e380b838296c85ff9aeaec9fa088bded69670307/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pcre/pcre-no-compat.patch |   31 +++++++++++++++++++++++++++++++
 package/pcre/pcre.mk              |    2 +-
 2 files changed, 32 insertions(+), 1 deletions(-)

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
