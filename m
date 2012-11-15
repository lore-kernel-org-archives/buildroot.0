From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 00:15:23 +0100
Subject: [Buildroot] [git commit] libnspr: fix build with ARMv7 toolchains
Message-ID: <20121115232933.84AD29A001@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27a0cfaa64605eac86a69e6a565eeda556b6b125
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following build failure:

  http://autobuild.buildroot.org/results/d7323831372050e425a34f5104a46d8cbd6be214/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/libnspr.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
