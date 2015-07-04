From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:38:13 +0200
Subject: [Buildroot] [git commit] package/nodejs: symlink
	/usr/lib/node_modules/.bin/* to /usr/bin
Message-ID: <20150704125427.23C6A8073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9aab65f304ed18ecb93d25de497e4f2fef75973d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch symlinks all executables in /usr/lib/node_modules/.bin
to /usr/bin so that node.js modules installed using
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL are accessible from the command line.

Signed-off-by: Martin Bark <martin@barkynet.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 59e03b0..0b3f8a5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -111,6 +111,14 @@ define NODEJS_INSTALL_MODULES
 		$(HOST_DIR)/usr/bin/npm install \
 		$(NODEJS_MODULES_LIST) \
 	)
+
+	# Symlink all executables in $(TARGET_DIR)/usr/lib/node_modules/.bin to
+	# $(TARGET_DIR)/usr/bin so they are accessible from the command line
+	cd $(TARGET_DIR)/usr/bin; \
+	for f in ../../usr/lib/node_modules/.bin/*; do \
+		[ -f "$${f}" -a -x "$${f}" ] || continue; \
+		ln -sf "$${f}" "$${f##*/}" || exit 1; \
+	done
 endef
 endif
 
