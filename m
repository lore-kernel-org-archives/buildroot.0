From: Adam Duskett <aduskett@gmail.com>
Date: Sun,  4 Jul 2021 22:40:57 -0700
Subject: [Buildroot] [PATCH 2/5] package/polkit: bump version to 0.119 and
 use duktape
In-Reply-To: <20210705054100.2857251-1-aduskett@gmail.com>
References: <20210705054100.2857251-1-aduskett@gmail.com>
Message-ID: <20210705054100.2857251-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortuantly, as of commit 3e1d61868fa8bfc586099302e931433270e5d17d, polkit
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
merge request applied, and a release made with the same tag as upstream (0.119),
with one small change: Netgroup support was yet again made optional. :)
I refrained from also adding 0001-make-netgroup-support-optional.patch as it is
outside of the scope of why the fork exists.

Changes:
  - refactor 0001-make-netgroup-support-optional.patch to work with 0.119
  - Remove upstream incorporated 0002-jsauthority-memleak.patch
  - Remove upstream 0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
  - Remove any trace of spidermonkey from polkit, udisks, and systemd-polkit
  - Add duktape as a dependency of polkit
  - Change POLKIT_SITE to the above polkit-duktape GitHub repository.
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-make-netgroup-support-optional.patch | 19 ++++++-----
 package/polkit/0002-jsauthority-memleak.patch | 28 ---------------
 ...lkit-0.116-pkttyagent-sigttou-bg-job.patch | 34 -------------------
 package/polkit/Config.in                      | 24 ++++---------
 package/polkit/polkit.hash                    |  4 +--
 package/polkit/polkit.mk                      | 12 +++----
 package/systemd/Config.in                     | 17 +++-------
 package/udisks/Config.in                      | 23 ++++---------
 8 files changed, 37 insertions(+), 124 deletions(-)
 delete mode 100644 package/polkit/0002-jsauthority-memleak.patch
 delete mode 100644 package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch

diff --git a/package/polkit/0001-make-netgroup-support-optional.patch b/package/polkit/0001-make-netgroup-support-optional.patch
index 86916aba34..155531f398 100644
--- a/package/polkit/0001-make-netgroup-support-optional.patch
+++ b/package/polkit/0001-make-netgroup-support-optional.patch
@@ -25,11 +25,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  src/polkit/polkitidentity.c                   |  16 ++
  src/polkit/polkitunixnetgroup.c               |   3 +
  .../polkitbackendinteractiveauthority.c       |  14 +-
- .../polkitbackendjsauthority.cpp              |   2 +
+ .../polkitbackendjsauthority.cpp              |   3 +-
  test/polkit/polkitidentitytest.c              |   9 +-
  test/polkit/polkitunixnetgrouptest.c          |   3 +
  .../test-polkitbackendjsauthority.c           |   2 +
- 9 files changed, 185 insertions(+), 8 deletions(-)
+ 9 files changed, 185 insertions(+), 9 deletions(-)
  create mode 100644 buildutil/introspection.m4
 
 diff --git a/buildutil/introspection.m4 b/buildutil/introspection.m4
@@ -184,7 +184,7 @@ diff --git a/configure.ac b/configure.ac
 index 5cedb4e..87aa0ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
+@@ -100,7 +100,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
  	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
  AC_SUBST(EXPAT_LIBS)
  
@@ -298,7 +298,7 @@ diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/
 index 9b752d1..09b2878 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1520,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -306,14 +306,15 @@ index 9b752d1..09b2878 100644
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
index bacd682139..f19cc5edbf 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1	polkit-0.116.tar.gz
+sha256  999bd3c2e50e02b464efd14a81da6ddef8c8359b3b720ce4c68dc23820a9567e  polkit-0.119.tar.gz
 
 # Locally calculated
-sha256	d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8	COPYING
+sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index bf9b5a7112..7249980a79 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.116
-POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
+POLKIT_VERSION = 0.119
+POLKIT_SITE = $(call github,aduskett,polkit-duktape,$(POLKIT_VERSION))
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
index d658308213..6bc6294a78 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -320,11 +320,8 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
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
@@ -335,13 +332,9 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 
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
-- 
2.31.1
