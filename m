From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed,  9 Dec 2015 15:30:23 -0300
Subject: [Buildroot] [PATCH] netsnmp: enable tsm + DTLSUDP/TLSTCP with
	openssl
Message-ID: <1449685823-30946-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Otherwise the openssl support is basically unused.

net-snmp provides a stripped-down openssl implementation that can be
used to enable tsm/DTLSUDP/TLSTCP but given it's security track record
it's best to rely on the external one, it also saves space.

usm is the user validation module, it's default on, however when passing
--with-security-modules we must keep it otherwise it won't be.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.4.10
