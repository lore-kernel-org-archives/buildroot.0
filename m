From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 11 May 2014 07:34:05 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-09
In-Reply-To: <536E86B1.4050005@mind.be>
References: <20140510063010.4D1F81010DF@stock.ovh.net>
 <536E86B1.4050005@mind.be>
Message-ID: <20140511043405.GB4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, May 10, 2014 at 10:06:09PM +0200, Arnout Vandecappelle wrote:
> >       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/cc7873842959a5ba3222c9e70e8b1513d8936d71/
> >       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/73811fc73253aecec5560ebf5ccfa52e28e01d6a/
> >       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/0d1b1baff85de54902d9c07ff41913f49d89042b/
> >       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/11b92a8fec6aae0839ece48b2ed5e58a159f24c5/
> 
>  This one is on the powerpc autobuilders; it reports:
> 
> In file included from ./google/protobuf/stubs/atomicops.h:59:0,
>                  from google/protobuf/stubs/atomicops_internals_x86_gcc.cc:36:
> ./google/protobuf/stubs/platform_macros.h:61:2: error: #error Host architecture
> was not detected as supported by protobuf
> 
> The weird thing is that the header file has:
> 
> #elif defined(__ppc__)
> #define GOOGLE_PROTOBUF_ARCH_PPC 1
> #define GOOGLE_PROTOBUF_ARCH_32_BIT 1
> #else
> #error Host architecture was not detected as supported by protobuf
> #endif
> 
>  So why is __ppc__ not defined?

It's __PPC__ on toolchains I have access to.

>  Note that it will still fail anyway, because in atomicops.h, there seems to 
>  be no powerpc support.

Correct. As I mentioned at http://patchwork.ozlabs.org/patch/347044/, the 
patch from http://code.google.com/p/protobuf/issues/detail?id=488 adds powerpc 
support, but it uses gcc internal atomic operations, so it is only applicable 
to gcc 4.7+.

>  I guess that means that protobuf should be blacklisted?

Probably.

> >     xtensa |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/ae9fa612d0b6c9d593504206d5cedd480ad2547e/
> >    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/2606a545b3962eebe1331fed701552c2b3dbe097/
> >        sh4 |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/bcdd448b364dbca32779491fe4535dd04d61e411/
> >    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/4d2aea1cdd7f40ab606382210fea5843ae72fea4/
> >   mips64el |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/f906d803473e99decf75928b18ff63a90bb1e41f/
> >    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/2d7502dded4e1dee6fa152183ce170e9cce81cbd/
> >    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/4c3ab411e5f2a7acb68197548742de0bea2571ec/
> >    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/3a0d5224e8804ea1c4fb158d47b1dc61f9c4bae9/
> >       mips |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/78c6071f1c49440b9e7bf192867c209885ccedd5/
> 
>  All these architectures are not supported by the atomicops.
> 
>  I'll cook a patch.

Your patch is correct, I guess, but as far as I understand it doesn't solve 
the host architecture dependency problem that is causing the host-protobuf 
failure above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
