From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Sep 2012 16:04:52 +0200
Subject: [Buildroot] [git commit] libpcap: fix build on microblaze
Message-ID: <20120905140625.94B2A9958F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd00c5fcd072b4a1e3862c5af29f8c580acadd38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On microblaze, libpcap needs to be built with -fPIC rather than -fpic as
reported by mrueg on IRC.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpcap/libpcap.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 04766ea..7a1d32f 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -21,4 +21,9 @@ LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 
+# microblaze needs -fPIC instead of -fpic
+ifeq ($(BR2_microblaze),y)
+LIBPCAP_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endif
+
 $(eval $(autotools-package))
