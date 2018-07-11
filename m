From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2018 23:14:39 +0200
Subject: [Buildroot] [PATCH 1/6] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <20180711143113.11927-2-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-2-matthew.weber@rockwellcollins.com>
Message-ID: <0588fc06-c633-9bcd-5a73-478e8e512506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-18 16:31, Matt Weber wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> The hardening options are compiler flags, not pure pre-processor flags, so
> put them in CFLAGS, not CPPFLAGS.
> 
> This fixes build errors where -D_FORTIFY_SOURCE=2 whas put in CPPFLAGS and
> then applied to configure tests which could fail since the required -O2 is
> only in CFLAGS.
> 
> Originally submitted as
> http://patchwork.ozlabs.org/patch/904057/
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 I was thinking: why introduce TARGET_HARDENED instead of just adding to
TARGET_CFLAGS directly. But it actually does look nicer this way. So

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/Makefile.in | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index f2962767cc..5e0ff8c841 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -147,29 +147,29 @@ TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  
>  ifeq ($(BR2_SSP_REGULAR),y)
> -TARGET_CPPFLAGS += -fstack-protector
> +TARGET_HARDENED += -fstack-protector
>  else ifeq ($(BR2_SSP_STRONG),y)
> -TARGET_CPPFLAGS += -fstack-protector-strong
> +TARGET_HARDENED += -fstack-protector-strong
>  else ifeq ($(BR2_SSP_ALL),y)
> -TARGET_CPPFLAGS += -fstack-protector-all
> +TARGET_HARDENED += -fstack-protector-all
>  endif
>  
>  ifeq ($(BR2_RELRO_PARTIAL),y)
> -TARGET_CPPFLAGS += $(TARGET_CFLAGS_RELRO)
> +TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
>  TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
>  else ifeq ($(BR2_RELRO_FULL),y)
> -TARGET_CPPFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
> +TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
>  TARGET_LDFLAGS += -pie
>  endif
>  
>  ifeq ($(BR2_FORTIFY_SOURCE_1),y)
> -TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=1
> +TARGET_HARDENED += -D_FORTIFY_SOURCE=1
>  else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
> -TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=2
> +TARGET_HARDENED += -D_FORTIFY_SOURCE=2
>  endif
>  
>  TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> +TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)

 The line is getting a bit long, but TARGET_DEBUGGING was already too much so
not for this patch :-)


 Regards,
 Arnout

>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
