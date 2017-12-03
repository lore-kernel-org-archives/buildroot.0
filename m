From: daggs <daggs@gmx.com>
Date: Sun, 3 Dec 2017 20:38:43 +0100
Subject: [Buildroot] [PATCH 1/8] meson-tools: New Package
In-Reply-To: <20171203190603.gkai3rkdr52vxiny@tarshish.tkos.co.il>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203190603.gkai3rkdr52vxiny@tarshish.tkos.co.il>
Message-ID: <trinity-2520822b-7068-4366-ba13-a83fd1d0f874-1512329923803@3c-app-mailcom-bs02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Baruch,

> Sent: Sunday, December 03, 2017 at 9:06 PM
> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/8] meson-tools: New Package
>
> Hi Dagg,
> 
> On Sun, Dec 03, 2017 at 02:56:12PM +0200, Dagg Stompler wrote:
> > all amlogic's meson based soc require a signed firmware to boot, this
> > package provides a binary to do so.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  package/Config.in.host                             |  2 +-
> >  .../meson-tools/0001-support_crosscompile.patch    | 12 +++++++++
> >  package/meson-tools/Config.in.host                 |  9 +++++++
> >  package/meson-tools/meson-tools.hash               |  2 ++
> >  package/meson-tools/meson-tools.mk                 | 31 ++++++++++++++++++++++
> >  5 files changed, 55 insertions(+), 1 deletion(-)
> >  create mode 100644 package/meson-tools/0001-support_crosscompile.patch
> >  create mode 100644 package/meson-tools/Config.in.host
> >  create mode 100644 package/meson-tools/meson-tools.hash
> >  create mode 100644 package/meson-tools/meson-tools.mk
> > 
> > diff --git a/package/Config.in.host b/package/Config.in.host
> > index 48b6f8c7a8..78d085d44d 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -20,13 +20,13 @@ menu "Host utilities"
> >  	source "package/genpart/Config.in.host"
> >  	source "package/go/Config.in.host"
> >  	source "package/go-bootstrap/Config.in.host"
> > -	source "package/google-breakpad/Config.in.host"
> 
> Is this change intentional?
no, it got slipped in by mistake, thanks.

> 
> >  	source "package/gptfdisk/Config.in.host"
> >  	source "package/imx-usb-loader/Config.in.host"
> >  	source "package/jq/Config.in.host"
> >  	source "package/jsmin/Config.in.host"
> >  	source "package/lpc3250loader/Config.in.host"
> >  	source "package/lttng-babeltrace/Config.in.host"
> > +	source "package/meson-tools/Config.in.host"
> >  	source "package/mfgtools/Config.in.host"
> >  	source "package/mkpasswd/Config.in.host"
> >  	source "package/mtd/Config.in.host"
> > diff --git a/package/meson-tools/0001-support_crosscompile.patch b/package/meson-tools/0001-support_crosscompile.patch
> > new file mode 100644
> > index 0000000000..ef937f78ab
> > --- /dev/null
> > +++ b/package/meson-tools/0001-support_crosscompile.patch
> 
> Since you are only adding a host package this patch should be named something 
> else. But ...
good point, look like leftovers from previous iteration.

> 
> > @@ -0,0 +1,12 @@
> > +--- a/Makefile	2017-07-22 15:51:00.000000000 +0300
> > ++++ b/Makefile	2017-07-22 15:51:26.000000000 +0300
> > +@@ -1,7 +1,7 @@
> > + all: amlbootsig unamlbootsig amlinfo
> > + 
> > +-CFLAGS = -g
> > +-LDFLAGS = -lcrypto
> > ++override CFLAGS += -g
> > ++override LDFLAGS += -lssl -lcrypto
> 
> ... you do not actually use this override capability as far as I can see ...
> 
> [snip]
indeed.

> 
> > diff --git a/package/meson-tools/meson-tools.mk b/package/meson-tools/meson-tools.mk
> > new file mode 100644
> > index 0000000000..19f5bf543b
> > --- /dev/null
> > +++ b/package/meson-tools/meson-tools.mk
> > @@ -0,0 +1,31 @@
> > +################################################################################
> > +#
> > +# meson-tools
> > +#
> > +################################################################################
> > +
> > +HOST_MESON_TOOLS_VERSION = 5e01cbadc6f6f21ad88a63492a83182fc4b19d37
> > +HOST_MESON_TOOLS_SITE = $(call github,afaerber,meson-tools,$(HOST_MESON_TOOLS_VERSION))
> > +HOST_MESON_TOOLS_LICENSE = GPL-2.0+
> > +HOST_MESON_TOOLS_LICENSE_FILES = COPYING README.md
> > +HOST_MESON_TOOLS_DEPENDENCIES += host-openssl
> > +
> > +HOST_MESON_TOOLS_MAKE_OPTS = CC="$(HOSTCC)" \
> > +        CFLAGS="$(HOST_CFLAGS)" \
> > +        LDFLAGS="$(HOST_LDFLAGS)"
> > +
> > +define HOST_MESON_TOOLS_BUILD_CMDS
> > +        $(MAKE) -C $(@D) $(HOST_MESON_TOOLS_MAKE_OPTS)
> 
> ... because you pass the make variables as options, thus forcing their value. 
> So the patch might not be needed.
correct.

> 
> > +endef
> > +
> > +define HOST_MESON_TOOLS_INSTALL_BIN
> > +	$(INSTALL) -m 0755 $(@D)/$(1) $(HOST_DIR)/bin
> > +endef
> > +
> > +define HOST_MESON_TOOLS_INSTALL_CMDS
> > +	$(call HOST_MESON_TOOLS_INSTALL_BIN,amlbootsig)
> > +	$(call HOST_MESON_TOOLS_INSTALL_BIN,unamlbootsig)
> > +	$(call HOST_MESON_TOOLS_INSTALL_BIN,amlinfo)
> > +endef
> > +
> > +$(eval $(host-generic-package))
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> 
