From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 10:12:24 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <1479460224-6119-5-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-5-git-send-email-jezz@sysmic.org>
Message-ID: <b19d2886-5502-d2e2-5acc-040e921ebf39@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> In order to make tar images reproducible, we use --sort flag. However,
> this flags is available only from tar 1.28. So we also bump necessary
> host-tar version.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  fs/tar/tar.mk                          | 2 +-
>  support/dependencies/check-host-tar.sh | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
> index 11c69c5..5a1b263 100644
> --- a/fs/tar/tar.mk
> +++ b/fs/tar/tar.mk
> @@ -7,7 +7,7 @@
>  TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
>  
>  define ROOTFS_TAR_CMD
> -	tar $(TAR_OPTS) -cf $@ --numeric-owner -C $(TARGET_DIR) .
> +	tar $(TAR_OPTS) -cf $@ --sort=name --numeric-owner -C $(TARGET_DIR) .

 Instead of requiring a specific version of tar, I would prefer to use the same
solution we already have in the git wrapper, and which is also what is proposed
by reproducible-builds.org:

find src -print0 | LC_ALL=C sort -z |
    tar --null -T - --no-recursion -cf $@ --numeric-owner -C $(TARGET_DIR)

 The find | sort part we probably want to factor into the rootfs infra, because
the same thing will have to be done for all other rootfs types as well. But that
refactoring can be done later (when the other rootfs types are tackled).

 Regards,
 Arnout

>  endef
>  
>  $(eval $(call ROOTFS_TARGET,tar))
> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
> index 932d3c4..cef6d82 100755
> --- a/support/dependencies/check-host-tar.sh
> +++ b/support/dependencies/check-host-tar.sh
> @@ -26,10 +26,9 @@ if [ ! -z "${version_bsd}" ] ; then
>    minor=0
>  fi
>  
> -# Minimal version = 1.17 (previous versions do not correctly unpack archives
> -# containing hard-links if the --strip-components option is used).
> +# Minimal version = 1.28 (previous versions do not does not support --sort=name)
>  major_min=1
> -minor_min=17
> +minor_min=28
>  if [ $major -gt $major_min ]; then
>  	echo $tar
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
