From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jun 2018 19:23:45 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <20180603022145.14222-1-casantos@datacom.com.br>
References: <20180603022145.14222-1-casantos@datacom.com.br>
Message-ID: <20180605172345.GB29058@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-06-02 23:21 -0300, Carlos Santos spake thusly:
> Since commit 118534fe54b (fs: use a common tarball as base for the other
> filesystems) Buildroot creates a .tar filesystem image and re-extracts
> it in a private directory to create each format-specific image. Add an
> option to pass extra arguments to tar when that commom root image is
> extracted.
> 
> This option is useful when the root filesystem is volatile (e.g. initrd)
> or read-only but a read-write subtree is still necessary for persistent
> data modified by programs as they run.
> 
> For example, one can pass "--exclude='./var/lib/*'" to exclude that path
> from the rootfs image and use a post-fakeroot script to make a separate
> filesystem image for /var/lib.

Well, I am not too fond of this extra option. But see below...

> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
> Additional explanation
> 
> This change solves a real-life problem of my current project. Before
> buildroot 2018.05 I had to use a trickier approach:
> 
> 1. Add a post-fakeroot script to
>    1.1. Create a filesystem image (ext4) from $(TARGET_DIR)/var/lib.
>    1.2. Move $(TARGET_DIR)/var/lib to a backup path under $(BUILD_DIR).
>    1.3. Create an empty $(TARGET_DIR)/var/lib.
> 2. Add a post-image script to
>    2.1. Copy the rootfs and /var/lib images to the disk image.
>    2.2. Remove the empty $(TARGET_DIR)/var/lib.
>    2.3. Restore $(TARGET_DIR)/var/lib from the backup path.
> 
> That solution is fragile: if something goes wrong during the execution
> of the post-image script it can lead to a cripled $(TARGET_DIR) with an
> empty var/lib subdir. Rebuilding a package without restoring the backup
> can easily cause a kaboom and force me to run a lengthy clean build.

What prevents you from providing your own filesystem mechanism at all?

Since you have post-scripts, it means you do have an existing tree
where they are stored (even probably a git trre, at that).

So you could use that location as a br2-external, if that's not what
you already do. And then, you can add a new filesystem type in that
br2-external tree.

Jsut make your filesystem depend on rootfs-tar, then you can basically
do something like:

    $ cat my-mkfs-tool
    #!/bin/sh
    if [ $(id -u) -ne 0 ]; then
        exec fakeroot "${0}" "${@}"
    fi

    mktempdir && cd tempdir # You get the idea
    tar xf $(IMAGES_DIR)/rootfs.tar
    do-soemthing

And then you have a mechanism that cleanly and reliably fits in
Buildroot's filesystem infra.

I don't think the overhead would be big, since you anyway already have
to have some scripts doing the separation properly, so making those into
a filesystem is probably not too much, I guess.

For a (basic) example, see slide 16 (shameless self-reference):
    https://elinux.org/images/8/8e/2017-10-24_-_ELCE-Buildroot.pdf

(note: the macro to call has changed in master since that presentation,
but you get the idea.)

In the end, I believe this is more robust and more generic than this
extra option to the intermediate tarball, which is purely an internal
detail. We may tomorrow decide on another solution for the internal
state in the future...

My 2 cents...

Regards,
Yann E. MORIN.

> I added some protection mechanisms to stop the build if a stale /var/lib
> backup is found but quite frankly the whole thing stinks.
> 
> The solution with custom extraction arguments, OTOH, is bullet-proof
> because it does not change $(TARGET_DIR), so it is always safe to run
> dirty builds.
> ---
>  docs/manual/customize-rootfs.txt | 10 ++++++++++
>  fs/Config.in                     | 13 +++++++++++++
>  fs/common.mk                     |  3 ++-
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index bb6d8da6bf..6dd9365723 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -121,6 +121,16 @@ This method is not recommended because it duplicates the entire
>    skeleton, which prevents taking advantage of the fixes or improvements
>    brought to the default skeleton in later Buildroot releases.
>  
> +Rootfs tarball extraction arguments (+BR2_ROOTFS_COMMON_UNTAR_ARGS+)::
> ++
> +Buildroot creates a .tar filesystem image and re-extracts it in a private
> + directory to create each format-specific image. Use this option to pass
> + extra arguments to tar when the commom root image is extracted.
> ++
> +For example, you can pass "--exclude=\'./var/lib/*\'" to exclude that path from
> + the rootfs image and use a post-fakeroot script (see below) to create a
> + separate filesystem image for '/var/lib'.
> +
>  Post-fakeroot scripts (+BR2_ROOTFS_POST_FAKEROOT_SCRIPT+)::
>  +
>  When aggregating the final images, some parts of the process requires
> diff --git a/fs/Config.in b/fs/Config.in
> index c25b01c3de..74487b1172 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -1,5 +1,18 @@
>  menu "Filesystem images"
>  
> +config BR2_ROOTFS_COMMON_UNTAR_ARGS
> +	string "Rootfs tarball extraction arguments"
> +	help
> +	  Buildroot creates a .tar filesystem image and re-extracts it
> +	  in a private directory to create each format-specific image.
> +	  Use this option to pass extra arguments to tar when the commom
> +	  root image is extracted.
> +
> +	  For example, you can pass "--exclude='./var/lib/*'" to exclude
> +	  that path from the rootfs image and use a post-fakeroot script
> +	  (see BR2_ROOTFS_POST_FAKEROOT_SCRIPT) to create a separate
> +	  filesystem image for /var/lib.
> +
>  source "fs/axfs/Config.in"
>  source "fs/cloop/Config.in"
>  source "fs/cpio/Config.in"
> diff --git a/fs/common.mk b/fs/common.mk
> index abf35418cb..33ad1ab2a9 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -50,9 +50,10 @@ define ROOTFS_COMMON_TAR_CMD
>  endef
>  
>  # Command to extract the common tarball into the per-rootfs target directory
> +ROOTFS_COMMON_UNTAR_ARGS = $(call qstrip,$(BR2_ROOTFS_COMMON_UNTAR_ARGS))
>  define ROOTFS_COMMON_UNTAR_CMD
>  	mkdir -p $(TARGET_DIR)
> -	tar xf $(ROOTFS_COMMON_TAR) -C $(TARGET_DIR)
> +	tar xf $(ROOTFS_COMMON_TAR) -C $(TARGET_DIR) $(ROOTFS_COMMON_UNTAR_ARGS)
>  endef
>  
>  .PHONY: rootfs-common
> -- 
> 2.17.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
