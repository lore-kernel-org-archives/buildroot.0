From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 00:48:23 +0100
Subject: [Buildroot] [PATCH 11/16] package/Makefile.in: adjust LDFLAGS
 for elf2flt
In-Reply-To: <1458164602-16983-12-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9F0C7.1060009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> So far, our LDFLAGS for the BR2_BINFMT_FLAT case were only used on
> Blackfin. However, passing -elf2flt in LDFLAGS is wrong. Indeed,
> LDFLAGS are not linker flags, but flags passed to the compiler when
> linking.
>
> If you pass -elf2flt to the compiler when linking, it is understood as
> "-e lf2flt", i.e "the entry point is named lf2flt", which isn't
> exactly the intention. We in fact need to pass -Wl,-elf2flt in LDFLAGS
> as well, so that the compiler passes -elf2flt down to the linker.
>
> For some reason, this option does not cause an issue with the Blackfin
> toolchain,

  Probably because it isn't tested so much :-)


 > but it does with either a Buildroot toolchain for Cortex-M
> or an OSELAS toolchain for Cortex-M. We have verified that passing
> -Wl,-elf2flt continues to work with the Blackfin toolchain.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   package/Makefile.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dd595e2..616bdd0 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -145,7 +145,7 @@ TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FL
>   	-Wl$(comma)-elf2flt)
>   TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>   	-Wl$(comma)-elf2flt)
> -TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-elf2flt)
> +TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt)
>   endif
>
>   ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
