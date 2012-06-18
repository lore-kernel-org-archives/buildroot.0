From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 18 Jun 2012 10:02:22 -0500
Subject: [Buildroot] [RFC/PATCH 3/4] busybox: ensure $(BUSYBOX_BUILD_CONFIG)
	is writable
In-Reply-To: <1340031743-29694-1-git-send-email-ntl@pobox.com>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
Message-ID: <1340031743-29694-4-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If $(BUSYBOX_CONFIG_FILE) is read-only, the sed fixups to
$(BUSYBOX_BUILD_CONFIG) fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 package/busybox/busybox.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1d988f8..50a612f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -115,7 +115,8 @@ endef
 endif
 
 define BUSYBOX_COPY_CONFIG
-	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
+	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG) && \
+		chmod u+w $(BUSYBOX_BUILD_CONFIG)
 endef
 
 # Disable shadow passwords support if unsupported by the C library
-- 
1.7.10.2
