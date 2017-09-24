From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 24 Sep 2017 16:03:42 +0200
Subject: [Buildroot] [PATCH 1/9] luaposix: bump to version 34.0.1
In-Reply-To: <332fbe7b-3daf-16ad-cd78-9efb049f34ba@mind.be>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
 <332fbe7b-3daf-16ad-cd78-9efb049f34ba@mind.be>
Message-ID: <CAB0FRstCXqwkhSqB3HeQ8okPDos1hFO7KJ13Zz=izO=L=kbtYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-09-24 12:23 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>  Hi Francois,
>
> On 24-09-17 09:59, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/luaposix/luaposix.hash |  2 +-
> >  package/luaposix/luaposix.mk   | 24 ++++++++++++++++++++----
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.
> hash
> > index e2216be73..b3984c1d1 100644
> > --- a/package/luaposix/luaposix.hash
> > +++ b/package/luaposix/luaposix.hash
> > @@ -1,2 +1,2 @@
> >  # Locally calculated
> > -sha256 e66262f5b7fe1c32c65f17a5ef5ffb31c4d1877019b4870a5d373e2ab6526a21
> luaposix-33.4.0.tar.gz
> > +sha256 ba0bc343783fc33958cd02a68cdbfd65430152d9f297f7ed92678b1a305bd5d7
> luaposix-34.0.1.tar.gz
> > diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> > index ea3af16fb..779e707ce 100644
> > --- a/package/luaposix/luaposix.mk
> > +++ b/package/luaposix/luaposix.mk
> > @@ -4,11 +4,27 @@
> >  #
> >  ############################################################
> ####################
> >
> > -LUAPOSIX_VERSION = 33.4.0
> > +LUAPOSIX_VERSION = 34.0.1
> >  LUAPOSIX_SITE = $(call github,luaposix,luaposix,
> release-v$(LUAPOSIX_VERSION))
> >  LUAPOSIX_LICENSE = MIT
> > -LUAPOSIX_LICENSE_FILES = COPYING
> > +LUAPOSIX_LICENSE_FILES = LICENSE
> >  LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
> > -LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)"
> --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
> >
> > -$(eval $(autotools-package))
> > +define LUAPOSIX_BUILD_CMDS
> > +     (cd $(@D); \
> > +             $(LUA_RUN) build-aux/luke \
> > +             CC="$(TARGET_CC)" \
> > +             CFLAGS="$(TARGET_CFLAGS)" \
> > +             LUA_INCDIR=$(STAGING_DIR)/usr/include \
> > +     )
>
>  Since you're anyway switching the build system, why not convert it to a
> luarocks package?
>
>
luaposix have a rockspec, but not suitable for BR.
Because our luarocks infrastructure handles only the type=builtin which
represents almost 90% of all rockspec.

Fran?ois


>  Regards,
>  Arnout
>
> > +endef
> > +
> > +define LUAPOSIX_INSTALL_TARGET_CMDS
> > +     (cd $(@D); \
> > +             $(LUA_RUN) build-aux/luke install \
> > +             INST_LIBDIR="$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)"
> \
> > +             INST_LUADIR="$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
> \
> > +     )
> > +endef
> > +
> > +$(eval $(generic-package))
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170924/59c200ef/attachment.html>
