From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 13:54:27 +0100
Subject: [Buildroot] [PATCH] v2 Add UBI image generation support.
In-Reply-To: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
References: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20101223135427.3876f009@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks Julien for this UBI support, it's definitely good to have in
Buildroot. This version looks good to me, but there is an alternate
solution (patch below, merged into Julien's patch).

Peter, we need you to make a decision here, between those two
solutions, because I have no strong opinion on which one is the best. To
summarize:

 * Julien's solution is to create a new root filesystem type, called
   "ubi", which depends on the "ubifs" filesystem to be generated. So
   at build time, the rootfs.ubifs image is first generated, and then
   the rootfs.ubi image is generated from rootfs.ubifs using ubinize.
   You end up with rootfs.ubifs and rootfs.ubi in $(O)/images.

 * The other solution proposed below is to not add a new root
   filesystem type, but rather add a post-processing step to the
   rootfs.ubifs image when "Embed in UBI image" is selected. You end up
   with rootfs.ubifs in $(O)/images, regardless of whether it is a
   UBIFS filesystem image, or a complete UBI image.

I just implemented the second solution because it's how I would have
implemented it if I had to do it, but I don't know if it's better or
not than Julien's proposal.

Regards,

Thomas
