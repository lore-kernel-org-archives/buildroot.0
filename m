From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Oct 2017 19:15:13 +0200
Subject: [Buildroot] [PATCH 1/1] turbovnc: new package
In-Reply-To: <59F86E82.9080303@petroprogram.com>
References: <1509347376-12231-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171031045826.fiaekmm4omtiel2d@tarshish>
 <59F86E82.9080303@petroprogram.com>
Message-ID: <20171031171513.bam3y3ij2ofu5rxu@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

Please keep the list on Cc.

On Tue, Oct 31, 2017 at 02:37:22PM +0200, Stefan Fr?berg wrote:
> Oh, so I should put like select BR2_PACKAGE_OPENSSL, etc ... into Config.in
> ?

Yes.

> (been so very long from my last time of adding new package to buildroot).
> 
> Yes, you are right, perl is needed for just vncserver script that is nothing
> more than messy
> wrapper for TurboVNC version of Xvnc binary.
> And if I remember correctly, the vncserver script complained about missing
> xfont.
> 
> I will make the changes.
> 
> BTW, there is also init script included but god it looks messy and
> complicated
> (allkind of stuff like handling Gnome 3 and KDE and so on, things that
>  buildroot not yet have in package list) ....
> Should I make my own, simpler init script ?

This script (unix/vncserver.init.in) also requires bash. So unless you make 
bash a run-time dependency, you'll need to provide a simpler script, or none. 
An init script is not a hard requirement.

> Also, for some strange reason, TurboVNC has hardcoded xstartup.turbovnc
> while other
> VNC implementations use just xstartup and all the docs in the Net tell that
> you should add
> your window/desktop/etc whatever you want to start, into $HOME/.vnc/xstartup
> file like this for example:
> 
> #!/bin/sh
> exec startfluxbox
> 
> Should I do a patch that would keep TurboVNC behavior in sync with other
> VNCs ? Or maybe just add switch to
> vncserver script in the init file? (I think there was something like
> -xstartup or something that could
> be given to specify xstartup file name)

Buildroot generally does not make changes to upstream package behaviour.

baruch

