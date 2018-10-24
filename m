From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 24 Oct 2018 12:28:37 +0200
Subject: [Buildroot] [V2 4/4] [RFC] pkg-perl: add per package upgrade
 target
In-Reply-To: <68212947-d3be-2b5f-8b6b-7cf7f773e3c1@mind.be>
References: <20181011161248.13457-1-francois.perrad@gadz.org>
 <20181011161248.13457-5-francois.perrad@gadz.org>
 <68212947-d3be-2b5f-8b6b-7cf7f773e3c1@mind.be>
Message-ID: <CAB0FRstdQVba8drJkpB7tObC0oiF6HShpVtuzT6ZdMC9ZyDjtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 24 oct. 2018 ? 01:57, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>
>
> On 10/11/18 5:12 PM, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/pkg-generic.mk |  6 +++++-
> >  package/pkg-perl.mk    | 11 +++++++++++
> >  2 files changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 91b61c6de..f349c6c1f 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -779,6 +779,9 @@ $(1)-external-deps:
> >       @echo "file://$$($(2)_OVERRIDE_SRCDIR)"
> >  endif
> >
> > +$(1)-upgrade:
> > +                     +$$($(2)_UPGRADE_CMDS)
> > +
>
>  Oh, I misremembered - I thought you had put this bit in pkg-perl.mk. As
> noted
> in the scanrock series, I don't think there should be a generic rule, only
> a
> perl- and luarocks-specific one. So I've moved this to pkg-perl.mk.
>
> >  $(1)-show-version:
> >                       @echo $$($(2)_VERSION)
> >
> > @@ -1030,7 +1033,8 @@ DL_TOOLS_DEPENDENCIES += $$(call
> extractor-dependency,$$($(2)_SOURCE))
> >       $(1)-rsync \
> >       $(1)-show-depends \
> >       $(1)-show-version \
> > -     $(1)-source
> > +     $(1)-source \
> > +     $(1)-upgrade
> >
> >  ifneq ($$($(2)_SOURCE),)
> >  ifeq ($$($(2)_SITE),)
> > diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> > index 74a116075..53413b3eb 100644
> > --- a/package/pkg-perl.mk
> > +++ b/package/pkg-perl.mk
> > @@ -61,6 +61,17 @@ ifeq ($(4),target)
> >  SCANCPAN_ALL_DISTRIB += $$($(2)_DISTNAME)
> >  endif
> >
> > +# Upgrade helper
> > +ifeq ($(4),target)
> > +define $(2)_UPGRADE_CMDS
>
>  With this in pkg-perl.mk, there is no longer a need for the variable.
>
> > +     utils/scancpan -force -target $$($(3)_DISTNAME)
>
>  The condition is also not needed, since we can use -$(4) directly here.
>
>  Instead, I've made the entire rule conditional on $(3)_DISTNAME not being
> empty.
>
>  I've applied to master with all these changes. In the end, it doesn't
> resemble
> what you submitted at all anymore, but I've kept you as the author :-).
>
>  I've tried it out, and I think you'll want to improve the scancpan script
> a
> little. For example, it would be better if it wouldn't touch a package if
> its
> version hasn't changed. Printing the entire package/Config.in hunk is also
> inconvenient. So just for your own sanity, I think you can improve things
> there
> a little :-), e.g. passing an -upgrade $(PKG_VERSION) argument instead of
> -force.
>
>
Thanks for this remark. See https://patchwork.ozlabs.org/patch/988493/

Fran?ois


>  Regards,
>  Arnout
>
>
> > +endef
> > +else
> > +define $(2)_UPGRADE_CMDS
> > +     utils/scancpan -force -host $$($(3)_DISTNAME)
> > +endef
> > +endif
> > +
> >  #
> >  # Configure step. Only define it if not already defined by the package
> >  # .mk file. And take care of the differences between host and target
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181024/5c1a6b64/attachment.html>
