From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Aug 2020 14:01:20 +0200
Subject: [Buildroot] [PATCH] Revert "package/pkg-generic.mk: create
 directories upfront in the configure step"
Message-ID: <20200801120120.28745-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This _partially_ reverts commit 2dbb0660fb4d89f8eac86fcff08e9b3d0a705917.

Indeed, before 2dbb0660fb, the per-package ../host/ directory was
explicitly created right before it was populated. With 2dbb0660fb, it
is now created only at the begining of the configure step.

However, some packages may have download or extract host dependencies,
and when we are trying to rsync them, the destination .../host/
directory does not yet exist at the download or wxtract steps, thus the
build fails. E.g., with wget which needs host-lzip if the system does
not have it yet:

    rsync -a --link-dest=/home/ymorin/dev/buildroot/O/per-package/host-lzip/host/ /home/ymorin/dev/buildroot/O/per-package/host-lzip/host/ /home/ymorin/dev/buildroot/O/per-package/wget/host
    rsync: mkdir "/home/ymorin/dev/buildroot/O/per-package/wget/host" failed: No such file or directory (2)
    rsync error: error in file IO (code 11) at main.c(682) [Receiver=3.1.3]
    make[1]: *** [package/pkg-generic.mk:170: /home/ymorin/dev/buildroot/O/build/wget-1.20.3/.stamp_extracted] Error 11

Kudos to Raphael for pin-pointing the culprit commit.

Fixes:
    http://autobuild.buildroot.org/results/4c8/4c895c7ac0a635d38f5015b5df0393581ad7b508/
    and a slew of similar failures

Notes:
An alternatative solution would be to move the creation of the
directories from the configure step to the download step *and* to the
rsync step, but this is not so nice in the end... Let's just ensure they
are created where needed: at the configure step, and when populating
them.

Reported-by: Raphael Jacob <r.jacob2002@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f6de295b7f..ad7a84475a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -167,6 +167,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 # $2: 'host' or 'target'
 # $3: destination directory
 define per-package-rsync
+	mkdir -p $(3)
 	$(foreach pkg,$(1),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-- 
2.20.1
