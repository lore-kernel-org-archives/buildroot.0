From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 19:46:58 +0100
Subject: [Buildroot] [PATCH 4/5] package/uClibc: ensure .oldconfig is
	writable
In-Reply-To: <cover.1384454667.git.yann.morin.1998@free.fr>
References: <cover.1384454667.git.yann.morin.1998@free.fr>
Message-ID: <9f08675878a925c9850b26ced36ed5e1edf53c9b.1384454667.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

If $(UCLIBC_CONFIG_FILE) is read-only (eg. because Buildroot's
source dir is), the sed fixups to .oldconfig fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 20d3bb6..fca83fc 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -416,7 +416,7 @@ UCLIBC_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_SETUP_DOT_CONFIG
-	cp -f $(UCLIBC_CONFIG_FILE) $(@D)/.config
+	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
-- 
1.8.1.2
