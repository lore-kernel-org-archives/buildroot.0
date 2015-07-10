From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jul 2015 12:08:33 +0200
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <1436515926.2800.26.camel@synopsys.com>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
 <559EE7E6.401@mind.be> <20150710084455.3462000c@free-electrons.com>
 <1436515926.2800.26.camel@synopsys.com>
Message-ID: <559F99A1.8060501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/15 10:12, Alexey Brodkin wrote:
[snip]

 Thanks for the detailed explanation!

> In other words if we disable PIE in Buildroot's toolchain there will be
> no way to build U-Boot for ARC. And that's not what we want.

 It's probably getting complicated, but we could add either another option or an
environment variable to enable PIE again. E.g. if it's an envrionment variable,
then we can do for packages that we know do *not* break with ARC-PIE:

ifneq ($(BR2_arc),)
UBOOT_MAKE_ENV += GCC_REALLY_SUPPORT_PIE=1
endif

(and of course make sure that UBOOT_MAKE_ENV is used, which is currently not the
case in uboot.mk).


 Question is: is that more complicated that the current per-package workarounds
or not?

 Regards,
 Arnout

> 
> Note that U-Boot needs PIE not only on ARC but on x86, ARM and MIPS.
> So that's not unique "feature" or ARC. Some arches still use PIC in
> U-Boot but that causes problems here and there, requiring to patch
> offsets manually in each and every driver etc instead of using gcc,
> grep for CONFIG_NEEDS_MANUAL_RELOC if of any interest :)
> 
> Hopefully my explanation makes some sense.
> 
> If you guys have any thought on how to solve that problem better please
> shout.
> 
> -Alexey
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
