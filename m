From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 08:42:38 +0100
Subject: [Buildroot] [git commit] kismet: fix build with new libnl-3
Message-ID: <20111226160334.009848FDD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f472b915c0b394ba637553da931c5797b07c0b59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPPFLAGS have to be augmented, so configure finds the correct include
dir, and the patch needs to be tweaked to make the binary link to
libnl-3 instead of libnl-gen.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kismet/kismet-libnl-30-support.patch |   13 +++++++++----
 package/kismet/kismet.mk                     |    1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/kismet/kismet-libnl-30-support.patch b/package/kismet/kismet-libnl-30-support.patch
index cf3c845..dca6151 100644
--- a/package/kismet/kismet-libnl-30-support.patch
+++ b/package/kismet/kismet-libnl-30-support.patch
@@ -35,7 +35,7 @@ Index: b/configure
    libnl20_CFLAGS
                C compiler flags for libnl20, overriding pkg-config
    libnl20_LIBS
-@@ -6760,6 +6768,75 @@
+@@ -6760,6 +6768,76 @@
  	fi
  fi
 
@@ -103,6 +103,7 @@ Index: b/configure
 +	libnl30_CFLAGS=$pkg_cv_libnl30_CFLAGS
 +	libnl30_LIBS=$pkg_cv_libnl30_LIBS
 +        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
++	CPPFLAGS="$CPPFLAGS $libnl30_CFLAGS"
 +$as_echo "yes" >&6; }
 +	libnl30=yes
 +fi
@@ -111,13 +112,17 @@ Index: b/configure
  pkg_failed=no
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for libnl20" >&5
  $as_echo_n "checking for libnl20... " >&6; }
-@@ -6897,7 +6974,7 @@
+@@ -6897,7 +6974,11 @@
  $as_echo "yes" >&6; }
  	libnl1=yes
  fi
 -	if test "$libnl20" = "yes"; then
-+	if test "$libnl20" = "yes" -o "$libnl30" = "yes"; then
-
++	if test "$libnl30" = "yes"; then
++$as_echo "#define HAVE_LIBNL 1" >>confdefs.h
++$as_echo "#define HAVE_LIBNL20 1" >>confdefs.h
++               NLLIBS="-lnl-genl-3 -lnl-3"
++	elif test "$libnl20" = "yes"; then
+ 
  $as_echo "#define HAVE_LIBNL 1" >>confdefs.h
 
 
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 4c7d6e2..854c9dd 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -10,6 +10,7 @@ KISMET_DEPENDENCIES = libpcap ncurses
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	KISMET_DEPENDENCIES += libnl
+	KISMET_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/"
 endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
 	KISMET_DEPENDENCIES += pcre
