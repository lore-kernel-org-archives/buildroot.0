From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 06:24:53 -0500
Subject: [Buildroot] [PATCH v2] autotools: add with/without and
	enable/disable helpers
In-Reply-To: <20101119121326.3185e990@surf>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
	<1290162216-30689-1-git-send-email-vapier@gentoo.org>
	<20101119121326.3185e990@surf>
Message-ID: <201011190624.54500.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, November 19, 2010 06:13:26 Thomas Petazzoni wrote:
> So typically, one would do:
> 
> SDL_MIXER_CONF_OPT += $(call USE_ENABLE,PACKAGE_LIBVORBIS,music-ogg)
> SDL_MIXER_DEPENDENCIES-$(BR2_PACKAGE_LIBVORBIS) += libvorbis
> 
> what about doing something more consistent, like:
> 
> SDL_MIXER_CONF_OPT     += $(call USE_ENABLE,PACKAGE_LIBVORBIS,music-ogg)
> SDL_MIXER_DEPENDENCIES += $(call USE_DEP,PACKAGE_LIBVORBIS,libvorbis)
> 
> I know it's a litte bit more characters that the previous solution, but
> it looks more consistent to me.

personally, i prefer to stick to the kconfig syntax where possible.  the only 
reason for USE_ENABLE is that we need to expand into different text strings.

> > +_USE_CONF = $(if $(BR2_$(3)), --$(1)-$(4)$(if $(5),=$(5)),
> > --$(2)-$(4))
> 
> What about testing directly BR2_PACKAGE_$(3), since all packages are
> prefixed by BR2_PACKAGE_ ?

if that's the case, then there's no reason

in the original implementation, i avoided making the 2nd argument optional.  
this was because i'd have to execute tr or something to do lower->upper.  but 
if it's all in make now, it should be possible to support the syntax:
	$(call USE_ENABLE,libvorbis)
the 1st arg would always be passed through the UPPERCASE helper, and hte 2nd 
arg would default to the 1st.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/b054eeb6/attachment.pgp>
