From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 09:11:44 +0100
Subject: [Buildroot] [git commit] libnspr: only pass --{enable,
	disable}-thumb2 on ARM
Message-ID: <20130107081309.41C229A684@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13a9fc901f637a1534baa4f08322f3b29ba66b0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/dff3f851ee4c62067a0b231c683383ce8692b8b3

libnspr adds -marm to CFLAGS when passed --disable-thumb2, which is only
recognized by ARM cross compilers, so only use when building for ARM.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/libnspr.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index d7ea4b3..a5307fa 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -16,11 +16,13 @@ LIBNSPR_CONF_OPT  = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPT += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPT += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
+ifeq ($(BR2_arm),y)
 ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
 LIBNSPR_CONF_OPT += --enable-thumb2
 else
 LIBNSPR_CONF_OPT += --disable-thumb2
 endif
+endif
 
 define LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
