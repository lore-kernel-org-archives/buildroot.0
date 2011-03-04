From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Fri, 4 Mar 2011 17:26:25 +0100
Subject: [Buildroot] xterm fails to compile
In-Reply-To: <20110304133533.1e06310f@surf>
References: <20110304121139.54ce01d0@gmail.com> <20110304133533.1e06310f@surf>
Message-ID: <20110304172625.1e5fcc7b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thanks for the quick fix, xterm compiles now.


Le Fri, 4 Mar 2011 13:35:33 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Hello Frederic,
> 
> On Fri, 4 Mar 2011 12:11:39 +0100
> Frederic Bassaler <frederic.bassaler@gmail.com> wrote:
> 
> > -c ./main.c In file included from ./input.c:86: ./xtermcap.h:62:20:
> > error: curses.h: No such file or directory In file included
> 
> Yes, xterm needs ncurses. I have the following patch in one of my
> branch since July 2010, but never had the time to finalize it. I think
> it should fix your problem:
> 
> =======================================================================
> commit 2bb119327287ff859d5bc292881fc7e8f6c83bc6
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Thu Jul 22 15:45:19 2010 +0200
> 
>     xterm: add missing dependency on ncurses
>     
>     Signed-off-by: Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>
> 
> diff --git a/package/xterm/Config.in b/package/xterm/Config.in
> index da3e9fe..447c912 100644
> --- a/package/xterm/Config.in
> +++ b/package/xterm/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_XTERM
>         bool "xterm"
>         depends on BR2_PACKAGE_XORG7
> +       select BR2_PACKAGE_NCURSES
>         help
>           xterm terminal emulator
>  
> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
> index b07eda4..2304dd7 100644
> --- a/package/xterm/xterm.mk
> +++ b/package/xterm/xterm.mk
> @@ -7,7 +7,8 @@
>  XTERM_VERSION:=259
>  XTERM_SOURCE:=xterm-$(XTERM_VERSION).tgz
>  XTERM_SITE:=ftp://invisible-island.net/xterm
> -XTERM_DEPENDENCIES = xserver_xorg-server
> +XTERM_DEPENDENCIES = xserver_xorg-server ncurses
>  XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> +XTERM_CONF_OPT = --disable-imake
>  
>  $(eval $(call AUTOTARGETS,package,xterm))
> =======================================================================
> 
> > I was able to generate a working embedded i386 X.org + Blackbox wm
> > system, but it seems that it must be done in several steps :
> > - first build a bare Xorg
> > - then add the Xorg Drivers and needed utilities
> > 
> > otherwise, some packages may fail to compile because of dependencies
> > not working (eg. xf86-input-driver would require xorg-server, but
> > xorg-server wasn't compiled before)
> 
> Hum, which driver failed exactly ? Because for example
> xdriver_xf86-input-evdev already has the dependency on
> xserver_xorg-server. And from a quick look, it seems that all other
> input drivers also have xserver_xorg-server in their dependencies.
> Could you bit a more specific about the failure (i.e give us
> the .config + build log) ?
> 
> Thanks !
> 
> Thomas

I will have to restart from scratch to see if I can reproduce the
problem (Compiling the whole thing takes a lot of time on my system).
