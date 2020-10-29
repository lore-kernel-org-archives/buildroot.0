From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Oct 2020 08:15:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/sshfs: fix uclibc build
In-Reply-To: <20201025164108.1837152-1-fontaine.fabrice@gmail.com>
References: <20201025164108.1837152-1-fontaine.fabrice@gmail.com>
Message-ID: <20201029071500.GL2805@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-25 17:41 +0100, Fabrice Fontaine spake thusly:
> Fix build of sshfs 3.7.0 with uclibc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f93972515ad09ab2ccbdc4cd976ed60702c5974a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-target-libfuse-version-30.patch      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/sshfs/0001-target-libfuse-version-30.patch
> 
> diff --git a/package/sshfs/0001-target-libfuse-version-30.patch b/package/sshfs/0001-target-libfuse-version-30.patch
> new file mode 100644
> index 0000000000..d83ebcf13b
> --- /dev/null
> +++ b/package/sshfs/0001-target-libfuse-version-30.patch
> @@ -0,0 +1,35 @@
> +From 7315b0c2f7e04353fefb9734da60884e9b382e51 Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Tue, 28 Jul 2020 15:40:39 -0700
> +Subject: [PATCH] target libfuse version 30
> +
> +libfuse only defines fuse_new_30 when FUSE_USE_VERSION == 30. It does not
> +define fuse_new_31 in the headers.
> +
> +fuse_new_31 and _32 seem to be internal only.
> +
> +Fixes a linking issue:
> +ld: sshfs.p/sshfs.c.o: in function `main':
> +sshfs.c:(.text.startup+0x506): undefined reference to `fuse_new'
> +ld: sshfs.c:(.text.startup+0x506): undefined reference to `fuse_new'
> +
> +[Retrieved from:
> +https://github.com/libfuse/sshfs/pull/221/commits/7315b0c2f7e04353fefb9734da60884e9b382e51]

Not sure if you followed up on that PR, but there has been some recent
activity, and the issue is in fact probably with libfuse itself:

    https://github.com/libfuse/libfuse/pull/556

So, I'll refrain from applying this patch for a little while still.

Regards,
Yann E. MORIN.

> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index f6bbe51..dc40313 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -51,7 +51,7 @@ sshfs_deps = [ dependency('fuse3', version: '>= 3.1.0'),
> + executable('sshfs', sshfs_sources,
> +            include_directories: include_dirs,
> +            dependencies: sshfs_deps,
> +-           c_args: ['-DFUSE_USE_VERSION=31'],
> ++           c_args: ['-DFUSE_USE_VERSION=30'],
> +            install: true,
> +            install_dir: get_option('bindir'))
> + 
> -- 
> 2.28.0
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
