From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:33:11 +0100
Subject: [Buildroot] [git commit] package/dhcp: fix autoreconf for
 libtool-enabled build
Message-ID: <20191115222547.70B917FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3817b798692a596531fea6700d40fb9fe9f04fa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream provides two configure.ac versions, the default one does not
use libtool. For libtool-enabled builds the default configure.ac calls
https://gitlab.isc.org/isc-projects/dhcp/blob/master/configure.ac#L873
https://gitlab.isc.org/isc-projects/dhcp/blob/master/config+lt

which copies configure.ac+lt to configure.ac and starts autoreconf.

On host systems lacking autoreconf this causes a build error:

configure: WARNING: legacy configure is used but libtool is enabled. Trying to recover...
/home/buildroot/autobuild/instance-2/output-1/build/dhcp-4.4.1/config+lt: 20:
 /home/buildroot/autobuild/instance-2/output-1/build/dhcp-4.4.1/config+lt: autoreconf: not found
autoreconf failed

Fixes:
http://autobuild.buildroot.net/results/16f/16f800dd844572336c2fbba3d123604405382a84/
http://autobuild.buildroot.net/results/eac/eac1e7b25128476eccf40aece612e13a1e0637dc/
http://autobuild.buildroot.net/results/8fc/8fcfe7b40af3ae42549351c70466b4dd388820e3/
http://autobuild.buildroot.net/results/7ff/7ff82708b9dea09f1447f0ef94b9bb21fca73196/
http://autobuild.buildroot.net/results/1c5/1c5f401ce7eef13f5ca4603ca8d7c67da249d7c9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcp/dhcp.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 0abb0aebd7..5e0bcca71f 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -10,6 +10,12 @@ DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
 DHCP_DEPENDENCIES = bind
+
+# use libtool-enabled configure.ac
+define DHCP_LIBTOOL_AUTORECONF
+	cp $(@D)/configure.ac+lt $(@D)/configure.ac
+endef
+
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
@@ -33,6 +39,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
 DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
 DHCP_CONF_OPTS += --disable-libtool
 else
+DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF
+DHCP_AUTORECONF = YES
 DHCP_CONF_OPTS += --enable-libtool
 endif
 
