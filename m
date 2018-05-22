From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 22 May 2018 23:49:38 +0200
Subject: [Buildroot] [git commit branch/next] systemd: add optional
 dependency on libidn2
In-Reply-To: <726bd387-4b74-faba-bb22-e6a0edc3291a@mind.be>
References: <20180520141552.91B5181239@busybox.osuosl.org>
 <726bd387-4b74-faba-bb22-e6a0edc3291a@mind.be>
Message-ID: <CAPi7W80i7hYppmX2fnOTcZEThcXT7cA538Aaz9bOFBHdmJMPCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

2018-05-22 23:17 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 20-05-18 16:12, Thomas Petazzoni wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=
> 4ded5d6af4f0198036183f00de190569d7578bc3
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > [Thomas: simplify ifeq/else/endif sequence.]
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  package/systemd/systemd.mk | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index db7fb43636..1e4b257731 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -75,11 +75,15 @@ else
> >  SYSTEMD_CONF_OPTS += -Daudit=false
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_LIBIDN),y)
> > +# Both options can't be selected at the same time so prefer libidn2
> > +ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> > +SYSTEMD_DEPENDENCIES += libidn2
> > +SYSTEMD_CONF_OPTS += -Dlibidn2=true -Dlibidn=false
> > +else ifeq ($(BR2_PACKAGE_LIBIDN),y)
> >  SYSTEMD_DEPENDENCIES += libidn
> > -SYSTEMD_CONF_OPTS += -Dlibidn=true
> > +SYSTEMD_CONF_OPTS += -Dlibidn=true -Dlibidn2=false
> >  else
> > -SYSTEMD_CONF_OPTS += -Dlibidn=false
> > +SYSTEMD_CONF_OPTS += -Dlibidn=false -Dlibidn2=true
>
>  Shouldn't this be -Dlibidn2=false ?
>
Indeed, you're completly right, thanks for spotting the mistake.

>   Regards,
>  Arnout
>
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180522/a3ec7c7b/attachment.html>
