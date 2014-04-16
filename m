From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:28:34 +0200
Subject: [Buildroot] [git commit] Makefile: introduce BR_PATH
Message-ID: <20140416172939.3584E9C80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=caa329bffda8f2fa861a3b4aa5168917d0771253
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the HOST_PATH and TARGET_PATH variables almost contain the same
things, let's factorize this in a single BR_PATH.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            |    3 +++
 package/Makefile.in |    5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 467e21c..fb0493d 100644
--- a/Makefile
+++ b/Makefile
@@ -330,6 +330,9 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 # packages compiled for the host go here
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
+# Quotes are needed for spaces and all in the original PATH content.
+BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 0830cd5..f7c9bca 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -168,8 +168,7 @@ else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
-# Quotes are needed for spaces et al in path components.
-TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
+TARGET_PATH = $(BR_PATH)
 
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
@@ -224,7 +223,7 @@ HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
+HOST_PATH = $(BR_PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
