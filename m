From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:11:21 +0100
Subject: [Buildroot] [git commit] package/ulogd: add optional support for
	jansson
Message-ID: <20160216221142.D46CD7FFE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a116366064c52bcde98f7b4cfbbfe8d6c9f957b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When jansson was compiled before, ulogd will use it as optional
dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/ulogd/ulogd_output_JSON.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libjansson.so.4]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ulogd/ulogd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7730198..363b8c8 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -29,4 +29,11 @@ else
 ULOGD_CONF_OPTS += --with-mysql=no --without-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+ULOGD_CONF_OPTS += --with-jansson
+ULOGD_DEPENDENCIES += jansson
+else
+ULOGD_CONF_OPTS += --without-jansson
+endif
+
 $(eval $(autotools-package))
