From: Dan Lykowski <lykowdk@gmail.com>
Date: Mon, 27 Jul 2009 16:36:27 -0700
Subject: [Buildroot] xlib libXt build problem
In-Reply-To: <8109ECD0-3E25-4BAD-B4D7-DE97BEEBE007@earthlink.net>
References: <8109ECD0-3E25-4BAD-B4D7-DE97BEEBE007@earthlink.net>
Message-ID: <f8955f9e0907271636p26bea750s1f3e6be1782badac@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve,
 Try to replace the xlib_libXt-1.0.5-makestrs-nocc.patch with this one.

I grabbed it from upstream a while back and haven't had time to submit it.
It fixed the problem for me, but I don't know if it 'does the right
thing(tm)'.

Dan Lykowski




On Mon, Jul 27, 2009 at 10:30 AM, Steve Bennett <sablists@earthlink.net>wrote:

> Hi!
>
> I've been trying to setup a buildroot configuration (in this case an x86
> environment, although PPC is next...) and have run into a snag getting an
> X11 environment included.   I've done pretty much the minimum configuration
> needed - setting the X Windows System server to tinyx and turning on
> xorg-server.
>
> But the build is hanging in the middle of the X11 build, in particular when
> building the makestrs.c module in the xlib libXt package.   It fails with an
> error:
>
>        makestrs.c:33:21: error: X11/Xos.h: No such file or directory
>
> I've put the full output at the end of this message.  (The string library
> function warnings bother me too, but they're at least just warnings...)
>  I've done quite a lot of searching and trying to figure this out before
> coming here, and it looks to me like the compiler command line is missing an
> include path to the staging directory's /usr/include directory.   That seems
> to be correctly referenced in the packages xlib_libXt.mk file (in
> XLIB_LIBXT_CONF_ENV), but there is also a patch
> (xlib_libXt-1.0.5-makestrs-nocc.patch) in the package folder which sets it
> up to use gcc (the HOST_CC part of the patch) and doesn't seem to take into
> account the staging directory.
>
> I'm making an educated guess that the patch effectively overrides the
> XLIB_LIBXT_CONF_ENV setting (or something else isn't including that
> setting), but I'm not sure what the right fix for this is.   A brute force
> fix would be something like changing the patch to read:
>
>        HOST_CC=gcc -I$(STAGING_DIR)/usr/include
>
> ...but is that the correct approach here?  And why hasn't anything
> regarding this issue come up before?  It seems odd that nobody else is
> running into this.
>
> -->Steve Bennett
>
> ----
> >>> xlib_libXt 1.0.5 Building
> PATH="/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/toolchain_build_i486/bin:/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/host_dir/bin:/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/host_dir/usr/bin:/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/staging_dir/bin:/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/staging_dir/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
>  /usr/bin/make -j1  -C
> /home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5/
> make[1]: Entering directory
> `/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5'
> /usr/bin/make  all-recursive
> make[2]: Entering directory
> `/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5'
> Making all in util
> make[3]: Entering directory
> `/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5/util'
> if gcc -DHAVE_CONFIG_H -I. -I. -I..      -MT makestrs-makestrs.o -MD -MP
> -MF ".deps/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.o `test -f
> 'makestrs.c' || echo './'`makestrs.c; \
>        then mv -f ".deps/makestrs-makestrs.Tpo"
> ".deps/makestrs-makestrs.Po"; else rm -f ".deps/makestrs-makestrs.Tpo"; exit
> 1; fi
> makestrs.c:33:21: error: X11/Xos.h: No such file or directory
> makestrs.c: In function ???ifopen???:
> makestrs.c:106: warning: incompatible implicit declaration of built-in
> function ???strlen???
> makestrs.c:111: warning: incompatible implicit declaration of built-in
> function ???strcpy???
> makestrs.c:112: warning: incompatible implicit declaration of built-in
> function ???strcat???
> makestrs.c: In function ???CopyTmplProlog???:
> makestrs.c:236: warning: incompatible implicit declaration of built-in
> function ???strlen???
> makestrs.c: In function ???WriteHeader???:
> makestrs.c:280: warning: incompatible implicit declaration of built-in
> function ???strlen???
> makestrs.c:284: warning: incompatible implicit declaration of built-in
> function ???strlen???
> makestrs.c: In function ???DoLine???:
> makestrs.c:479: warning: incompatible implicit declaration of built-in
> function ???strlen???
> makestrs.c:509: warning: incompatible implicit declaration of built-in
> function ???strcpy???
> makestrs.c:528: warning: incompatible implicit declaration of built-in
> function ???strcpy???
> makestrs.c:550: warning: incompatible implicit declaration of built-in
> function ???strcpy???
> makestrs.c:592: warning: incompatible implicit declaration of built-in
> function ???index???
> makestrs.c:598: warning: incompatible implicit declaration of built-in
> function ???strcat???
> makestrs.c: In function ???IntelABIIndexEntries???:
> makestrs.c:633: warning: incompatible implicit declaration of built-in
> function ???strlen???
> makestrs.c: In function ???DefaultIndexEntries???:
> makestrs.c:647: warning: incompatible implicit declaration of built-in
> function ???strlen???
> makestrs.c: In function ???DoComment???:
> makestrs.c:675: warning: incompatible implicit declaration of built-in
> function ???index???
> makestrs.c:680: warning: incompatible implicit declaration of built-in
> function ???strncpy???
> makestrs.c: In function ???main???:
> makestrs.c:742: warning: incompatible implicit declaration of built-in
> function ???strlen???
> make[3]: *** [makestrs-makestrs.o] Error 1
> make[3]: Leaving directory
> `/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5/util'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory
> `/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5'
> make: ***
> [/home/steveb/Documents/CTBaseLinux/buildroot-2009.05/build_i486/xlib_libXt-1.0.5/.stamp_built]
> Error 2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090727/a39f4316/attachment.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: xlib_libXt-1.0.5-cross_compile.patch
Type: text/x-patch
Size: 892 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090727/a39f4316/attachment.bin>
