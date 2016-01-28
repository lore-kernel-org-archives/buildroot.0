From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 28 Jan 2016 14:51:23 +1100
Subject: [Buildroot] [PATCH 1/1] package/glibc: set --enable-kernel to match
	kernel
Message-ID: <fd2384a12df3a10ae821b7facab9184290970b04.1453953049.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Glibc is currently configured without any "--enable-kernel" option.
This causes it to use the oldest possible kernel API, slowing it down
and preventing it from using any kernel features from later versions.

Since we are likely building a kernel and matching glibc together,
backwards compatability is probably unnecessary so this patch
unconditionally configures glibc with --enable-kernel set to
BR2_TOOLCHAIN_HEADERS_AT_LEAST.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---

 package/glibc/glibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e60575f..4a9ba0e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -96,6 +96,7 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--without-gd \
 		--enable-obsolete-rpc \
+		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
-- 
2.1.0
