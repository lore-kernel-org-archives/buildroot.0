From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 18:33:09 +0100
Subject: [Buildroot] [PATCH 2/2] kismet: Fix static build
In-Reply-To: <cover.1419615048.git.yann.morin.1998@free.fr>
References: <cover.1419615048.git.yann.morin.1998@free.fr>
Message-ID: <6c3f1a6f597ba9282340782273af01cef607bfe1.1419615048.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Use pcap-config to list optional libpcap dependencies needed for static
link. Otherwise we will see errors like this one:

/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcap.a(pcap-canusb-linux.o):
In function `canusb_close':
pcap-canusb-linux.c:(.text+0xec): undefined reference to `libusb_close'

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[yann.morin.1998 at free.fr: remove the ncurses bits (done differently in
 another patch), fix BR2_PREFER_STATIC_LIB -> BR2_STATIC_LIBS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kismet/kismet.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index a71414e..117d182 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -15,6 +15,10 @@ KISMET_LICENSE_FILES = debian/copyright
 # We touch configure.in:
 KISMET_AUTORECONF = YES
 
+ifeq ($(BR2_STATIC_LIBS),y)
+KISMET_CONF_ENV = LIBS="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 	KISMET_DEPENDENCIES += pcre
 endif
-- 
1.9.1
