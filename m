From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:08 +0200
Subject: [Buildroot] [PATCH v2 03/15] package/Makefile.in: set
	TARGET_FCFLAGS variables
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-4-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benjamin Kamath <bkamath@spaceflight.com>

TARGET_FCFLAGS is already added to TARGET_CONFIGURE_OPTS, but was not
defined so for.
This change fixes this.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- integrate these FCFLAGS changes in this series
---
 package/Makefile.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index f6d1e67..471f687 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -141,6 +141,7 @@ endif
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
+TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_BINFMT_FLAT),y)
@@ -148,29 +149,36 @@ TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FL
 	-Wl$(comma)-elf2flt)
 TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
+TARGET_FCFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
+	-Wl$(comma)-elf2flt)
 TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt)
 endif
 
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
 TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
 TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_FCFLAGS += -mid-shared-library -mshared-library-id=0
 TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
 endif
 ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
 TARGET_LDFLAGS += -msep-data
 TARGET_CFLAGS += -msep-data
+TARGET_FCFLAGS += -msep-data
 TARGET_CXXFLAGS += -msep-data
 endif
 
 ifeq ($(BR2_SSP_REGULAR),y)
 TARGET_CFLAGS += -fstack-protector
 TARGET_CXXFLAGS += -fstack-protector
+TARGET_FCFLAGS += -fstack-protector
 else ifeq ($(BR2_SSP_STRONG),y)
 TARGET_CFLAGS += -fstack-protector-strong
 TARGET_CXXFLAGS += -fstack-protector-strong
+TARGET_FCFLAGS += -fstack-protector-strong
 else ifeq ($(BR2_SSP_ALL),y)
 TARGET_CFLAGS += -fstack-protector-all
 TARGET_CXXFLAGS += -fstack-protector-all
+TARGET_FCFLAGS += -fstack-protector-all
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
@@ -373,6 +381,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
 TARGET_CFLAGS += -static
 TARGET_CXXFLAGS += -static
+TARGET_FCFLAGS += -static
 TARGET_LDFLAGS += -static
 else ifeq ($(BR2_SHARED_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --disable-static --enable-shared
-- 
2.9.0
