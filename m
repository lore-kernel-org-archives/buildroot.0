From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 May 2018 23:39:57 +0200
Subject: [Buildroot] [PATCH] fs: ensure hard links in TARGET_DIR are
 correctly copied for filesystem input
In-Reply-To: <20180527204857.6081-1-peter@korsgaard.com>
References: <20180527204857.6081-1-peter@korsgaard.com>
Message-ID: <20180527213957.GE2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-05-27 22:48 +0200, Peter Korsgaard spake thusly:
> Fixes #11046
> 
> Commit bb2a57a17a7 (fs: run packages' filesystem hooks in a copy of target/)
> changed the file system logic to run file system hooks from packages on a
> copy of TARGET_DIR, and finally use this copy as input for the file system
> generation.
> 
> This copy was done with rsync, which by default does not preserve hard
> links, leading to an expansion of the file system images when hard links are
> present.
> 
> Fix it by passing the -H option to rsync (preserve hard links).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Not sure how I was not able to reproduce the issue. But the rsync docs
say we should use it, so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Alternatively we can use 'cp -a' instead of rsync.
> 
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 9baf367729..abf35418cb 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -71,7 +71,7 @@ $(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
>  	@$(call MESSAGE,"Generating common rootfs tarball")
>  	rm -rf $(FS_DIR)
>  	mkdir -p $(FS_DIR)
> -	rsync -au $(BASE_TARGET_DIR)/ $(TARGET_DIR)
> +	rsync -auH $(BASE_TARGET_DIR)/ $(TARGET_DIR)
>  	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
>  	echo "set -e" >> $(FAKEROOT_SCRIPT)
>  	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
