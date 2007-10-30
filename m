From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 30 Oct 2007 08:41:54 +0100
Subject: [Buildroot] Several issues with building multiple"projects"	for
	same architecture
References: <d83696340710290855s5e4e4f44y7b5777bfeacf4ec2@mail.gmail.com><1193698207.8485.4.camel@local.atmel.sweden>
	<20071030001045.GA5198@cloud.net.au>
Message-ID: <003101c81ac8$75b4be60$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 29, 2007 at 11:50:07PM +0100, Ulf Samuelsson wrote:
> m?n 2007-10-29 klockan 10:55 -0500 skrev Jonathan Nalley:
> > I am using the buildroot to build for several different boards, some
> > of them have the same CPU architecture (PPC405GP/EP).  I have noticed
> > some issues with the "project" concept in the buildroot.  Since the
> > builds are for the same architecture the toolchain is created under
> > "build_powerpc".  Everything works fine for the first board, but for
> > subsequent builds for different "project" names things are missing
> > under "project_build_powerpc/PROJECT_NAME/root".  Specifically:
> >
> > /root/lib/libgcc_s.so
> > /root/usr/lib/libstdc++.so
> > /root/usr/sbin/ethtool
> >
> > This is because the make files that install those files check for:
> >
> > $(GCC_BUILD_DIR2)/.libs_installed

There's another problem with this approach. If you are modifying the
target_skeleton contents you might want to nuke the generated root
directory and have it rebuilt, but then libgcc_s.so (etc) won't be
re-copied.

> Here is a first attempt to fix this,
> I have not tested it yet myself though.
>
> The idea is to create a $(DEP_DIR) directory in $(PROJECT_BUILD_DIR)
> and then to generate a $(<package>).installed in this directory.

This doesn't solve the problem I note either, although I guess you could
also delete *.installed. Why not just depend on the actual target rather
than these stamp files?

==> The proper way of installing a package is often "make install".
        Question is which files should be copied and in which order.

        If you depend on an arbitrary file, then you risk that
        the build fails if not all files are copied, but the file,
         on which we depend *is* copied

        If you detect the order and make it depend on the latest
        then you have a problem if the package is updated
        and the order is changed or if new files are introduced
        by make install.

        You also have a problem if the package has options.

        One possible option is to create the .installed
        inside the root file ssytem, but then you add unneccessary
        files to your target system.

        If you want to rebuild the project from scratch, then you
        might as well delete the complete $(PROJECT_BUILD_DIR)
        instead of the root file system.

        Note that my fix does not handle the "package/Makefile.in.autotools"
        Someone obviously needs to fix that as well.

Best Regards
Ulf Samuelsson
