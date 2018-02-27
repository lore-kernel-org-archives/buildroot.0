From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Feb 2018 19:16:55 +0100
Subject: [Buildroot] unsafe header/library path used in
 cross-compilation: '-I/usr/include/readline'
In-Reply-To: <CAPzckP6WmuyZ+Jp_xmc6ePEi1P2Xw890vP8fb9RdbrLsT6aUzA@mail.gmail.com>
References: <CAPzckP7PfQYz-+vH09kjX3v0C7kM8nrdEB8aNrhoe4ZfiiF2dQ@mail.gmail.com>
 <20180224212548.i2xsnhq6clxclmob@tarshish>
 <CAPzckP5unJcBFCt-At53B1k2huN-WBFY=RVH2ovpqKY_o6=HdA@mail.gmail.com>
 <20180225053633.olwtzm2gtmf5tmix@sapphire.tkos.co.il>
 <CAPzckP7nabX7LWat7=h52avsdU5=EjyiRqtFD+B1Gf3FCSsQCg@mail.gmail.com>
 <20180226054259.emj4ut4q43dsmrzm@sapphire.tkos.co.il>
 <CAPzckP5q2T+-=4EjzrsyWku5Qupby1Vs0reeK57KHXVRWipa+A@mail.gmail.com>
 <20180227125427.4b0ee21a@gmx.net>
 <CAPzckP6WmuyZ+Jp_xmc6ePEi1P2Xw890vP8fb9RdbrLsT6aUzA@mail.gmail.com>
Message-ID: <20180227191655.07a6a8d1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sjoerd,

On Tue, 27 Feb 2018 18:56:57 +0100, Sjoerd Venema <srg.venema@gmail.com> wrote:

