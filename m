From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 7 Jan 2020 20:36:21 +0100
Subject: [Buildroot] Header is nine years old
In-Reply-To: <20200107183055.0a52268a@gmx.net>
References: <XnsAB3CA67D5979Efgotham@195.159.176.226>
 <20200106213317.693ae331@windsurf>
 <CALtZhhMC1gi4ER0CVTAmT1dkkgOXQ_MMrTXxMAxCUPEzCX3+iQ@mail.gmail.com>
 <20200107103959.025a9581@gmx.net> <20200107183055.0a52268a@gmx.net>
Message-ID: <20200107203621.7d5f9afe@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frederick,

On Tue, 7 Jan 2020 18:30:55 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Frederick,
>
> On Tue, 7 Jan 2020 10:39:59 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Hello Frederick,
> >
> > On Tue, 7 Jan 2020 08:28:39 +0000, Frederick Gotham <cauldwell.thomas@gmail.com> wrote:
> >
> > > Thomas Petazzoni wrote:
> > >
> > > > "You need to give more details about the Barebox failure you're seeing"
> > >
> > >
> > > Here's the exact output:
> > >
> > > >>> barebox 2019.12.0 Configuring
> > > >>> barebox 2019.12.0 Building
> > > /opt/src/build/output/host/bin/x86_64-buildroot-linux-gnu-gcc
> > > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
> > >   -o /opt/src/build/output/build/barebox-2019.12.0/bareboxenv
> > > /opt/src/build/output/build/barebox-2019.12.0/scripts/bareboxenv.c
> > > /opt/src/build/output/build/barebox-2019.12.0/scripts/bareboxenv.c:100:10:
> > > fatal error: linux/list.h: No such file or directory
> > >  #include <linux/list.h>
> > >           ^~~~~~~~~~~~~~
> >
> > This include was introduced in barebox by commit 'recursive_action: add ACTION_SORT flag'
> > from 2019-01-08 ([1]), so maybe more a barebox than a buildroot question...
> >
> > Maybe you can avoid the problem by changing the barebox version (by using a pre 2019-01-08
> > version), or by changing your barebox/buildroot config (disabling bareboxenv)?
> >
> > Without reproducing the problem but looking at the commit you could try to change
> > the lines (totally untested)
> >
> > 	#include <linux/list.h>
> > 	#include <linux/list_sort.h>
> >
> > to (or similar)
> >
> > 	#include <../include/linux/list.h>
> > 	#include <../include/linux/list_sort.h>
> >
> > as the barebox sources carry a copy of the linux kernel include files...
>
> Suggestion maybe nonsens as another copy of the linux kenrnel include files
> (or part of) is stored in the barebox-2019.12.0/scripts/include/linux
> directory...
>
> >
> > Please provide your buildroot/barebox config file for further help and/or
> > report your problem upstream (barebox at lists.infradead.org, [2])
>
> I can reproduce your problem using buildroot raspberrypi3_defconfig and
> enabling barebox with the rpi_defconfig and BR2_TARGET_BAREBOX_BAREBOXENV
> enabled...., disabling BR2_TARGET_BAREBOX_BAREBOXENV avoids the list.h/list_sort.h
> problem....

Can be fixed by (proper buildroot patch follows soon):

--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -82,7 +82,7 @@ $(1)_KCONFIG_DEPENDENCIES = \

 ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 define $(1)_BUILD_BAREBOXENV_CMDS
-       $$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
+       $$(TARGET_CC) $$(TARGET_CFLAGS) -I$$(@D)/scripts/include $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
                $$(@D)/scripts/bareboxenv.c
 endef
 endif

>
> But later the buildroot/barebox install step fails with:
>
> >>> barebox 2019.12.0 Installing to images directory
> if test -n ""; then cp -L  .../images ; elif test -h .../build/barebox-2019.12.0/barebox-flash-image ; then cp -L .../build/barebox-2019.12.0/barebox-flash-image .../images/barebox.bin ; else cp .../build/barebox-2019.12.0/barebox.bin .../images; fi
> cp: cannot stat '.../build/barebox-2019.12.0/barebox-flash-image': No such file or directory
> make[1]: *** [package/pkg-generic.mk:343: .../build/barebox-2019.12.0/.stamp_images_installed] Error 1
> make: *** [Makefile:23: _all] Error 2

