From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Nov 2016 22:23:39 +0100
Subject: [Buildroot] [PATCH 5/6] package/pseudo: fix fakeroot wrapper to
	correctly use pseudo
In-Reply-To: <cover.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <be88ddb9a18f43beaece4e29c5fe62ad91071ce3.1478553802.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far, we expected pseudo to behave like fakeroot would. This is not
correct: we need to export a few variables to make pseudo look like it
is behaving like fakeroot.

Provide a wrapper to impersonate fakeroot, instead of doing a symlink.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
---
 package/pseudo/pseudo.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 2a3e31f..cc1bcdd 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -31,7 +31,8 @@ HOST_PSEUDO = \
 	$(HOST_DIR)/usr/bin/pseudo
 
 define HOST_PSEUDO_FAKEROOT_SYMLINK
-	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
+	printf '#!/bin/sh\n%s "$${@}"\n' '$(HOST_PSEUDO)' >$(HOST_DIR)/usr/bin/fakeroot
+	chmod 755 $(HOST_DIR)/usr/bin/fakeroot
 endef
 HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
 
-- 
2.7.4
