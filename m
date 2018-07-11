From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2018 23:26:55 +0200
Subject: [Buildroot] [PATCH 2/6] package/Makefile.in: Add missing
 options to LDFLAGS for full RELRO build
In-Reply-To: <20180711143113.11927-3-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-3-matthew.weber@rockwellcollins.com>
Message-ID: <4e64b93d-e5fd-a666-2e08-ae03ecac941e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-18 16:31, Matt Weber wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> The options for a full RELRO build should also be added to LDFLAGS.
> 
> Originally submitted as
> http://patchwork.ozlabs.org/patch/904034/
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 5e0ff8c841..14b3bbd243 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -159,7 +159,7 @@ TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
>  TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
>  else ifeq ($(BR2_RELRO_FULL),y)
>  TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
> -TARGET_LDFLAGS += -pie
> +TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)

 Actually, those flags (-Wl,-z,now,-z,relo) really are link-time flags only. So
really there is no reason why we would have them in TARGET_CFLAGS (i.e. in
TARGET_HARDENED). However, it is likely that there are packages that only apply
TARGET_CFLAGS to linking, not TARGET_LDFLAGS (we currently have no way of
knowing, since all of the LDFLAGS are also in CFLAGS, except for the hardening
ones).

 I have also considered to add TARGET_HARDENING to TARGET_LDFLAGS. However, it
is really only this -Wl,-z,... option which is relevant in LDFLAGS; the
-fstack-protector and -D_FORTIFY options can never have any effect. So this
looks good.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I have one little gripe, not directly related to this patch: I think the
variables TARGET_CFLAGS_RELRO and TARGET_CFLAGS_RELRO_FULL have little value,
they make IMO the code harder to read.

 Regards,
 Arnout
>  endif
>  
>  ifeq ($(BR2_FORTIFY_SOURCE_1),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
