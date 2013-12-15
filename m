From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 00:28:39 +0100
Subject: [Buildroot] [PATCH] manual: add section about dealing
	efficiently with big image files
In-Reply-To: <20131215224851.GC3463@free.fr> (Yann E. MORIN's message of "Sun, 
 15 Dec 2013 23:48:51 +0100")
References: <1387133792-32363-1-git-send-email-yann.morin.1998@free.fr>
 <87k3f5vqio.fsf@dell.be.48ers.dk> <20131215222521.GB3463@free.fr>
 <87ppoxu4cc.fsf@dell.be.48ers.dk> <20131215224851.GC3463@free.fr>
Message-ID: <87lhzlu21k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> What I meant was simply that if you want to end up with a filesystem
 >> with lots of free space and don't want to waste time writing zeroes to
 >> the unused areas, it is safer to:
 >> 
 >> - create the filesystem spanning the entire partition yourself on the
 >> fly (mkfs + tar xf output/images/rootfs.tar)
 >> 
 >> - or resize fs to the full partition size after writing the image
 >> (dd if=output/images/rootfs.ext2 + resize2fs)

 > I see, but in that case, we should no offer the user the ability to
 > specify the number of blocks to use for the ext2 filesystem, with
 > BR2_TARGET_ROOTFS_EXT2_BLOCKS, for example (and ext2 if the only
 > writable filesystem for which we do it).

Historically, part of the reason why we had that option was that our
size estimate wasn't perfect, so we sometimes didn't forsee enough
space. Next to that, some people might be using it already for
provide-me-a-bit-extra-space (I know I have used it in the past). It's
not that the option is really bad, just that it is more efficient to not
transfer / write all those zeroes for the unallocated space if you can.

 > Should I cook up a patch to remove BR2_TARGET_ROOTFS_EXT2_BLOCKS?

I would prefer to keep it. It doesn't add much complexity in Buildroot.

-- 
Bye, Peter Korsgaard
