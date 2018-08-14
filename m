From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:13:37 +0200
Subject: [Buildroot] [PATCH 8/8] package/mender: set version in go linker
In-Reply-To: <20180814231337.19114-1-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
Message-ID: <20180814231337.19114-9-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is used when calling the mender client with the
-version option and it says "unknown" if not set in
linker.

Now it displays the following:

    # mender -version
    1.4.0
    runtime: go1.10.2

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ce48c82671..db0eb55454 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -17,6 +17,8 @@ ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_DEVICE_TYPE)),)
 $(error Mender device type not set. Check your BR2_PACKAGE_MENDER_DEVICE_TYPE setting)
 endif
 
+MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
+
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
-- 
2.18.0
