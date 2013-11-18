From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Nov 2013 13:59:59 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <528A0E38.9040905@mind.be>
References: <20131116223632.462c6e60@skate> <20131117172917.GB4425@free.fr>
 <20131117233812.4ac14561@skate> <528A0E38.9040905@mind.be>
Message-ID: <20131118135959.47faa95b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 18 Nov 2013 13:55:20 +0100, Arnout Vandecappelle wrote:

>   I read:
> 
> config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
>          bool "Xilinx Little Endian Microblaze GNU Tools 14.3"
>          depends on BR2_microblazeel
>          depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>          depends on !BR2_PREFER_STATIC_LIB
> 
>   Is it possible that the autobuilder scripts randomly set 
> BR2_PREFER_STATIC_LIB?  If that is set, then none of the official 
> external toolchain profiles work and the default will be a custom 
> preinstalled one...

Aaah, you got it! Indeed the autobuilder randomly sets
BR2_PREFER_STATIC_LIB, and this isn't going to work properly when the
external toolchain is glibc based, since I've excluded glibc/eglibc
toolchains from the static build thing.

I guess I need to improve the autobuild script to only use
BR2_PREFER_STATIC_LIB when !glibc && !eglibc (i.e at the moment, when
uClibc is used).

Thanks for spotting this!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
