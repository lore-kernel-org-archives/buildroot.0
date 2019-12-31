From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 15:30:02 +0100
Subject: [Buildroot] [git commit] package/alsamixergui: cleanly fix build
 against fltk and newer alsa-libs
Message-ID: <20191231142035.BAECD813E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=312814a0be9ca4acc95cf4361a94499b2d7d6bd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have an existing patch to configure.in that chains the test to find
fltk (supposedly because a symbol of fltk got renamed sometime in the
past). By doing so, this chaining breaks the build when configure later
checks for the alsa libraries.

This is because chaining calls to AC_CHECK_LIBS() one in the other would
be expanded in such a way that internal functions, like ac_fn_c_try_link,
would get defined after being called, which results in configure failures
(see new bundled patch).

So, we change configure to use AC_SEARCH_LIBS() instead, which allows us
to memorise the result of each test, and we only fail when both tests
failed.

We can now drop the ac_cv overrides we had.

Incidentally, this also fixes detection of newer alsa-libs, where
atopology functions were offloaded to their own separate library:
    https://github.com/alsa-project/alsa-lib/commit/75d393a563efb578c79364a277087c6326267f52

Fixes:
    http://autobuild.buildroot.org/results/564c1561e83e0c064f3859d25e68dec96640e060

(Note: upstream has been basically dead for at least 15 years now, so we
did not even try to submit the patch there...)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0002-configure-fix-detection-of-fltk-libs.patch | 53 ++++++++++++++++++++++
 package/alsamixergui/alsamixergui.mk               |  5 --
 2 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/package/alsamixergui/0002-configure-fix-detection-of-fltk-libs.patch b/package/alsamixergui/0002-configure-fix-detection-of-fltk-libs.patch
new file mode 100644
index 0000000000..cc72d33bee
--- /dev/null
+++ b/package/alsamixergui/0002-configure-fix-detection-of-fltk-libs.patch
@@ -0,0 +1,53 @@
+From c154195fa161575363280aac9e928b7225f0de9e Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 29 Dec 2019 17:42:13 +0100
+Subject: [PATCH] configure: fix detection of fltk libs
+
+Chaining calls to AC_CHECK_LIB one in the other, breaks the configure
+script, because some internal functions (e.g. ac_fn_c_try_link) would
+not be defined before they are needed, leading the build to fail as
+thus:
+
+    checking for snd_tplg_new in -latopology... ./configure: line 4630:
+    ac_fn_c_try_link: command not found
+    no
+    configure: error: No linkable libatopology was found.
+
+Using AC_CHECK_LIB() in sequence (i.e. one after the other) and
+memorising the result is not trivial: AC_CHECK_LIB() implements a
+ddefault action-if-found that append to LIBS, but not if the user
+ptrovides their own action-if-found.
+
+Instead, AC_SEARH_LIBS() always append to LIBS, *and* run the
+user-provided action.
+
+So, we switch to AC_SEARCH_LIBS() and memorise the result for each
+test, to eventually test if ether worked.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 9307cc2..55f6864 100644
+--- a/configure.in
++++ b/configure.in
+@@ -11,10 +11,10 @@ AC_PROG_INSTALL
+ AC_PROG_LN_S
+ 
+ dnl Checks for libraries.
+-AC_CHECK_LIB(fltk,numericsort,,
+-AC_CHECK_LIB(fltk,fl_numericsort,,
+-AC_MSG_ERROR("missing fltk"))
+-)
++has_fltk=false
++AC_SEARCH_LIBS(numericsort,fltk,has_fltk=true)
++AC_SEARCH_LIBS(fl_numericsort,fltk,has_fltk=true)
++AS_IF(test "${has_fltk}" = "false", AC_MSG_ERROR("missing fltk"))
+ AM_PATH_ALSA(0.9.0)
+ 
+ dnl Checks for header files.
+-- 
+2.20.1
+
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index 24e2497f3b..8bf3f8e073 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -11,11 +11,6 @@ ALSAMIXERGUI_LICENSE = GPL-2.0+
 ALSAMIXERGUI_LICENSE_FILES = debian/copyright
 ALSAMIXERGUI_AUTORECONF = YES
 
-ALSAMIXERGUI_CONF_ENV = \
-	ac_cv_lib_fltk_numericsort=yes \
-	ac_cv_lib_fltk_fl_numericsort=yes \
-	ac_cv_lib_asound_snd_ctl_open=yes
-
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
 $(eval $(autotools-package))
