From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Oct 2015 14:57:17 +0200
Subject: [Buildroot] [PATCH 2/2] ipmiutil: fix stack protector test
In-Reply-To: <88628938a5c1b5e5ec376f105519948386afe751.1445950637.git.baruch@tkos.co.il>
References: <88628938a5c1b5e5ec376f105519948386afe751.1445950637.git.baruch@tkos.co.il>
Message-ID: <fe150b99186b8b76924cfaf246a3d56b43e1d8cb.1445950637.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that corrects detection of toolchain stack protector support when
libssp is missing.

Fixes:
http://autobuild.buildroot.net/results/497/497d2739c27ce0dcf91bdf2f87c02fc169ba9071/
http://autobuild.buildroot.net/results/f71/f71a4bbca2505fcacb396bcc643c7152d87b5283/
http://autobuild.buildroot.net/results/85d/85da63d49086f8cc62e2c67632dfdc39d7702169/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...003-configure.ac-fix-stack-protector-test.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch

diff --git a/package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch b/package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch
new file mode 100644
index 000000000000..d6ad6045dd34
--- /dev/null
+++ b/package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch
@@ -0,0 +1,45 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 27 Oct 2015 13:58:24 +0200
+Subject: [PATCH] configure.ac: fix stack protector test
+
+gcc does not generate stack protection check code for function that does not
+use its stack. Some toolchain (most notable uClibc based) accept the
+-fstack-protector option, but don't provide libssp. The current test will
+incorrectly identify this case, leading to link failures like:
+
+ipmiutil.o: In function `main':
+ipmiutil.c:(.text.startup+0x1c0): undefined reference to
+`__stack_chk_fail_local'
+ialarms.o: In function `get_alarms_picmg':
+ialarms.c:(.text+0x1c5): undefined reference to `__stack_chk_fail_local'
+ialarms.o: In function `.L46':
+ialarms.c:(.text+0x362): undefined reference to `__stack_chk_fail_local'
+ialarms.o: In function `get_enc_leds':
+ialarms.c:(.text+0x45f): undefined reference to `__stack_chk_fail_local'
+
+Add stack usage code to the test to correctly identify missing libssp.
+
+Patch status: sent upstream
+(http://sourceforge.net/p/ipmiutil/mailman/message/34572536/)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 41b6ea89167a..f3f60fb9ff69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -334,7 +334,7 @@ else
+         rm -f $tmpc $tmpo >/dev/null 2>&1
+ 	echo $ECHO_N "checking compile fortify flags ... $ECHO_C"
+ 	cfhard="-fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
+-	echo "int main() { return(1); }" >$tmpc
++	echo "int main() { alloca(100); return(1); }" >$tmpc
+ 	$CC -o $tmpo $cfhard $tmpc  >/dev/null 2>&1
+ 	if test $? -ne 0 ; then
+ 	   cfhard=
+-- 
+2.6.1
+
-- 
2.6.1
