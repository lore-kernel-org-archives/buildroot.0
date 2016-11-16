From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 16 Nov 2016 14:55:42 -0500
Subject: [Buildroot] [PATCH] fs/ext2: fix double quoted label
Message-ID: <20161116195543.6456-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Since the commit 6dd7bbb59134799ed3d7343f238b3b02592faebf, the label does
not need anymore to be quoted. Even worse it *must* not be simple-quoted,
unless the label will contain the double-quotes from the config variable
BR2_TARGET_ROOTFS_EXT2_LABEL.

The commit mentionned above has replaced echo by printf:
-	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
+	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)

Since this commit the rootfs label contains extra double-quotes.
$ blkid
/dev/mmcblk0: LABEL=""BR 2016.08"" UUID="xxx"
                     ^          ^

With this fix, the extra double-quotes have disappeared:
# blkid 
/dev/mmcblk0: LABEL="BR 2016.11-rc2" UUID="yyy"

Note: I tested the fix under pseudo and fakeroot, even if has nothing
to deal with this those tools.

Regards,
Ga?l PORTAY (1):
  fs/ext2: fix double quoted label

 fs/ext2/ext2.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 
2.10.2
