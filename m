From: vbr vbr <vvvg77@gmail.com>
Date: Fri, 6 Jan 2012 10:39:42 -0800
Subject: [Buildroot] genext2fs: couldn't allocate a block (no free space)
Message-ID: <CAOrAeonTZC0dXZnNLLfTjrcZHyiTGHRUWcKDO06mz3MOT0Y7CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot 2011.11 with x86_64 and hitting this issue after
enabling valgrind which made my target fatter:
genext2fs: couldn't allocate a block (no free space)

I made this change to work around this issue increasing the number of
BLOCKS, but it's probably not the right thing to do:

Index: fs/ext2/genext2fs.sh
===================================================================
--- fs/ext2/genext2fs.sh        (revision 92473)
+++ fs/ext2/genext2fs.sh        (working copy)
@@ -29,7 +29,7 @@
     # size ~= superblock, block+inode bitmaps, inodes (8 per block), blocks
     # we scale inodes / blocks with 10% to compensate for bitmaps size +
slack
     BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
-    BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)
+    BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 14 / 10)
     set -- $@ -b $BLOCKS
 fi

I also searched in the mailing list history and found a similar thread but
no conclusion seemed to have emerged.
Any advice?

Thanks
Vincent
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120106/b278b444/attachment.html>
