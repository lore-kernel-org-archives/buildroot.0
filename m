From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:58:58 +0100
Subject: [Buildroot] [git commit] package/dhcp: bump version to 4.3.3-P1
Message-ID: <20160302202755.B6E4C7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fb3f220807a5203c6854e30ab126e2f78b280cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bind source tar-ball is now embedded into the dhcp source. The embedded
bind tar-ball is extracted after the dhcp source so cross compiling
patches can be applied to the dhcp and bind before the package is built.

The embedded bind configure is called as part of dhcp make instead of
dhcp configure; therefore, needed configure parameters are set in the
make env.

0001-dhcp-cross-compile.patch and 0002-bind-cross-compile.patch have
been submitted upstream as part of a cross compiling enhancement
suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
0003-bind-hos-cc.patch is already scheduled for the next dhcp release.

Buildroot thread
	http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
has related information.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/0001-dhcp-cross-compile.patch | 34 +++++++++++++++++++++++++
 package/dhcp/0002-bind-cross-compile.patch | 24 ++++++++++++++++++
 package/dhcp/0003-bind-host-cc.patch       | 40 ++++++++++++++++++++++++++++++
 package/dhcp/dhcp.hash                     |  4 +--
 package/dhcp/dhcp.mk                       | 28 +++++++++++++++++++--
 5 files changed, 126 insertions(+), 4 deletions(-)

diff --git a/package/dhcp/0001-dhcp-cross-compile.patch b/package/dhcp/0001-dhcp-cross-compile.patch
new file mode 100644
index 0000000..95b4689
--- /dev/null
+++ b/package/dhcp/0001-dhcp-cross-compile.patch
@@ -0,0 +1,34 @@
+dhcp cross compile support integration
+
+Allow BINDCONFIG to be initialized in environment passed to configure.
+
+Allow archiver to be determined during configure.
+
+This patch is submitted upstream as part of a cross compiling enhancement
+suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: dhcp-4.3.3-P1/configure.ac
+===================================================================
+--- dhcp-4.3.3-P1.orig/configure.ac
++++ dhcp-4.3.3-P1/configure.ac
+@@ -33,7 +33,7 @@ if test "$GCC" = "yes"; then
+ fi
+ 
+ # We can have some flags to pass to bind configure
+-BINDCONFIG=
++BINDCONFIG="$BINDCONFIG"
+ AC_SUBST(BINDCONFIG)
+ 
+ # POSIX doesn't include the IPv6 Advanced Socket API and glibc hides
+@@ -43,6 +43,9 @@ AC_SUBST(BINDCONFIG)
+ # Use this to define _GNU_SOURCE to pull in the IPv6 Advanced Socket API.
+ AC_USE_SYSTEM_EXTENSIONS
+ 
++AC_CHECK_TOOL(AR,ar)
++AC_SUBST(AR)
++
+ AC_PROG_RANLIB
+ AC_CONFIG_HEADERS([includes/config.h])
+ 
diff --git a/package/dhcp/0002-bind-cross-compile.patch b/package/dhcp/0002-bind-cross-compile.patch
new file mode 100644
index 0000000..f7c42c6
--- /dev/null
+++ b/package/dhcp/0002-bind-cross-compile.patch
@@ -0,0 +1,24 @@
+bind cross compile support integration
+
+Pass system types from dhcp configure to bind configure.
+
+This patch is submitted upstream as part of a cross compiling enhancement
+suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
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
diff --git a/package/dhcp/0003-bind-host-cc.patch b/package/dhcp/0003-bind-host-cc.patch
new file mode 100644
index 0000000..96c144f
--- /dev/null
+++ b/package/dhcp/0003-bind-host-cc.patch
@@ -0,0 +1,40 @@
+ensure host compiler is used
+
+dns/Makefile.in patch is derived from:
+http://wiki.beyondlogic.org/patches/dhcp-4.3.0b1.bind_arm-linux-gnueabi.patch
+
+This patch is already accepted upstream and will be included in the next
+release:
+--[snip]--
+From Francis Dupont via RT <dhcp-suggest@isc.org>
+To   rdkehn at yahoo.com 
+
+Message body
+It was fixed on the master branch sometimes ago.
+Quoting master RELNOTES:
+
+- Made the embedded bind libraries able to be cross compiled
+  (please refer to the bind9 documentation to learn how to cross
+  compile DHCP and its bind library dependency).
+  [ISC-Bugs #38836]
+
+This is in the Changes since 4.3.3 so for the next release.
+--[snip]--
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
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
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index 84e3c63..fd9b24a 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
-sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.3.3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc
+sha256 c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921 dhcp-4.3.3-P1.tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c05e694..5cb6043 100644
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
@@ -25,6 +26,29 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
+# The source for the bind libraries used by dhcp are embedded in the dhcp source
+# as a tar-ball. Extract the bind source to allow any patches to be applied
+# during the patch phase.
+define DHCP_EXTRACT_BIND
+	cd $(@D)/bind; tar -xvf bind.tar.gz
+endef
+DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND
+
+# The patchset requires configure et.al. to be regenerated.
+DHCP_AUTORECONF = YES
+
+# bind does not support parallel builds.
+DHCP_MAKE = $(MAKE1)
+
+# bind configure is called via dhcp make instead of dhcp configure. The make env
+# needs extra values for bind configure.
+DHCP_MAKE_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	BUILD_CC="$(HOSTCC)" \
+	BUILD_CFLAGS="$(HOST_CFLAGS)" \
+	BUILD_CPPFLAGS="$(HOST_CPPFLAGS)" \
+	BUILD_LDFLAGS="$(HOST_LDFLAGS)"
+
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
