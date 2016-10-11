From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 11 Oct 2016 12:20:17 +0100
Subject: [Buildroot] [PATCH 2/2] dhcp: bump version to 4.3.5
In-Reply-To: <20161011112017.41472-1-Vincent.Riera@imgtec.com>
References: <20161011112017.41472-1-Vincent.Riera@imgtec.com>
Message-ID: <20161011112017.41472-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- 0001-dhcp-cross-compile.patch is now upstream:
  https://source.isc.org/cgi-bin/gitweb.cgi?p=dhcp.git;a=commit;h=e2f36ff16f7de5fb6e028354a2cc04a181e887b4

- 0003-bind-host-cc.patch is now upstream:
  https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=commit;h=118394ef2ec7cef253c55359a3d70d202ddc2fa0

- --with-randomdev configure option can now be used normally.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/dhcp/0001-dhcp-cross-compile.patch | 34 -------------------------
 package/dhcp/0003-bind-host-cc.patch       | 40 ------------------------------
 package/dhcp/dhcp.hash                     |  4 +--
 package/dhcp/dhcp.mk                       |  7 +++---
 4 files changed, 5 insertions(+), 80 deletions(-)
 delete mode 100644 package/dhcp/0001-dhcp-cross-compile.patch
 delete mode 100644 package/dhcp/0003-bind-host-cc.patch

diff --git a/package/dhcp/0001-dhcp-cross-compile.patch b/package/dhcp/0001-dhcp-cross-compile.patch
deleted file mode 100644
index 95b4689..0000000
--- a/package/dhcp/0001-dhcp-cross-compile.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-dhcp cross compile support integration
-
-Allow BINDCONFIG to be initialized in environment passed to configure.
-
-Allow archiver to be determined during configure.
-
-This patch is submitted upstream as part of a cross compiling enhancement
-suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
-
-Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
-
-Index: dhcp-4.3.3-P1/configure.ac
-===================================================================
---- dhcp-4.3.3-P1.orig/configure.ac
-+++ dhcp-4.3.3-P1/configure.ac
-@@ -33,7 +33,7 @@ if test "$GCC" = "yes"; then
- fi
- 
- # We can have some flags to pass to bind configure
--BINDCONFIG=
-+BINDCONFIG="$BINDCONFIG"
- AC_SUBST(BINDCONFIG)
- 
- # POSIX doesn't include the IPv6 Advanced Socket API and glibc hides
-@@ -43,6 +43,9 @@ AC_SUBST(BINDCONFIG)
- # Use this to define _GNU_SOURCE to pull in the IPv6 Advanced Socket API.
- AC_USE_SYSTEM_EXTENSIONS
- 
-+AC_CHECK_TOOL(AR,ar)
-+AC_SUBST(AR)
-+
- AC_PROG_RANLIB
- AC_CONFIG_HEADERS([includes/config.h])
- 
diff --git a/package/dhcp/0003-bind-host-cc.patch b/package/dhcp/0003-bind-host-cc.patch
deleted file mode 100644
index 96c144f..0000000
--- a/package/dhcp/0003-bind-host-cc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-ensure host compiler is used
-
-dns/Makefile.in patch is derived from:
-http://wiki.beyondlogic.org/patches/dhcp-4.3.0b1.bind_arm-linux-gnueabi.patch
-
-This patch is already accepted upstream and will be included in the next
-release:
---[snip]--
-From Francis Dupont via RT <dhcp-suggest@isc.org>
-To   rdkehn at yahoo.com 
-
-Message body
-It was fixed on the master branch sometimes ago.
-Quoting master RELNOTES:
-
-- Made the embedded bind libraries able to be cross compiled
-  (please refer to the bind9 documentation to learn how to cross
-  compile DHCP and its bind library dependency).
-  [ISC-Bugs #38836]
-
-This is in the Changes since 4.3.3 so for the next release.
---[snip]--
-
-Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
-
-Index: dhcp-4.3.3-P1/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
-===================================================================
---- dhcp-4.3.3-P1.orig/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
-+++ dhcp-4.3.3-P1/bind/bind-9.9.7-P3/lib/export/dns/Makefile.in
-@@ -168,7 +168,9 @@ code.h:	gen
- 	./gen -s ${srcdir} > code.h
- 
- gen: ${srcdir}/gen.c
--	${CC} ${ALL_CFLAGS} ${LDFLAGS} -o $@ ${srcdir}/gen.c ${LIBS}
-+	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
-+		${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
-+		${BUILD_LIBS}
- 
- #We don't need rbtdb64 for this library
- #rbtdb64. at O@: rbtdb.c
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index fd9b24a..7898aa4 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,2 +1,2 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.3.3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc
-sha256 c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921 dhcp-4.3.3-P1.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.3.5/dhcp-4.3.5.tar.gz.sha256.asc
+sha256 eb95936bf15d2393c55dd505bc527d1d4408289cec5a9fa8abb99f7577e7f954  dhcp-4.3.5.tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 5cb6043..4d2cb06 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,17 +4,16 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.3.3-P1
+DHCP_VERSION = 4.3.5
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
-		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
-	ac_cv_file__dev_random=yes \
-	BINDCONFIG='--with-randomdev=/dev/random'
+		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
 DHCP_CONF_OPTS = \
+	--with-randomdev=/dev/random \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
 	--with-cli-lease-file=/var/lib/dhcp/dhclient.leases \
-- 
2.10.0
