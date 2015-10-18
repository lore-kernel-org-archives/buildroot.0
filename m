From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:04:59 +0200
Subject: [Buildroot] [PATCH 0/3] linux: Fix appended DTB image generation
Message-ID: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

What initially prompted this short series is the oldest patch
currently sitting in patchwork, i.e
http://patchwork.ozlabs.org/patch/394002/. In this patch, Guido
Mart?nez wanted to fix a problem in our implementation of the appended
DTB image generation: we are concatenating over and over again the DTB
at the end of the same file, so that if you do "make linux-rebuild"
multiple times, your kernel image ends up having your DTB concatenated
multiple times to it. This is because we do the appending "in place",
directly on zImage.

To solve this problem, this series moves to generating the appended
image under a different name: zImage.<dtb> (or uImage.<dtb> if the
uImage format is used).

But since this naming allows to generate *multiple* appended DTB
images (which was forbidden until now), we take this opportunity to
make such a thing possible.

This is all done in the last patch of this series, the two first
patches being merely preparation work for the last patch.

Please help get rid of the oldest patch in patchwork by
reviewing/testing this series!

Best regards,

Thomas

Thomas Petazzoni (3):
  linux: de-duplicate DTB and Linux image installation
  linux: only install the DTBs when not in appended DTB mode
  linux: don't build appended DTB image in place and support multiple
    images

 linux/linux.mk | 70 ++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

-- 
2.6.2
