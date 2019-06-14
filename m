From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 14 Jun 2019 11:43:28 +0200
Subject: [Buildroot] [PATCH] package/brotli: add missing TARGET_CFLAGS on
 Bug 68485
In-Reply-To: <87imthdgz8.fsf@dell.be.48ers.dk>
References: <87imthdgz8.fsf@dell.be.48ers.dk>
Message-ID: <20190614094328.119792-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building with Bug 68485 only '-O0' flag is used loosing
TARGET_CFLAGS. Add BROTLI_CFLAGS variable initialized with TARGET_FLAGS
and if Bug 68485 is present append '-O0' to it. Then pass it to
CMAKE_C_FLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/brotli/brotli.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 248bfb9daf..134f480895 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -14,8 +14,12 @@ BROTLI_CONF_OPTS = \
 	-DBROTLI_DISABLE_TESTS=ON \
 	-DBROTLI_BUNDLED_MODE=OFF
 
+BROTLI_CFLAGS = $(TARGET_CFLAGS)
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
-BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
+BROTLI_CFLAGS += -O0
 endif
 
+BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(BROTLI_CFLAGS)"
+
 $(eval $(cmake-package))
-- 
2.17.1
