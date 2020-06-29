From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 29 Jun 2020 12:52:43 +0200
Subject: [Buildroot] [PATCH] system/skeleton: make /var/run a symlink to
 /run
In-Reply-To: <20200629104749.46938-1-nolange79@gmail.com>
References: <20200629104749.46938-1-nolange79@gmail.com>
Message-ID: <CADYdroNQhEHTV4=9m_EOZ_mVpx1C9Eewn1J9wqDh+0RsWZGarQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 29. Juni 2020 um 12:47 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>
> both systemd and FHS3 denote /var/run as a compatibility directory,
> new systems should use /run.
>
> There seems to be little reason to not switch to the new FHS layout
> with buildroot, and adding the compatibility symlink.
>
> [1] - https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s13.html
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 --
>  system/skeleton/var/run                                | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
>  create mode 120000 system/skeleton/var/run
>
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index 5d6b716f7a..528cf43e61 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -60,8 +60,6 @@ endif
>  define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>         mkdir -p $(TARGET_DIR)/home
>         mkdir -p $(TARGET_DIR)/srv
> -       mkdir -p $(TARGET_DIR)/var
> -       ln -s ../run $(TARGET_DIR)/var/run
>         $(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>  endef
>
> diff --git a/system/skeleton/var/run b/system/skeleton/var/run
> new file mode 120000
> index 0000000000..84ba55b912
> --- /dev/null
> +++ b/system/skeleton/var/run
> @@ -0,0 +1 @@
> +../run
> \ No newline at end of file
> --
> 2.27.0
>

Some future change would be to change relative symlinks touching the
target root to absolutes.
potentially as last step after the fakeroot scripts.
Reasoning can be found at the debian manual (allowing symlinks in root).

Norbert

[1] - https://www.debian.org/doc/debian-policy/ch-files.html#symbolic-links
