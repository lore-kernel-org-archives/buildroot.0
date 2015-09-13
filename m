From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 21:16:43 +0200
Subject: [Buildroot] [PATCH] host-gcc-final: don't install a dead symlink
In-Reply-To: <1442068315-23186-1-git-send-email-arnout@mind.be>
References: <1442068315-23186-1-git-send-email-arnout@mind.be>
Message-ID: <20150913211643.5ea1e647@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, 12 Sep 2015 16:31:55 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Nothing is installed into $(HOST_DIR)/usr/$(GNU_TARGET_NAME) by
> host-gcc-final (only by binutils), so no 'gcc' executable exists
> there. Therefore, the cc -> gcc symlink that is created in that
> directory is dead.
> 
> Since this was not working, the symlink is clearly not needed, so
> remove its installation command.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/gcc/gcc-final/gcc-final.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 86b3c78..3426ba4 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -92,9 +92,6 @@ define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
>  		ln -snf $(GNU_TARGET_NAME)-gcc \
>  			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
>  	fi
> -	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
> -		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
> -	fi

Hum, are you sure? When I look at an external toolchain built with
Buildroot, I see:

$ ls -l arm-buildroot-linux-uclibcgnueabi/bin/cc 
lrwxrwxrwx 1 thomas thomas 3 ao?t   8 16:14 arm-buildroot-linux-uclibcgnueabi/bin/cc -> gcc
$ ls -l arm-buildroot-linux-uclibcgnueabi/bin/gcc
-rwxr-xr-x 1 thomas thomas 595798 ao?t   8 16:14 arm-buildroot-linux-uclibcgnueabi/bin/gcc

This is the only file named 'cc' in the toolchain.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
