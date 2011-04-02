From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Apr 2011 18:44:36 +0200
Subject: [Buildroot] [PATCH 1/1] Fix ccache handling
In-Reply-To: <cover.1301762667.git.thomas.petazzoni@free-electrons.com>
References: <cover.1301762667.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b72ef46ee804b8b98950e0559dadd4cb7590666b.1301762667.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When ccache support is enabled and 'make silentoldconfig' is being
started from the following rule:

$(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig

then, the Makefile in package/config inherits from HOSTCC/HOSTCXX
values with the ccache prefix. However, if we start from a cleaned
build (after make clean), ccache is not compiled yet, so things break.

To solve this, we pass a noccache variant of HOSTCC/HOSTCXX down to
the package/config Makefile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 9aa7399..2e698cc 100644
--- a/Makefile
+++ b/Makefile
@@ -367,7 +367,7 @@ dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 $(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
-	$(MAKE) $(EXTRAMAKEARGS) silentoldconfig
+	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-- 
1.7.1
