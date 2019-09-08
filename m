From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 8 Sep 2019 09:58:54 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/systemd: drop
 host-intltool dependency
In-Reply-To: <5d749986d4842_b182acfecbe864c960f8@ultri5.mail>
References: <20190812175809.27786-1-fontaine.fabrice@gmail.com>
 <5d749986d4842_b182acfecbe864c960f8@ultri5.mail>
Message-ID: <CAPi7W82MAEs3gSzqG49Vu3Sx3kSbOxt-3eBV51VCy327nghung@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

Le dim. 8 sept. 2019 ? 08:02, Ricardo Martincoski
<ricardo.martincoski@gmail.com> a ?crit :
>
> Hello,
>
> + Thomas P
>
> On Mon, Aug 12, 2019 at 02:58 PM, Fabrice Fontaine wrote:
>
> > intltool is not needed since version 236 and
> > https://github.com/systemd/systemd/commit/c81217920effddc93fb780cf8f9eb699d6fe1319
> > https://github.com/systemd/systemd/commit/9e8f3893e349a68312a817da72b3473b81b6869e
> >
> > So drop it and replace it by TARGET_NLS_DEPENDENCIES
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/systemd/systemd.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index e8fd7967bd..b6aac6dc53 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -12,10 +12,10 @@ SYSTEMD_INSTALL_STAGING = YES
> >  SYSTEMD_DEPENDENCIES = \
> >       $(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
> >       host-gperf \
> > -     host-intltool \
> >       kmod \
> >       libcap \
> > -     util-linux
> > +     util-linux \
> > +     $(TARGET_NLS_DEPENDENCIES)
> >
> >  SYSTEMD_PROVIDES = udev
> >
> > --
>
> After this patch, 4 runtime tests started to fail. See the run before [1] and
> after [2] this patch:
>
> [1] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290109684
> [2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290110315
>
> These are the tests:
> ...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126471  | ORPH
> ...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126473  | ORPH
> ...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126476  | ORPH
> ...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126477  | ORPH
>
> systemd build fails at configure step:
> po/meson.build:4:5: ERROR: Can not do gettext because xgettext is not installed.
>
> Running the same tests in my PC without the docker image all 4 tests pass.
>
> Autobuilders did not catch this:
> http://autobuild.buildroot.net/?reason=systemd-241
>
> I tried the bump to 243, the same build error occurs:
> http://patchwork.ozlabs.org/patch/1157207/
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290136894
>
> An error in another package with the same error message was fixed by you in:
> "56fb7401b9 package/ncmpc: fix build without NLS"
>
> Can you investigate this?
I think it should be fixed by adding host-gettext to
SYSTEMD_DEPENDENCIES. Could you check if it fixes the build failure?
I'll then send a patch.
>
>
> Regards,
> Ricardo
Regards,

Fabrice
