From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Jun 2021 18:20:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: unset the NDEBUG flag
Message-ID: <20210620162030.1149816-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see:
https://gitlab.torproject.org/tpo/core/tor/-/blob/main/src/lib/log/util_bug.h#L56

Fixes:
http://autobuild.buildroot.net/results/aab/aabc7fd3093b1a7f08de8d06a1875eb5d231be4c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e0db278fb9..fca272f836 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -62,6 +62,9 @@ endif
 # uses gnu extensions
 TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
+# tor does not support building with NDEBUG enabled
+TOR_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -UNDEBUG"
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 TOR_CONF_ENV += LIBS=-latomic
 endif
-- 
2.30.2
