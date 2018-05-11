From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 21:59:10 +0200
Subject: [Buildroot] [git commit] package/dahdi-linux: use package's DL_DIR
Message-ID: <20180511195850.7BC6D80FB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a06b3d34c32bfad087d949603062bafce415ad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we reworked the download infra, the location for packages to look
for their files has moved to a per-package directory.

For systems where a download of the dahdi firmware files was already
done in a version prior to the rework, all was working fine so far,
because the files were indeed in the main DL directory.

But for systems where the download is first attempted after the rework,
the files are not found (even though they are properly downloaded).

Fix the location where dahdi-linux looks for its extra files.

Reported-by: ***** ***** <zyama.abel@mail.ru>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: ***** ***** <zyama.abel@mail.ru>
Cc: Carlos Santos <casantos@datacom.ind.br>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dahdi-linux/dahdi-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index c042a14e53..6ac1e88943 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -56,7 +56,7 @@ DAHDI_LINUX_MODULE_MAKE_OPTS = \
 
 define DAHDI_LINUX_EXTRACT_FW
 	$(foreach f,$(DAHDI_LINUX_FW_FILES),\
-		cp $(BR2_DL_DIR)/$(f) $(@D)/drivers/dahdi/firmware/$(f)$(sep))
+		cp $(DAHDI_LINUX_DL_DIR)/$(f) $(@D)/drivers/dahdi/firmware/$(f)$(sep))
 endef
 DAHDI_LINUX_POST_EXTRACT_HOOKS += DAHDI_LINUX_EXTRACT_FW
 
