From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:47 +0200
Subject: [Buildroot] [git commit] grub2: install in $(HOST_DIR) instead of
	$(HOST_DIR)/usr
Message-ID: <20170705141337.86618802F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6895400fd23831342c9ca79c14eb102943772fa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grub2 builds for the target but installs with DESTDIR=$(HOST_DIR). Since
we set prefix to /usr in TARGET_CONF_OPTS, this results in installing
things in $(HOST_DIR)/usr.

To make sure we don't install in $(HOST_DIR)/usr, override --prefix and
--exec-prefix.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 5082ece..eeda6ab 100644
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
