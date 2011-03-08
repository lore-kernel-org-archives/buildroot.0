From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2011 22:42:25 +0100
Subject: [Buildroot] How to add a board with Buildroot 2011.02
In-Reply-To: <F41B82AC38A41A41868925971DCBED9E06EFEFC0@rfomb01.corp.atmel.com>
References: <F41B82AC38A41A41868925971DCBED9E06EFEFC0@rfomb01.corp.atmel.com>
Message-ID: <20110308224225.1d924c40@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ludovic,

On Tue, 8 Mar 2011 17:44:06 +0100
"Desroches, Ludovic" <Ludovic.Desroches@atmel.com> wrote:

> I wanted to know how I can add in a proper way a new board to
> Buildroot following the policy introduced into the last release.
> 
> I have read the discussion between square(Thomas) :p and the
> documentation but I still have questions:
> 
> 1) On one side I have read that target/device folder should host
> things such as kernel conf files or various board-specific patches
> and on the other side I have read into the documentation to use the
> board folder. So which one I have to use ?

The target/device is almost empty nowadays (it only contains Xtensa
specific things and the device table), and ultimately, the goal is to
get rid of it completely.

Therefore, things like kernel configuration files should go into
board/<manufacturer>/<boardname>/.

> 2) What about the skeleton policy ? Before Atmel had its own
> skeleton. There are not so many changes from the generic skeleton.
> Then I think we won't need to have our own one. Moreover, if we
> provides many board configurations it's not a good idea to duplicate
> it. To avoid this, what do you suggest? I was thinking we can have a
> small skeleton with only files changing from the generic ones or
> patches; copying or patching can de bone by the post build script.

The policy I'd like to see is to not add several skeletons to the
mainline Buildroot tree, or at least not skeleton that are
board-specific. But of course, it's only my opinion, and as a community
project, the opinion of others also count.

So, there are three cases :

 *) The changes needed compared to the official skeleton can be
    directly integrated into this official skeleton, because they make
    sense in a generic way. In this case, send some patches on the
    official skeleton, and we'll discuss them.

 *) The changes needed are interesting outside of the specifities of a
    particular hardware platform (and I think it's generally the case),
    then we can add a generic Buildroot option that will adjust the
    official skeleton as needed at build time. This is for example
    something that is being done for choosing between static /dev,
    devtmpfs, udev or mdev. It could be done for other customizations.

 *) The changes needed are very board-specific and cannot be considered
    as generic enough to be configuration options, in that case, what
    I'd suggest is a post-build script (BR2_ROOTFS_POST_BUILD_SCRIPT)
    that modifies the target filesystem, potentially by copying files
    from the board/<manufacturer>/<boardname> folder.

Don't hesitate to discuss on the list the modifications you need on the
skeleton, so that we can sort out together into which of the following
three cases your modifications fall.

Also remember that all this board support mechanism is very new (the
cleanup and change has been done between 2010.11 and 2011.02), so it
may not be perfect and may have some shortcomings. It is not set into
stone, so your input will be very appreciated.

> Do you plan other changes about board configuration into the next
> release ? I have seen the device_table.txt split.

The device table split has not yet been acked by Peter, the Buildroot
maintainer, so I don't know what will happen to this. But if it is
accepted, then it would allow a board configuration file to override,
or add an additional device file to the build.

I don't think any other major change is scheduled at the level of board
configuration, besides minor cleanups (maybe moving the device table to
fs/, etc.). I least I don't plan to do anything major.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
