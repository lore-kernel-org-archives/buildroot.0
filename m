From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 7 Oct 2014 23:29:39 +0200
Subject: [Buildroot] [Patch v2 1/1] Fix selection of bootloaders from
 $(BR2_EXTERNAL)
In-Reply-To: <20141007154851.4a94c0f7@free-electrons.com>
References: <1412686892-29394-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20141007154851.4a94c0f7@free-electrons.com>
Message-ID: <20141007212938.GA2949@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All

On Tue, Oct 07, 2014 at 03:48:51PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Tue,  7 Oct 2014 15:01:32 +0200, Eric Le Bihan wrote:
> > If a package is based on "generic-package", pkg-generic.mk will compute
> > the name of the Kconfig variable to use for checking if this package has
> > been selected by the user.
> >
> > Unfortunately, this mechanism does not take into account the case where
> > a bootloader is declared in a $(BR2_EXTERNAL)/boot directory.
> >
> > So, even if the bootloader has been selected, it will not be added to
> > $(TARGETS) and will not be built.
> >
> > This patch fixes this issue, as well as handle toolchains.
> >
> > Changes v1 -> v2:
> >
> >   - use multiple patterns in filter (suggested by ThomasDS).
> >   - handle toolchains.
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/pkg-generic.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index d04fd36..e201803 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -614,9 +614,9 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
> >  # kernel case, the bootloaders case, and the normal packages case.
> >  ifeq ($(1),linux)
> >  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> > -else ifneq ($$(filter boot/%,$(pkgdir)),)
> > +else ifneq ($$(filter boot/% $(BR2_EXTERNAL)/boot/%,$(pkgdir)),)
> >  $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
> > -else ifneq ($$(filter toolchain/%,$(pkgdir)),)
> > +else ifneq ($$(filter toolchain/% $(BR2_EXTERNAL)/toolchain/%,$(pkgdir)),)
> >  $(2)_KCONFIG_VAR = BR2_$(2)
> >  else
> >  $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
>
> Well, this makes the assumption that $(BR2_EXTERNAL) bootloaders should
> be in boot/ and $(BR2_EXTERNAL) toolchain stuff should be in toolchain/.
>
> In practice, the boot/ and toolchain/ organization in the main
> Buildroot does not necessarily need to be reflected in $(BR2_EXTERNAL):
> you can have a bootloader in $(BR2_EXTERNAL)/package/foobar/, just name
> its option BR2_PACKAGE_FOOBAR and not BR2_TARGET_FOOBAR.

On the contrary, I find it confusing *not* to reflect the main Buildroot
organization in $(BR2_EXTERNAL).

To me, the $(BR2_EXTERNAL)/package directory should contain Makefiles for
programs to be deployed in the rootfs of the target or host tools to build
them. But a bootloader is not to be deployed on the rootfs, but to be built
next to it. So it is more sensible to put the Makefile for a new/proprietary
bootloader in $(BR2_EXTERNAL)/boot.

For $(BR2_EXTERNAL)/toolchain, a user may want to use a proprietary toolchain
that is not available as a tarball and thus not installable via the
traditional means.

Best regards,
ELB