My fault, can be fixed (for the rpi_defconfig case) by:

BR2_TARGET_BAREBOX_IMAGE_FILE="images/barebox-raspberry-pi-1.img images/barebox-raspberry-pi-2.img images/barebox-raspberry-pi-3.img"

Regards,
Peter

>
> Regards,
> Peter
>
> >
> > Regards,
> > Peter
> >
> > [1] https://git.pengutronix.de/cgit/barebox/commit/?id=99c1263dce3902a8961bcdcac9398bce51fccd1b
> > [2] http://lists.infradead.org/mailman/listinfo/barebox
> >
> > > compilation terminated.
> > > package/pkg-generic.mk:238: recipe for target
> > > '/opt/src/build/output/build/barebox-2019.12.0/.stamp_built' failed
> > > make: *** [/opt/src/build/output/build/barebox-2019.12.0/.stamp_built] Error 1
> > >
> > >
> > > So if I then open up the file "bareboxenv.c", and navigate to line
> > > #100, I see that it includes a load of headers. Here are the lines #93
> > > - 122:
> > >
> > > static char *concat_subpath_file(const char *path, const char *f)
> > > {
> > > 	if (f && DOT_OR_DOTDOT(f))
> > > 		return NULL;
> > > 	return concat_path_file(path, f);
> > > }
> > >
> > > #include <linux/list.h>
> > > #include <linux/list_sort.h>
> > > #include "../lib/list_sort.c"
> > > #include "../lib/recursive_action.c"
> > > #include "../include/envfs.h"
> > > #include "../crypto/crc32.c"
> > > #include "../lib/make_directory.c"
> > > #include "../common/environment.c"
> > >
> > > static void usage(char *prgname)
> > > {
> > > 	printf( "Usage : %s [OPTION] DIRECTORY FILE\n"
> > > 		"Load a barebox environment sector into a directory or\n"
> > > 		"save a directory into a barebox environment sector\n"
> > > 		"\n"
> > > 		"options:\n"
> > > 		"  -s        save (directory -> environment sector)\n"
> > > 		"  -z        force the built-in default environment at startup\n"
> > > 		"  -l        load (environment sector -> directory)\n"
> > > 		"  -p <size> pad output file to given size\n"
> > > 		"  -v        verbose\n",
> > > 		prgname);
> > > }
> > >
> > >
> > >
> > >
> > > On 1/6/20, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > > > Hello Frederick,
> > > >
> > > > On Mon, 6 Jan 2020 16:21:59 -0000 (UTC)
> > > > Frederick Gotham <cauldwell.thomas@gmail.com> wrote:
> > > >
> > > >> The following header file:
> > > >>
> > > >>     #include <linux/list.h>
> > > >>
> > > >> was added to the Github for the Linux kernel in May 2011. That was 9 years
> > > >>
> > > >> ago.
> > > >
> > > > This is an internal kernel header.
> > > >
> > > >> So on my Buildroot setup, I navigate to this directory:
> > > >>
> > > >>
> > > >> build/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux
> > > >
> > > > This only contains the kernel headers exposed to userspace, i.e the
> > > > UAPI (user-space API). There is absolutely no reason for list.h to be
> > > > in there.
> > > >
> > > >> And I check to see if "list.h" is in there. It's not there, and this is
> > > >> why I
> > > >> am unable to build the latest version of Barebox.
> > > >>
> > > >> Anyone got any idea why that header file isn't in there?
> > > >
> > > > You need to give more details about the Barebox failure you're seeing:
> > > > which version you're trying to build, what is the build error. But the
> > > > error is clearly not due to <linux/list.h> being missing from the
> > > > compiler sysroot.
> > > >
> > > > Best regards,
> > > >
> > > > Thomas
> > > > --
> > > > Thomas Petazzoni, CTO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
