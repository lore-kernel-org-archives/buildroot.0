From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 18 Aug 2015 00:35:57 +0200
Subject: [Buildroot] xtables-addons does not build for arm kernel 4.1.4
In-Reply-To: <87lhd98twt.fsf@dell.be.48ers.dk>
References: <20150817185012.2051aa10@pcviktorin.fit.vutbr.cz>
 <87lhd98twt.fsf@dell.be.48ers.dk>
Message-ID: <20150818003557.4bb6aef9@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2015 23:52:18 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Jan" == Jan Viktorin <viktorin@rehivetech.com> writes:
> 
>  > Hello Gustavo,
>  > I am trying to compile xtables-addons by Buildroot, however, I get
>  > a lot of "undefined!" warnings and some errors.
> 
>  > I build with:
>  > - Buildroot (master: 15a53b93a034af78)
>  > - internal toolchain
>  > - Linux 4.1.4.
> 
>  > The Buildroot is patched by
>  > http://lists.busybox.net/pipermail/buildroot/2015-August/137485.html
>  > for the olinuxino lime2 support. However, the same issues come
>  > with olimex_a20_olinuxino_lime_defconfig.
> 
>  > My setup is:
> 
>  > $ make olimex_a20_olinuxino_lime2_defconfig
>  > $ make menuconfig
>  >   enable Target packages/Network Applications/xtables-addons
>  > $ make
> 
>  > And I end up with:
> 
> > buildroot-a20/output/build/xtables-addons-2.7/extensions/compat_xtables.mod.c:9:2:
> > error: unknown field ?name? specified in initializer
>  >   .name = KBUILD_MODNAME,
> 
> The problem is that you don't have modules (CONFIG_MODULES=y) support
> enabled in your kernel, as the sunxi_defconfig in the kernel until
> very recently didn't enable that - But it is naturally needed to
> build the xtables-addons modules.

Thank you for this hint! I'll check it out.

> 
> Arguably Buildroot should automatically enable this for you when
> enabling the xtables-addons package, similar to how it is done for the
> netfilter options even though it is quite a "big" option to enable
> behind your back. Alternatively we could simply error out with a
> sensible message like it was recently done for the pkg-kernel-module
> infrastructure.

I agree, I would be happy to get a reasonable error message instead
of loosing few hours of looking up for such a trivial mistake.

> 
> 
>  > I can build xtables-addons from git (tag 2.7, e277360) for both
>  > Linux 4.1.4 and 4.1.5 on x86_64 by the standard xtables-addons
>  > build-system (without Buildroot).
> 
> You most likely have modules support in your x86-64 kernel.
> 

-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech                  Phone: +420 606 201 868
  Brno, Czech Republic
