From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 21:11:22 +0100
Subject: [Buildroot] [PATCH 2/5] busybox: ensure $(BUSYBOX_BUILD_CONFIG) is
	writable
In-Reply-To: <cover.1390939719.git.yann.morin.1998@free.fr>
References: <cover.1390939719.git.yann.morin.1998@free.fr>
Message-ID: <01fa1f7ad6024207eec43d9840894e602e3b06b4.1390939719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Lynch <ntl@pobox.com>

If $(BUSYBOX_CONFIG_FILE) is read-only (eg. because Buildroot's
source dir is), the sed fixups to $(BUSYBOX_BUILD_CONFIG) fail.

Fixes: #4363
Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f6f542e..948f3e4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -135,7 +135,7 @@ endef
 endif
 
 define BUSYBOX_COPY_CONFIG
-	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
+	$(INSTALL) -D -m 0644 $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
 endef
 
 # Disable shadow passwords support if unsupported by the C library
-- 
1.8.1.2
