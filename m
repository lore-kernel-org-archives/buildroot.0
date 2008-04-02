From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 2 Apr 2008 18:41:54 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <8763v071sq.fsf@macbook.be.48ers.dk>
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk>
Message-ID: <20080402164154.GE9436@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 02, 2008 at 04:45:57PM +0200, Peter Korsgaard wrote:
>>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:
>
> Guillaume> Anyone care to comment on that:
> Guillaume> $ make ARCH=ppc linux26-menuconfig
> Guillaume> [ -f
> Guillaume> /home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24/.config ] |
> Guillaume> | cp local/genepy/linux-2.6.24.config
> Guillaume> /home/guinevere/buildroot/project_build_pp
> Guillaume> c/genepy/linux-2.6.24/.config
> Guillaume> /usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=powerpc
> Guillaume> [...]
>
> Guillaume> Why does ARCH change ?!?
>
>Because target/linux/Makefile.in uses KERNEL_ARCH for ARCH setting,
>and not what you have set ARCH to on the cmdline.
>
>KERNEL_ARCH is calculated in
>toolchain/kernel-headers/kernel-headers.mk - Notice that arch/ppc is
>deprecated, you should use arch/powerpc nowadays.

Somebody did IMHO the Wrong Thing by silently unset'ing ARCH in the
toplevel Makefile. The proper thing to do is either $(error ARCH is set)
or, preferably, check that $ARCH is clean via dependencies.sh
Silently unseting ARCH is error-prone and misleading (as you see).
