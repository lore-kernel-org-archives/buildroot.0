From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 10 Apr 2017 01:07:24 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add config for enabling SMP
	for 3.x
In-Reply-To: <16e3dbf6-416b-6e7a-8e69-143fafad4bba@mind.be>
References: <20170406234657.31813-1-sikor6@gmail.com>
 <16e3dbf6-416b-6e7a-8e69-143fafad4bba@mind.be>
Message-ID: <CAKfV1Cb9E2Aw6jGPSrb14s6AXST0BYu2O9TrcRWO1Ni-63rtFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2017-04-07 13:22 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 07-04-17 01:46, Pawel Sikora wrote:
> > Add a config option for enabling SMP in Xenomai
> > userspace, only for versions >= 3.x
> >
> > In 2.x versions this option was enabled by
> > default, so for now behaviour for it will
> > not change, while as buildroot supports
> > now Xenomai 3.0.3 it's good to let users
> > have this option.
> >
> > Add a comment about this config's behaviour
> > above this option in the menuconfig.
> >
> > Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> > ---
> >  package/xenomai/Config.in  | 12 ++++++++++++
> >  package/xenomai/xenomai.mk |  4 ++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> > index b548ee810..cd323545c 100644
> > --- a/package/xenomai/Config.in
> > +++ b/package/xenomai/Config.in
> > @@ -51,6 +51,18 @@ config BR2_PACKAGE_XENOMAI_VERSION
> >         BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
> >         Kernel -> Linux Kernel Extensions menu.
> >
> > +comment "-------------------------------------------------------"
> > +comment "Please note:                                           "
> > +comment "Option for enabling SMP in Xenomai userspace is meant  "
> > +comment "only for Xenomai 3.x                                   "
> > +comment "If you use Xenomai 2.x you have SMP enabled by default."
>
>  Do we really still support Xenomai 2.x? Do our patches apply to it?
>
>  Anyway, instead of putting this in a comment, just put it in the help
> text.
>

I don't know, actually patches should be different for Xenomai 2.x, so from
my
POV and from testing they are not applying. Maybe split into to packages
for Xenomai 2.x and 3.x would be a good idea... already asked you/Thomas
about it in the thread with Xenomai Core.

I moved this comment for help and rewrote it a little bit.


> > +comment "-------------------------------------------------------"
> > +
> > +config BR2_PACKAGE_XENOMAI_ENABLE_SMP
> > +     bool "Enable SMP"
>
>  Since it was enabled before, I would add
>         default y
>

Ok, I agree. I also added comment about this in help, why it is default y.


>
> > +     help
> > +       This option allows to enable SMP in Xenomai userspace.
> > +
> >  config BR2_PACKAGE_XENOMAI_TESTSUITE
> >       bool "Install testsuite"
> >       help
> > diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> > index c9e810e05..7af4e0cf5 100644
> > --- a/package/xenomai/xenomai.mk
> > +++ b/package/xenomai/xenomai.mk
> > @@ -23,6 +23,10 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
> install-user
> >
> >  XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
> --disable-doc-install
> >
> > +ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_SMP),y)
> > +XENOMAI_CONF_OPTS += --enable-smp
>
>  Can you add an explicit --disable-smp in the else branch? Or does that
> not work?
>

On Xenomai 3 default it is disabled, so it will not make any difference,
but for 2.x will.
So ok, as it is a valid option I added it also.


>  Regards,
>  Arnout
>
> > +endif
> > +
> >  define XENOMAI_REMOVE_DEVFILES
> >       for i in xeno-config xeno-info wrap-link.sh ; do \
> >               rm -f $(TARGET_DIR)/usr/bin/$$i ; \
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

Changes in patch v2.

Thanks!

Regards,
Pawel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170410/db8588c0/attachment.html>
