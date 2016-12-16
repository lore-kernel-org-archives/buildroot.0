From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 16 Dec 2016 23:30:22 +0100
Subject: [Buildroot] [PATCH v2] tinycbor: disable parallel build
Message-ID: <20161216223022.20266-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe fixes ([1]):

 make[1]: Entering directory `/home/peko/autobuild/instance-1/output/build/tinycbor-v0.4'
 .config:8: *** missing separator.  Stop.

[1] http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - remove included qt5base change added by mistake...

See [2] for discussion. If disabling parallel build does not work a
second attempt to fix this problem would be to pre-gnerate a .config
file before starting the compile.

[2] http://lists.busybox.net/pipermail/buildroot/2016-December/179783.html
---
 package/tinycbor/tinycbor.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 2691e5b8d..65deacd22 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -18,8 +18,10 @@ endif
 
 TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
 
+# disabled parallel build because of build failures while
+# producing the .config file
 define TINYCBOR_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TINYCBOR_MAKE_OPTS) -C $(@D)
 endef
 
 define TINYCBOR_INSTALL_STAGING_CMDS
-- 
2.11.0
