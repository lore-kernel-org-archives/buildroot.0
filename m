From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 Feb 2018 18:40:20 +0200
Subject: [Buildroot] [RFCv2 2/3] gobject-introspection: new package
In-Reply-To: <CAFSsvmoriOf2X90CvATTm_aZbrkF_CBR3jCjw1uq4TtPAwbzmA@mail.gmail.com>
References: <20180207212355.7464-1-aduskett@gmail.com>
 <20180207212355.7464-3-aduskett@gmail.com>
 <20180208044301.jvbotpwg3rl4g6ry@tarshish>
 <CAFSsvmpuJ+sEj7kRi1kYF6QcT_KaxQWyMwqsv9_WA3yan86oTQ@mail.gmail.com>
 <CAFSsvmoriOf2X90CvATTm_aZbrkF_CBR3jCjw1uq4TtPAwbzmA@mail.gmail.com>
Message-ID: <20180208164020.hu5sc57gvatrukgy@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Thu, Feb 08, 2018 at 08:58:48AM -0500, Adam Duskett wrote:
> Side note:
> 
> BR2_TOOLCHAIN_HEADERS_AT_LEAST looks like it may provide what I would need,
> which would allow me to drop the linux dependency.
> 
> Would this work for everybody?

I think that BR2_TOOLCHAIN_HEADERS_AT_LEAST is indeed what you need. As I 
understand, GI needs the toolchain headers version, not the target kernel 
version. They are not always the same.

baruch

> On Thu, Feb 8, 2018 at 8:54 AM, Adam Duskett <aduskett@gmail.com> wrote:
> > Hey Baruch! Thanks so much for emailing back!
> >
> > On Wed, Feb 7, 2018 at 11:43 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> >> Thanks for working on this hard problem.
> >>
> > Thanks! I must admit this isn't for completely selfless reasons.  I
> > want to use the gstreamer-python
> > bindings for a product I am working on, but alas it uses
> > gobject-intropsection. :)
> >
> >
> >> On Wed, Feb 07, 2018 at 04:23:54PM -0500, Adam Duskett wrote:
> >>> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> >>> new file mode 100644
> >>> index 0000000000..42f58c8c0e
> >>> --- /dev/null
> >>> +++ b/package/gobject-introspection/Config.in
> >>> @@ -0,0 +1,34 @@
> >>> +config BR2_PACKAGE_GOBJECT_INTROSPECTION
> >>> +     bool "gobject-introspection"
> >>> +     depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS #host-qemu
> >>> +     depends on BR2_TOOLCHAIN_HAS_THREADS # libffi, libglib2
> >>> +     depends on BR2_TOOLCHAIN_USES_GLIBC
> >>> +     depends on BR2_USE_MMU # python3, libglib2
> >>> +     depends on BR2_USE_WCHAR # python3, libglib2 -> gettext
> >>> +     depends on !BR2_STATIC_LIBS
> >>> +     depends on !BR2_MIPS_NABI32
> >>> +     depends on BR2_LINUX_KERNEL # qemu-host
> >>
> >> So the target board (not only architecture) must be one that qemu emulates.
> >> This is a pretty big limitation. Since GI does not require any specific
> >> hardware, would it be possible to use the qemu user space emulator[1] instead?
> >>
> > Good catch! I am using the qemu-userspace!
> >
> > The only reason I am required BR2_LINUX_KERNEL is because I am using
> > $(LINUX_VERSION) in gobject-introspection.mk here:
> > $(SED) "s|@LINUX_VERSION@|$(LINUX_VERSION)|g"
> >
> > which get's turned into:
> > PSEUDO_UNLOAD=1 $HOST_DIR/bin/qemu-x86_64 -r 3.10 -L ...
> >
> > So a question then: Is there a variable I could use to use the toolchains
> > kernel header version instead? That would be an ideal solution in this
> > instance.
> >
> >> [1] https://qemu.weilnetz.de/doc/qemu-doc.html#QEMU-User-space-emulator

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
