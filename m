From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:22 +0200
Subject: [Buildroot] [PATCH 48/53] grub2: install in $(HOST_DIR) instead of
	$(HOST_DIR)/usr
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-49-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

grub2 builds for the target but installs with DESTDIR=$(HOST_DIR). Since
we set prefix to /usr in TARGET_CONF_OPTS, this results in installing
things in $(HOST_DIR)/usr.

To make sure we don't install in $(HOST_DIR)/usr, override --prefix and
--exec-prefix.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/grub2/grub2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 80f06c7f02..1b1ca105fe 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -63,6 +63,8 @@ GRUB2_CONF_ENV = \
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
 	--with-platform=$(GRUB2_PLATFORM) \
+	--prefix=/ \
+	--exec-prefix=/ \
 	--disable-grub-mkfont \
 	--enable-efiemu=no \
 	ac_cv_lib_lzma_lzma_code=no \
-- 
2.11.0
