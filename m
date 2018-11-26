From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 09:25:34 +0100
Subject: [Buildroot] [PATCH-2018.02.x] mosquitto: fix build on uClibc
Message-ID: <20181126082534.20928-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c42/c425eb496cc5422ff1e2e51e59d4baf377bcbeed/

The memory tracking feature of mosquitto (which is enabled by default on
systems defining __GLIBC__) uses malloc_usable_size() which was only added
to uClibc-ng in 1.0.29.

2018.02.x still uses 1.0.28, so disable this feature when building on
uClibc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index fcce0535cb..d01811e5aa 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -17,6 +17,13 @@ MOSQUITTO_MAKE_OPTS = \
 	WITH_WRAP=no \
 	WITH_DOCS=no
 
+# uses malloc_usable_size which was only added in uClibc-ng 1.0.29
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+MOSQUITTO_MAKE_OPTS += WITH_MEMORY_TRACKING=no
+else
+MOSQUITTO_MAKE_OPTS += WITH_MEMORY_TRACKING=yes
+endif
+
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 MOSQUITTO_MAKE_OPTS += WITH_ADNS=yes
-- 
2.11.0
