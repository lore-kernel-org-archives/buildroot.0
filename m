From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:50 +0200
Subject: [Buildroot] [PATCH 07/19] libeXosip: add dependency on
	host-pkg-config and remove useless flags
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d2e5763e529e4ed387e30854f80e801273ecdbaf.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libeXosip fails to use pkg-config to find libosip, it defaults to
thinking that libosip is installed in $(prefix)/lib and
$(prefix)/include, which is of course wrong. There was an attempt to
fix this by passing OSIP_CFLAGS and OSIP_LIBS variables to libeXosip
./configure script, but it still does not work:

checking pkg-config is at least version 0.9.0... ./configure: line 21035: /home/test/outputs/test-41/host/usr/bin/pkg-config: No such file or directory
no
checking for OSIP... configure: WARNING: assuming osip can be found in -I${prefix}/include and -L${exec_prefix}/lib

Therefore, the correct fix is to depend on host-pkg-config.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libeXosip2/libeXosip2.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 7f282b7..30eac9f 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -22,8 +22,6 @@ $(LIBEXOSIP2_DIR)/.configured: $(LIBEXOSIP2_DIR)/.unpacked
 	(cd $(LIBEXOSIP2_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		OSIP_CFLAGS="$(TARGET_CFLAGS)" \
-		OSIP_LIBS="-L$(STAGING_DIR)/usr/lib -losip2 -losipparser2" \
 		./configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -73,7 +71,7 @@ $(TARGET_DIR)/usr/bin/sip_reg: $(STAGING_DIR)/usr/bin/sip_reg
 
 
 
-libeXosip2: libosip2 $(TARGET_DIR)/usr/lib/libeXosip2.so
+libeXosip2: host-pkg-config libosip2 $(TARGET_DIR)/usr/lib/libeXosip2.so
 
 libeXosip2-source: $(DL_DIR)/$(LIBEXOSIP2_SOURCE)
 
-- 
1.7.0.4
