From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 07:22:33 +0200
Subject: [Buildroot] [PATCH 3/3] linux: don't build appended DTB image
	in place and support multiple images
In-Reply-To: <1445202302-2720-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 18 Oct 2015 23:05:02 +0200")
References: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1445202302-2720-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oafu15d2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Currently, the linux.mk logic for appended DTB image does the
 > appending of the DTB in place, directly at the end of the zImage using
 > a >> sign. This is incorrect because if you run "make linux-rebuild"
 > multiple times, you get the DTB appended over and over again to the
 > image.

 > Since keeping the 'zImage' or 'uImage' name for the appended DTB image
 > is not very clear, this commit moves to using the 'zImage.<dtb>' and
 > 'uImage.<dtb>' format. This way, we can clearly distinguish the
 > original image from the appended one.

 > In addition, this naming scheme easily allows to generate *multiple*
 > appended DTB images: from one zImage, you can generate multiple
 > zImage.<dtb> for several DTBs, and then generate (if requested) the
 > corresponding uImage.<dtb>.

 > To achieve this, this commit:

 >  - Changes the definition of LINUX_APPENDED_DTB to iterate over
 >    $(KERNEL_DTS_NAME), and generate a zImage.<dtb> image for each of
 >    them.

 >  - Changes the addition of LINUX_APPENDED_DTB for appended uImage to
 >    also iterate over $(KERNEL_DTS_NAME).

 >  - Provide a different implementation of LINUX_INSTALL_IMAGE which
 >    installs all the appended DTB images (but not the bare image)

 >  - Remove the checks that verified that only one DT name is passed
 >    when appended DTB is used, since we now support generating multiple
 >    DT images.

 > Some of the tested configuration:

Thanks for the testing!

 >  - Appended uImage with several DTBs:

 >    BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
 >    BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 >    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x200000"
 >    BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-xp-matrix armada-xp-gp armada-370-mirabox"

 >    Contents of output/images:

 >    uImage.armada-370-mirabox  uImage.armada-xp-gp  uImage.armada-xp-matrix

Don't we have readme's and u-boot boot scripts expecting uImage instead
of uImage.<dtb>? I guess if nothing else we need to update the readme's
to tell people to rename the file when copying to the sd card or
whatever.

Other than that the series look good to me!

-- 
Bye, Peter Korsgaard
