From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed, 18 Nov 2015 13:15:30 +0100
Subject: [Buildroot] [PATCH 1/1] libnet: explicitly pass
	libnet_cv_have_packet_socket=yes because PF_PACKET is always
	available on Linux
Message-ID: <1447848930-3090-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/libnet/libnet.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index 3b62a79..7004417 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -10,4 +10,9 @@ LIBNET_INSTALL_STAGING = YES
 LIBNET_LICENSE = BSD-2c, BSD-3c
 LIBNET_LICENSE_FILES = doc/COPYING
 
+# PF_PACKET is always available on Linux, but build breaks for musl
+ifneq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
+endif
+
 $(eval $(autotools-package))
-- 
1.8.3.1
