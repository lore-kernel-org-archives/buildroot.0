From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 14 Jan 2014 11:29:15 -0700
Subject: [Buildroot] Problems building SDL, SDL_image, SDL_ttf,
 SDL_gfx via buildroot-2013.11
In-Reply-To: <20140109153734.19dbd074@skate>
References: <CAGrGpJBkBcVq+N8X2z_mArrzM30Sbq0_m4T4B3hzDaoaZWtoWg@mail.gmail.com>
 <20140109153734.19dbd074@skate>
Message-ID: <CAGrGpJDd-ZXPjcuCwtbqSikrRLX_sBzXqUevtSTh-9KtxxWK3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Sorry I am so very very slow in responding.   I was away at the CES show in
Las Vegas and fell way behind in keeping up to my emails and work in
general.

Thanks so much for your suggestions.    I am going to spend a day or so
digesting and trying your suggestions.

Again, I am sorry I am so slow in responding.


Peter


On Thu, Jan 9, 2014 at 12:37 AM, Thomas Petazzoni
<info@free-electrons.com>wrote:

> Hello Peter,
>
> Le Wed, 8 Jan 2014 20:38:10 -0700,
> Peter Thompson <peter.macleod.thompson@gmail.com> a ?crit :
>
> > I used the following before cross-compiling my application.   I do have
> SDL
> > on my host so for pkg-config to work, the felabs path has to appear first
> > in the path list
> > export CROSS_COMPILE=arm-linux-
>
> Unneeded.
>
> > export ARCH=arm
>
> Unneeded.
>
> > export PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:$PATH
>
> Unneeded, and potentially harmful, as if the order of things in the
> PATH is not correct, or the toolchain prefix you use is not correct,
> you might end up using directly the external toolchain, instead of
> using the toolchain wrappers that Buildroot creates in
> output/host/usr/bin.
>
> > export
> >
> PATH=/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:$PATH
>
> This is the only thing that is needed.
>
> > the combo of SDL + SDL_image + SDL_ttf + SDL_gfx using
> > arm-linux-g++  -o oz         \
> >     /home/peter/Documents/oz3/display/main.cpp    \
> >         ....(list of about 10 files)
> >     /home/peter/Documents/oz4/keyboard/ttfopen.c        \
> >     -lSDL -lSDL_image -lSDL_gfx -lSDL_ttf                   \
> >     $(pkg-config --libs --cflags sdl SDL_image SDL_gfx      \
> >            SDL_ttf)
> >
> > doesn't seem to work.
> >
> > The dynamic .so cross-compiles ok
>
> .so ? The command you show above certainly does *not* build a .so. It
> builds an application, dynamically linked against the various SD
> libraries.
>
> Also, your command is kind of wrong: there is no need to pass -l<foo>
> if you're also using pkg-config to get the necessary compiler and
> linker flags.
>
> > but has a seg fault part way through when
> > running on IGEPv2.   The source is complex so I haven't figured out the
> > point of error but I suspect a .so error.   I am preparing a simpler
> > version for testing to track it down.
>
> Isn't that a bug in your application? Please do:
>
>         ulimit -c unlimited
>
> on the target, before running your application. It will generate a core
> file. Then use it with gdb to get a backtrace of when the segfault
> occurred.
>
> If you want us to help on this, then yes please provide a simple test
> case that exhibits the problem.
>
> > The static won't cross-compile because for some reason SDL_image.a is
> > missing from
> >
> /home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
>
> Humm, that's a bug. For some reason, our sdl_image package passes
> --disable-static. It has had this option passed since the sdl_image
> package was introduced in 2008, for an unknown reason. It would worth
> removing this --disable-static option and see if it causes a problem or
> not (it should not). This would get you SDL_image.a.
>
> > I tried copying SDL_image.a from a different library I had cross-compiled
> > from-scratch but that didn't seem to help.
>
> This is potentially dangerous: are you sure you've built this
> SDL_image.a manually with the same toolchain? Same floating-point
> strategy?
>
> Just removing --disable-static from package/sdl_image/sdl_image.mk
> seems like a better idea.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140114/57f25365/attachment.html>
