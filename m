From: Martin Bark <martin@barkynet.com>
Date: Thu, 16 Jun 2016 17:05:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/upx: fix build with host gcc 6.x
Message-ID: <20160616160554.21393-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the -Werror gcc option because is causes the following error
when using gcc 6.x on the host.

 p_vmlinx.cpp:100:5: error: this ?if? clause does not guard...
  [-Werror=misleading-indentation] if (a->p_paddr > b->p_paddr) return  1;

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/upx/upx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 400d283..eaef275 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -17,6 +17,7 @@ HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 define HOST_UPX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
+		CXXFLAGS_WERROR= \
 		-C $(@D) all
 endef
 
-- 
2.8.3
