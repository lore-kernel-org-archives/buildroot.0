From: Daniel Mack <zonque@gmail.com>
Date: Wed, 30 Nov 2011 16:06:00 +0100
Subject: [Buildroot] [PATCH 2/2] kismet: fix build with new libnl-3
In-Reply-To: <1322665560-29888-1-git-send-email-zonque@gmail.com>
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
 <1322665560-29888-1-git-send-email-zonque@gmail.com>
Message-ID: <1322665560-29888-2-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CFLAGS have to be augmented, so configure finds the correct include
dir, and the patch needs to be tweaked to make the binary link to
libnl-3 instead of libnl-gen.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/kismet/kismet-libnl-30-support.patch |   10 +++++++---
 package/kismet/kismet.mk                     |    1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/kismet/kismet-libnl-30-support.patch b/package/kismet/kismet-libnl-30-support.patch
index cf3c845..5100a69 100644
--- a/package/kismet/kismet-libnl-30-support.patch
+++ b/package/kismet/kismet-libnl-30-support.patch
@@ -111,13 +111,17 @@ Index: b/configure
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
-- 
1.7.7.3
