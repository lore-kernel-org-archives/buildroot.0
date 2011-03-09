From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 9 Mar 2011 08:59:58 +0100
Subject: [Buildroot] How to add a board with Buildroot 2011.02
In-Reply-To: <20110308224225.1d924c40@surf>
References: <F41B82AC38A41A41868925971DCBED9E06EFEFC0@rfomb01.corp.atmel.com>
	<20110308224225.1d924c40@surf>
Message-ID: <AANLkTinWtvTDnRYuyXk8XS3djY1fKagMj0srmO=jt-iH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Mar 8, 2011 at 10:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[...]
>
> The policy I'd like to see is to not add several skeletons to the
> mainline Buildroot tree, or at least not skeleton that are
> board-specific. But of course, it's only my opinion, and as a community
> project, the opinion of others also count.
>
> So, there are three cases :
>
> ?*) The changes needed compared to the official skeleton can be
> ? ?directly integrated into this official skeleton, because they make
> ? ?sense in a generic way. In this case, send some patches on the
> ? ?official skeleton, and we'll discuss them.
>
> ?*) The changes needed are interesting outside of the specifities of a
> ? ?particular hardware platform (and I think it's generally the case),
> ? ?then we can add a generic Buildroot option that will adjust the
> ? ?official skeleton as needed at build time. This is for example
> ? ?something that is being done for choosing between static /dev,
> ? ?devtmpfs, udev or mdev. It could be done for other customizations.
>
> ?*) The changes needed are very board-specific and cannot be considered
> ? ?as generic enough to be configuration options, in that case, what
> ? ?I'd suggest is a post-build script (BR2_ROOTFS_POST_BUILD_SCRIPT)
> ? ?that modifies the target filesystem, potentially by copying files
> ? ?from the board/<manufacturer>/<boardname> folder.
>
> Don't hesitate to discuss on the list the modifications you need on the
> skeleton, so that we can sort out together into which of the following
> three cases your modifications fall.
>

In my case, a non-consumer non-interactive device, we have made the
following changes to the skeleton:
* /etc/inittab, to startup some extra getty's, and to add a 'sleep 1'
before doing that because one baudrate is very low (9600) which causes
the last messages from the init scripts not to be displayed
* Extra init scripts, to startup the project-specific applications,
load drivers etc.
* Add directories to hold the project specific applications, drivers etc.

I expect that this is very common usage of buildroot for people
working on specific boards.
* The getty configuration could be made more generic (we need more
than one, which is (was?) not possible with the generic_serial
option).
* For the 'sleep 1', I'm not sure if there are more elegant solutions.
If indeed this is a generic problem for slow baud rates, then it could
be added to mainline buildroot
* The extra init scripts could be added in a generic way as well, by
providing a path to custom init scripts (either to be added to the
default ones, if any; or to replace the default ones completely)
* Creation of directories (and maybe extra files) could either be done
with a post-build script, or with an 'overlay' to the filesystem (so
not containing a full skeleton, but only a delta). This overlay could
actually also be used for the init scripts.

Best regards,
thomas
