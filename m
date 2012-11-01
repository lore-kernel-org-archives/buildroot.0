From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 23:21:20 +0100
Subject: [Buildroot] [PATCH v2] fs/common: Create initial console device
In-Reply-To: <1351765685-8128-1-git-send-email-markos.chandras@gmail.com>
References: <1351765685-8128-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <5092F5E0.80704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/12 11:28, Markos Chandras wrote:
> From: Markos Chandras<markos.chandras@imgtec.com>
>
> A /dev/console node must be present in rootfs when the Linux kernel
> boots otherwise the kernel will print the following warning:
> "Warning: unable to open an initial console"
>
> This is because when we use an initramfs the /dev directory is not
> populated at this point. This can cause problems when a program
> (e.g ldso with early debugging enabled) opens a standard file
> descriptor for read/write before these descriptors are actually
> created by the init process later on.
>
> Signed-off-by: Markos Chandras<markos.chandras@imgtec.com>
> ---
>   fs/cpio/cpio.mk |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index aa20b41..3293bc9 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -21,6 +21,8 @@ define ROOTFS_CPIO_ADD_INIT
>           fi
>   endef
>
> +PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1

  The last three entries are missing (start, inc, count). Also, there should
be a $(sep) at the end of the line; otherwise, any subsequent entries are
appended at the end of the line.  (This will probably be the last line in
the table anyway, because the fs/ tree is included at the end of Makefile,
but we shouldn't rely on that).


  Regards,
  Arnout

> +
>   endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
>
>   ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
