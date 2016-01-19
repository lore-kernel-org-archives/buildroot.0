From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Jan 2016 00:09:26 +0100
Subject: [Buildroot] [PATCH] luvi: build for the right MIPS endianness
In-Reply-To: <1453133375-54831-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1453133375-54831-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <569EC226.7060700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-01-16 17:09, Vicente Olivert Riera wrote:
> Otherwise it will cause build failures like this one:
> 
> [100%] Linking C executable luvi
> /home/buildroot/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/5.2.0/../../../../mipsel-buildroot-linux-gnu/bin/ld:
> jitted_tmp/src/lua/init.lua_luvi_generated.o: compiled for a big endian
> system and target is little endian
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/luvi/luvi.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
> index ef1c2e1..d83933e 100644
> --- a/package/luvi/luvi.mk
> +++ b/package/luvi/luvi.mk
> @@ -20,8 +20,10 @@ else ifeq ($(BR2_powerpc),y)
>  LUVI_TARGET_ARCH = ppc
>  else ifeq ($(BR2_arm)$(BR2_armeb),y)
>  LUVI_TARGET_ARCH = arm
> -else ifeq ($(BR2_mips)$(BR2_mipsel),y)
> +else ifeq ($(BR2_mips),y)
>  LUVI_TARGET_ARCH = mips
> +else ifeq ($(BR2_mipsel),y)
> +LUVI_TARGET_ARCH = mipsel

 This could just fall into the BR2_ARCH situation below, no?

 Regards,
 Arnout

>  else
>  LUVI_TARGET_ARCH = $(BR2_ARCH)
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
