From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 00:14:01 +0100
Subject: [Buildroot] [PATCH 07/16] musl: build broken on Thumb,
 use ARM mode
In-Reply-To: <1458164602-16983-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9E8B9.3060909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> Building the musl C library on Thumb (Thumb1, not Thumb2), fails with:
>
>   {standard input}:20: Error: only lo regs allowed with immediate -- `mov fp,#0'
>   {standard input}:21: Error: only lo regs allowed with immediate -- `mov lr,#0'
>   {standard input}:25: Error: unshifted register required -- `and ip,a1,#-16'
>
> Since there are no cores that we support that are Thumb1 only, use the
> same solution as the one used by glibc: build the C library in ARM
> mode.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/musl/musl.mk | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 081a700..0e881f9 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -23,6 +23,11 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
>
>   MUSL_INSTALL_STAGING = YES
>
> +# Thumb build is broken, build in ARM mode

  The comment about all our thumb1 architectures supporting arm mode should be 
repeated here IMHO.

> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)

  So this one would also have to be changed if INSTRUCTIONS_THUMB2 is removed. 
Hm, maybe not such a good idea after all... So instead, just add a depends on 
!THUMB2 to BR2_ARM_INSTRUCTIONS_THUMB.


  Regards,
  Arnout

> +MUSL_EXTRA_CFLAGS += -marm
> +endif
> +
>   define MUSL_CONFIGURE_CMDS
>   	(cd $(@D); \
>   		$(TARGET_CONFIGURE_OPTS) \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
