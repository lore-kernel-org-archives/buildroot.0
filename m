From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 8 Jun 2017 10:34:57 -0400
Subject: [Buildroot] [PATCH WIP] package/systemd: fix paths to runtime
	utilities
In-Reply-To: <20170607220837.2969-1-yann.morin.1998@free.fr>
References: <20170607220837.2969-1-yann.morin.1998@free.fr>
Message-ID: <CAFSsvmqKd7zVrMTDAGRjv8z0-RmzHfmsLNVP1TQDJZpKVeivZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann!

On Wed, Jun 7, 2017 at 6:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> systemd's configure is looking in $PATH to find utilities that will be
> needed at runtime.
>
> Usually, those utilties, when installed on the host, will be found in
> the same path they would be present on the target. For example,
> /usr/bin/mount on the host would also be /usr/bin/mount on the target,
> and all is fine.
>
> Except when we need to install a host variant of util-linux, which will
> install mount in $(HOST_DIR), in which case systemd's configure would
> find that one.
>
I can confirm that I had host-util-linux building before systemd.

> Of course, it is also very well possible that those utilities are not
> installed on the host in the same location they would be on the target,
> in case a user has manually installed some of those (e.g. in /usr/local/
> or in /opt/)
>
> Forcibly set the path to those utilities, as they are expected to be on
> the target.
>
> For kexec, we can set it even though we do not depend on it (yet).
> systemd will appropriately test it at runtime.
>
> For quota, we point to non-existing files, so as to catch errors at
> runtime. It is to be noted that quotacheck is optional, while quotaon
> does not seem to be (a service file is always installed, that uses it).
>
> Note: utilties listed in the order they appear in configure.ac
>
> Reported-by: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>
> This patch is a tentative for Adam to test. I haven't even build it so
> far, by lack of time those days...
>
> ---
>  package/systemd/systemd.mk | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 0b62cf043e..de155f8098 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -45,10 +45,16 @@ SYSTEMD_CONF_OPTS += \
>
>  SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
>
> -# Override path to kmod, used in kmod-static-nodes.service
> +# Override paths to a few utilities needed at runtime, to
> +# avoid finding those we would install in $(HOST_DIR).
>  SYSTEMD_CONF_ENV = \
>         CFLAGS="$(SYSTEMD_CFLAGS)" \
> -       ac_cv_path_KMOD=/usr/bin/kmod
> +       ac_cv_path_KILL=/usr/bin/kill \
> +       ac_cv_path_KMOD=/usr/bin/kmod \
> +       ac_cv_path_KEXEC=/usr/sbin/kexec \
> +       ac_cv_path_SULOGIN=/usr/sbin/sulogin \
These work fine.

> +       ac_cv_path_MOUNT=/usr/sbin/mount \
> +       ac_cv_path_UMOUNT=/usr/sbin/umount
This should be :
ac_cv_path_MOUNT_PATH=/usr/bin/mount \
ac_cv_path_UMOUNT_PATH=/usr/bin/umount

Why they decided that MOUNT and UMOUNT need to have _PATH
in the variable name is beyond me.

Also /bin/ instead of /sbin.
>
>  define SYSTEMD_RUN_INTLTOOLIZE
>         cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
> @@ -182,8 +188,14 @@ endif
>
>  ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
>  SYSTEMD_CONF_OPTS += --enable-quotacheck
> +SYSTEMD_CONF_ENV += \
> +       ac_cv_path_QUOTAON=/usr/sbin/quotaon \
> +       ac_cv_path_QUOTACHECK=/usr/sbin/quotacheck
>  else
>  SYSTEMD_CONF_OPTS += --disable-quotacheck
> +SYSTEMD_CONF_ENV += \
> +       ac_cv_path_QUOTAON=/.missing \
> +       ac_cv_path_QUOTACHECK=/.missing
>  endif
>
>  ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
> --
> 2.11.0
>

After I made the small changes above, the system booted just fine again!
Thanks a ton for your help!

Adam
