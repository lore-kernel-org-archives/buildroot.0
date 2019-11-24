From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 24 Nov 2019 13:48:21 -0800
Subject: [Buildroot] [PATCH/next v2 2/4] package/polkit: bump to version
 0.116
In-Reply-To: <20191124214823.2570598-1-aduskett@gmail.com>
References: <20191124214823.2570598-1-aduskett@gmail.com>
Message-ID: <20191124214823.2570598-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Add spidermonkey as a dependency.
  - Add 0001-make-netgroup-support-optional.patch to allow building on musl.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |   1 +
 .../0001-make-netgroup-support-optional.patch | 232 ++++++++++++++++++
 package/polkit/Config.in                      |  22 +-
 package/polkit/polkit.hash                    |   2 +-
 package/polkit/polkit.mk                      |   8 +-
 5 files changed, 255 insertions(+), 10 deletions(-)
 create mode 100644 package/polkit/0001-make-netgroup-support-optional.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f05d1fe4c..e3d1c694f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -53,6 +53,7 @@ F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
+F:	package/polkit/
 F:	package/python3/
 F:	package/python-aioredis/
 F:	package/python-asgiref/
diff --git a/package/polkit/0001-make-netgroup-support-optional.patch b/package/polkit/0001-make-netgroup-support-optional.patch
new file mode 100644
index 0000000000..f96738c910
--- /dev/null
+++ b/package/polkit/0001-make-netgroup-support-optional.patch
@@ -0,0 +1,232 @@
+From 21aa2747e8f0048759aab184b07dd6389666d5e6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 May 2019 13:18:55 -0700
+Subject: [PATCH] make netgroup support optional
+
+On at least Linux/musl and Linux/uclibc, netgroup
+support is not available.  PolKit fails to compile on these systems
+for that reason.
+
+This change makes netgroup support conditional on the presence of the
+setnetgrent(3) function which is required for the support to work.  If
+that function is not available on the system, an error will be returned
+to the administrator if unix-netgroup: is specified in configuration.
+
+Fixes bug 50145.
+
+Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ configure.ac                                     |  2 +-
+ src/polkit/polkitidentity.c                      | 16 ++++++++++++++++
+ src/polkit/polkitunixnetgroup.c                  |  3 +++
+ .../polkitbackendinteractiveauthority.c          | 14 ++++++++------
+ src/polkitbackend/polkitbackendjsauthority.cpp   |  2 ++
+ test/polkit/polkitidentitytest.c                 |  9 ++++++++-
+ test/polkit/polkitunixnetgrouptest.c             |  3 +++
+ .../test-polkitbackendjsauthority.c              |  2 ++
+ 8 files changed, 43 insertions(+), 8 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXP
+ 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
+ AC_SUBST(EXPAT_LIBS)
+ 
+-AC_CHECK_FUNCS(clearenv fdatasync)
++AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
+ 
+ if test "x$GCC" = "xyes"; then
+   LDFLAGS="-Wl,--as-needed $LDFLAGS"
+--- a/src/polkit/polkitidentity.c
++++ b/src/polkit/polkitidentity.c
+@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gcha
+     }
+   else if (g_str_has_prefix (str, "unix-netgroup:"))
+     {
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine ('%s')",
++                   str);
++#else
+       identity = polkit_unix_netgroup_new (str + sizeof "unix-netgroup:" - 1);
++#endif
+     }
+ 
+   if (identity == NULL && (error != NULL && *error == NULL))
+@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVaria
+       GVariant *v;
+       const char *name;
+ 
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine");
++      goto out;
++#else
+       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
+       if (v == NULL)
+         {
+@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVaria
+       name = g_variant_get_string (v, NULL);
+       ret = polkit_unix_netgroup_new (name);
+       g_variant_unref (v);
++#endif
+     }
+   else
+     {
+--- a/src/polkit/polkitunixnetgroup.c
++++ b/src/polkit/polkitunixnetgroup.c
+@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUni
+ PolkitIdentity *
+ polkit_unix_netgroup_new (const gchar *name)
+ {
++#ifndef HAVE_SETNETGRENT
++  g_assert_not_reached();
++#endif
+   g_return_val_if_fail (name != NULL, NULL);
+   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
+                                        "name", name,
+--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
+@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity
+   GList *ret;
+ 
+   ret = NULL;
++#ifdef HAVE_SETNETGRENT
+   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
+ 
+-#ifdef HAVE_SETNETGRENT_RETURN
++# ifdef HAVE_SETNETGRENT_RETURN
+   if (setnetgrent (name) == 0)
+     {
+       g_warning ("Error looking up net group with name %s: %s", name, g_strerror (errno));
+       goto out;
+     }
+-#else
++# else
+   setnetgrent (name);
+-#endif
++# endif /* HAVE_SETNETGRENT_RETURN */
+ 
+   for (;;)
+     {
+-#if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
++# if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
+       const char *hostname, *username, *domainname;
+-#else
++# else
+       char *hostname, *username, *domainname;
+-#endif
++# endif /* defined(HAVE_NETBSD) || defined(HAVE_OPENBSD) */
+       PolkitIdentity *user;
+       GError *error = NULL;
+ 
+@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity
+ 
+  out:
+   endnetgrent ();
++#endif /* HAVE_SETNETGRENT */
+   return ret;
+ }
+ 
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext
+ 
+   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
+ 
++#ifdef HAVE_SETNETGRENT
+   JS::RootedString usrstr (authority->priv->cx);
+   usrstr = args[0].toString();
+   user = JS_EncodeStringToUTF8 (cx, usrstr);
+@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext
+ 
+   JS_free (cx, netgroup);
+   JS_free (cx, user);
++#endif
+ 
+   ret = true;
+ 
+--- a/test/polkit/polkitidentitytest.c
++++ b/test/polkit/polkitidentitytest.c
+@@ -19,6 +19,7 @@
+  * Author: Nikki VonHollen <vonhollen@google.com>
+  */
+ 
++#include "config.h"
+ #include "glib.h"
+ #include <polkit/polkit.h>
+ #include <polkit/polkitprivate.h>
+@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_tes
+   {"unix-group:root", "unix-group:jane", FALSE},
+   {"unix-group:jane", "unix-group:jane", TRUE},
+ 
++#ifdef HAVE_SETNETGRENT
+   {"unix-netgroup:foo", "unix-netgroup:foo", TRUE},
+   {"unix-netgroup:foo", "unix-netgroup:bar", FALSE},
++#endif
+ 
+   {"unix-user:root", "unix-group:root", FALSE},
++#ifdef HAVE_SETNETGRENT
+   {"unix-user:jane", "unix-netgroup:foo", FALSE},
++#endif
+ 
+   {NULL},
+ };
+@@ -181,11 +186,13 @@ main (int argc, char *argv[])
+   g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
+   g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
+ 
++#ifdef HAVE_SETNETGRENT
+   g_test_add_data_func ("/PolkitIdentity/netgroup_string", "unix-netgroup:foo", test_string);
++  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
++#endif
+ 
+   g_test_add_data_func ("/PolkitIdentity/user_gvariant", "unix-user:root", test_gvariant);
+   g_test_add_data_func ("/PolkitIdentity/group_gvariant", "unix-group:root", test_gvariant);
+-  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
+ 
+   add_comparison_tests ();
+ 
+--- a/test/polkit/polkitunixnetgrouptest.c
++++ b/test/polkit/polkitunixnetgrouptest.c
+@@ -19,6 +19,7 @@
+  * Author: Nikki VonHollen <vonhollen@google.com>
+  */
+ 
++#include "config.h"
+ #include "glib.h"
+ #include <polkit/polkit.h>
+ #include <string.h>
+@@ -69,7 +70,9 @@ int
+ main (int argc, char *argv[])
+ {
+   g_test_init (&argc, &argv, NULL);
++#ifdef HAVE_SETNETGRENT
+   g_test_add_func ("/PolkitUnixNetgroup/new", test_new);
+   g_test_add_func ("/PolkitUnixNetgroup/set_name", test_set_name);
++#endif
+   return g_test_run ();
+ }
+--- a/test/polkitbackend/test-polkitbackendjsauthority.c
++++ b/test/polkitbackend/test-polkitbackendjsauthority.c
+@@ -137,12 +137,14 @@ test_get_admin_identities (void)
+         "unix-group:users"
+       }
+     },
++#ifdef HAVE_SETNETGRENT
+     {
+       "net.company.action3",
+       {
+         "unix-netgroup:foo"
+       }
+     },
++#endif
+   };
+   guint n;
+ 
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index ac17cb4dc3..716fc44c93 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -1,11 +1,17 @@
 config BR2_PACKAGE_POLKIT
 	bool "polkit"
