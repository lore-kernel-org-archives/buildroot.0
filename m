From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Feb 2016 23:46:34 +0100
Subject: [Buildroot] [PATCH] perf: append endianness argument to ld when
 building for MIPS
In-Reply-To: <1455816222-43031-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1455816222-43031-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <56C8ECCA.6010705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/18/16 18:23, Vicente Olivert Riera wrote:
> We need to pass an argument to ld for setting the endianness when
> building it for MIPS architecture, otherwise the default one will always
> be used (which is big endian) and the compilation for little endian will
> always fail showing an error like this one:
> 
> LD    foo.o
> mips-linux-gnu-ld: foo.o: compiled for a little endian system and target
> is big endian
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  linux/linux-tool-perf.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
> index 07c3514..7ad6629 100644
> --- a/linux/linux-tool-perf.mk
> +++ b/linux/linux-tool-perf.mk
> @@ -27,6 +27,21 @@ PERF_MAKE_FLAGS = \
>  	WERROR=0 \
>  	ASCIIDOC=
>  
> +# We need to pass an argument to ld for setting the endianness when
> +# building it for MIPS architecture, otherwise the default one will
> +# always be used (which is big endian) and the compilation for little
> +# endian will always fail showing an error like this one:
> +#  LD    foo.o
> +# mips-linux-gnu-ld: foo.o: compiled for a little endian system and
> +# target is big endian
> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +ifeq ($(BR2_ENDIAN),"BIG")

 Er, isn't this a bit silly? Can you have big-endian mipsel, or little-endian mips?

 Regards,
 Arnout

> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EB"
> +else
> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EL"
> +endif
> +endif
> +
>  # The call to backtrace() function fails for ARC, because for some
>  # reason the unwinder from libgcc returns early. Thus the usage of
>  # backtrace() should be disabled in perf explicitly: at build time
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
