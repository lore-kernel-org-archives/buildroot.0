From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:41:06 +0100
Subject: [Buildroot] [git commit] package/pure-ftpd: add optional support
	for elfutils
Message-ID: <20160221114127.AD0E5802CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c58907f69e425cd9d391bb28b83165a80b7d39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When elfutils was compiled before, pure-ftpd will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/pure-ftpd | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libelf.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libcrypt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

The build system offers no option to en-/disable elfutils support,
check m4/getloadavg.m4, line 44.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pure-ftpd/pure-ftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index aa65e9e..8df4c23 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -16,6 +16,10 @@ PURE_FTPD_CONF_OPTS = \
 	--with-puredb \
 	--with-rfc2640
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+PURE_FTPD_DEPENDENCIES += elfutils
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 PURE_FTPD_CONF_OPTS += --with-capabilities
 PURE_FTPD_DEPENDENCIES += libcap
