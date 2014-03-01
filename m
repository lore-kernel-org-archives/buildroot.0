From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  1 Mar 2014 20:59:09 +0100
Subject: [Buildroot] [PATCH v5 2/4] Makefile: export PATH including the
	Buildroot host bindirs
In-Reply-To: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1393703951-7059-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch exports the PATH variable containing the factorized content
of TARGET_PATH and HOST_PATH (because they were fairly similar).

TARGET_PATH and HOST_PATH are now set using only the PATH variable.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v4 -> v5:
- make my call: export PATH
  - merge patch 7/7 into this one, so:
  - do not use intermediate BR_PATH variable, just export PATH with th
    right content
  - now, HOST_PATH and TARGET_PATH are just $PATH
- remove unrelevant comments (Arnout)

changes v3 -> v4:
- rebase
- rename BR2_PATH -> BR_PATH

changes v2 -> v3:
- rebase

changes v1 -> v2:
- rebase
---
 Makefile            | 4 ++++
 package/Makefile.in | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ae868da..97f9983 100644
--- a/Makefile
+++ b/Makefile
@@ -356,6 +356,10 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
+# * Export the PATH including the Buildroot host bindirs with immediate
+#   assignation to avoid recursive variable referencing issues triggered by make.
+# * Quotes are needed for spaces and all in the original PATH content.
+export PATH := "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
 ################################################################################
 #
diff --git a/package/Makefile.in b/package/Makefile.in
index 454f614..0ec237d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -144,8 +144,8 @@ else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
-# Quotes are needed for spaces et al in path components.
-TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
+# PATH already contains Buildroot host bindirs
+TARGET_PATH = $(PATH)
 
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
@@ -200,7 +200,8 @@ HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
+# PATH already contains Buildroot host bindirs
+HOST_PATH = $(PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
-- 
1.9.0