+	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # spidermonkey -> libnspr
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # spidermonkey -> pthread_getattr_np()
 	depends on BR2_USE_MMU # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_WCHAR # libglib2
-	select BR2_PACKAGE_LIBGLIB2
+	depends on !BR2_STATIC_LIBS # spidermonkey -> dlopen()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # spidermonkey -> fenv
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_SPIDERMONKEY
 	help
 	  PolicyKit is a toolkit for defining and handling
 	  authorizations. It is used for allowing unprivileged
@@ -13,6 +19,10 @@ config BR2_PACKAGE_POLKIT
 
 	  http://www.freedesktop.org/wiki/Software/polkit
 
-comment "polkit needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "polkit needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
+	depends on BR2_USE_MMU || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+	!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 6368091c4a..bacd682139 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	8fdc7cc8ba4750fcce1a4db9daa759c12afebc7901237e1c993c38f08985e1df	polkit-0.105.tar.gz
+sha256	88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1	polkit-0.116.tar.gz
 
 # Locally calculated
 sha256	d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8	COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index fb4c171c52..5d85ea9897 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,20 +4,22 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.105
+POLKIT_VERSION = 0.116
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 
 POLKIT_INSTALL_STAGING = YES
 
-POLKIT_DEPENDENCIES = libglib2 host-intltool expat
+POLKIT_DEPENDENCIES = libglib2 host-intltool expat spidermonkey
 
 # We could also support --with-authfw=pam
 POLKIT_CONF_OPTS = \
 	--with-authfw=shadow \
 	--with-os-type=unknown \
 	--disable-man-pages \
-	--disable-examples
+	--disable-examples \
+	--enable-libsystemd-login=no \
+	--enable-libelogind=no
 
 $(eval $(autotools-package))
-- 
2.23.0
