From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:11:34 +0100
Subject: [Buildroot] [git commit] package/ulogd: add optional support for
	libpcap
Message-ID: <20160216221142.E01EA7FE9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b37ecac8e2e50fd187ca6a1d08ad2094a8a1fcec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libpcap was compiled before, ulogd will use it as optional
dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/ulogd/ulogd_output_PCAP.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libpcap.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ulogd/ulogd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 363b8c8..4017edc 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -29,6 +29,13 @@ else
 ULOGD_CONF_OPTS += --with-mysql=no --without-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+ULOGD_CONF_OPTS += --with-pcap
+ULOGD_DEPENDENCIES += libpcap
+else
+ULOGD_CONF_OPTS += --without-pcap
+endif
+
 ifeq ($(BR2_PACKAGE_JANSSON),y)
 ULOGD_CONF_OPTS += --with-jansson
 ULOGD_DEPENDENCIES += jansson
