From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:56:32 +0100
Subject: [Buildroot] [git commit] package/polkit: bump to version 0.116
Message-ID: <20191208145140.33E3E8899E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce2a5eff7890815afeb26105c7760b6f8d2986e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Add spidermonkey as a dependency.
  - Add 0001-make-netgroup-support-optional.patch to allow building on musl.
  - Add a runtime dependency on dbus.
  - Add --disable-libelongind.
  - Add --disable-libsystemd-login.
  - Update dependencies for systemd pam support.
  - Update dependencies for udisks.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 .../0001-make-netgroup-support-optional.patch      | 232 +++++++++++++++++++++
 package/polkit/Config.in                           |  26 ++-
 package/polkit/polkit.hash                         |   2 +-
 package/polkit/polkit.mk                           |   8 +-
 package/systemd/Config.in                          |  16 +-
 package/udisks/Config.in                           |  27 ++-
 7 files changed, 293 insertions(+), 19 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e9546a7299..d5fd6e0e93 100644
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
index ac17cb4dc3..f54b6b4cda 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -1,11 +1,18 @@
 config BR2_PACKAGE_POLKIT
 	bool "polkit"
-	depends on BR2_USE_MMU # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # spidermonkey
+	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # spidermonkey
+	depends on BR2_USE_MMU # libglib2, dbus
 	depends on BR2_USE_WCHAR # libglib2
-	select BR2_PACKAGE_LIBGLIB2
+	depends on !BR2_STATIC_LIBS # spidermonkey
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # spidermonkey
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_SPIDERMONKEY
 	help
 	  PolicyKit is a toolkit for defining and handling
 	  authorizations. It is used for allowing unprivileged
@@ -13,6 +20,13 @@ config BR2_PACKAGE_POLKIT
 
 	  http://www.freedesktop.org/wiki/Software/polkit
 
-comment "polkit needs a toolchain w/ wchar, threads"
+comment "polkit needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
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
index fb4c171c52..507d1865fa 100644
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
+	--disable-libelogind \
+	--disable-libsystemd-login
 
 $(eval $(autotools-package))
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index aef39abe27..8f1d6fc0c0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -275,7 +275,12 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 config BR2_PACKAGE_SYSTEMD_POLKIT
 	bool "enable polkit support"
-	depends on BR2_TOOLCHAIN_USES_GLIBC # polkit
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # polkit
+	depends on BR2_INSTALL_LIBSTDCPP # polkit
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # polkit
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # polkit
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
+	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_POLKIT
 	help
 	  If enabled, systemd is built with polkit support and policy
@@ -285,8 +290,13 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 
 	  http://wiki.freedesktop.org/www/Software/polkit/
 
-comment "polkit support needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "polkit support needs a toolchain with C++, wchar, NPTL, gcc >= 4.9"
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 	bool "enable quotacheck tools"
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index c1e5538fb5..80a905fd9b 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # spidermonkey
+	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
-	depends on BR2_TOOLCHAIN_USES_GLIBC # polkit, lvm2
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
 	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2
+	depends on !BR2_STATIC_LIBS # lvm2, spidermonkey
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_SG3_UTILS
@@ -30,17 +34,28 @@ if BR2_PACKAGE_UDISKS
 
 config BR2_PACKAGE_UDISKS_LVM2
 	bool "lvm2 support"
+	# The lvm app library can't compile against musl
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Enable LVM2 support
 
+comment "lvm2 support needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 endif
 
 comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a glibc toolchain w/ wchar, threads, dynamic library"
+comment "udisks needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
