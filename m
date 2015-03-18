From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 18 Mar 2015 16:59:16 +0800
Subject: [Buildroot] [PATCH 2/2] bfin: put the libc link path of the flat
	shared and sep data formats before the sysroot link path
In-Reply-To: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
References: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1426669156-24250-2-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

The libc of the shared flat and sep data formats are different from the
standard flat libc in the sysroot lib path. In order to make application
link with proper libc, put their path before the sysroot link path.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/Makefile.in |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..e88d1ad 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -153,12 +153,12 @@ TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSI
 endif
 
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
-TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0 -L$(STAGING_DIR)/usr/lib/mid-shared-library
 TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
 TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
 endif
 ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
-TARGET_LDFLAGS += -msep-data
+TARGET_LDFLAGS += -msep-data -L$(STAGING_DIR)/usr/lib/msep-data
 TARGET_CFLAGS += -msep-data
 TARGET_CXXFLAGS += -msep-data
 endif
-- 
1.7.9.5
