From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 18:05:01 +0100
Subject: [Buildroot] [git commit] package/libpcap: fix build failure without
 wchar
Message-ID: <20210123164535.515E78151B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=768213c71b7d3c2defb683b7073bc197236f80da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpcap requires c99 since version 1.10.0 and
https://github.com/the-tcpdump-group/libpcap/commit/68e5ca3f4cbb66d687582ae9563009c87bf3d184

However, this test will fail without wchar on:

configure:3609: /home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
conftest.c:52:9: error: unknown type name 'wchar_t'
   const wchar_t *name;
         ^~~~~~~

So hardcode ac_cv_prog_cc_c99 as already done in numerous package such
as apparmor, wireshark, xz, etc.

Fixes:
 - http://autobuild.buildroot.org/results/6e87c25a0dccccf5e7ad03742597a0613f554506

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpcap/libpcap.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 81e7cd4ab0..24215ebed5 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -12,8 +12,11 @@ LIBPCAP_CPE_ID_VENDOR = tcpdump
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
 LIBPCAP_CONF_ENV = \
 	ac_cv_header_linux_wireless_h=yes \
+	ac_cv_prog_cc_c99=-std=gnu99 \
 	CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag \
