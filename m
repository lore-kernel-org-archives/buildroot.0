From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 23:38:24 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/gpsd: use common
 BR2_TOOLCHAIN_HAS_GCC_BUG_68485
In-Reply-To: <20190527213826.114001-1-giulio.benetti@micronovasrl.com>
References: <2e2b06bc-ee6a-7d38-5c14-a79dd51685dd@micronovasrl.com>
 <20190527213826.114001-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190527213826.114001-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Workaround for Gcc ICE works ok, but it's issued if BR2_microblaze=y
with a local comment. Let's use BR2_TOOLCHAIN_HAS_GCC_BUG_68485 instead
to avoid repeating ICE bug comment for every package affected from it.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/gpsd/gpsd.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index d2c7612526..2062f9e846 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -42,10 +42,7 @@ else
 GPSD_SCONS_OPTS += libgpsmm=no
 endif
 
-# prevents from triggering GCC ICE
-# A bug was reported to the gcc bug tracker:
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
-ifeq ($(BR2_microblaze),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 GPSD_CFLAGS += -O0
 endif
 
-- 
2.17.1
