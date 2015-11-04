From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Nov 2015 22:39:32 +0100
Subject: [Buildroot] [PATCH] gcc-final: hard link TARGET-cc -> TARGET-gcc
In-Reply-To: <1446622467-21916-1-git-send-email-steven@uplinklabs.net>
References: <1446622467-21916-1-git-send-email-steven@uplinklabs.net>
Message-ID: <563A7B14.9090507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-11-15 08:34, Steven Noonan wrote:
> Doing a symlink results in incorrect behavior:
> 
>     $ x86_64-buildroot-linux-gnux32-cc
>     --version
>     ccache: error: execv of [...]/x86_64-buildroot-linux-gnux32-cc.br_real.br_real failed: No such file or directory
> 
>     $ x86_64-buildroot-linux-gnux32-gcc --version
>     x86_64-buildroot-linux-gnux32-gcc.br_real (Buildroot 2015.11-git-00965-g8d89653-dirty) 5.2.0
>     Copyright (C) 2015 Free Software Foundation, Inc.
>     This is free software; see the source for copying conditions.  There is NO
>     warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> Note the double .br_real on the invocation by toolchain-wrapper.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However...

> ---
>  package/gcc/gcc-final/gcc-final.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 8ac2968..7ccc533 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -91,7 +91,7 @@ HOST_GCC_FINAL_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
>  # Make sure we have 'cc'
>  define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
>  	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
> -		ln -snf $(GNU_TARGET_NAME)-gcc \
> +		cp -l $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc \

 Why not ln -f instead of cp -l?

 Regards,
 Arnout

>  			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
>  	fi
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
