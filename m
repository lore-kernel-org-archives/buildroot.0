From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 22 Jun 2014 15:45:43 +0200
Subject: [Buildroot] [PATCH 4 of 5 RFC] busybox: menuconfig: take into
 account initial settings from config file
In-Reply-To: <patchbomb.1403444739@localhost>
References: <patchbomb.1403444739@localhost>
Message-ID: <5dc5438c0108ca503012.1403444743@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When busybox-menuconfig is executed from a clean repo, and a custom
configuration file was set, then these custom settings are ignored and
busybox starts from the default configuration.

This patch adds an explicit copy of the custom config file to the menuconfig
target to fix 'make clean busybox-menuconfig'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r 6bb6b3f59fd5 -r 5dc5438c0108 package/busybox/busybox.mk
--- a/package/busybox/busybox.mk	Sun Jun 22 15:29:01 2014 +0200
+++ b/package/busybox/busybox.mk	Sun Jun 22 15:33:49 2014 +0200
@@ -232,6 +232,7 @@
 $(eval $(generic-package))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
+	$(BUSYBOX_COPY_CONFIG)
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
 		$(subst busybox-,,$@)
 	rm -f $(BUSYBOX_DIR)/.stamp_built
