From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 13 May 2017 23:49:17 +0200
Subject: [Buildroot] [PATCH] package/ntp: fix aarch64/mips build,
	-fPIC required
Message-ID: <20170513214917.3305-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -fPIC to CFLAGS to avoid ntpsnmpd link issues with libntpq.a

Fixes:
[aarch64] http://autobuild.buildroot.net/results/866/866b1d28595efd8b6becf83d0a64b596538d58b0
[mips] http://autobuild.buildroot.net/results/c2a/c2a945855172970736a8ffea9c564f029a023344

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ntp/ntp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index cd6cb16..9b65c5e 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -20,6 +20,12 @@ NTP_CONF_OPTS = \
 	--disable-local-libevent \
 	--with-crypto
 
+# ntp build unconditionnaly some static libraries (libntpq.a, libntp.a etc...)
+# The build system fail to create ntpsnmpd while linking these libraries when
+# built without -fPIC.
+NTP_CONF_ENV += \
+	CFLAGS="-fPIC $(TARGET_CFLAGS)"
+
 # 0002-ntp-syscalls-fallback.patch
 NTP_AUTORECONF = YES
 
-- 
2.9.3
