From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 23:38:59 +0100
Subject: [Buildroot] [PATCH] manual: add section about dealing
	efficiently with big image files
In-Reply-To: <20131215222521.GB3463@free.fr> (Yann E. MORIN's message of "Sun, 
 15 Dec 2013 23:25:21 +0100")
References: <1387133792-32363-1-git-send-email-yann.morin.1998@free.fr>
 <87k3f5vqio.fsf@dell.be.48ers.dk> <20131215222521.GB3463@free.fr>
Message-ID: <87ppoxu4cc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > I'll remove it before re-submitting. After all, we hint to the man pages
 > of other tools, so it's thoroughly documented. And if anyone if foolish
 > enough to try that, then we can say 'we never wrote that!' :-)

Indeed, thanks ;)

 >> I think that you should be using bigger block sizes, tools that
 >> understand the filesystem layout or resize afterwards (E.G. resize2fs)
 >> instead.

 > Not sure I follow you on that one. What if the user enters a large
 > number of blocks for his ext2 filesystem? Those will be empty
 > (zero-filled), but the image file will not be made sparse. So there is
 > no 'fs resize' or such in the process.

What I meant was simply that if you want to end up with a filesystem
with lots of free space and don't want to waste time writing zeroes to
the unused areas, it is safer to:

 - create the filesystem spanning the entire partition yourself on the
   fly (mkfs + tar xf output/images/rootfs.tar)

 - or resize fs to the full partition size after writing the image
   (dd if=output/images/rootfs.ext2 + resize2fs)

-- 
Bye, Peter Korsgaard
