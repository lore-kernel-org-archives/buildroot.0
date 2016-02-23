From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:56:32 +0100
Subject: [Buildroot] [git commit] package/glibc: set --enable-kernel to
	match kernel
Message-ID: <20160302202756.DD78D80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd5bcd0eda8fb21f639c34a09b212e6f9b066a04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Glibc is currently configured without any "--enable-kernel" option.
This causes it to use the oldest possible kernel API, slowing it down
and preventing it from using any kernel features from later versions.

Since we are likely building a kernel and matching glibc together,
backwards compatability is probably unnecessary so this patch
unconditionally configures glibc with --enable-kernel set to
BR2_TOOLCHAIN_HEADERS_AT_LEAST.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Tested-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
