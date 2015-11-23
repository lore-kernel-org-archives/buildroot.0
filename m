From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:29:55 +0100
Subject: [Buildroot] [PATCH] jimtcl: fix sparc64 compile
In-Reply-To: <20151123164853.GA29207@waldemar-brodkorb.de>
References: <20151123164853.GA29207@waldemar-brodkorb.de>
Message-ID: <20151123182955.0bd4db5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Mon, 23 Nov 2015 17:48:53 +0100, Waldemar Brodkorb wrote:
> It is general safe to use -fPIC for all architectures.
> -fpic breaks sparc64 compile.
> 
> Generally gcc just optimize position independent code
> for m68k, powerpc and sparc with -fpic.
> The size differences are minimal, f.e. for powerpc:
>    text    data     bss     dec     hex filename
>  235983    5336     684  242003   3b153 output/target/usr/lib/libjim.0.75
>  236255    8456     684  245395   3be93 output/target/usr/lib/libjim.so.0.75
> 
> So instead of keeping special settings for sparc64 it would be better
> to always use -fPIC in general.

So in other words, you're saying that in other packages that add -fPIC
only for sparc/sparc64, we should add it unconditionally?

> +# -fPIC works for any architecture

I think this comment is a bit useless. It should rather be:

# -fPIC is mandatory to build shared libraries on certain architectures
# (e.g. SPARC) and causes no harm or drawbacks on other architectures

>  define JIMTCL_BUILD_CMDS
> +	SH_CFLAGS="-fPIC" \
> +	SHOBJ_CFLAGS="-fPIC" \
>  	$(MAKE) -C $(@D)
>  endef
>  

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
