From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:11:35 +0200
Subject: [Buildroot] [PATCH] ustr: remove source code from target
Message-ID: <20181011201135.25219-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, ustr installs its own source code, which means we end
up with 448 KB of source code in /usr/share in the target filesystem:

$ tree output/target/usr/share/
output/target/usr/share/
??? ustr-1.0.4
    ??? malloc-check.h
    ??? ustr-b-code.h
    ??? ustr-b-dbg-code.c
    ??? ustr-b-opt-code.c
    ??? ustr-cmp-code.h
    ??? ustr-cmp-dbg-code.c
    ??? ustr-cmp-internal.h
    ??? ustr-cmp-opt-code.c
    ??? ustr-cntl-code.h
    ??? ustr-fmt-code.h
    ??? ustr-fmt-dbg-code.c
    ??? ustr-fmt-internal.h
    [...]

$ du -sh output/target/usr/share/ustr-1.0.4/
448K	output/target/usr/share/ustr-1.0.4/

So let's drop this source code in a post-install target hook.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ustr/ustr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 8346adbcf2..c99ada5276 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -28,5 +28,12 @@ USTR_MAKE_OPTS = all all-shared
 USTR_CONF_OPTS += LDCONFIG=/bin/true
 HOST_USTR_CONF_OPTS += LDCONFIG=/bin/true
 
+# for some reason, ustr finds it useful to install its source code in
+# /usr/share, which is totally useless on the target
+define USTR_REMOVE_SOURCE_CODE
+	$(RM) -rf $(TARGET_DIR)/usr/share/ustr-$(USTR_VERSION)
+endef
+USTR_POST_INSTALL_TARGET_HOOKS += USTR_REMOVE_SOURCE_CODE
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.4
