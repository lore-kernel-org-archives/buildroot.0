Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A7FC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFAA401D6;
	Wed, 15 Feb 2023 21:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAFAA401D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMpq4Kp6-iqu; Wed, 15 Feb 2023 21:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F80240861;
	Wed, 15 Feb 2023 21:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F80240861
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A42BB1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E8FD40199
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E8FD40199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyAjRo9qUiI4 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36179400CC
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36179400CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 219DD85ED1; Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:45:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7bd0fdb88a15b15d4b41bdc82a37cf35ab2b268
X-Git-Newrev: b259dac22a4179494e9947c485b6b171d8fef52e
X-Patchwork-Hint: ignore
Message-Id: <20230215214803.219DD85ED1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmalloc: use actual patches rather
 than sed-ing
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b259dac22a4179494e9947c485b6b171d8fef52e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our dmalloc packaging is very old and carries historical baggage and
idiosyncracies that we have long stopped doing in the rest ofthe code
base.

Drop our post-patch hooks that seds the configure and Makefile.in files,
and add patches (that could be upstreamed one day).

We provide the results in the environment, like would be done with
actual autoconf cache variables (ac_cv_*).

Note: those are the result of cleaning up for further patches that did
not manifest because it was too complex to add proper SSP support to
dmalloc (instead, we're going to forcibly disable it in the following
commit).

Note-2: those patches have not been submitted upstream, as it's mostly
dead: even though there's been some commit activities recently-ish, there
has been no review or comments or the many PR pending for many years
now.

Note-3: we patch both configure and configure.ac, rather than
autoreconf, for two reasons: 1. the both are in the upstream git tree,
so submitting these patches would require patching both, and 2. dmalloc
does not autoreconf nicely out of the box, and it was deemed too much
hassle to fix that in addition.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...003-configure-allow-overriding-some-tests.patch | 80 ++++++++++++++++++++++
 ...e-the-configure-detected-or-user-supplied.patch | 50 ++++++++++++++
 ...onfigure-use-LD-instead-of-hard-coding-ld.patch | 67 ++++++++++++++++++
 package/dmalloc/dmalloc.mk                         | 17 ++---
 4 files changed, 202 insertions(+), 12 deletions(-)

