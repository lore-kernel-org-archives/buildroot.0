From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 14:48:01 +0000
Subject: [Buildroot] [PATCH 2/2] kismet: Fix static build
In-Reply-To: <1418395681-40434-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418395681-40434-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1418395681-40434-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pcap-config to list optional libpcap dependencies needed for static
link. Otherwise we will see errors like this one:

/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcap.a(pcap-canusb-linux.o):
In function `canusb_close':
pcap-canusb-linux.c:(.text+0xec): undefined reference to `libusb_close'

Also reorder the ncurses libs because the order is very important when
doing static builds. Otherwise we will see errors like this one:

/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpanel.a(p_delete.o):
In function `del_panel':
p_delete.c:(.text+0x68): undefined reference to `_nc_panelhook'

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/kismet/kismet.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index f177fea..6aeafe2 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -12,6 +12,14 @@ KISMET_CONF_OPTS += --with-netlink-version=3
 KISMET_LICENSE = GPLv2+
 KISMET_LICENSE_FILES = debian/copyright
 
+define KISMET_REORDER_NCURSES_LIBS
+	$(SED) 's/-lncurses -lpanel/-lpanel -lncurses/' $(@D)/Makefile.inc
+endef
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+KISMET_CONF_ENV = LIBS="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+KISMET_POST_CONFIGURE_HOOKS += KISMET_REORDER_NCURSES_LIBS
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 	KISMET_DEPENDENCIES += pcre
 endif
-- 
1.7.1
