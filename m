From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 00:56:49 +0200
Subject: [Buildroot] [PATCH] fs/ext2: hint about setting the filesystem
	size on error
In-Reply-To: <20170725220528.314-1-yann.morin.1998@free.fr>
References: <20170725220528.314-1-yann.morin.1998@free.fr>
Message-ID: <67d723cd-b4d2-bc62-26dd-ae60618864e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-17 00:05, Yann E. MORIN wrote:
> Since we now request that the user sets the exact size of the ext2/3/4
> filesystem, we've had quite a few users wondering what was going on when
> they enable too much and the default 60M are no longer enough.
> 
> When mkfs.ext2 fails, print a hint that the user should check the size
> setting.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 I've added *** in the beginning to make it stand out more and redirected to
stderr and applied to master, thanks.

 Regards,
 Arnout


> ---
>  fs/ext2/ext2.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 902e6639ee..6a992747c6 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -29,7 +29,11 @@ ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
>  define ROOTFS_EXT2_CMD
>  	rm -f $@
>  	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
> -		"$(EXT2_SIZE)"
> +		"$(EXT2_SIZE)" \
> +	|| { ret=$$?; \
> +	     echo "Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)"; \
> +	     exit $$ret; \
> +	}
>  endef
>  
>  rootfs-ext2-symlink:
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