> 31.10.2017, 6:58, Baruch Siach kirjoitti:
> > On Mon, Oct 30, 2017 at 07:09:36AM +0000, Stefan Fr?berg wrote:
> > > TurboVNC, a high-performance VNC.
> > > 
> > > Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> > > ---
> > >   package/Config.in              |  1 +
> > >   package/turbovnc/Config.in     | 16 ++++++++++++++++
> > >   package/turbovnc/turbovnc.hash |  5 +++++
> > >   package/turbovnc/turbovnc.mk   | 21 +++++++++++++++++++++
> > >   4 files changed, 43 insertions(+)
> > >   create mode 100644 package/turbovnc/Config.in
> > >   create mode 100644 package/turbovnc/turbovnc.hash
> > >   create mode 100644 package/turbovnc/turbovnc.mk
> > > 
> > > diff --git a/package/Config.in b/package/Config.in
> > > index dbfb288..2ab14bf 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -330,6 +330,7 @@ comment "X applications"
> > >   	source "package/qt-webkit-kiosk/Config.in"
> > >   	source "package/rdesktop/Config.in"
> > >   	source "package/synergy/Config.in"
> > > +	source "package/turbovnc/Config.in"
> > >   	source "package/wmctrl/Config.in"
> > >   	source "package/x11vnc/Config.in"
> > >   	source "package/xdotool/Config.in"
> > > diff --git a/package/turbovnc/Config.in b/package/turbovnc/Config.in
> > > new file mode 100644
> > > index 0000000..6ea2882
> > > --- /dev/null
> > > +++ b/package/turbovnc/Config.in
> > > @@ -0,0 +1,16 @@
> > > +config BR2_PACKAGE_TURBOVNC
> > > +	bool "turbovnc"
> > > +	help
> > > +	  TurboVNC is a high-performance, enterprise-quality version
> > > +	  of VNC based on TightVNC, TigerVNC, and X.org.
> > > +	  It contains a variant of Tight encoding that is tuned for
> > > +	  maximum performance and compression with 3D applications
> > > +	  (VirtualGL), video, and other image-intensive workloads.
> > > +	  TurboVNC, in combination with VirtualGL, provides a
> > > +	  complete solution for remotely displaying 3D applications
> > > +	  with interactive performance. TurboVNC's high-speed encoding
> > > +	  methods have been adopted by TigerVNC and libvncserver,
> > > +	  and TurboVNC is also compatible with any other TightVNC
> > > +	  derivative.
> > > +
> > > +	  https://turbovnc.org
> > > diff --git a/package/turbovnc/turbovnc.hash b/package/turbovnc/turbovnc.hash
> > > new file mode 100644
> > > index 0000000..0cad264
> > > --- /dev/null
> > > +++ b/package/turbovnc/turbovnc.hash
> > > @@ -0,0 +1,5 @@
> > > +# From https://sourceforge.net/projects/turbovnc/files/2.1.2/
> > > +md5	9d04b26d40664d0d8072e8b1828f69c4  turbovnc-2.1.2.tar.gz
> > > +sha1	cd99a27cee86f0680410133beb25da1d6f35a3ea  turbovnc-2.1.2.tar.gz
> > > +# Locally computed
> > > +sha256	2389f76eafc48412b980a61280ffb8d111dacd9e51d5e3df2112f505558b48d4  turbovnc-2.1.2.tar.gz
> > > diff --git a/package/turbovnc/turbovnc.mk b/package/turbovnc/turbovnc.mk
> > > new file mode 100644
> > > index 0000000..a861f78
> > > --- /dev/null
> > > +++ b/package/turbovnc/turbovnc.mk
> > > @@ -0,0 +1,21 @@
> > > +################################################################################
> > > +#
> > > +# turbovnc
> > > +#
> > > +################################################################################
> > > +
> > > +TURBOVNC_VERSION = 2.1.2
> > > +TURBOVNC_SOURCE = turbovnc-$(TURBOVNC_VERSION).tar.gz
> > > +TURBOVNC_SITE = https://downloads.sourceforge.net/project/turbovnc/$(TURBOVNC_VERSION)
> > > +TURBOVNC_DEPENDENCIES = jpeg-turbo linux-pam openssl perl xfont_font-misc-misc xlib_libICE xlib_libSM xlib_libX11 \
> > > +			xlib_libXext xlib_libXau xlib_libXdmcp
> > You need to select these dependencies in Config.in to make sure that they
> > actually get built. Don't forget to propagate their dependencies as well. As
> > far as I can see perl is a run-time only dependency, so there is no need to
> > list it here, since build order doesn't matter. Same goes for
> > xfont_font-misc-misc, I guess.
> > 
> > unix/Xvnc/README indicates that linux-pam is an optional dependency. Having
> > linux-pam optional would allow building turbovnc with musl libc.
> > 
> > > +TURBOVNC_LICENSE = GPL-2.0, MIT (putty), Dual FTL/GPL-2.0+ (freetype) \
> > > +		   bzip2 license (bzip2)
> > The README.txt file mentions also the zlib license.
> > 
> > > +TURBOVNC_LICENSE_FILES = doc/LICENSE.txt doc/LICENSE-PuTTY.txt \
> > > +			 unix/Xvnc/extras/freetype2/doc/LICENSE.txt \
> > > +			 unix/Xvnc/lib/bzip2/LICENSE
> > README.txt should also be here. Adding hashes for these files would also be
> > nice.
> > 
> > > +# Build just server
> > > +TURBOVNC_CONF_OPTS += -DTVNC_BUILDJAVA=0 -DTVNC_BUILDNATIVE=0
> > > +
> > > +$(eval $(cmake-package))
> > baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
