From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2015 17:00:42 +0200
Subject: [Buildroot] a philosophical question about Config.in and
 "comment" directives
In-Reply-To: <alpine.LFD.2.11.1504170840320.7665@localhost>
References: <alpine.LFD.2.11.1504170840320.7665@localhost>
Message-ID: <20150417150042.GA5271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rovert, All,

On 2015-04-17 08:58 -0400, Robert P. J. Day spake thusly:
[--SNIP--]
>   to distinguish between these two "levels" of dependency, i think it
> would be far clearer to rewrite a file like that as:
> 
>   if BR2_arm
> 
>   config BR2_PACKAGE_A10DISP
>         bool "a10disp"
>         depends on BR2_LINUX_KERNEL
>         help
>           Program to change the display mode of Allwinner ARM SOCs running
>           the linux-sunxi kernel (and not the mainline kernel.)
> 
>           http://github.com/hglm/a10disp
> 
>   comment "a10disp needs a Linux kernel to be built"
>         depends on !BR2_LINUX_KERNEL
> 
>   endif
> 
> that layout makes it far clearer that the entire option depends on
> arm or you see *nothing* and, further, internally, the dependencies
> in the comment list *only* those dependencies that the user will be
> warned that they need if they want this selection.
> 
>   i just think having the dependency line
> 
>   depends on BR2_arm
> 
> in both the config and comment directives is unnecessary duplication,
> and that that kind of dependency should be moved up to encompass the
> entire Config.in file, however that's best done.
> 
>   thoughts?

Well, you are right that "it would make moere sense" from a theoretical
point of view, and that there is no functional difference. BTW, there
are other  such architectural options, like MMU, that we handle the same
way as well.

Note however, we have more complex packages, like for example WebKit,
for which we move the architectural dependencies into their own option,
like so:

    config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
        bool
        # ARM needs BLX, so v5t+
        default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4
        default y if BR2_i386 || BR2_mips || BR2_mipsel || \
                BR2_sparc || BR2_x86_64
        depends on BR2_USE_MMU # libgail -> pango -> libglib2

That's because this way, other packages that may want to select WebKit
can select it by just adding a dependency on BR2_PACKAGE_WEBKIR_ARCH_SUPPORT.

And of course, that's the way packages have been written historically.
Changing all the packages is just not feasible, and maintainability and
homogeneity trump eye-candy quite easily. ;-)

So yes, you are right _on principle_. But we're not gonna change that
policy, and we'll continue to require new packages to conform to it.

Just a side note: I personally find it easier to read the way we have it
now: having the "depends on" directly in the package dependency list
looks more obvious to me (but hey! I'm kind of a weirdo! ;-) 

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
