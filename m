From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Jun 2016 16:31:23 +0200
Subject: [Buildroot] [git commit] elfutils: put all the "lfs mode" stuff
 together
In-Reply-To: <20160618130411.BC15980794@busybox.osuosl.org>
References: <20160618130411.BC15980794@busybox.osuosl.org>
Message-ID: <addd091c-1d12-e259-4742-41296acc653f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This can't be right...

On 18-06-16 14:59, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=bcc8d367140d00f76aba6ef4387a12469fa0c024
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/elfutils/elfutils.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 074ca02..a2012d6 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -16,17 +16,18 @@ ELFUTILS_DEPENDENCIES = zlib
>  ELFUTILS_AUTORECONF = YES
>  ELFUTILS_CONF_OPTS += --disable-werror
>  
> -ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
> -
>  # sparc64 needs -fPIC instead of -fpic
>  ifeq ($(BR2_sparc64),y)
>  ELFUTILS_CFLAGS += -fPIC

 Setting ELFUTILS_CFLAGS...

>  endif
>  
>  # elfutils gets confused when lfs mode is forced, so don't
> +ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))

 ... and overriding it here...

 Regards,
 Arnout

> +ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
> +
>  ELFUTILS_CONF_ENV += \
>  	CFLAGS="$(ELFUTILS_CFLAGS)" \
> -	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
> +	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
>  
>  ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
