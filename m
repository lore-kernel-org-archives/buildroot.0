Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C2BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:30:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2554B60E95
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2554B60E95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4100605D0;
	Sat, 24 Jul 2021 21:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ggvk86HT6LA; Sat, 24 Jul 2021 21:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B27B605EC;
	Sat, 24 Jul 2021 21:30:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50BC01BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 400AC834B6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TH9FjDXyN3jb for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:29:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F01688349A
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 00D5F7FD2E; Sat, 24 Jul 2021 20:55:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:29:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ad3de2abde38c023a7958cbd3ada1d7b066da67
X-Git-Newrev: 5a62f90e3635795dcc93b3316b987e0076dea48c
X-Patchwork-Hint: ignore
Message-Id: <20210724205513.00D5F7FD2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: bump version to 0.119 and
 use duktape
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5a62f90e3635795dcc93b3316b987e0076dea48c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately, as of commit 3e1d61868fa8bfc586099302e931433270e5d17d, polkit
requires mozjs >= 78, which means spidermonkey is too old. As such, this patch
is larger than usual.

Spidermonkey has a few major issues:
  - The source directory after compilation is enormous (2.7G!)
  - The shared library is 24MB stripped!
  - It requires python2 to build, which is EOLed, and Buildroot is working
    towards removing. See: https://elinux.org/Buildroot:Python2Packages

Instead of going through the arduous task of updating Spidermonkey, there is a
better solution: use duktape.

There has been a pending patch for over a year that incorporates duktape as an
optional backend for polkit found here:
https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/35

As Thomas Petazzoni put it:
  "As I am subscribed to notifications on this merge request, I have been
  following the intermittent discussions taking place on this topic.
  And indeed, discussions have been sparse, and the polkit maintainer reaction
  has not been very supportive. It even feels like they are trying to find
  every possible argument or small issue not to merge the duktape integration."

Many people have come out to support using duktape, and many users, including
myself, have used polkit with duktape for as long as the above merge request has
been around without issues; merging in the above merge request is an acceptable
exception to the typical Buildroot package policies.

