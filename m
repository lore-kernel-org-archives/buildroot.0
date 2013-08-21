From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 21:33:44 +0200
Subject: [Buildroot] [PATCH 4/5] Makefile: do not try to strip
 inexisting file when stripping libpthread
In-Reply-To: <1376996584-4462-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996584-4462-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52151618.7070900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/08/13 13:03, Thomas Petazzoni wrote:
> libpthread.so has a special stripping condition to preserve parts of
> it that are needed for debugging. However, due to the usage of 'xargs'
> instead of 'xargs -r', the strip command is executed regardless of
> whether a libpthread.so file is found or not. This leads to a big
> error message being displayed in static-only builds, because strip is
> executed without a file argument. Thanks to the '|| true', the build
> continues, but still shows a big error message in the middle, which is
> not nice.
>
> By using 'xargs -r', we avoid the strip command from being executed
> when 'find' doesn't find any match. We also remove the '|| true' to
> catch other real errors.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

  I'd find it more natural to use the -exec option of find, but this 
patch solves a real problem so

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 5d40126..9201f27 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -485,7 +485,7 @@ endif
>   # I set a breakpoint"
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>   	find $(TARGET_DIR)/lib -type f -name 'libpthread*.so*' | \
> -		xargs $(STRIPCMD) $(STRIP_STRIP_DEBUG) || true
> +		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
>   endif
>
>   	mkdir -p $(TARGET_DIR)/etc
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
