From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 23 Jun 2020 10:39:18 +0300
Subject: [Buildroot] [PATCH 1/1] package/dhcp: specify host-gawk path for
 dhcp build environment
Message-ID: <20200623073918.3415-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DHCP package silently fails to install its binaries if gawk tool
is not installed on build server. This is still the case even
if host-gawk package is already available: dhcp Makefiles detect
its presence but still attempt to use gawk from host system.

Add host-gawk to the list of dependencies for dhcp and explicitely
specify host-gawk location.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/dhcp/dhcp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index ad59804d3b..779d56801f 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,7 +9,7 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
-DHCP_DEPENDENCIES = bind
+DHCP_DEPENDENCIES = bind host-gawk
 
 # use libtool-enabled configure.ac
 define DHCP_LIBTOOL_AUTORECONF
@@ -21,6 +21,8 @@ DHCP_CONF_ENV = \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
+DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
+
 DHCP_CONF_OPTS = \
 	--with-libbind=$(STAGING_DIR)/usr \
 	--with-randomdev=/dev/random \
-- 
2.27.0
