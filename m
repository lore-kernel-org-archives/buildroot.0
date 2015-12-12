From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 16:58:56 +0100
Subject: [Buildroot] [git commit] netsnmp: enable tsm + DTLSUDP/TLSTCP with
	openssl
Message-ID: <20151212155907.BD87580835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=984ec386096513c5b3fcfbc4f77f3dbe1ef9d35d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the openssl support is basically unused.

net-snmp provides a stripped-down openssl implementation that can be
used to enable tsm/DTLSUDP/TLSTCP but given it's security track record
it's best to rely on the external one, it also saves space.

usm is the user validation module, it's default on, however when passing
--with-security-modules we must keep it otherwise it won't be.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/netsnmp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6eff5e3..fb72179 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -49,7 +49,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NETSNMP_DEPENDENCIES += openssl
 NETSNMP_CONF_OPTS += \
-	--with-openssl=$(STAGING_DIR)/usr/include/openssl
+	--with-openssl=$(STAGING_DIR)/usr/include/openssl \
+	--with-security-modules="tsm,usm" \
+	--with-transports="DTLSUDP,TLSTCP"
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 NETSNMP_CONF_ENV += LIBS=-lz
