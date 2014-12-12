From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 14:48:00 +0000
Subject: [Buildroot] [PATCH 1/2] kismet: Remove libpcap compile tests to fix
	cross-compiling
Message-ID: <1418395681-40434-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These compile tests are run on the host machine which may have or may
not have libpcap installed, so we are relying on the host machine to
determine if we have to stop the build process due to a missing pcap
library. Given that Kismet already depends on libpcap we can be sure
that library will be installed in our target. So, for these two reasons
we can remove these compile tests from the configure script.

Fixes:
  http://autobuild.buildroot.net/results/965/965a3e345dc0a432043b72581bff7d33561fbe0c/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...pcap-compile-tests-to-fix-cross-compiling.patch |  104 ++++++++++++++++++++
 1 files changed, 104 insertions(+), 0 deletions(-)
 create mode 100644 package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch

diff --git a/package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch b/package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch
new file mode 100644
index 0000000..d41c64e
--- /dev/null
+++ b/package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch
@@ -0,0 +1,104 @@
+Remove libpcap compile tests to fix cross-compiling
+
+These compile tests are run on the host machine which may have or may
+not have libpcap installed, so we are relying on the host machine to
+determine if we have to stop the build process due to a missing pcap
+library. Given that Kismet already depends on libpcap we can be sure
+that library will be installed in our target. So, for these two reasons
+we can remove these compile tests from the configure script.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/configure b/configure
+--- a/configure	2014-12-11 16:35:36.979059147 +0000
++++ b/configure	2014-12-11 16:43:54.175647454 +0000
+@@ -6265,29 +6265,7 @@ if eval \${$as_ac_Lib+:} false; then :
+ else
+   ac_check_lib_save_LIBS=$LIBS
+ LIBS="-l${pcaplib}  $LIBS"
+-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-/* Override any GCC internal prototype to avoid an error.
+-   Use char because int might match the return type of a GCC
+-   builtin and then its argument prototype would still apply.  */
+-#ifdef __cplusplus
+-extern "C"
+-#endif
+-char pcap_open_live ();
+-int
+-main ()
+-{
+-return pcap_open_live ();
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+   eval "$as_ac_Lib=yes"
+-else
+-  eval "$as_ac_Lib=no"
+-fi
+ rm -f core conftest.err conftest.$ac_objext \
+     conftest$ac_exeext conftest.$ac_ext
+ LIBS=$ac_check_lib_save_LIBS
+@@ -6337,29 +6315,7 @@ if ${ac_cv_lib_pcap_pcap_setnonblock+:} 
+ else
+   ac_check_lib_save_LIBS=$LIBS
+ LIBS="-lpcap  $LIBS"
+-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-/* Override any GCC internal prototype to avoid an error.
+-   Use char because int might match the return type of a GCC
+-   builtin and then its argument prototype would still apply.  */
+-#ifdef __cplusplus
+-extern "C"
+-#endif
+-char pcap_setnonblock ();
+-int
+-main ()
+-{
+-return pcap_setnonblock ();
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+   ac_cv_lib_pcap_pcap_setnonblock=yes
+-else
+-  ac_cv_lib_pcap_pcap_setnonblock=no
+-fi
+ rm -f core conftest.err conftest.$ac_objext \
+     conftest$ac_exeext conftest.$ac_ext
+ LIBS=$ac_check_lib_save_LIBS
+@@ -6385,29 +6341,7 @@ if eval \${$as_ac_Lib+:} false; then :
+ else
+   ac_check_lib_save_LIBS=$LIBS
+ LIBS="-l${pcaplib}  $LIBS"
+-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-/* Override any GCC internal prototype to avoid an error.
+-   Use char because int might match the return type of a GCC
+-   builtin and then its argument prototype would still apply.  */
+-#ifdef __cplusplus
+-extern "C"
+-#endif
+-char pcap_get_selectable_fd ();
+-int
+-main ()
+-{
+-return pcap_get_selectable_fd ();
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+   eval "$as_ac_Lib=yes"
+-else
+-  eval "$as_ac_Lib=no"
+-fi
+ rm -f core conftest.err conftest.$ac_objext \
+     conftest$ac_exeext conftest.$ac_ext
+ LIBS=$ac_check_lib_save_LIBS
-- 
1.7.1
