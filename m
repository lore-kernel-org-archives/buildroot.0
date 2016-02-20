From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 00:27:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/lftp: add optional support for expat
Message-ID: <1456010851-27810-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When expat was compiled before, the proto-http module will use it as
optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/lftp/4.6.4/proto-http.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libexpat.so.1]
[...]

The build system offers no option to en-/disable expat support:
https://github.com/lavv17/lftp/blob/lftp-4.6-stable/configure.ac#L337

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lftp/lftp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index d2d58fd..5051f70 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -17,6 +17,10 @@ ifneq ($(BR2_STATIC_LIBS),y)
 LFTP_CONF_OPTS += --with-modules
 endif
 
+ifeq ($(BR2_PACKAGE_EXPAT)$(BR2_PACKAGE_LFTP_PROTO_HTTP),yy)
+LFTP_DEPENDENCIES += expat
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LFTP_DEPENDENCIES += gnutls
 LFTP_CONF_OPTS += --with-gnutls
-- 
2.7.0
