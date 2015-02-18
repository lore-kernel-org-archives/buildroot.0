From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Tue, 17 Feb 2015 19:21:36 -0600
Subject: [Buildroot] setting up directfb for a raspberry pi +
	waveshare32b display
In-Reply-To: <trinity-6efddf4c-f989-4dcd-9386-73a7d9dcf612-1424212689909@3capp-gmx-bs50>
References: <trinity-6efddf4c-f989-4dcd-9386-73a7d9dcf612-1424212689909@3capp-gmx-bs50>
Message-ID: <CAFGceHEYEe5u=Ojd08e9vXTZRgE=ML6fCe09LiAwrtQW3SS7DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried running them and got an error stating it can't find /dev/fusion0 or
/dev/fusion/0 after running any of the df_knuckles --dfb commands with the
exception of the help command.

Did you have to create new device nodes and directories? I had to using
mkdir /dev/fusion
mkdir /dev/fusion0

then made the device nodes with these commands:

mknod /dev/fusion/0 c 253 0
mknod /dev/fusion/0 c 252 0
mknod /dev/fusion0 c 252 0
mknod /dev/fusion0 c 253 0

I then ran
$ df_knuckles --dfb:fbdev=/dev/fb1
$ df_dok --dfb:fbdev=/dev/fb1
$ df_cpuload --dfb:fbdev=/dev/fb1

both as root and as another user and I get:
(!) Fusion/Init: could not enter world 0! not a typewriter

I have no idea what that means. Other people have gotten the error as well,
but haven't had solutions, as per various searches.

On Tue, Feb 17, 2015 at 4:38 PM, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Lou,
>
> On Thu, Feb 12, 2015 at 05:35:32PM -0600, Lou Crittenden wrote:
> > Hi all. I have a buildroot setup running on a raspberry pi model b+ and a
> > waveshare32b 3.2" display and was able to get the system to work with the
> > display thanks to peter seiderer's awesome patch that builds the fbtft
> > drivers for buildroot, but I now would like to set up directfb to work on
> > this setup. Directfb built nicely, along with sdl and qt5 (I'm setting up
> > the framework for a gui on a buildroot based media player), but I cannot
> > get anything to work on directfb. I run the command "df_drivertest" that
> > tests for the driver, and it gives a
> >
> > (#) DirectFBError [dfb->CreateSurface( dfb, &dsc, &primary )]: The
> > requested operation or an argument is (currently)Not
> > supported.
> >
> > The same thing happens when I try to run any of their directfb demos.
> > I went on their site, directfb.org, and a lot of the links that would
> > help are dead
> >
>
> Just a quick test:
>
> $ df_knuckles --dfb:help
> $ df_knuckles --dfb:fbdev=/dev/fb1
> $ df_dok --dfb:fbdev=/dev/fb1
> $ df_cpuload --dfb:fbdev=/dev/fb1
>
> work for me...
>
> $ df_drivertest  --dfb:fbdev=/dev/fb1
> df_drivertest.c <97>:
>         (#) DirectFBError [dfb->CreateSurface( dfb, &dsc, &primary )]: The
> requested operation or an argument is (currently) not supported
>
> failes..
>
> Regards,
> Peter
>
> >
> > I want to use a setup lighter than xorg and supports touchscreen for a
> > gui on a multimedia player I am working on.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150217/a10441fb/attachment.html>
