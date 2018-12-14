From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Dec 2018 22:08:49 +0100
Subject: [Buildroot] [PATCH 1/1] kmod: fix build with pkgconf 1.5.3
In-Reply-To: <87bm5nettd.fsf@dell.be.48ers.dk>
References: <20181214154728.30189-1-fontaine.fabrice@gmail.com>
 <87bm5nettd.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W82C5KNdz6PONUfeAdn1R-H_TqcR29vz3FEsnjgOpe_pzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Le ven. 14 d?c. 2018 ? 21:29, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
>  > paths found in the .pc file. This is correct when the paths refer to
>  > something in STAGING_DIR (e.g. libdir, includedir), but not when it
>  > refers to something used for the target.
>
>  > kmod uses the completionsdir variable from bash-completions.pc to decide
>  > where to install things. Since DESTDIR is prepended to the install
>  > destination, this will end up in the wrong location.
>
>  > Until a better solution is found in pkgconf, pass the appdefaultdir to
>  > use explicitly instead of relying on bash-completions.pc.
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/f8a1f956333062027294e766ff0ddab5c35d5887
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
>  >  package/kmod/kmod.mk | 4 ++++
>  >  1 file changed, 4 insertions(+)
>
>  > diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
>  > index c165ea3020..ea5d291133 100644
>  > --- a/package/kmod/kmod.mk
>  > +++ b/package/kmod/kmod.mk
>  > @@ -28,6 +28,10 @@ KMOD_CONF_OPTS = --disable-static --enable-shared
>  >  KMOD_CONF_OPTS += --disable-manpages
>  >  HOST_KMOD_CONF_OPTS = --disable-manpages
>
>  > +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
>  > +KMOD_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
>  > +endif
>
> Hmm, how did this work before if there wasn't anything to ensure
> bash-completion was built before kmod? Just the alphabetical order?
You're right, personally, I think that we should add a bash-completion
dependency but bash-completion is not a "real" build time dependency,
it's only needed to retrieve completionsdir.
Because I was told to remove udev dependency from alsa-utils during
review of https://patchwork.ozlabs.org/patch/1013180, I applied the
same logic for kmod.
Howerver if you want, I can send a new patch to add bash-completion dependency.
>
> Anyway, committed - Thanks.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
