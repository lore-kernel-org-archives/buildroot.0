From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:55:39 +0200
Subject: [Buildroot] [PATCH 2/5] package/gcc: add support for gcc 10
In-Reply-To: <20200608221347.2639059-2-romain.naour@gmail.com>
References: <20200608221347.2639059-1-romain.naour@gmail.com>
 <20200608221347.2639059-2-romain.naour@gmail.com>
Message-ID: <20200624215539.078dfb99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Jun 2020 00:13:44 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Keep the same patch as for gcc 9.x fixing a parallel build issue:
> 58ecbbc3ef18c43ae1c02a5c4bf30aa7ef2d8092.
> 
> Keep libzstd support disabled for now, it could be used to LTO bytecode.

"... it could be used for LTO bytecode compression", otherwise it
doesn't make a lot of sense.

I've applied, but I have some comments/questions below.

> +config BR2_GCC_VERSION_10_X
> +	bool "gcc 10.x"
> +	# or1k needs binutils >= 2.32
> +	depends on !(BR2_or1k && BR2_BINUTILS_VERSION_2_31_X)

Why are we doing this here, instead of in the binutils package ? This
looks strange.

> +	# powerpc spe support has been deprecated since gcc 8.x.
> +	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> +	depends on !BR2_powerpc_SPE

Should we now drop support for PowerPC SPE ?

> +	# C-SKY sk610 needs abiv1, which is not supported in
> +	# upstream gcc. C-SKY gcc upstream support not tested
> +	# with upstream binutils and glibc.
> +	depends on !BR2_csky

We haven't had any news/contribution for C-SKY people for quite a
while. I know in recent SoC they have used RISC-V cores, but they were
supposed to continue making C-SKY based SoCs. I am fearing that this
looks like yet another abandoned CPU architecture :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
