From: Doug Kehn <rdkehn@yahoo.com>
Date: Sat, 23 Jan 2016 09:39:46 -0600
Subject: [Buildroot] [PATCH v4 1/1] package/dhcp: bump version to 4.3.3-P1
Message-ID: <1453563586-15682-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bind source tar-ball is now embedded into the dhcp source. The embedded
bind tar-ball is extracted after the dhcp source so cross compiling
patches can be applied to the dhcp and bind before the package is built.

The embedded bind configure is called as part of dhcp make instead of
dhcp configure; therefore, make is called from a POST_CONFIGURE_HOOK to
explicitly configure bind.

bind is built from a PRE_BUILD_HOOK using $(MAKE1) because it would not
build in parallel.

0001-cross-compile.patch has been submitted upstream (ISC-Bugs #41502).

Buildroot thread
	http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
has related information.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v3 -> v4
  - consolidate into single patch (suggested by Arnout)
  - separate into POST_CONFIGURE_HOOK & PRE_BUILD_HOOK (suggested by Arnout)
Changes v2 -> v3
  - removed RFC tag
  - updated version from 4.3.3 to 4.3.3-P1 (suggested by Richardo)
  - external toolchain support (suggested by Richardo)
Changes v1 -> v2
  - removed DHCP_PRE_BUILD_HOOKS in favor of patch (suggested by Arnout)
---
 package/dhcp/0001-cross-compile.patch | 194 ++++++++++++++++++++++++++++++++++
 package/dhcp/dhcp.hash                |   4 +-
 package/dhcp/dhcp.mk                  |  24 ++++-
 3 files changed, 218 insertions(+), 4 deletions(-)
 create mode 100644 package/dhcp/0001-cross-compile.patch

diff --git a/package/dhcp/0001-cross-compile.patch b/package/dhcp/0001-cross-compile.patch
new file mode 100644
index 0000000..84f8ea2
--- /dev/null
+++ b/package/dhcp/0001-cross-compile.patch
@@ -0,0 +1,194 @@
+cross compile support integration
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: dhcp-4.3.3-P1/bind/Makefile.in
+===================================================================
+--- dhcp-4.3.3-P1.orig/bind/Makefile.in
++++ dhcp-4.3.3-P1/bind/Makefile.in
+@@ -30,7 +30,9 @@ bindconfig = --disable-kqueue --disable-
+ 	--without-openssl --without-libxml2 --enable-exportlib \
+ 	--with-gssapi=no --enable-threads=no @BINDCONFIG@ \
+ 	--with-export-includedir=${binddir}/include \
+-	--with-export-libdir=${binddir}/lib
++	--with-export-libdir=${binddir}/lib \
++	--target=@target_alias@ --host=@host_alias@ \
++	--build=@build_alias@
+ 
+ @BIND_ATF_FALSE at cleandirs = ./lib ./include
+ @BIND_ATF_TRUE at cleandirs = ./lib ./include ./atf
+Index: dhcp-4.3.3-P1/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
+===================================================================
+--- dhcp-4.3.3-P1.orig/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
++++ dhcp-4.3.3-P1/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
+@@ -168,7 +168,9 @@ code.h:	gen
+ 	./gen -s ${srcdir} > code.h
+ 
+ gen: ${srcdir}/gen.c
+-	${CC} ${ALL_CFLAGS} ${LDFLAGS} -o $@ ${srcdir}/gen.c ${LIBS}
++	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
++		${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
++		${BUILD_LIBS}
+ 
+ #We don't need rbtdb64 for this library
+ #rbtdb64. at O@: rbtdb.c
+Index: dhcp-4.3.3-P1/common/Makefile.in
+===================================================================
+--- dhcp-4.3.3-P1.orig/common/Makefile.in
++++ dhcp-4.3.3-P1/common/Makefile.in
+@@ -99,7 +99,7 @@ CONFIG_HEADER = $(top_builddir)/includes
+ CONFIG_CLEAN_FILES =
+ CONFIG_CLEAN_VPATH_FILES =
+ LIBRARIES = $(noinst_LIBRARIES)
+-AR = ar
++AR = @AR@
+ ARFLAGS = cru
+ AM_V_AR = $(am__v_AR_ at AM_V@)
+ am__v_AR_ = $(am__v_AR_ at AM_DEFAULT_V@)
+Index: dhcp-4.3.3-P1/configure
+===================================================================
+--- dhcp-4.3.3-P1.orig/configure
++++ dhcp-4.3.3-P1/configure
+@@ -658,6 +658,7 @@ CPPFLAGS
+ LDFLAGS
+ CFLAGS
+ CC
++AR
+ host_os
+ host_vendor
+ host_cpu
+@@ -4459,7 +4460,7 @@ if test "$GCC" = "yes"; then
+ fi
+ 
+ # We can have some flags to pass to bind configure
+-BINDCONFIG=
++BINDCONFIG=$BINDCONFIG
+ 
+ 
+ # POSIX doesn't include the IPv6 Advanced Socket API and glibc hides
+@@ -4925,7 +4926,99 @@ $as_echo "$ac_cv_safe_to_define___extens
+ 
+   $as_echo "#define _TANDEM_SOURCE 1" >>confdefs.h
+ 
++# begin - AR
++if test -n "$ac_tool_prefix"; then
++  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
++set dummy ${ac_tool_prefix}ar; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if ${ac_cv_prog_AR+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$AR"; then
++  ac_cv_prog_AR="$AR" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++    ac_cv_prog_AR="${ac_tool_prefix}ar"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++fi
++fi
++AR=$ac_cv_prog_AR
++if test -n "$AR"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $AR" >&5
++$as_echo "$AR" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++
++fi
++if test -z "$ac_cv_prog_AR"; then
++  ac_ct_AR=$AR
++  # Extract the first word of "ar", so it can be a program name with args.
++set dummy ar; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if ${ac_cv_prog_ac_ct_AR+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$ac_ct_AR"; then
++  ac_cv_prog_ac_ct_AR="$ac_ct_AR" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++    ac_cv_prog_ac_ct_AR="ar"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++fi
++fi
++ac_ct_AR=$ac_cv_prog_ac_ct_AR
++if test -n "$ac_ct_AR"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_AR" >&5
++$as_echo "$ac_ct_AR" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
+ 
++  if test "x$ac_ct_AR" = x; then
++    AR=":"
++  else
++    case $cross_compiling:$ac_tool_warned in
++yes:)
++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
++ac_tool_warned=yes ;;
++esac
++    AR=$ac_ct_AR
++  fi
++else
++  AR="$ac_cv_prog_AR"
++fi
++# end - AR
+ 
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}ranlib", so it can be a program name with args.
+Index: dhcp-4.3.3-P1/dhcpctl/Makefile.in
+===================================================================
+--- dhcp-4.3.3-P1.orig/dhcpctl/Makefile.in
++++ dhcp-4.3.3-P1/dhcpctl/Makefile.in
+@@ -131,7 +131,7 @@ am__uninstall_files_from_dir = { \
+ am__installdirs = "$(DESTDIR)$(libdir)" "$(DESTDIR)$(bindir)" \
+ 	"$(DESTDIR)$(man1dir)" "$(DESTDIR)$(man3dir)"
+ LIBRARIES = $(lib_LIBRARIES)
+-AR = ar
++AR = @AR@
+ ARFLAGS = cru
+ AM_V_AR = $(am__v_AR_ at AM_V@)
+ am__v_AR_ = $(am__v_AR_ at AM_DEFAULT_V@)
+Index: dhcp-4.3.3-P1/omapip/Makefile.in
+===================================================================
+--- dhcp-4.3.3-P1.orig/omapip/Makefile.in
++++ dhcp-4.3.3-P1/omapip/Makefile.in
+@@ -129,7 +129,7 @@ am__uninstall_files_from_dir = { \
+   }
+ am__installdirs = "$(DESTDIR)$(libdir)" "$(DESTDIR)$(man3dir)"
+ LIBRARIES = $(lib_LIBRARIES)
+-AR = ar
++AR = @AR@
+ ARFLAGS = cru
+ AM_V_AR = $(am__v_AR_ at AM_V@)
+ am__v_AR_ = $(am__v_AR_ at AM_DEFAULT_V@)
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index 84e3c63..e2bb6d9 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
-sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
+# Verified from ftp://ftp.isc.org/isc/dhcp/4.3-3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc
+sha256 c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921 dhcp-4.3.3-P1.tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c05e694..a88bc65 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.1-ESV-R12
+DHCP_VERSION = 4.3.3-P1
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
@@ -12,7 +12,8 @@ DHCP_LICENSE_FILES = LICENSE
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
-	ac_cv_file__dev_random=yes
+	ac_cv_file__dev_random=yes \
+	BINDCONFIG='--with-randomdev=/dev/random'
 DHCP_CONF_OPTS = \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
@@ -25,6 +26,25 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
+define DHCP_EXTRACT_BIND
+	cd $(@D)/bind; tar -xvf bind.tar.gz
+endef
+DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND
+
+DHCP_BIND_CONF_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	BUILD_CC="$(HOSTCC)"
+
+define DHCP_BIND_CONFIGURE
+	$(DHCP_BIND_CONF_ENV) $(MAKE1) -C $(@D)/bind bind1
+endef
+DHCP_POST_CONFIGURE_HOOKS += DHCP_BIND_CONFIGURE
+
+define DHCP_BIND_MAKE
+	$(DHCP_MAKE_ENV) $(MAKE1) -C $(@D)/bind
+endef
+DHCP_PRE_BUILD_HOOKS += DHCP_BIND_MAKE
+
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
-- 
2.7.0
