From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 22:06:15 +0100
Subject: [Buildroot] [PATCH v2] arch/arc: Accommodate 16 KiB MMU pages
In-Reply-To: <20191218155555.45617-1-abrodkin@synopsys.com>
References: <20191218155555.45617-1-abrodkin@synopsys.com>
Message-ID: <20191222210615.GL26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-12-18 18:55 +0300, Alexey Brodkin spake thusly:
> ARC processors are known for its configurability and one of those
> configurable things is MMU page size which might be set to any
> power of two from 4 KiB to 16 MiB, though in the Linux kernel we
> only support 4, 8 and 16 KiB due to practical considerations.
> 
> And the most used setting is 8 KiB thus GNU LD assumes maximum
> page size is 8 KiB by default and while this works for smaller
> pages (it's OK to align segments by larger value it will be still
> peoperly aligned) this breaks execution of user-space apps on HW
> with larger pages because Elf sections might very well span across
> allocated pages and thus make executable broken.

Applied to master, thanks.

As you explained nicely in the commit log, when the CPU uses 4KiB pages,
the default 8KiB alignment is OK. However, is there a performance penalty
to it? Does it impose a limitation in how much memory one may use, per
process or system-wide?

In short, my question is: even though it works for 4KiB, would it not be
better to also override the default, like is done for 16KiB pages?

And to push thing even further, should we not also set it for 8KiB, in
case the default changes in a later binutils version?

If you believe those are valid, please send a follow up patch. Otherwise
just ignore my ramblings. ;-)

Regards,
Yann E. MORIN.

> Simplest example:
> ------------------------------------>8-----------------------------------
> $ arc-linux-gcc test.c
> $ arc-linux-readelf --segments a.out
> 
> Program Headers:
>   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
> ...
>   LOAD           0x000000 0x00010000 0x00010000 0x003e8 0x003e8 R E 0x2000 <-- See
>   LOAD           0x001f24 0x00013f24 0x00013f24 0x000f0 0x0010c RW  0x2000
> ------------------------------------>8-----------------------------------
> 
> Fortunately we may override default page size settings with "max-page-size"
> linker option this way:
> ------------------------------------>8-----------------------------------
> $ arc-linux-gcc test.c -Wl,-z,max-page-size=16384
> $ arc-linux-readelf --segments a.out
> Elf file type is EXEC (Executable file)
> Entry point 0x102c4
> There are 8 program headers, starting at offset 52
> 
> Program Headers:
>   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
> ...
>   LOAD           0x000000 0x00010000 0x00010000 0x003e8 0x003e8 R E 0x4000 <-- See
>   LOAD           0x001f24 0x00015f24 0x00015f24 0x000f0 0x0010c RW  0x4000
> ------------------------------------>8-----------------------------------
> 
> Which we implement with that change.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
> 
> Changes v1 -> v2:
> 
>  * Obviously we want to append lenker settings to the wrapper
>    but not overwrite atomic option if is set as these are orthogonal
>    things.
> 
>  arch/arch.mk.arc | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
> index 5fcffb7f4b..d45299144c 100644
> --- a/arch/arch.mk.arc
> +++ b/arch/arch.mk.arc
> @@ -1,4 +1,14 @@
> +ifeq ($(BR2_arc),y)
> +
>  # -matomic is always required when the ARC core has the atomic extensions
> -ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
> +ifeq ($(BR2_ARC_ATOMIC_EXT),y)
>  ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
>  endif
> +
> +# By default MAXPAGESIZE for ARC is 8196 so for larger MMU pages
> +# it needs to be overridden.
> +ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
> +ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
> +endif
> +
> +endif
> -- 
> 2.16.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
