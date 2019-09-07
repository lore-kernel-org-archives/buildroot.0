From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:24 +0200
Subject: [Buildroot] [PATCH v2 09/12] package/glibc: use GCC cross-compiler
 if Clang is used as cross-compiler
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <20190907094027.9537-10-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_USER_HOST_CLANG_AS_CROSS_COMPILER=y (added in the next patch),
TARGET_CONFIGURE_OPTS contains CC, CPP, CXX set to the path to clang
cross-compiler:

TARGET_CC = $(HOST_DIR)/bin/clang
TARGET_CPP = $(HOST_DIR)/bin/clang-cpp
TARGET_CXX = $(HOST_DIR)/bin/clang++

Since Glibc likely need a GCC toolchain to build, explicitely set theses
variables while configuring glibc package (GLIBC_CONFIGURE_CMDS).

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 9421f9fd81..131439c593 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -104,11 +104,16 @@ GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 # Note that as mentionned in
 # http://patches.openembedded.org/patch/38849/, glibc must be
 # built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
+# Use GCC cross-compiler if Clang is used as cross-compiler.
 define GLIBC_CONFIGURE_CMDS
 	mkdir -p $(@D)/build
 	# Do the configuration
 	(cd $(@D)/build; \
 		$(TARGET_CONFIGURE_OPTS) \
+		CC="$(TARGET_CROSS)gcc" \
+		GCC="$(TARGET_CROSS)gcc" \
+		CPP="$(TARGET_CROSS)cpp" \
+		CXX="$(TARGET_CROSS)g++" \
 		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
 		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
 		$(GLIBC_CONF_ENV) \
-- 
2.21.0
