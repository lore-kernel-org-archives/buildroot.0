From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Oct 2012 23:46:33 +0100
Subject: [Buildroot] [PATCH buildroot] fs/common: Create initial console
 device
In-Reply-To: <1351677232-14959-1-git-send-email-markos.chandras@gmail.com>
References: <1351677232-14959-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <5091AA49.6070300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/12 10:53, Markos Chandras wrote:
> From: Markos Chandras<markos.chandras@imgtec.com>
>
> A /dev/console node must be present in rootfs when the Linux kernel
> boots otherwise the kernel will print the following warning:
> "Warning: unable to open an initial console"
>
> This is because when we use an initramfs along with devtmpfs, the /dev
> directory is not populated at this point. This can cause problems when a
> program (e.g ldso with early debugging enabled) opens a standard file
> descriptor for read/write before these descriptors are actually created by
> the init process later on.
>
> Signed-off-by: Markos Chandras<markos.chandras@imgtec.com>

  Good point.  However:

- this is also true for mdev/udev;
- it is only relevant in a cpio/initramfs rootfs;
- it's cleaner to use the device table.

So I'd add a device table line to PACKAGES_PERMISSIONS_TABLE in
fs/cpio/cpio.mk, where the init script is also installed.

  Regards,
  Arnout

> ---
>   fs/common.mk |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/fs/common.mk b/fs/common.mk
> index debf7db..d7383d1 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -55,6 +55,12 @@ endif
>   	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)">>  $(FAKEROOT_SCRIPT)
>   endif
>   	echo "$(ROOTFS_$(2)_CMD)">>  $(FAKEROOT_SCRIPT)
> +	# create initial console if devtmpfs is used
> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS),y)
> +	echo -e 'pushd $(TARGET_DIR)/dev/>  /dev/null 2>&1'>>  $(FAKEROOT_SCRIPT)
> +	echo -e '/bin/mknod -m 622 console c 5 1'>>  $(FAKEROOT_SCRIPT)
> +	echo -e 'popd>  /dev/null 2>&1'>>  $(FAKEROOT_SCRIPT)
> +endif
>   	chmod a+x $(FAKEROOT_SCRIPT)
>   	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
>   	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
