From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Sep 2012 09:25:26 +0200
Subject: [Buildroot] [PATCH 08/14] microperl: bump version to 5.16.1
In-Reply-To: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
References: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1346484332-31433-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl-fix-build.patch |   76 +++++++++++++++++++++++++++
 package/microperl/microperl.mk              |    8 +--
 2 files changed, 80 insertions(+), 4 deletions(-)
 create mode 100644 package/microperl/microperl-fix-build.patch

diff --git a/package/microperl/microperl-fix-build.patch b/package/microperl/microperl-fix-build.patch
new file mode 100644
index 0000000..fe01395
--- /dev/null
+++ b/package/microperl/microperl-fix-build.patch
@@ -0,0 +1,76 @@
+Backport of http://perl5.git.perl.org/perl.git/commitdiff/d40eae8f110fb9900e82648a2c44710def9f117d
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+From: Nicholas Clark <nick@ccl4.org>
+Date: Fri, 27 Jul 2012 17:36:40 +0200
+Subject: [PATCH] Restore microperl, which has been unable to build since January.
+
+microperl was broken by commit 82ad65bb0613be64 on 2012-01-16, which used
+IN_LOCALE_COMPILETIME for the first time in the C code. Unlike
+IN_LOCALE_RUNTIME, it had no fallback definition for microperl.
+
+Commit f90a9a0230170cc0 on 2012-01-28 added the first use of Strtol(),
+which means that microperl now needs to assume that the system has strtol().
+(Which is not unreasonable, as it's part of C89).
+---
+ perl.h       |    1 +
+ uconfig.h    |    2 +-
+ uconfig.sh   |    2 +-
+ uconfig64.sh |    2 +-
+ 4 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/perl.h b/perl.h
+index e532af2..9e92ae4 100644
+--- a/perl.h
++++ b/perl.h
+@@ -5311,6 +5311,7 @@ typedef struct am_table_short AMTS;
+ #define RESTORE_NUMERIC_STANDARD()	/**/
+ #define Atof				my_atof
+ #define IN_LOCALE_RUNTIME		0
++#define IN_LOCALE_COMPILETIME		0
+ 
+ #endif /* !USE_LOCALE_NUMERIC */
+ 
+diff --git a/uconfig.h b/uconfig.h
+index 20b1f23..60c7ca7 100644
+--- a/uconfig.h
++++ b/uconfig.h
+@@ -527,7 +527,7 @@
+  *	This symbol, if defined, indicates that the strtol routine is available
+  *	to provide better numeric string conversion than atoi() and friends.
+  */
+-/*#define HAS_STRTOL	/ **/
++#define HAS_STRTOL	/**/
+ 
+ /* HAS_STRXFRM:
+  *	This symbol, if defined, indicates that the strxfrm() routine is
+diff --git a/uconfig.sh b/uconfig.sh
+index e96b7e8..d761d5c 100644
+--- a/uconfig.sh
++++ b/uconfig.sh
+@@ -424,7 +424,7 @@ d_strftime='undef'
+ d_strlcat='undef'
+ d_strlcpy='undef'
+ d_strtod='undef'
+-d_strtol='undef'
++d_strtol='define'
+ d_strtold='undef'
+ d_strtoll='undef'
+ d_strtoq='undef'
+diff --git a/uconfig64.sh b/uconfig64.sh
+index 80e6f7f..f57c979 100644
+--- a/uconfig64.sh
++++ b/uconfig64.sh
+@@ -425,7 +425,7 @@ d_strftime='undef'
+ d_strlcat='undef'
+ d_strlcpy='undef'
+ d_strtod='undef'
+-d_strtol='undef'
++d_strtol='define'
+ d_strtold='undef'
+ d_strtoll='undef'
+ d_strtoq='undef'
+-- 
+1.7.9.5
+
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index c0f6029..b601754 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-MICROPERL_VERSION_MAJOR = 14
-MICROPERL_VERSION = 5.$(MICROPERL_VERSION_MAJOR).2
+MICROPERL_VERSION_MAJOR = 16
+MICROPERL_VERSION = 5.$(MICROPERL_VERSION_MAJOR).1
 MICROPERL_SITE = http://www.cpan.org/src/5.0
 MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
 MICROPERL_LICENSE = Artistic
@@ -50,7 +50,6 @@ MICROPERL_BASE_MODS += \
 # some common modules (from lib/)
 MICROPERL_BASE_MODS += \
   Benchmark.pm \
-  Carp.pm \
   Class/Struct.pm \
   Exporter.pm Exporter/Heavy.pm \
   File/Basename.pm \
@@ -63,6 +62,7 @@ MICROPERL_BASE_MODS += \
 
 # other common modules (from dist/)
 MICROPERL_MODS += \
+  Carp.pm \
   Dumpvalue.pm \
   Env.pm \
   autouse.pm \
@@ -155,7 +155,7 @@ endef
 
 define MICROPERL_BUILD_CMDS
 	$(MAKE) -f Makefile.micro -C $(@D) \
-		CC="$(HOSTCC)" bitcount.h
+		CC="$(HOSTCC)" ubitcount.h
 	$(MAKE) -f Makefile.micro -C $(@D) \
 		CC="$(TARGET_CC)" OPTIMIZE="$(TARGET_CFLAGS)"
 	$(MICROPERL_BUILD_EXTENSIONS)
-- 
1.7.9.5