diff --git a/package/dmalloc/0003-configure-allow-overriding-some-tests.patch b/package/dmalloc/0003-configure-allow-overriding-some-tests.patch
new file mode 100644
index 0000000000..3003e8cbe4
--- /dev/null
+++ b/package/dmalloc/0003-configure-allow-overriding-some-tests.patch
@@ -0,0 +1,80 @@
+From 9d57d4353c82110c609f36f91986277343d4ee45 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 8 Feb 2023 13:26:56 +0100
+Subject: [PATCH] configure: allow overriding some tests
+
+Some tests use AC_RUN_IFELSE, so they do not work for cross-compilation.
+
+Allow the user to provide these results from the environment.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure    | 6 +++---
+ configure.ac | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index c18dfb2..d165962 100755
+--- a/configure
++++ b/configure
+@@ -4540,7 +4540,7 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking strdup macro" >&5
+ $as_echo_n "checking strdup macro... " >&6; }
+ if test "$cross_compiling" = yes; then :
+-  ac_cv_strdup_macro=no
++  ac_cv_strdup_macro="${ac_cv_strdup_macro-no}"
+ 
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -4578,7 +4578,7 @@ $as_echo "$ac_cv_strdup_macro" >&6; }
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking strndup macro" >&5
+ $as_echo_n "checking strndup macro... " >&6; }
+ if test "$cross_compiling" = yes; then :
+-  ac_cv_strndup_macro=no
++  ac_cv_strndup_macro="${ac_cv_strndup_macro-no}"
+ 
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -4753,7 +4753,7 @@ done
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking basic-block size" >&5
+ $as_echo_n "checking basic-block size... " >&6; }
+-ac_cv_page_size=0
++ac_cv_page_size="${ac_cv_page_size-0}"
+ if test $ac_cv_page_size = 0; then
+    if test "$cross_compiling" = yes; then :
+    ac_cv_page_size=0
+diff --git a/configure.ac b/configure.ac
+index 9740fdc..51bdf4d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -292,7 +292,7 @@ int main() { return 1; }
+ ]])],
+ [ac_cv_strdup_macro=yes],
+ [ac_cv_strdup_macro=no],
+-[ac_cv_strdup_macro=no]
++[ac_cv_strdup_macro="${ac_cv_strdup_macro-no}"]
+ )
+ AC_MSG_RESULT([$ac_cv_strdup_macro])
+ 
+@@ -316,7 +316,7 @@ int main() { return 1; }
+ ]])],
+ [ac_cv_strndup_macro=yes],
+ [ac_cv_strndup_macro=no],
+-[ac_cv_strndup_macro=no]
++[ac_cv_strndup_macro="${ac_cv_strndup_macro-no}"]
+ )
+ AC_MSG_RESULT([$ac_cv_strndup_macro])
+ 
+@@ -390,7 +390,7 @@ AC_MSG_RESULT([$ac_cv_use_mmap])
+ #
+ AC_CHECK_FUNCS(getpagesize)
+ AC_MSG_CHECKING([basic-block size])
+-ac_cv_page_size=0
++ac_cv_page_size="${ac_cv_page_size-0}"
+ if test $ac_cv_page_size = 0; then
+    AC_RUN_IFELSE([AC_LANG_SOURCE([
+ #if HAVE_UNISTD_H
+-- 
+2.25.1
+
diff --git a/package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch b/package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
new file mode 100644
index 0000000000..394e7ca34e
--- /dev/null
+++ b/package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
@@ -0,0 +1,50 @@
+From c958fd5cd7d5ff03c0a023608b53b74997c514b3 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 8 Feb 2023 13:43:55 +0100
+Subject: [PATCH] Makefile: use the configure-detected or user-supplied ar
+ program
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 86d3cca..089ac99 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -303,11 +303,11 @@ $(LIB_SL) : $(LIBRARY)
+ 	mv $@.t $@
+ 
+ $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
+-	ar cr $@ $?
++	$(AR) cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
+-	ar cr $@ $?
++	$(AR) cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH_SL) : $(LIB_TH)
+@@ -316,7 +316,7 @@ $(LIB_TH_SL) : $(LIB_TH)
+ 	mv $@.t $@
+ 
+ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+-	ar cr $@ $?
++	$(AR) cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_CXX_SL) : $(LIB_CXX)
+@@ -325,7 +325,7 @@ $(LIB_CXX_SL) : $(LIB_CXX)
+ 	mv $@.t $@
+ 
+ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+-	ar cr $@ $?
++	$(AR) cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH_CXX_SL) : $(LIB_TH_CXX)
+-- 
+2.25.1
+
diff --git a/package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch b/package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch
new file mode 100644
index 0000000000..3ba6ee3dc7
--- /dev/null
+++ b/package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch
@@ -0,0 +1,67 @@
+From d77e5f3d45b0cbae850e3a6e23d52edc137be803 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 8 Feb 2023 13:52:05 +0100
+Subject: [PATCH] configure: use ${LD} instead of hard-coding 'ld'
+
+When doing cross-compilation, we do not want to use the native tools to
+test, but the target tools.
+
+Note that the weird quoting is inherited from a legacy patch in
+Buildroot, which dates back ages (at least 2006), and as it has not been
+identified as breaking things, we keep it as-is... Meh...
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure    | 12 ++++++------
+ configure.ac | 12 ++++++------
+ 2 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/configure b/configure
+index 810636e..30a7ea3 100755
+--- a/configure
++++ b/configure
+@@ -4377,12 +4377,12 @@ if ac_fn_c_try_compile "$LINENO"; then :
+             ac_cv_shared_link_args='# Could not configure shlib linking'
+             enable_shlib=no
+           fi
+-       elif (ld -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -shared --whole-archive -soname $@ -o $@.t'
+-	elif (ld -shared -o conftest.so.t -all -soname conftest.so.t -none -lc -all conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -shared -o $@.t -all -soname $@ -none -lc -all'
+-	elif (ld -G -o conftest.so.t conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -G -o $@.t'
++       elif (${LD-ld} -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a) 2>&5; then
++		ac_cv_shared_link_args="${LD-ld}"' -shared --whole-archive -soname $@ -o $@.t'
++	elif (${LD-ld} -shared -o conftest.so.t -all -soname conftest.so.t -none -lc -all conftest.a) 2>&5; then
++		ac_cv_shared_link_args="${LD-ld}"' -shared -o $@.t -all -soname $@ -none -lc -all'
++	elif (${LD-ld} -G -o conftest.so.t conftest.a) 2>&5; then
++		ac_cv_shared_link_args="${LD-ld}"' -G -o $@.t'
+ 	else
+ 		# oh well, toss an error
+ 		ac_cv_shared_link_args='# Could not configure shlib linking'
+diff --git a/configure.ac b/configure.ac
+index 51bdf4d..0d80a78 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -169,12 +169,12 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([ int foo(int val) { return val + 1; } ])],[
+             ac_cv_shared_link_args='# Could not configure shlib linking'
+             enable_shlib=no
+           fi
+-       elif (ld -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -shared --whole-archive -soname $@ -o $@.t'
+-	elif (ld -shared -o conftest.so.t -all -soname conftest.so.t -none -lc -all conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -shared -o $@.t -all -soname $@ -none -lc -all'
+-	elif (ld -G -o conftest.so.t conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -G -o $@.t'
++       elif (${LD-ld} -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a) 2>&5; then
++		ac_cv_shared_link_args="${LD-ld}"' -shared --whole-archive -soname $@ -o $@.t'
++	elif (${LD-ld} -shared -o conftest.so.t -all -soname conftest.so.t -none -lc -all conftest.a) 2>&5; then
++		ac_cv_shared_link_args="${LD-ld}"' -shared -o $@.t -all -soname $@ -none -lc -all'
++	elif (${LD-ld} -G -o conftest.so.t conftest.a) 2>&5; then
++		ac_cv_shared_link_args="${LD-ld}"' -G -o $@.t'
+ 	else
+ 		# oh well, toss an error
+ 		ac_cv_shared_link_args='# Could not configure shlib linking'
+-- 
+2.25.1
+
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 81ac467277..6b90f810b2 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -44,18 +44,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_63261),y)
 DMALLOC_CFLAGS += -O0
 endif
 
-DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
-
-define DMALLOC_POST_PATCH
-	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
-	$(SED) 's/ac_cv_strdup_macro=no$$/ac_cv_strdup_macro=yes/' $(@D)/configure
-	$(SED) 's/ac_cv_strndup_macro=no$$/ac_cv_strndup_macro=yes/' $(@D)/configure
-	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
-	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
-	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
-endef
-
-DMALLOC_POST_PATCH_HOOKS += DMALLOC_POST_PATCH
+DMALLOC_CONF_ENV = \
+	CFLAGS="$(DMALLOC_CFLAGS)" \
+	ac_cv_page_size=12 \
+	ac_cv_strdup_macro=yes \
+	ac_cv_strndup_macro=yes
 
 # both DESTDIR and PREFIX are ignored..
 define DMALLOC_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