As Thomas also suggested, I have forked polkit on Github
(https://github.com/aduskett/polkit-duktape), with the above duktape
merge request applied, and a release made with the same tag as upstream (0.119).

I refrained from also adding 0001-make-netgroup-support-optional.patch as it is
outside of the scope of why the fork exists.

Changes:
  - refactor 0001-make-netgroup-support-optional.patch to work with 0.119 and
    duktape.
  - Remove upstream incorporated 0002-jsauthority-memleak.patch
  - Remove upstream 0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
  - Remove any trace of spidermonkey from polkit, udisks, and systemd-polkit
  - Add duktape as a dependency of polkit
  - Change POLKIT_SITE to the above polkit-duktape GitHub repository.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-make-netgroup-support-optional.patch      | 41 +++++++++++++++++-----
 package/polkit/0002-jsauthority-memleak.patch      | 28 ---------------
 ...03-polkit-0.116-pkttyagent-sigttou-bg-job.patch | 34 ------------------
 package/polkit/Config.in                           | 24 ++++---------
 package/polkit/polkit.hash                         |  4 +--
 package/polkit/polkit.mk                           | 12 +++----
 package/systemd/Config.in                          | 17 +++------
 package/udisks/Config.in                           | 23 ++++--------
 8 files changed, 59 insertions(+), 124 deletions(-)

diff --git a/package/polkit/0001-make-netgroup-support-optional.patch b/package/polkit/0001-make-netgroup-support-optional.patch
index 86916aba34..09c48d7791 100644
--- a/package/polkit/0001-make-netgroup-support-optional.patch
+++ b/package/polkit/0001-make-netgroup-support-optional.patch
@@ -16,6 +16,7 @@ Fixes bug 50145.
 
 Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Adam: Extend patch to work with duktape integration.]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [Thomas: add introspection.m4.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
@@ -24,12 +25,13 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  configure.ac                                  |   2 +-
  src/polkit/polkitidentity.c                   |  16 ++
  src/polkit/polkitunixnetgroup.c               |   3 +
+ .../polkitbackendduktapeauthority.c           |   2 +
  .../polkitbackendinteractiveauthority.c       |  14 +-
- .../polkitbackendjsauthority.cpp              |   2 +
+ .../polkitbackendjsauthority.cpp              |   3 +-
  test/polkit/polkitidentitytest.c              |   9 +-
  test/polkit/polkitunixnetgrouptest.c          |   3 +
  .../test-polkitbackendjsauthority.c           |   2 +
- 9 files changed, 185 insertions(+), 8 deletions(-)
+ 10 files changed, 187 insertions(+), 9 deletions(-)
  create mode 100644 buildutil/introspection.m4
 
 diff --git a/buildutil/introspection.m4 b/buildutil/introspection.m4
@@ -184,7 +186,7 @@ diff --git a/configure.ac b/configure.ac
 index 5cedb4e..87aa0ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
+@@ -111,7 +111,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
  	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
  AC_SUBST(EXPAT_LIBS)
  
@@ -249,6 +251,26 @@ index 8a2b369..83f8d4a 100644
    g_return_val_if_fail (name != NULL, NULL);
    return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
                                         "name", name,
+diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polkitbackend/polkitbackendduktapeauthority.c
+index 4b4f8fd..e19b009 100644
+--- a/src/polkitbackend/polkitbackendduktapeauthority.c
++++ b/src/polkitbackend/polkitbackendduktapeauthority.c
+@@ -1036,6 +1036,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+   const char *netgroup;
+   gboolean is_in_netgroup = FALSE;
+ 
++#ifdef HAVE_SETNETGRENT
+   user = duk_require_string (cx, 0);
+   netgroup = duk_require_string (cx, 1);
+ 
+@@ -1046,6 +1047,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+     {
+       is_in_netgroup = TRUE;
+     }
++#endif
+ 
+   duk_push_boolean (cx, is_in_netgroup);
+   return 1;
 diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
 index 056d9a8..36c2f3d 100644
 --- a/src/polkitbackend/polkitbackendinteractiveauthority.c
@@ -298,7 +320,7 @@ diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/
 index 9b752d1..09b2878 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1520,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -306,14 +328,15 @@ index 9b752d1..09b2878 100644
    JS::RootedString usrstr (authority->priv->cx);
    usrstr = args[0].toString();
    user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
- 
-   JS_free (cx, netgroup);
-   JS_free (cx, user);
+@@ -1534,7 +1535,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+     {
+       is_in_netgroup =  true;
+     }
+-
 +#endif
- 
    ret = true;
  
+   args.rval ().setBoolean (is_in_netgroup);
 diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
 index e91967b..e829aaa 100644
 --- a/test/polkit/polkitidentitytest.c
diff --git a/package/polkit/0002-jsauthority-memleak.patch b/package/polkit/0002-jsauthority-memleak.patch
deleted file mode 100644
index 4f0733185c..0000000000
--- a/package/polkit/0002-jsauthority-memleak.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 28e3a6653d8c3777b07e0128a0d97d46e586e311 Mon Sep 17 00:00:00 2001
-From: Jan Rybar <jrybar@redhat.com>
-Date: Tue, 8 Oct 2019 13:28:18 +0000
-Subject: [PATCH] jsauthority: Fix two minor memory leaks
-
-(cherry picked from commit 28e3a6653d8c3777b07e0128a0d97d46e586e311)
-Signed-off-by: Jan Rybar <jrybar@redhat.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- src/polkitbackend/polkitbackendjsauthority.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 9b752d1..e97b8aa 100644
---- a/src/polkitbackend/polkitbackendjsauthority.cpp
-+++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -567,6 +567,8 @@ polkit_backend_js_authority_finalize (GObject *object)
-   g_strfreev (authority->priv->rules_dirs);
- 
-   delete authority->priv->ac;
-+  delete authority->priv->js_global;
-+  delete authority->priv->js_polkit;
- 
-   JS_DestroyContext (authority->priv->cx);
-   /* JS_ShutDown (); */
--- 
-2.24.1
-
diff --git a/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch b/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
deleted file mode 100644
index fb41df3af2..0000000000
--- a/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 76aae4fce586b400f5fe08df31497db19d624609 Mon Sep 17 00:00:00 2001
-From: Jan Rybar <jrybar@redhat.com>
-Date: Thu, 1 Aug 2019 06:46:10 +0000
-Subject: [PATCH] pkttyagent: process stopped by SIGTTOU if run in background
- job
-
-
-(cherry picked from commit 76aae4fce586b400f5fe08df31497db19d624609)
-Signed-off-by: Jan Rybar <jrybar@redhat.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- src/programs/pkttyagent.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/programs/pkttyagent.c b/src/programs/pkttyagent.c
-index 3c8d502..13879a2 100644
---- a/src/programs/pkttyagent.c
-+++ b/src/programs/pkttyagent.c
-@@ -264,6 +264,12 @@ main (int argc, char *argv[])
- 
-   memset (&sa, 0, sizeof (sa));
-   sa.sa_handler = &tty_handler;
-+/* If tty_handler() resets terminal while pkttyagent is run in background job,
-+   the process gets stopped by SIGTTOU. This impacts systemctl, hence it must
-+   be blocked for a while and then the process gets killed anyway.
-+ */
-+  sigemptyset(&sa.sa_mask);
-+  sigaddset(&sa.sa_mask, SIGTTOU);
-   sigaction (SIGTERM, &sa, &savesigterm);
-   sigaction (SIGINT, &sa, &savesigint);
-   sigaction (SIGTSTP, &sa, &savesigtstp);
--- 
-2.24.1
-
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index f54b6b4cda..622cbbb90b 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -1,18 +1,14 @@
 config BR2_PACKAGE_POLKIT
 	bool "polkit"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # spidermonkey
-	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
-	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # spidermonkey
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, dbus
 	depends on BR2_USE_MMU # libglib2, dbus
 	depends on BR2_USE_WCHAR # libglib2
-	depends on !BR2_STATIC_LIBS # spidermonkey
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # spidermonkey
+	depends on !BR2_STATIC_LIBS # duktape
 	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_SPIDERMONKEY
 	help
 	  PolicyKit is a toolkit for defining and handling
 	  authorizations. It is used for allowing unprivileged
@@ -20,13 +16,7 @@ config BR2_PACKAGE_POLKIT
 
 	  http://www.freedesktop.org/wiki/Software/polkit
 
-comment "polkit needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
+comment "polkit needs a toolchain with dynamic library, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index bacd682139..9677e19bb0 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1	polkit-0.116.tar.gz
+sha256  88d078f1d1f653fd31fe42e46cc3d9b7dd468e70684075e32fe1766dc7ece517  polkit-0.119.tar.gz
 
 # Locally calculated
-sha256	d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8	COPYING
+sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index bf9b5a7112..f48c103a52 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.116
-POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
+POLKIT_VERSION = 0.119
+POLKIT_SITE = $(call github,aduskett,polkit-duktape,v$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
@@ -13,11 +13,10 @@ POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = \
-	libglib2 host-intltool expat spidermonkey $(TARGET_NLS_DEPENDENCIES)
+	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
-# spidermonkey needs C++11
 POLKIT_CONF_ENV = \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
+	CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	LIBS=$(TARGET_NLS_LIBS)
 
 POLKIT_CONF_OPTS = \
@@ -25,7 +24,8 @@ POLKIT_CONF_OPTS = \
 	--disable-man-pages \
 	--disable-examples \
 	--disable-libelogind \
-	--disable-libsystemd-login
+	--disable-libsystemd-login \
+	--with-duktape
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 POLKIT_CONF_OPTS += --enable-introspection
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b9b1b3b9b4..0148cad791 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -329,11 +329,8 @@ config BR2_PACKAGE_SYSTEMD_OOMD
 
 config BR2_PACKAGE_SYSTEMD_POLKIT
 	bool "enable polkit support"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # polkit
-	depends on BR2_INSTALL_LIBSTDCPP # polkit
-	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # polkit
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # polkit
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
+	depends on BR2_TOOLCHAIN_HAS_THREADS # polkit
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_POLKIT
 	help
@@ -344,13 +341,9 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 
 	  http://wiki.freedesktop.org/www/Software/polkit/
 
-comment "polkit support needs a toolchain with C++, wchar, NPTL, gcc >= 4.9"
-	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_USE_WCHAR
+comment "polkit support needs a toolchain with threads, wchar, gcc >= 7"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_SYSTEMD_PORTABLED
 	bool "enable portable services"
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 17993baafc..82f11ae7de 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,16 +1,12 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on BR2_ENABLE_LOCALE # parted
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # spidermonkey
-	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> C++17
+	depends on BR2_TOOLCHAIN_HAS_THREADS # polkit
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit
-	depends on !BR2_STATIC_LIBS # spidermonkey
+	depends on !BR2_STATIC_LIBS # polkit -> duktape
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBATASMART
@@ -43,14 +39,9 @@ comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a glibc or musl toolchain with locale, C++, wchar, dynamic library, NPTL, gcc >= 4.9"
+comment "udisks needs a toolchain with dynamic library, locale, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_ENABLE_LOCALE || BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
