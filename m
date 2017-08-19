From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Aug 2017 15:08:07 +0200
Subject: [Buildroot] [PATCHv2] core/pkg-toolchain-external: quiesce
 spurious stderr
In-Reply-To: <20170817191946.9167-1-yann.morin.1998@free.fr>
References: <20170817191946.9167-1-yann.morin.1998@free.fr>
Message-ID: <20170819150807.5ab32f8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Aug 2017 21:19:46 +0200, Yann E. MORIN wrote:
> Since 392b0a26f5 (toolchain-external: default BR2_TOOLCHAIN_EXTERNAL_PATH
> to empty), calling 'make clean' or similar can yield a spurious stderr
> message:
>     dirname: missing operand
>     Try 'dirname --help' for more information.
> 
> Which is definitely baffling and unsettling...
> 
> It turns out that it is pretty trivial to reproduce, and this defconfig
> is just enough:
> 
>     $ cat my-defconfig
>     BR2_TOOLCHAIN_EXTERNAL=y
> 
>     $ make BR2_DEFCONFIG=$(pwd)/my-defconfig defconfig
> 
>     $ make clean
>     dirname: missing operand
>     Try 'dirname --help' for more information.
>     [--snip--]
> 
> This is because the cross-compiler is not found in the PATH (and for
> good reasons, I don't have it in the PATH, not even at all).
> 
> So, when the cross-compiler is not found in the path, we simply
> continue as if all was good, and postpone the check to much later,
> when we try to copy the toolchain libs...
> 
> So, use a make construct rather than calling to the shell: $(dir ...)
> does not whine if passed nothing.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - use $(dir ...) instead of $(shell dirname ...)  (Arnout)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
