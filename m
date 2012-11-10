From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 23:12:05 +0100
Subject: [Buildroot] [PATCH] libnspr: fix build with ARMv7 toolchains
Message-ID: <1352585525-25600-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build failure:

  http://autobuild.buildroot.org/results/d7323831372050e425a34f5104a46d8cbd6be214/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 736984d..a9d5812 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -16,6 +16,12 @@ LIBNSPR_CONF_OPT  = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPT += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPT += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
+ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
+LIBNSPR_CONF_OPT += --enable-thumb2
+else
+LIBNSPR_CONF_OPT += --disable-thumb2
+endif
+
 define LIBNSPR_INSTALL_STAGING_PC
 	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnspr/nspr.pc.in \
 		$(STAGING_DIR)/usr/lib/pkgconfig/nspr.pc
-- 
1.7.9.5
