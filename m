From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Nov 2018 08:39:07 -0800
Subject: [Buildroot] [PATCH] package/xen: Bump Xen to 4.11.0 and
 backport a fix
In-Reply-To: <CANQCQpbyf4Q72Qkjug8D417kHWB2q7g0b0SwMVAcKW7u9pEyGg@mail.gmail.com>
References: <20181117221707.28399-1-alistair@alistair23.me>
 <CANQCQpbyf4Q72Qkjug8D417kHWB2q7g0b0SwMVAcKW7u9pEyGg@mail.gmail.com>
Message-ID: <CAKmqyKP4hjyG2ToLarUb35kiD5kkeT9qP+gP_=jaAnpqZCGJXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 17, 2018 at 4:14 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Alistair,
>
> On Sat, Nov 17, 2018 at 4:19 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > Bump the Xen package to the latest release and backport a fix from the
> > Xen master brach.
> >
>
> Good call on doing the bump, I didn't look close enough to see that
> would catch the patches[1][2] I sent and my [3] was a yocto reference
> to your patch below.  I'll reject mine and provide my tested by on
> this set as it is a much cleaner fix.
>
> I'd suggest splitting this patch into a two separate patches(unsure of
> others preference).
>
> Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> [1] https://patchwork.ozlabs.org/patch/999090/
> [2] https://patchwork.ozlabs.org/patch/999089/
> [3] https://patchwork.ozlabs.org/patch/999088/

Hey Matt,

Sorry, I didn't realise you had already tackled this problem. Had I
know I would have been happy to use your patches. Although as Peter
points out we might have needed to apply a few more.

Thanks for the tested by.

Alistair

>
>
> > This fixes autobuilder issue:
> > http://autobuild.buildroot.net/results/6e0d8e962e861a32f5bf2e5031ef51c25768f1f6/
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  ...rm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch | 37 +++++++++++++++++++
> >  package/xen/xen.hash                          |  2 +-
> >  package/xen/xen.mk                            |  2 +-
> >  3 files changed, 39 insertions(+), 2 deletions(-)
> >  create mode 100644 package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch
> >
> > diff --git a/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch b/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch
> > new file mode 100644
> > index 0000000000..db2bbe8363
> > --- /dev/null
> > +++ b/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch
> > @@ -0,0 +1,37 @@
> > +From c8993743d611ed23ebded3168ac3ac6ff3e5d2fa Mon Sep 17 00:00:00 2001
> > +From: Christopher Clark <christopher.w.clark@gmail.com>
> > +Date: Thu, 16 Aug 2018 13:22:41 -0700
> > +Subject: [PATCH] libxl/arm: Fix build on arm64 + acpi w/ gcc 8.2
> > +
> > +Add zero-padding to #defined ACPI table strings that are copied.
> > +Provides sufficient characters to satisfy the length required to
> > +fully populate the destination and prevent array-bounds warnings.
> > +Add BUILD_BUG_ON sizeof checks for compile-time length checking.
> > +
> > +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > +Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > +Acked-by: Wei Liu <wei.liu2@citrix.com>
>
> Missing your signed off
>
> > +---
> > + tools/libxl/libxl_arm_acpi.c | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/tools/libxl/libxl_arm_acpi.c b/tools/libxl/libxl_arm_acpi.c
> > +index 636f724039..eeca1def06 100644
> > +--- a/tools/libxl/libxl_arm_acpi.c
> > ++++ b/tools/libxl/libxl_arm_acpi.c
> > +@@ -48,9 +48,9 @@ extern const unsigned char dsdt_anycpu_arm[];
> > + _hidden
> > + extern const int dsdt_anycpu_arm_len;
> > +
> > +-#define ACPI_OEM_ID "Xen"
> > +-#define ACPI_OEM_TABLE_ID "ARM"
> > +-#define ACPI_ASL_COMPILER_ID "XL"
> > ++#define ACPI_OEM_ID "Xen\0\0"
> > ++#define ACPI_OEM_TABLE_ID "ARM\0\0\0\0"
> > ++#define ACPI_ASL_COMPILER_ID "XL\0"
> > +
> > + enum {
> > +     RSDP,
> > +--
> > +2.17.1
> > +
> > diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> > index 1b3fc12f94..376013eb7a 100644
> > --- a/package/xen/xen.hash
> > +++ b/package/xen/xen.hash
> > @@ -1,3 +1,3 @@
> >  # Locally computed
> > -sha256 d5a944a34e47e9d52b2837f616821eb4a9514c8fd0955dcc723111dba499acd4 xen-4.10.2.tar.gz
> > +sha256 826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643 xen-4.11.0.tar.gz
> >  sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
> > diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> > index fb34d64c3f..8d7b92eadc 100644
> > --- a/package/xen/xen.mk
> > +++ b/package/xen/xen.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -XEN_VERSION = 4.10.2
> > +XEN_VERSION = 4.11.0
> >  XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
> >  XEN_LICENSE = GPL-2.0
> >  XEN_LICENSE_FILES = COPYING
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
