From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 10 Apr 2017 14:36:52 +0200
Subject: [Buildroot] [PATCH v2] xenomai: Add choice for
 enabling/disabling Cobalt/Mercury core
In-Reply-To: <a01e3d6d-a16a-630c-6dbf-3d0925ce9d43@mind.be>
References: <20170406234139.31532-2-sikor6@gmail.com>
 <20170409235434.31059-1-sikor6@gmail.com>
 <a01e3d6d-a16a-630c-6dbf-3d0925ce9d43@mind.be>
Message-ID: <CAKfV1CYc1+-j9RV+qaZAnPewqL6ivH_eiDSnjEDbVeQEm4Uv0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

2017-04-10 13:11 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>  Some small improvements to the help text, otherwise looks OK.
>
> On 10-04-17 01:54, Pawel Sikora wrote:
> > Add an option choice for Cobalt or Mercury core
> > depending on option BR2_LINUX_KERNEL_EXT_XENOMAI.
> >
> > Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> > ---
> >
> > Changes v1 -> v2:
> >  - explicitly setting Cobalt core  (suggested by Thomas de Schampheleire)
> >  - removing from Cobalt config dependency from Xenomai being set
> >    in the Linux Kernel Extensions (Thomas P., Arnout V.)
> >
> > package/xenomai/Config.in  | 36 ++++++++++++++++++++++++++++++++++++
> >  package/xenomai/xenomai.mk |  6 ++++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> > index b548ee810..3d6342c8f 100644
> > --- a/package/xenomai/Config.in
> > +++ b/package/xenomai/Config.in
> > @@ -51,6 +51,42 @@ config BR2_PACKAGE_XENOMAI_VERSION
> >         BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
> >         Kernel -> Linux Kernel Extensions menu.
> >
> > +choice
> > +     prompt "Xenomai core"
> > +     default BR2_PACKAGE_XENOMAI_MERCURY
> > +     help
> > +       Manually select the Xenomai core. Depends if
> > +       you selected BR2_LINUX_KERNEL_EXT_XENOMAI.
> > +       If yes, then default option will be Cobalt.
> > +       Otherwise you can choose between Mercury/Cobalt
> > +       depending from your needs.
>
>  All this reference to defaults and dependencies isn't very useful.
> Instead just:
>
>           Select the Xenomai core: dual kernel (Cobalt) or
>           native Linux kernel (Mercury).
>
> > +
> > +config BR2_PACKAGE_XENOMAI_MERCURY
> > +     bool "Mercury"
> > +     depends on !BR2_LINUX_KERNEL_EXT_XENOMAI
> > +     help
> > +       Select Mercury core for the Xenomai userspace.
> > +       You want to use it if you have the native Linux Kernel.
>
>           Select Mercury core (single kernel) for the Xenomai
>           userspace. Use this if you use the native Linux kernel
>           without Xenomai extension.
>
> > +
> > +       If you want Cobalt core, you need to either enable
> > +       BR2_LINUX_KERNEL_EXT_XENOMAI in the Linux Kernel ->
> > +       Linux Kernel Extensions menu or you can choose it
> > +       anyway if you use external Linux Kernel with applied
> > +       I-pipe patch.
>
>  Remove this second paragraph entirely, since it's about the other choice.
>
> > +
> > +config BR2_PACKAGE_XENOMAI_COBALT
> > +     bool "Cobalt"
> > +     help
> > +       Select Cobalt core for the Xenomai userspace.
> > +       You should have the right I-pipe patch for your
> > +       Linux Kernel version, you can add it via
> > +       BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH in the Linux Kernel ->
> > +       Linux Kernel Extensions menu or from the interactive prompt
> > +       at compile time of Xenomai.
> > +       You can also compile it without providing this information
> > +       if have an external Linux Kernel that is already patched.
>
>           Select Cobalt core (dual kernel) for the Xenomai
>           userspace. Use this if you use a Xenomai-patched
>           Linux kernel.
>
>           If you want to use Cobalt core, your kernel must have
>           the Adeos and Xenomai patches applied to it. You can
>           add these through the BR2_LINUX_KERNEL_EXT_XENOMAI option
>           in the Linux Kernel Extensions menu.
>
>
>  Regards,
>  Arnout
>
>
> > +endchoice
> > +
> >  config BR2_PACKAGE_XENOMAI_TESTSUITE
> >       bool "Install testsuite"
> >       help
> > diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> > index c9e810e05..73d9617b1 100644
> > --- a/package/xenomai/xenomai.mk
> > +++ b/package/xenomai/xenomai.mk
> > @@ -23,6 +23,12 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
> install-user
> >
> >  XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
> --disable-doc-install
> >
> > +ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
> > +XENOMAI_CONF_OPTS += --with-core=mercury
> > +else
> > +XENOMAI_CONF_OPTS += --with-core=cobalt
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

Corrections in patch v3, Thanks Arnout!

Regards,
Pawel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170410/a6072b1a/attachment.html>
