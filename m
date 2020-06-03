From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 2 Jun 2020 22:07:43 -0700
Subject: [Buildroot] procps-ng: disable for musl libc
In-Reply-To: <871rmw7olw.fsf@tarshish>
References: <CAGt4E5sHuMNr38r_adE4Tj2+VmWevAYwyAN9_PSENem4prK0Jw@mail.gmail.com>
 <877dwo7qjq.fsf@tarshish>
 <CAGt4E5svy+bxT=hD_MdR+xjv7uo6UkrAvF+8pq5+KT7_bBLYVg@mail.gmail.com>
 <874krs7pcu.fsf@tarshish>
 <CAGt4E5spXtLwd+XTgxQn=89A81LHA13RZzCNiRQvb_3H5ZyFAA@mail.gmail.com>
 <871rmw7olw.fsf@tarshish>
Message-ID: <CAGt4E5sa2a44f=xx-2R0kyDuY6mU1q73bvhrdfC94Z+Vivne5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2 Jun 2020 at 21:35, Baruch Siach <baruch@tkos.co.il> wrote:

> >> What is yours?
> >
> > BR2_aarch64=y
> > BR2_cortex_a53=y
> > BR2_ARM_FPU_FP_ARMV8=y
> >
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
> > BR2_TOOLCHAIN_EXTERNAL_MUSL=y
> > BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL=y
>
> So you are using an external musl toolchain. It most likely has a musl
> version older than 1.1.19 (Feb 2018) that introduced fopencookie()
> implementation.

You are correct. I was trying earlier to find a version string in the
musl libc binary and didn't see one. But now I found it.

$ strings aarch64-unknown-linux-musleabi/sys-root/usr/lib/libc.so | fgrep 1.1
1.1.16

I'll see what we can do about that. Thanks for the pointer.

Regards,
-Markus

> baruch
>
> > BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL="toolchain-external-custom"
> > BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux"
> > BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> > BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
> > BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG=y
> > BR2_TOOLCHAIN_EXTERNAL_CXX=y
> >
> > Mine is aarch64. GCC is 6.3 and the kernel is 4.9 (the toolchain is
> > configured with 4.1 headers to support 4.1 and 4.9).
>
> --
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
