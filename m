Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA5C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F39F682022;
	Wed,  8 Feb 2023 16:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39F682022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9mDQgaUtaXO; Wed,  8 Feb 2023 16:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51B982021;
	Wed,  8 Feb 2023 16:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51B982021
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE901BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBBFB40C2C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBBFB40C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8TV3S8-gZsEm for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:20:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8689440C22
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8689440C22
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:20:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so2639892wmp.1
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WC6MxZCdD/WMlKItQpwcb1tfp/4ZW6mZ93I11Mplu0o=;
 b=U87xm8a6Jvo03KlKbvTH69Mv5Dc+StCJoT1ljpolgbwx9Q51cvnb2D6E+XfsVKvFBq
 PwaaPAMQGJlpTM2hg+qWieBbuUZjaFAOu24S+2LLSOG0OXWyEppFL33v/lPp1HjGQTnZ
 zBMmO/s/zOVK8awfjtORH9SNsZFniWtZdihqBmorrN6sX8BSigjbXjLyPouxFwuzt7H9
 GOXMKLVZnbm0p/KgurvrjXTvTmpo6qJn5b4xqJ96iTYFoPjjs1wJnfnYFHn+baDpCrEJ
 IVBsnCO6U9fh8lxC89F7A3ijhhTLwpEfippRn3tsDOfASyTM1LfaXiBzaz7gNnS6/jED
 Oziw==
X-Gm-Message-State: AO0yUKUg1qVcuovL1C12h+2Rc8suTZfC7ey1gQH2r2xW5nW57nHmZmIM
 3z4eCq4yKffBxEc8FYgTIPt2rCoKgScJew==
X-Google-Smtp-Source: AK7set/jmlSJxrAnb16JZkaIqvGlUu1XlCadRTYesNFhg6gwBq56VyzUI4ChJxcdaM2RSbIjscN2Mw==
X-Received: by 2002:a05:600c:318a:b0:3df:94c3:46f2 with SMTP id
 s10-20020a05600c318a00b003df94c346f2mr7202735wmp.23.1675873218088; 
 Wed, 08 Feb 2023 08:20:18 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c169400b003dc54eef495sm2167672wmn.24.2023.02.08.08.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 08:20:17 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 17:20:15 +0100
Message-Id: <a2a5d94174a0efd482097b95a7eda50362d8d7a2.1675873210.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675873210.git.yann.morin.1998@free.fr>
References: <cover.1675873210.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WC6MxZCdD/WMlKItQpwcb1tfp/4ZW6mZ93I11Mplu0o=;
 b=efVu7m3X5Qa4No4qEPp9IO2BCDjZQU9/dUwOQUanMlnnvAhF2THNBF2KECJMCOHd5W
 Fq1R9om+rVkwuMM8oiaA+i4K/4TqtwFeDW6Aub+Ld7ELzDQ61ODAZIRSJVFsnh+KyvCZ
 WaZE64SLnkWe7z5SiKvyedCZY9vqv+Acg95uw2C3wrlHIon4DaQFPVCqdaX4qvWouLfq
 0xQVZ6wYKqxc8sli5CYIRQZTVvvcD3SZU8DdG0LNwjGcWs2jbOFFMK4yNS7ibrjy7KPp
 wrViE+lgC8P3MaMRnMNDyusE8L4m4GHl4+OdW4KzUiK7Cv4vSGtaoPto3Erv+VN7jyVB
 JHUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=efVu7m3X
Subject: [Buildroot] [PATCH 2/3] package/dmalloc: use actual patches rather
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
dead: even though there's een some commit activities recently-ish, there
has been no review or comments or the many PR pending for many years
now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...onfigure-allow-overriding-some-tests.patch | 80 +++++++++++++++++++
 ...-configure-detected-or-user-supplied.patch | 50 ++++++++++++
 ...ure-use-LD-instead-of-hard-coding-ld.patch | 67 ++++++++++++++++
 package/dmalloc/dmalloc.mk                    | 17 ++--
 4 files changed, 202 insertions(+), 12 deletions(-)
 create mode 100644 package/dmalloc/0003-configure-allow-overriding-some-tests.patch
 create mode 100644 package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 create mode 100644 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
