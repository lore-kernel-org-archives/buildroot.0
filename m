From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Mar 2021 13:00:11 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210320220946.GV3443324@scaer>
References: <20210216201148.26688-1-ps.report@gmx.net>
 <20210308215541.GB2737665@scaer> <20210308231454.519fa1dc@gmx.net>
 <20210308222753.GE2737665@scaer> <20210309213246.382d07b4@gmx.net>
 <20210309212942.GP2737665@scaer> <20210318232548.2bb4a716@gmx.net>
 <20210320220946.GV3443324@scaer>
Message-ID: <20210321130011.2eda602a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, All,

On Sat, 20 Mar 2021 23:09:46 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2021-03-18 23:25 +0100, Peter Seiderer spake thusly:
> > On Tue, 9 Mar 2021 22:29:42 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > OK, so here's my new proposal:
> > >
> > >   - keep your BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE, which points to a
> > >     default, basic one, not unlike the busybox default config:
> > >         default "package/rpi-firmware/config.txt"
> > >
> > >   - package/rpi-firmware/config.txt is just the common part of all the
> > >     config.txt you currently had in your patch
> > >
> > >   - rpi-firmware.mk will add arm_64bit=1 as needed, based on
> > >     BR2_aarch64=y, because that *really* is not an option.
> > >
> > >   - add BR2_PKG_RPI_FW_DTOVERLAY_LIST as I suggest above, which is not
> > >     empty, will be copied as is to dtoverlay
> > >
> > >   - change the defconfig files to just set:
> > >     BR2_PKG_RPI_FW_DTOVERLAY_LIST="miniuart-bt"
> > >
> > > That way, we get best of both worlds:
> > >
> > >   - we avoid duplication of the config.txt, and we can still customise
> > >     it a bit with just "easy stuff" that we need for our example
> > >     defconfigs,
> > >
> > >   - users can stil point to their custom, fine-tuned config.txt (in
> > >     which case they will probably not set BR2_PKG_RPI_FW_DTOVERLAY_LIST)
> >
> > Finally found time for a new iteration of the patch set:
> >
> > - fixed two bugs
> > - changed the firmware list handling to one-assignment style
> > - changed the firmware install to make-level foreach loop
> > - changed the dtb overlay install to make-level foreach loop
> >
> > - kept the verbatim BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE option,
> >   as your suggestion missed one more point where the config.txt
> >   files diverge (aside from dtoverlay=miniuart-bt and arm_64bit=1),
> >   the start_file=start.elf/fixup_file=fixup.dat or start_file=start4.elf/
> >   fixup_file=fixup4.dat as the firmware files are now copied verbatim...,
> >   and still confident that the principal of taking a verbatim copy of
> >   a given file is more flexible than implementing some more or less smart
> >   logic...
>
> But now, you will notice that all the config.txt will load the default
> fixups/start_file blobs appropriate for the hardware, so they do not
> need to be specified. The rpi docs state they are "an advanced option".

But it does not hurt (and is a good hint/starting point for how to use
the other available files provided by rpi-firmware), and I would call the
buildroot users advanced (in comparison to the plain raspian users) ;-)

>
> Also, I wonder why we specify a memory split. 100M for the GPU seems
> arbitrary. We should keep the defaults unless there is a reason not to,
> and thus not specify any.

Not part of this patch set/discussion, but for sure something to improve
(in a preliminary patch or afterwards)...

>
> We're now left with just the qt5we defconfig that differs just because
> a bit more memory is allocated tp the GPU on the 1GB+ models. But if we
> indeed drop setting the memory split between CPU/GPU, then we no longer
> need a special config.txt for qt5we either, at the expense of a bit of
> memory on the ARM side (but that should be OK as it is OK for smaller
> RAMs...).

And the kernel image name....

>
> As for the 64-bit thing: I insist that we *must* enforce it to be set
> to the proper value, i.e. 0 (or not set) for 32-bit builds, and 1 for
> 64-bit builds, because that variable is not an option: its value really
> depends on theconfiguration of the build, not on users' customisation
> will.
>
> Eventually, we're left with the dtoverlay variable. Appending the value
> of that variable, if set, verbatim into the config.txt is not trying to
> be too smart, I believe. ;-)
>
> So we can have a single config.txt, with a very easy way for users to
> base off that with dtoverlay customisations, and if they need more
> tricks, they can provide their own config.txt and/or their own
> post-build script, to apply whatever customisations they need.

Still do not see the advantage of tweaking one config.txt file to
suit the different use cases instead of a configure option for
selecting a verbatim copied one (we store different genimage files too
instead of tweaking one to fit)....

What is so bad about providing a RPI_FIRMWARE_CONFIG_FILE option (similar
as already done for uboot, kernel, busybox, uclibc,...)? An option
which is easily explained to buildroot users compared to '...you must
adjust a script to copy (or tweak) some file to some specific
location....'?

>
> At the very extreme, if the BR2_PKG_RPI_FW_DTOVERLAY_LIST variable is
> still seen as being too smart, then I think we could maybe have two
> config.txt: one that loads the miniuart-bt dtoverlay, and one that does
> not.

See above, already provided by RPI_FIRMWARE_CONFIG_FILE option...

>
> And finally, we should get rid of the commented-out initramfs setting.
> I don't want that we document the file; rather, I want users to read the
> documentation at the source, i.e. the rpi foundation-maintained docs:
>
>     https://www.raspberrypi.org/documentation/configuration/config-txt/README.md
>     https://www.raspberrypi.org/documentation/configuration/boot_folder.md

Not part of this patch set/discussion, but for sure something to improve
(in a preliminary patch or afterwards)...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
>
