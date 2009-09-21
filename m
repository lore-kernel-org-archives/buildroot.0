From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 21 Sep 2009 18:48:10 +0200
Subject: [Buildroot] [PATCH] samba: explicitly link with -pthread if avahi
	support is enabled
Message-ID: <1253551690-31652-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The avahi-client library makes use of threads. We need to link the
smbd binary with -pthread if avahi support is enabled. Otherwise the
binary will crash at startup.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/samba/samba.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 2c344a1..1cead40 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -61,6 +61,7 @@ $(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
 		samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 		samba_cv_fpie=no \
 		libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
+		AVAHI_LIBS=-pthread \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
-- 
1.6.0.4
