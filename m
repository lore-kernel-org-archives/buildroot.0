From: Robert Szentmihalyi <robert.szentmihalyi@helvetica-it.com>
Date: Wed, 8 Dec 2010 23:47:55 +0100
Subject: [Buildroot] YAFFS2 support for buildroot
In-Reply-To: <20101208203429.5ae2cadc@surf>
References: <201012081744.10248.robert.szentmihalyi@helvetica-it.com>
	<20101208203429.5ae2cadc@surf>
Message-ID: <201012082347.55945.robert.szentmihalyi@helvetica-it.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thank you for your input.

On Mittwoch, 8. Dezember 2010, Thomas Petazzoni wrote:
> Hi Robert,
> 
> On Wed, 8 Dec 2010 17:44:10 +0100
> 
> Robert Szentmihalyi <robert.szentmihalyi@helvetica-it.com> wrote:
> > I am planning to add YAFFS2 support to buildroot.
> > Is anybody else interested in that or working on it already?
> 
> I am not personaly, and I haven't heard of any effort in this direction.
> 
> > Would anybody care to give me a hint about what is the preferred way to
> > add support for a new root filesystem to buildroot, so that a patch
> > could eventually be accepted for inclusion?
> 
> It depends on what you want to be able to do:
> 
>  1) Have Buildroot generate a YAFFS2 image for the filesystem
> 
>  2) Have Buildroot patch the kernel built to support YAFFS2

I have solved that with the attached script for now, which generates a patch 
against a given kernel which contains the yaffs2 code taken from the git 
repository plus a defconfig for our board. I place the generated patch in the 
buildroot directory and set BR2_LINUX_KERNEL_PATCH and 
BR2_LINUX_KERNEL_DEFCONFIG to make use of it.
This works at least until I have time to think up something better :-)


> 
> 1) is fairly easy, 2) is much more complicated because we don't have
> (yet ?) a proper infrastructure to handle third-party kernel patches in
> a generic way (even though it'd be nice to support things like Xenomai).
> 
> For 1), what you have to do is :
> 
>  *) Create a package for the userspace yaffs tools. You can look in
>     package/cramfs/cramfs.mk for an example. You need to do this so
>     that Buildroot builds a host version of mkyaffs and installs it in
>     $(HOST_DIR)/usr/bin.

I looked at cramfs.mk.
Is there a way to pull the sources from the yaffs git repository, or will I 
have to create a pseudo package and place it in the dl directory?
As I said, my goal is not just to make it work somehow, but to create a patch 
which can be submitted later, so that others can benefit from it.

> 
>  *) Create a new filesystem format in fs/yaffs/ by taking example on
>     other filesystems.

I did that and I added 
source "fs/yaffs2/Config.in"
to
fs/Config.in,
but the option does not appear under "target filesystem options".


What am I missing?

> 
> If you need any other detail or clarification about this, do not
> hesitate to ask.
> 
> Regards,
> 
> Thomas

Thanks for your help!

Regards,
 Robert

-- 
Robert Szentmih?lyi
Technischer Leiter

Helvetica IT AG
Bahnhofstrasse 15
CH-8890 Flums SG

Tel +41 81 733 15 67
Fax +41 81 733 15 68
Mobil +41 79 252 97 80

Niederlassung Deutschland:
Leopoldstrasse 244
DE-80807 M?nchen

Tel +49 89 20 80 39 508

http://www.helvetica-it.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mk_buildroot_patch.sh
Type: application/x-shellscript
Size: 1509 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/fe84b90d/attachment.bin>
