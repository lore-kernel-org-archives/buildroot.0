From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Oct 2018 22:13:10 +0200
Subject: [Buildroot] [PATCH v2] poco: disable fpenvironment for MIPS
 without FPU
In-Reply-To: <20181009132152.24383-1-yegorslists@googlemail.com>
References: <20181009132152.24383-1-yegorslists@googlemail.com>
Message-ID: <51cdb909-89fd-6832-0988-f29ab95dbf74@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 9/10/18 15:21, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> glibc fixed a bug, that defined FPU capabilities not
> available for MIPS without FPU. So add --no-fpenvironment
> to the configuration options for this case.

 The commit message is still very vague. I think I understand it though,
something like:

On MIPS soft-float, glibc defines some FPU capabilities in fpenv that don't
actually exist. This is a bug that has been fixed in glibc but not yet released.
Therefore, pass --no-fpenvironment to disable floating-point operations entirely.

 It would also be nice to point to the glibc bug.

> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
>    - put all conditions in one ifeq statement (Thomas Petazzoni)
> 	
>  package/poco/poco.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index 018344d5c7..af41d36ff7 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -42,6 +42,11 @@ ifeq ($(BR2_sh4a)$(BR2_nios2),y)
>  POCO_CONF_OPTS += --no-fpenvironment
>  endif
>  
> +# MIPS without FPU
> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el):$(BR2_MIPS_SOFT_FLOAT),y:y)

 BR2_MIPS_SOFT_FLOAT is only defined on MIPS, so it is sufficient to do

ifeq ($(BR2_MIPS_SOFT_FLOAT),y)

 However, since this is about a glibc bug, shouldn't it check for a glibc
toolchain as well?

 Regards,
 Arnout

> +POCO_CONF_OPTS += --no-fpenvironment
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  POCO_MAKE_TARGET = static_release
>  else ifeq ($(BR2_SHARED_LIBS),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
