From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2020 12:19:32 -0800
Subject: [Buildroot] [PATCH] external-toolchain: Detect linux/version.h
 via cross compiler
In-Reply-To: <20201103210038.2afaada6@windsurf.home>
References: <20201023093641.619746-1-raj.khem@gmail.com>
 <20201103210038.2afaada6@windsurf.home>
Message-ID: <CAMKF1sofX6BSLHnrzn=gKcVraCaQHKQWP4LoG3ZjYwZiccFovw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On Tue, Nov 3, 2020 at 12:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Khem,
>
> Thanks for the patch.
>
> On Fri, 23 Oct 2020 02:36:41 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>
> > Using linux/version.h is assumed to be hardcoded inside sysroot but this
> > does not consider the case where toolchains might be built with
> > --with-native-system-header-dir which means the header directories will
> > not be under <sysroot>/usr/include but customized, archlinux, debian
> > built cross toolchains use these install settings ( due to multiarch )
> > they have the headers installed like /usr/aarch64-linux-gnu/include and
> > not /usr/aarch64-linux-gnu/usr/include
>
> I am wondering how this can work with Buildroot. Indeed all the logic
> of our external toolchains consists in copying the external toolchain
> sysroot to $STAGING_DIR, and then pointing the cross-compiler to it
> using --sysroot. But if the toolchain headers are not inside the
> sysroot, I think we would not copy them to STAGING_DIR, and therefore
> the rest of the Buildroot logic would not work.
>
> Could you give more details on how this work with regard to how we're
> copying the sysroot to STAGING_DIR ?

It still copied the target pieces to staging area and the compiler
headers and libs are still
used from original install location. so when sysroot is pointing to
new location it can find
the non-compiler specific headers as expected and then use the
compiler headers from
default location and sysroot setting would not have changed that anyway.
The typical usecase is to use distro provided cross compilers, so if a
SDK is generated to use such a  setup you would ask the user to
install the distro cross
toolchain and hook it us into buildroot via external toolchain setup
using defconfig



>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
