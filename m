From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 21:59:41 +0100
Subject: [Buildroot] [PATCH 1/6] Makefile: introduce BR2_PATH
In-Reply-To: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203586-17790-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the HOST_PATH and TARGET_PATH variables almost contain the same
things, let's factorize this in a single BR2_PATH.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile            | 3 +++
 package/Makefile.in | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2f7db59..5a99bbb 100644
--- a/Makefile
+++ b/Makefile
@@ -266,6 +266,9 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 # packages compiled for the host go here
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
+# Set BR2_PATH (including host bindirs)
+BR2_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
+
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 612f3c7..b5829cb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -145,7 +145,7 @@ TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 endif
 
 # Quotes are needed for spaces et al in path components.
-TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
+TARGET_PATH = $(BR2_PATH)
 
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
@@ -200,7 +200,7 @@ HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
+HOST_PATH = $(BR2_PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
-- 
1.8.4.2
