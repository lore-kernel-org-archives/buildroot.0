From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:35:27 +0200
Subject: [Buildroot] [git commit] ipmiutil: bump to version 2.9.9
Message-ID: <20160726193601.398BA807E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fccf22c3a4681a38d3dd80998b9e2c803b4140c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches, and update AUTORECONF comment accordingly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-lib-Makefile.am-fix-lanplus-disable.patch | 38 ------------------
 ...003-configure.ac-fix-stack-protector-test.patch | 45 ----------------------
 package/ipmiutil/ipmiutil.hash                     |  4 +-
 package/ipmiutil/ipmiutil.mk                       |  4 +-
 4 files changed, 5 insertions(+), 86 deletions(-)

diff --git a/package/ipmiutil/0002-lib-Makefile.am-fix-lanplus-disable.patch b/package/ipmiutil/0002-lib-Makefile.am-fix-lanplus-disable.patch
deleted file mode 100644
index 35d1d67..0000000
--- a/package/ipmiutil/0002-lib-Makefile.am-fix-lanplus-disable.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 27 Oct 2015 14:23:44 +0200
-Subject: [PATCH] lib/Makefile.am: fix lanplus disable
-
-Protect the install target as well when lanplus is disabled. Fixes the
-following installation failure when openssl is missing:
-
-In file included from lanplus.c:78:0:
-./inc/ipmitool/ipmi.h:51:25: fatal error: openssl/evp.h: No such file or directory
-
-Patch status: sent upstream
-(http://sourceforge.net/p/ipmiutil/mailman/message/34572580/)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- lib/Makefile.am | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 805a218ab7eb..939594cfd3e5 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -51,8 +51,10 @@ distclean:
- 	cd lanplus; make distclean
- 	
- install:
--	$(MKDIR) ${datato}
--	cd lanplus; make install
-+	if [ "$(PLUSFLAGS)" = "-DHAVE_LANPLUS" ]; then \
-+	  $(MKDIR) ${datato} ; \
-+	  cd lanplus; make install ; \
-+	fi
- 
- check:
- 
--- 
-2.6.1
-
diff --git a/package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch b/package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch
deleted file mode 100644
index d6ad604..0000000
--- a/package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 27 Oct 2015 13:58:24 +0200
-Subject: [PATCH] configure.ac: fix stack protector test
-
-gcc does not generate stack protection check code for function that does not
-use its stack. Some toolchain (most notable uClibc based) accept the
--fstack-protector option, but don't provide libssp. The current test will
-incorrectly identify this case, leading to link failures like:
-
-ipmiutil.o: In function `main':
-ipmiutil.c:(.text.startup+0x1c0): undefined reference to
-`__stack_chk_fail_local'
-ialarms.o: In function `get_alarms_picmg':
-ialarms.c:(.text+0x1c5): undefined reference to `__stack_chk_fail_local'
-ialarms.o: In function `.L46':
-ialarms.c:(.text+0x362): undefined reference to `__stack_chk_fail_local'
-ialarms.o: In function `get_enc_leds':
-ialarms.c:(.text+0x45f): undefined reference to `__stack_chk_fail_local'
-
-Add stack usage code to the test to correctly identify missing libssp.
-
-Patch status: sent upstream
-(http://sourceforge.net/p/ipmiutil/mailman/message/34572536/)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 41b6ea89167a..f3f60fb9ff69 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -334,7 +334,7 @@ else
-         rm -f $tmpc $tmpo >/dev/null 2>&1
- 	echo $ECHO_N "checking compile fortify flags ... $ECHO_C"
- 	cfhard="-fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
--	echo "int main() { return(1); }" >$tmpc
-+	echo "int main() { alloca(100); return(1); }" >$tmpc
- 	$CC -o $tmpo $cfhard $tmpc  >/dev/null 2>&1
- 	if test $? -ne 0 ; then
- 	   cfhard=
--- 
-2.6.1
-
diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index 35a0bd3..f9d086b 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,2 +1,4 @@
 # From http://sourceforge.net/projects/ipmiutil/files/?source=navbar
-sha1	cc26d977afc87717812ef25aa02b2d5ab84843c4	ipmiutil-2.9.7.tar.gz
+sha1	f423a77a374b6a37a16496844f1e6e363e7d63fe	ipmiutil-2.9.9.tar.gz
+# Locally computed
+sha256	beace08386a002c6a4bbbf894bda9899ea34fae4c2181c89f29fb1fa136925f6	ipmiutil-2.9.9.tar.gz
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 30d0f96..392856c 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 2.9.7
+IPMIUTIL_VERSION = 2.9.9
 IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3c
 IPMIUTIL_LICENSE_FILES = COPYING
-# We're patching configure.ac, lib/Makefile.am
+# We're patching configure.ac
 IPMIUTIL_AUTORECONF = YES
 
 IPMIUTIL_MAKE = $(MAKE1)
