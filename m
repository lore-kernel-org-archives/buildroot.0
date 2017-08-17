From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Aug 2017 00:08:51 +0200
Subject: [Buildroot] [PATCHv2] core/pkg-toolchain-external: quiesce
	spurious stderr
In-Reply-To: <20170817191946.9167-1-yann.morin.1998@free.fr>
References: <20170817191946.9167-1-yann.morin.1998@free.fr>
Message-ID: <60740d4a-674b-5d15-43cf-7d7983c15fce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-08-17 21:19, Yann E. MORIN wrote:
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

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
