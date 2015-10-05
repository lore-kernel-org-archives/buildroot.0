From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Oct 2015 19:53:06 +0100
Subject: [Buildroot] [PATCH v2 2/2] axfs: add new filesystem type
In-Reply-To: <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <5612C712.6020209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05-10-15 17:55, Ariel D'Alessandro wrote:
> The Advanced XIP File System is a Linux kernel filesystem driver that enables
> files to be executed directly from flash or ROM memory rather than being copied
> into RAM.
> 
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  fs/Config.in      |  1 +
>  fs/axfs/Config.in |  4 ++++
>  fs/axfs/axfs.mk   | 13 +++++++++++++
>  3 files changed, 18 insertions(+)
>  create mode 100644 fs/axfs/Config.in
>  create mode 100644 fs/axfs/axfs.mk
> 
> diff --git a/fs/Config.in b/fs/Config.in
> index 5853113..51ccf28 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -1,5 +1,6 @@
>  menu "Filesystem images"
>  
> +source "fs/axfs/Config.in"
>  source "fs/cloop/Config.in"
>  source "fs/cpio/Config.in"
>  source "fs/cramfs/Config.in"
> diff --git a/fs/axfs/Config.in b/fs/axfs/Config.in
> new file mode 100644
> index 0000000..7e25fe7
> --- /dev/null
> +++ b/fs/axfs/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_TARGET_ROOTFS_AXFS
> +	bool "axfs root filesystem"
> +	help
> +	  Build an axfs root filesystem

 This needs a lot more explanation. For starters, repeat the explanation you put
in the commit message (but wrap at 72 columns!). And perhaps you should add that
all files will be XIPified (or whatever the verb is). Also, you should mention
that the kernel has to be built with the axfs patches to be able to read it.

 It would be nice to add the axfs kernel side as a kernel extension as well. But
that looks heavily non-trivial.


> diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
> new file mode 100644
> index 0000000..05d6e5d
> --- /dev/null
> +++ b/fs/axfs/axfs.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# Build the axfs root filesystem image
> +#
> +################################################################################
> +
> +ROOTFS_AXFS_DEPENDENCIES = host-axfsutils
> +
> +define ROOTFS_AXFS_CMD
> +	$(HOST_DIR)/usr/bin/mkfs.axfs -s -a $(TARGET_DIR) $@

 I'm not sure if we really want to give the -s option. Is it very verbose?
Generally I like a bit of feedback about how the filesystem is built, and we do
get it for e.g. squashfs.


 But basically, the patch looks good to me. I'm a bit surprised it's so simple.

> +endef
> +
> +$(eval $(call ROOTFS_TARGET,axfs))

 Eek, do we still have that horrible construct for rootfs building... :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