> Thanks! That fixed it.
> Compilation now succeeds!
> 
> Only one problem seems to remain. During the installation phase I get this
> error at the end (full output of install stage:
> https://pastebin.com/ca6FJebB):
> 
> ecasound: installs files in
> /home/buildroot/buildroot-2018.02-rc2/output/target//home/buildroot/buildroot-2018.02-rc2/output
> make[1]: ***
> [/home/buildroot/buildroot-2018.02-rc2/output/build/ecasound-2.9.1/.stamp_target_installed]
> Error 1
> make: *** [_all] Error 2
> 
> Everything seems to have nicely been installed into each directory.
> I noticed there's a double forward slash in the directory name, could that
> be the culprit?

Did not happen at my test build, the difference could be I am using
an out-of-tree build, see [1]...

Regards,
Peter

[1] http://nightly.buildroot.org/manual.html#_building_out_of_tree

> 
> By the way, the working patch looks like this now:
> 
> diff --git a/ecasound/Makefile.am b/ecasound/Makefile.am
> index 7346a51d5b94..1223f346aff7 100644
> --- a/ecasound/Makefile.am
> +++ b/ecasound/Makefile.am
> @@ -1,4 +1,4 @@
> -INCLUDES = -I$(ECA_S_READLINE_INCLUDES) -I$(srcdir) -I$(top_srcdir)
> -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> +INCLUDES = -I=/usr/include/readline -I$(srcdir) -I$(top_srcdir)
> -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> 
>  if ECA_AM_USE_NCURSES
>  termcap_library_ncurses = -lncurses
> 
> Assuming we manage to fix this, should I upload this package for inclusion
> into Buildroot somewhere?
> Or, how does that work? What's the etiquette, convention, etc.?
> 
> rgds,
> Sjoerd Venema
> 
> 
> On 27 February 2018 at 12:54, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Hello Sjoerd,
> >
> > On Mon, 26 Feb 2018 18:51:30 +0100, Sjoerd Venema <srg.venema@gmail.com>
> > wrote:
> >  
> > > Hi Baruch,
> > >
> > > Still fails on the readline.h
> > >
> > > Full output:
> > > https://pastebin.com/1eM3dZBiusr/include/readline
> > >
> > > I'm starting to think that there's a problem with the installation of
> > > readline perhaps?  
> >
> > No, a problem with the suggested patch, try the following:
> >
> > diff --git a/package/ecasound/0001-makefile.am-unsafereadine.patch
> > b/package/ecasound/0001-makefile.am-unsafereadine.patch
> > index a7eb1c3824..87a8eb078e 100644
> > --- a/package/ecasound/0001-makefile.am-unsafereadine.patch
> > +++ b/package/ecasound/0001-makefile.am-unsafereadine.patch
> > @@ -2,7 +2,7 @@
> >  +++ ecasound-2.9.1/ecasound/Makefile.am        2018-02-27
> > 12:49:04.641658026 +0100
> >  @@ -1,4 +1,4 @@
> >  -INCLUDES = -I$(ECA_S_READLINE_INCLUDES) -I$(srcdir) -I$(top_srcdir)
> > -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> > -+INCLUDES = -I=/readline -I$(srcdir) -I$(top_srcdir)
> > -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> > ++INCLUDES = -I=/usr/include/readline -I$(srcdir) -I$(top_srcdir)
> > -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> >
> >   if ECA_AM_USE_NCURSES
> >   termcap_library_ncurses = -lncurses
> > diff --git a/package/ecasound/Config.in b/package/ecasound/Config.in
> > index b443127bf8..15338b13aa 100644
> > --- a/package/ecasound/Config.in
> > +++ b/package/ecasound/Config.in
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_ECASOUND
> >         bool "ecasound"
> > +       select BR2_PACKAGE_READLINE
> >         help
> >           Ecasound is a software package designed for
> >           multitrack audio processing.
> > diff --git a/package/ecasound/ecasound.mk b/package/ecasound/ecasound.mk
> > index 657248e78b..f48ed4168c 100644
> > --- a/package/ecasound/ecasound.mk
> > +++ b/package/ecasound/ecasound.mk
> > @@ -10,7 +10,7 @@ ECASOUND_SITE = http://ecasound.seul.org/download
> >  ECASOUND_INSTALL_STAGING = NO
> >  ECASOUND_INSTALL_TARGET = YES
> >  #ECASOUND_CONF_OPTS =
> > -ECASOUND_DEPENDENCIES = readline
> > +ECASOUND_DEPENDENCIES = host-pkgconf readline
> >  ECASOUND_AUTORECONF = YES
> >
> >  $(eval $(autotools-package))
> >
> >
> > Regards,
> > Peter
> >  
> > >
> > > kind regards,
> > > Sjoerd
> > >
> > > On 26 February 2018 at 06:42, Baruch Siach <baruch@usr/include/
> > readlinetkos.co.il> wrote:
> > >  
> > > > Hi Sjoerd,
> > > >
> > > > On Sun, Feb 25, 2018 at 11:12:10AM +0100, Sjoerd Venema wrote:  
> > > > > Thanks for the patch, at this point, quick hacks are welcome ;-).
> > > > > I'm new at Buildroot and (Cross-)Compilation. So, it's not always  
> > that  
> > > > > clear to me what errors mean exactly and how to deal with them.
> > > > >
> > > > > The patch, however, doesn't seem to work:
> > > > >
> > > > > On 25 February 2018 at 06:36, Baruch Siach <baruch@tkos.co.il>  
> > wrote:  
> > > > >  
> > > > > > Hi Sjoerd Venema,
> > > > > >
> > > > > > On Sun, Feb 25, 2018 at 01:03:03AM +0100, Sjoerd Venema wrote:  
> > > > > > > Ok, but package BR2_PACKAGE_READLINE is actually selected.  
> > Still, I  
> > > > get  
> > > > > > the  
> > > > > > > error.
> > > > > > > I'm now running a make clean all, to be sure, but I don't think  
> > it  
> > > > > > resolves  
> > > > > > > the issue. This is my .mk file:
> > > > > > >
> > > > > > > ############################################################  
> > > > > > ####################  
> > > > > > > #
> > > > > > > # ecasound
> > > > > > > #
> > > > > > > ############################################################  
> > > > > > ####################  usr/include/readline  
> > > > > > >
> > > > > > > ECASOUND_VERSION = 2.9.1
> > > > > > > ECASOUND_SOURCE = ecasound-$(ECASOUND_VERSION).tar.gz
> > > > > > > ECASOUND_SITE = http://ecasound.seul.org/download
> > > > > > > ECASOUND_INSTALL_STAGING = NO
> > > > > > > ECASOUND_INSTALL_TARGET = YES
> > > > > > > #ECASOUND_CONF_OPTS =
> > > > > > > ECASOUND_DEPENDENCIES = readline
> > > > > > >
> > > > > > > $(eval $(autotools-package))  e0eec7a4f752364b5ca2580979f28435be0a41a2
> > > > > >
> > > > > > Unfortunately the ecasound build systems is not cross compile  
> > > > friendly. It  
> > > > > > insists on looking for readline.h in the host include directory.  
> > The  
> > > > quick  
> > > > > > hack below might help. Make sure to add _AUTORECONF to regenerate  
> > the  
> > > > > > Makefile.  
> > > > >
> > > > > Added.
> > > > >  
> > > > > > This does not fix the cross compile issue completely, since  
> > ecasound  
> > > > still  
> > > > > > depends on readline headers being installed on your host, otherwise
> > > > > > configure
> > > > > > failes.
> > > > > >
> > > > > > diff --git a/ecasound/Makefile.am b/ecasound/Makefile.am
> > > > > > index 9378d40ecb10..d2e58ab6e50c 100644
> > > > > > --- a/ecasound/Makefile.amusr/include/readlinee0eec7a4f752364b5ca2580979f28435be0a41a2
> > > > > > +++ b/ecasound/Makefile.am
> > > > > > @@ -1,4 +1,4 @@
> > > > > > -AM_CPPFLAGS = -I$(ECA_S_READLINE_INCLUDES) -I$(srcdir)  
> > -I$(top_srcdir)  
> > > > > > -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> > > > > > +AM_CPPFLAGS = -I=/readline -I$(srcdir) -I$(top_srcdir)
> > > > > > -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> > > > > >
> > > > > >  
> > > > > This patch gives me an error:
> > > > >  
> > > > > >>> ecasound 2.9.1 Patching  
> > > > >
> > > > > Applying 0001-makefile.am-unsafereadline.patch using patch:
> > > > > patching file ecasound/Makefile.am
> > > > > Hunk #1 FAILED at 1.
> > > > > 1 out of 1 hunk FAILED -- saving rejects to file  
> > ecasound/Makefile.am.rej  
> > > > > make[1]: ***
> > > > > [/home/buildroot/buildroot-2018.02-rc2/output/build/  
> > > > ecasound-2.9.1/.stamp_patched]  
> > > > > Error 1
> > > > > make: *** [_all] Error 2
> > > > >
> > > > > Can't find that .rej file. But upon closer inspection, there is no
> > > > > AM_CPPFLAGS in Makefile.am.
> > > > > There is one in the Makefile:
> > > > >
> > > > > AM_CPPFLAGS =  -D_REENTRANT -D_XOPEN_SOURCE=600
> > > > >
> > > > > I've tried appending the line from the patch, but no luck on that.  
> > > >
> > > > That's because I generated the patch against the master branch. Here  
> > it is  
> > > > against v2.9.1:
> > > >
> > > > diff --git a/ecasound/Makefile.am b/ecasound/Makefile.am
> > > > index 7346a51d5b94..1223f346aff7 100644
> > > > --- a/ecasound/Makefile.am
> > > > +++ b/ecasound/Makefile.am
> > > > @@ -1,4 +1,4 @@
> > > > -INCLUDES = -I$(ECA_S_READLINE_INCLUDES) -I$(srcdir) -I$(top_srcdir)
> > > > -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> > > > +INCLUDES = -I=/readline -I$(srcdir) -I$(top_srcdir)
> > > > -I$(top_srcdir)/libecasound -I$(top_srcdir)/kvutils
> > > >
> > > >  if ECA_AM_USE_NCURSES
> > > >  termcap_library_ncurses = -lncurses
> > > >  
> > > > > >  if ECA_AM_USE_NCURSES
> > > > > >  termcap_library_ncurses = -lncurses  
> > > > >
> > > > > Should this be part of the patch too?  
> > > >
> > > > Yes. This is the patch hunk context. See
> > > > https://en.wikipedia.org/wiki/Diff_utility#Unified_format.
> > > >  
> > >
> > > Thanks, that clarifies that.
> > >
> > >
> > >  
> > > >  
> > > > > > > On 24 February 2018 at 22:25, Baruch Siach <baruchusr/include/  
> > readline at tkos.co.il>  
> > > > wrote:  
> > > > > > > > On Sat, Feb 24, 2018 at 10:12:19PM +0100, Sjoerd Venema wrote:  
> > > > > > > > > I'm getting an "unsafe header/library path used in  
> > > > > > > > cross-compilation"-error  
> > > > > > > > > while building ecasound (https://ecasound.seul.org/  
> > > > > > ecasound/download.php  
> > > > > > > > ).  
> > > > > > > > > From what I've read so far is that it's because the makefile  
> > > > > > references  
> > > > > > > > the  
> > > > > > > > > /usr/-directory. What I can't figure out is how to change the  
> > > > > > makefile to  
> > > > > > > > > not do that. Turning on/off the "paranoid"-function in  
> > menuconfig  
> > > > > > didn't  
> > > > > > > > > make a difference.  e0eec7a4f752364b5ca2580979f28435be0a41a2
> > > > > > > >
> > > > > > > > There is no ecasound package in current Buildroot. Have you  
> > added  
> > > > this  
> > > > > > > > package
> > > > > > > > locally?
> > > > > > > >  
> > > > > > > > > [buildroot at br buildroot]$ make ecasound  
> > > > > > > > > >>> ecasound 2.9.1 Building  
> > > > > > > > > PATH="/home/buildroot/buildroot-2018.02-rc2/output/  
> > > > > > > > host/bin:/home/buildroot/buildroot-2018.02-rc2/output/
> > > > > > > > host/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:
> > > > > > > > /home/buildroot/.local/bin:/home/buildroot/bin"  
> > > > > > > > > /usr/bin/make -j5  -C
> > > > > > > > > /home/buildroot/buildroot-2018.02-rc2/output/build/  
> > > > ecasound-2.9.1/  
> > > > > > > > > /usr/bin/make  all-recursive
> > > > > > > > > Making all in kvutils
> > > > > > > > > make[4]: Nothing to be done for `all'.
> > > > > > > > > Making all in libecasound
> > > > > > > > > Making all in plugins
> > > > > > > > > make[5]: Nothing to be done for `all'.
> > > > > > > > > make[5]: Nothing to be done for `all-am'.
> > > > > > > > > Making all in ecasound
> > > > > > > > > /home/buildroot/buildroot-2018.02-rc2/output/host/bin/  
> > > > > > > > arm-buildroot-linux-uclibcgnueabihf-g++  
> > > > > > > > > -DHAVE_CONFIG_H -I. -I. -I.. *-I/usr/include/readline* -I.  
> > -I..  
> > > > > > > > > -I../libecasound -I../kvutils -D_REENTRANT  
> > -D_XOPEN_SOURCE=600  
> > > > > > > > > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE  
> > -D_FILE_OFFSET_BITS=64  
> > > > > > > > > -ffast-math -fstrict-aliasing -DNDEBUG -DENABLE_DBC  
> > > > > > -D_LARGEFILE_SOURCE  e0eec7a4f752364b5ca2580979f28435be0a41a2
> > > > > > > > > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -c -o  
> > > > eca-curses.o  
> > > > > > > > > eca-curses.cpp
> > > > > > > > > arm-buildroot-linux-uclibcgnueabihf-g++: WARNING: unsafe  
> > > > > > header/library  
> > > > > > > > > path used in cross-compilation: '*-I/usr/include/readline*'  
> > > > > > > >
> > > > > > > > This is just a warning, it doesn't break your build. But you  
> > should  
> > > > > > fix it.  
> > > > > > > >
> > > > > > > > The BR2_COMPILER_PARANOID_UNSAFE_PATH option makes this a hard  
> > > > error.  
> > > > > > But  
> > > > > > > > the
> > > > > > > > warning is shown anyway.
> > > > > > > >  
> > > > > > > > > eca-curses.cpp:46:22: fatal error: readline.h: No such file  
> > or  
> > > > > > directory  
> > > > > > > > >  #include <readline.h>
> > > > > > > > >                       ^  
> > > > > > > >
> > > > > > > > This is your problem. Your package need readline. You need to  
> > > > select  
> > > > > > > > BR2_PACKAGE_READLINE, as well as add readline to your package  
> > > > > > dependencies.  
> > > > > > > >  
> > > > > > > > > compilation terminated.
> > > > > > > > > make[4]: *** [eca-curses.o] Error 1
> > > > > > > > > make[3]: *** [all-recursive] Error 1
> > > > > > > > > make[2]: *** [all] Error 2
> > > > > > > > > make[1]: ***
> > > > > > > > > [/home/buildroot/buildroot-2018.02-rc2/output/build/  
> > > > > > > > ecasound-2.9.1/.stamp_built]  
> > > > > > > > > Error 2
> > > > > > > > > make: *** [_all] Error 2  
> > > >
> > > > --
> > > >      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> > > > Systems
> > > > =}------------------------------------------------ooO--U--
> > > > Ooo------------{=
> > > >    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> > > >  
> >
> >  
