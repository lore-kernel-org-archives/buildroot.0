From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 11:29:13 +0100
Subject: [Buildroot] [git commit] kismet: Fix static build
Message-ID: <20141227102918.BD53E7FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3365ebf72fc34c71e28191f107280b9d7c825a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pcap-config to list optional libpcap dependencies needed for static
link. Otherwise we will see errors like this one:

/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcap.a(pcap-canusb-linux.o):
In function `canusb_close':
pcap-canusb-linux.c:(.text+0xec): undefined reference to `libusb_close'

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[yann.morin.1998 at free.fr: remove the ncurses bits (done differently in
 another patch), fix BR2_PREFER_STATIC_LIB -> BR2_STATIC_LIBS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/kismet.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
