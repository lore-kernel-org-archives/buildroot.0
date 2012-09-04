From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Sep 2012 00:10:04 +0200
Subject: [Buildroot] [PATCH 4/4] Split target/Config.in.arch into
	multiple Config.in.* in arch/
In-Reply-To: <bf030fb668c9608de1f3e99bac17bf300ad59c67.1346767209.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <bf030fb668c9608de1f3e99bac17bf300ad59c67.1346767209.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209050010.05444.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 04 September 2012 16:04:09 Thomas Petazzoni wrote:
> target/Config.in.arch had become too long, and we want to remove the
> target/ directory. So let's move it to arch/ and split it this way:
> 
>  * An initial Config.in.arches that lists the top-level architecture

'arches' is not nice to the eye! ;-)
What about: arch/Config.in.choice ?
Or better yet, inline this file in arch/Config.in ?  (see below)

>  * One Config.in.<something> per architecture, listing the CPU
>    families, ABI choices, etc.
> 
>  * One Config.in.common that defines the gcc mtune, march, mcpu values
>    and other hidden options.

I find it a bit peculiar to have to edit two files to set architecture
variants:
  - one architecture-specific file
  - one architecture-independent file

What I would suggest is that arch/Config.in.common disapears, plus:

arch/Config.in
    config BR2_ARCH
        string
    config BR2_GCC_TARGET_TUNE
        string
    # And so on...

    # Ideally, this could/should be directly inlined
    # here, rather than being in its own file
    source "arch/Config.in.arches"

    if BR2_arm
    source "arch/Config.in.arm"
    endif
    if BR2_bfin
    source "arch/Config.in.bfin"
    endif
    # And so on, too...

Then, in each arch/Config.in.${ARCH}:
    # No need for 'if BR2_${ARCH}', this file is
    # already conditionally included
    config BR2_ARCH
        default "${ARCH}"

    choice
        prompt "Target Architecture Variant"
    # Blabla BR2_${ARCH}_XXX
    # Blabla BR2_${ARCH}_YYY
    endchoice

    config BR2_GCC_TARGET_TUNE
        string
        default "XXX" if BR2_${ARCH}_XXX
        default "YYY" if BR2_${ARCH}_YYY

    # And so on for all optimisation tunables

That way, all architecture-related settings are in the same file.

>  * One Config.in to source all those configuration files in the right
>    order.

[--SNIP--]
> diff --git a/arch/Config.in.arches b/arch/Config.in.arches
> new file mode 100644
> index 0000000..21abe63
> --- /dev/null
> +++ b/arch/Config.in.arches
> @@ -0,0 +1,129 @@
> +config BR2_ARCH_IS_64
> +       bool

I'd move this symbol to the other file arch/Config.in (in my proposal),
where all other arch-describing symbols are defined.

> +choice
> +	prompt "Target Architecture"
> +	default BR2_i386
> +	help
> +	  Select the target architecture family to build for.
> +
> +config BR2_arm
> +	bool "ARM (little endian)"

Why not have 'select BR2_LE' and be done with that, plus (in your
Config.in.common):

    config BR2_BE
        bool
    config BR2_LE
        bool
    config BR2_ENDIANN
        string
        default "BIG"    if BR2_BE
        default "LITTLE" if BR2_LE

Then each architecture selects its endianness directly from this choice
entry. As we provide endianness in the prompt, we already know _right here_
which endianness we're taliking about; no need to re-compute it later.

Besides, this mechanism is already used by the x86 to select support
for the various mmx and sse stuff.

[--SNIP--]
> +config BR2_sh64
> +	bool "SuperH64"

I know the previous code did no do it, but maybe we're missing:
    select BR2_ARCH_IS_64

Not sure about the impact that would have, just noticed the discrepancy
with x86_64, below.

[--SNIP--]
> +config BR2_microblaze
> +	bool
> +	default y if BR2_microblazeel || BR2_microblazebe

I find it very strange that:
  - ARM little is 'BR2_arm'      MIPS little is 'mipsel'
  - ARM big is    'BR2_armeb'    MIPS big is    'mips'
but:
  - Microblaze little is 'BR2_microblazeel'
  - Microblaze big is    'BR2_microblazebe'

What I would propose is that the default or more common variant drops the
endianness suffix. From the menuconfig, it seems to be 'little' the default
(or at least the 'official' AXI default?), while the toolchain tupples
seem to imply that microblaze-* is big, while microblazeel-* is little.
Dang... What a mess.

Also, the suffix is not homogeneous: 'el' vs. 'be', while other archs use
'el' vs. 'eb'.

Yes, the code was like that before your changes. I just spoted this
situation, and thought I'd suggest the improvements.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
