From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 22:34:11 +0200
Subject: [Buildroot] [PATCH v2 1/6] package/lmbench: use UPDATE_CONFIG_HOOK
 instead of CONFIG_UPDATE
In-Reply-To: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190528203416.32261-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jimtcl, perl, usb_modeswitch and x264 are registering
UPDATE_CONFIG_HOOK as a post patch hook to get their gnuconfig files
updated. lmbench is the only package calling CONFIG_UPDATE directly,
so for consistency, let's make it use the same logic as jimtcl, perl,
usb_modeswitch and x264.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lmbench/lmbench.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index c52d6a5a39..2f3b19b5f8 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -18,8 +18,9 @@ LMBENCH_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 LMBENCH_LDLIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
+LMBENCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+
 define LMBENCH_CONFIGURE_CMDS
-	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
 	sed -i 's/LDLIBS=/LDLIBS+=/g' $(@D)/scripts/build
 	sed -i '/cd .*doc/d' $(@D)/src/Makefile
-- 
2.21.0
