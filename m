From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:28:32 +0100
Subject: [Buildroot] [git commit] package/pure-ftpd: add optional support
	for libsodium
Message-ID: <20160221202911.D30C7817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a40c74d5389722ebf46e422da486f52ba199056e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libsodium was compiled before, pure-ftpd will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/pure-statsdecode | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libsodium.so.17]
 0x0000000000000001 (NEEDED)             Shared library: [libcrypt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

The build system offers no option to en-/disable libsodium support,
check configure.ac, line 953.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pure-ftpd/pure-ftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 8df4c23..e1040fa 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -27,6 +27,10 @@ else
 PURE_FTPD_CONF_OPTS += --without-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
+PURE_FTPD_DEPENDENCIES += libsodium
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
 PURE_FTPD_DEPENDENCIES += openssl
