From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 22 Oct 2015 10:22:31 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: add -C flag for /sbin/ldconfig
In-Reply-To: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
References: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1445502151-25735-2-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed when building in a FHS chroot on NixOS[1]. Without it, ldconfig
tries to open a directory in the nix store. Being explicit fixes it.

Tested that it doesn't regress on Ubuntu 14.04.

[1] I know, it's an uncommon setup :-)

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 61ce1f9..ff812f3 100644
--- a/Makefile
+++ b/Makefile
@@ -607,6 +607,7 @@ endif
 					-f $(TARGET_DIR)/etc/ld.so.conf; \
 	else \
 		/sbin/ldconfig -r $(TARGET_DIR) \
+			       -C /etc/ld.so.cache \
 			       -f /etc/ld.so.conf; \
 	fi
 	( \
-- 
2.5.2
