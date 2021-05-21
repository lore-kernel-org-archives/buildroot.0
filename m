From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 09:52:33 +0200
Subject: [Buildroot] [git commit] package/dhcp: add host-gawk to global
 dependencies and build environment
Message-ID: <20210521074027.D006288E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ec60e877e3cf9bb1a11f59ae18976f3f7087fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DHCP package may silently fail to install binaries to the target image.
The problem occurs when buildroot output/host and build server provide
different flavors of awk. For instance, mawk on build server and gawk
in buildroot output/host. In this case isc-dhcp configure script detects
gawk in output/host and generates Makefiles specifying gawk without
absolute path. During Buildroot installation phase, those Makefiles
are used to install dhcp binaries. They attempt to use gawk without
absolute path. However build host does not have gawk.

To resolve the issue add host-gawk to dependencies and specify absolute
path to host-gawk in dhcp configure script using DHCP_CONF_ENV.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcp/dhcp.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 8d7157f357..db58870f88 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,7 +9,7 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
-DHCP_DEPENDENCIES = bind
+DHCP_DEPENDENCIES = bind host-gawk
 DHCP_CPE_ID_VENDOR = isc
 
 # use libtool-enabled configure.ac
@@ -22,6 +22,8 @@ DHCP_CONF_ENV = \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
+DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
+
 DHCP_CONF_OPTS = \
 	--with-libbind=$(STAGING_DIR)/usr \
 	--with-randomdev=/dev/random \
@@ -55,7 +57,6 @@ define DHCP_INSTALL_LIBS
 endef
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
-DHCP_DEPENDENCIES += host-gawk
 define DHCP_INSTALL_CTL_LIBS
 	$(MAKE) -C $(@D)/dhcpctl install-exec DESTDIR=$(TARGET_DIR)
 endef
