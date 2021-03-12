From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 23:13:58 +0100
Subject: [Buildroot] [PATCH v1] package/e2fsprogs: bump version to 1.46.2
In-Reply-To: <20210312215504.27591-1-ps.report@gmx.net>
References: <20210312215504.27591-1-ps.report@gmx.net>
Message-ID: <20210312221358.GE2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-12 22:55 +0100, Peter Seiderer spake thusly:
> - removed 0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
>   (upstream [1])
> 
> [1] 0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-xattrs-to-the-root-directory-as-wel.patch | 46 -------------------
>  package/e2fsprogs/e2fsprogs.hash              |  4 +-
>  package/e2fsprogs/e2fsprogs.mk                |  2 +-
>  3 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
> 
> diff --git a/package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch b/package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
> deleted file mode 100644
> index 2e9c3ccef0..0000000000
> --- a/package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 1826d8965057bd84517156a4b75c81bdfdae9ebc Mon Sep 17 00:00:00 2001
> -From: Antoine Tenart <antoine.tenart@bootlin.com>
> -Date: Wed, 1 Jul 2020 10:06:03 +0200
> -Subject: [PATCH] create_inode: set xattrs to the root directory as well
> -
> -populate_fs do copy the xattrs for all files and directories, but the
> -root directory is skipped and as a result its extended attributes aren't
> -set. This is an issue when using mkfs to build a full system image that
> -can be used with SElinux in enforcing mode without making any runtime
> -fix at first boot.
> -
> -This patch adds logic to set the root directory's extended attributes.
> -
> -[Uspstream status: sent to the mailing list and has a Reviewed-by tag,
> -https://lore.kernel.org/linux-ext4/20200717100846.497546-1-antoine.tenart at bootlin.com/]
> -
> -Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ----
> - misc/create_inode.c | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/misc/create_inode.c b/misc/create_inode.c
> -index e8d1df6b55a5..fe66faf1b53d 100644
> ---- a/misc/create_inode.c
> -+++ b/misc/create_inode.c
> -@@ -1050,9 +1050,17 @@ errcode_t populate_fs2(ext2_filsys fs, ext2_ino_t parent_ino,
> - 	file_info.path_max_len = 255;
> - 	file_info.path = calloc(file_info.path_max_len, 1);
> - 
> -+	retval = set_inode_xattr(fs, root, source_dir);
> -+	if (retval) {
> -+		com_err(__func__, retval,
> -+			_("while copying xattrs on root directory"));
> -+		goto out;
> -+	}
> -+
> - 	retval = __populate_fs(fs, parent_ino, source_dir, root, &hdlinks,
> - 			       &file_info, fs_callbacks);
> - 
> -+out:
> - 	free(file_info.path);
> - 	free(hdlinks.hdl);
> - 	return retval;
> --- 
> -2.26.2
> -
> diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
> index b563af27f2..909394ba44 100644
> --- a/package/e2fsprogs/e2fsprogs.hash
> +++ b/package/e2fsprogs/e2fsprogs.hash
> @@ -1,5 +1,5 @@
> -# https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.6/sha256sums.asc
> -sha256  ffa7ae6954395abdc50d0f8605d8be84736465afc53b8938ef473fcf7ff44256  e2fsprogs-1.45.6.tar.xz
> +# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.2/sha256sums.asc
> +sha256  23aa093295c94e71ef1be490c4004871c5b01d216a8cb4d111fa6c0aac354168  e2fsprogs-1.46.2.tar.xz
>  # Locally calculated
>  sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
>  sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index eb127b42d3..4420d16aff 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -E2FSPROGS_VERSION = 1.45.6
> +E2FSPROGS_VERSION = 1.46.2
>  E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
>  E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
>  E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
> -- 
> 2.30.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
