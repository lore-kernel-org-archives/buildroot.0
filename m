From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Oct 2014 09:57:35 +0200
Subject: [Buildroot] [PATCH 1/1] openocd bump to 0.8.0
In-Reply-To: <5435C245.1090100@integrazionetotale.it>
References: <1412801633-3394-1-git-send-email-claudio.laurita@integrazionetotale.it>
 <20141008231040.57406af4@free-electrons.com>
 <5435C245.1090100@integrazionetotale.it>
Message-ID: <20141009095735.529fd5ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Claudio Laurita,

On Thu, 09 Oct 2014 01:01:25 +0200, Claudio Laurita wrote:

> This is my first tentative of "real" collaboration, so thank you for the 
> patience.

Sure, no problem. We try to welcome contributions for everyone, and
your contribution is very welcome.

>  > The patch is doing a lot more than just bumping the version, so it 
> would be good to have some details about the changes that are made.
> 
> Ok, I thought it was not a lot ;-)

Well, a patch doing a version bump normally is nothing but a one-liner
changing the version. Here you're adding a new patch, removing many
patches, adding a large number of configuration options, etc.

> >> -HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
> >> +HOST_OPENOCD_CONF_OPTS = $(OPENOCD_CONF_OPTS)
> > Target options should normally not affect the build of host tools:
> > remember that someone can enable the host OpenOCD without building the
> > target OpenOCD.
> You're perfectly right, obviously. I made an hard shortcut ;-)
> I tried to find a way to avoid duplicating the logic of selecting 
> options and finding related real dependencies. In current version it's 
> not allowed any choice for the host and I think it's a limit. 
> Duplicating everything is a bit redundant, but my idea was terribly 
> based on my actual needs. I apologize.

We unfortunately don't really have a very good solution here. My
proposal would be the following one:

 * For the target version, provide many configuration options to only
   build what's really needed, as we need to save space on the target
   and build only the features that will be useful.

 * For the host version, just build all the possible features (i.e
   support for all the JTAG interfaces, etc.). I don't think OpenOCD is
   that long to build, so it should be a reasonable compromise I
   believe.

> This is a problem.
> If I understand, changing this variable would affect every successive 
> step of the global build. Is this the point? Not bad, as a mistake. I 
> should have studied better the main makefile. Sorry.
> Anyway, SHARED_STATIC_LIBS_OPT is added by default to the configure 
> parameters. If your default is having shared preferred, It ends up in a 
> first assignment to --enable-shared (the global) and a second one to 
> --disable-shared (the local). Unfortunately, jimtcl ignores the second 
> one and keeps building only the shared lib, making openocd build fail. 
> The current BR implementation applies a patch to auto.def of jimtcl to 
> force it ignore -enable-shared. I don't like much this approach and 
> tried to find an alternative to avoid the patch. So, the only way is 
> redefining OPENOCD_CONFIGURE_CMDS entirely?

Hum. I believe the easiest way is to keep the patch as is. It is really
a deficiency of the OpenOCD build system to not build both the static
*and* shared versions of jimctl if --enable-shared --enable-static are
passed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
