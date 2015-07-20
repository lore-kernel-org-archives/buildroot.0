From: =?UTF-8?Q?Aur=C3=A9lien_Chabot?= <aurelien@chabot.fr>
Date: Mon, 20 Jul 2015 23:04:06 +0200
Subject: [Buildroot] [PATCH] nfs-utils: systemd support
In-Reply-To: <1437344153-11424-1-git-send-email-aurelien@chabot.fr>
References: <1437344153-11424-1-git-send-email-aurelien@chabot.fr>
Message-ID: <CAJup9cgD8LwXCeGZQENP7xacxU_K2_hScg1DCvu+zL7sMM1+kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 20, 2015 at 12:15 AM, Aur?lien Chabot <aurelien@chabot.fr>
wrote:

> Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> ---
>  .../0005-Remove-broken-problematic-chown.patch     | 25 ++++++++++++
>  .../0006-Fix-systemd-activation-options.patch      | 24 +++++++++++
>  package/nfs-utils/0007-No-gss-support.patch        | 46
> ++++++++++++++++++++++
>  package/nfs-utils/0007-No-nfsv4-support.patch      | 33 ++++++++++++++++
>  package/nfs-utils/nfs-utils.mk                     | 24 +++++++++++
>  package/nfs-utils/nfs-utils_env.sh                 |  1 +
>  6 files changed, 153 insertions(+)
>  create mode 100644
> package/nfs-utils/0005-Remove-broken-problematic-chown.patch
>  create mode 100644
> package/nfs-utils/0006-Fix-systemd-activation-options.patch
>  create mode 100644 package/nfs-utils/0007-No-gss-support.patch
>  create mode 100644 package/nfs-utils/0007-No-nfsv4-support.patch
>  create mode 100755 package/nfs-utils/nfs-utils_env.sh
>
> diff --git a/package/nfs-utils/0005-Remove-broken-problematic-chown.patch
> b/package/nfs-utils/0005-Remove-broken-problematic-chown.patch
> new file mode 100644
> index 0000000..fdf6864
> --- /dev/null
> +++ b/package/nfs-utils/0005-Remove-broken-problematic-chown.patch
> @@ -0,0 +1,25 @@
> +From 6602a2dbee18d8a6bc568a6486adbe9c83f05736 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
> +Date: Tue, 17 Feb 2015 00:55:59 +0100
> +Subject: [PATCH] Remove broken problematic chown
> +
> +Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> +---
> + Makefile.am | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 4a2edc6..59e5328 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -28,8 +28,6 @@ install-data-hook:
> +       touch $(DESTDIR)$(statedir)/rmtab; chmod 644
> $(DESTDIR)$(statedir)/rmtab
> +       mkdir -p $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak
> +       touch $(DESTDIR)$(statdpath)/state
> +-      chmod go-rwx $(DESTDIR)$(statdpath)/sm
> $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
> +-      -chown $(statduser) $(DESTDIR)$(statdpath)/sm
> $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
> +
> + uninstall-hook:
> +       rm $(DESTDIR)$(statedir)/xtab
> +--
> +2.3.0
> diff --git a/package/nfs-utils/0006-Fix-systemd-activation-options.patch
> b/package/nfs-utils/0006-Fix-systemd-activation-options.patch
> new file mode 100644
> index 0000000..1d76394
> --- /dev/null
> +++ b/package/nfs-utils/0006-Fix-systemd-activation-options.patch
> @@ -0,0 +1,24 @@
> +From c61c2075588f9e47509d2607613da8cef5b2491c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
> +Date: Wed, 18 Feb 2015 22:33:45 +0100
> +Subject: [PATCH] Fix systemd activation options
> +
> +Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> +---
> + configure.ac | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8e427e3..e61430f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -60,7 +60,6 @@ AC_ARG_WITH(systemd,
> +       [AC_HELP_STRING([--with-systemd@<:@=unit-dir-path@:>@],
> +                       [install systemd unit files @<:@Default: no, and
> path defaults to /usr/lib/systemd/system if not given@:>@])],
> +       test "$withval" = "no" && use_systemd=0 || unitdir=$withval
> use_systemd=1
> +-      use_systemd=0
> +       )
> +       AM_CONDITIONAL(INSTALL_SYSTEMD, [test "$use_systemd" = 1])
> +       AC_SUBST(unitdir)
> +--
> +2.3.0
> diff --git a/package/nfs-utils/0007-No-gss-support.patch
> b/package/nfs-utils/0007-No-gss-support.patch
> new file mode 100644
> index 0000000..505198f
> --- /dev/null
> +++ b/package/nfs-utils/0007-No-gss-support.patch
> @@ -0,0 +1,46 @@
> +From 8bee1194d21e4ba48d4149de03ca387be1c4cd02 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
> +Date: Sun, 5 Apr 2015 19:57:59 +0200
> +Subject: [PATCH 1/2] No gss support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> +---
> + systemd/nfs-client.target  | 4 ----
> + systemd/nfs-server.service | 4 ----
> + 2 files changed, 8 deletions(-)
> +
> +diff --git a/systemd/nfs-client.target b/systemd/nfs-client.target
> +index 9b792a3..36ff275 100644
> +--- a/systemd/nfs-client.target
> ++++ b/systemd/nfs-client.target
> +@@ -8,10 +8,6 @@ Wants=remote-fs-pre.target
> + Wants=nfs-blkmap.service rpc-statd-notify.service
> + After=nfs-blkmap.service
> +
> +-# GSS services dependencies and ordering
> +-Wants=auth-rpcgss-module.service
> +-After=rpc-gssd.service rpc-svcgssd.service gssproxy.service
> +-
> + [Install]
> + WantedBy=multi-user.target
> + WantedBy=remote-fs.target
> +diff --git a/systemd/nfs-server.service b/systemd/nfs-server.service
> +index 8010aad..2694669 100644
> +--- a/systemd/nfs-server.service
> ++++ b/systemd/nfs-server.service
> +@@ -9,10 +9,6 @@ After= network.target proc-fs-nfsd.mount rpcbind.target
> nfs-mountd.service
> + After= nfs-idmapd.service rpc-statd.service
> + Before= rpc-statd-notify.service
> +
> +-# GSS services dependencies and ordering
> +-Wants=auth-rpcgss-module.service
> +-After=rpc-gssd.service gssproxy.service rpc-svcgssd.service
> +-
> + Wants=nfs-config.service
> + After=nfs-config.service
> +
> +--
> +2.3.5
> diff --git a/package/nfs-utils/0007-No-nfsv4-support.patch
> b/package/nfs-utils/0007-No-nfsv4-support.patch
> new file mode 100644
> index 0000000..25b6a2a
> --- /dev/null
> +++ b/package/nfs-utils/0007-No-nfsv4-support.patch
> @@ -0,0 +1,33 @@
> +From 382501b49443b49b999701e00a69364d8bb82c7b Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
> +Date: Sun, 5 Apr 2015 19:58:13 +0200
> +Subject: [PATCH 2/2] No nfsv4 support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> +---
> + systemd/nfs-server.service | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/systemd/nfs-server.service b/systemd/nfs-server.service
> +index 2694669..95cdb46 100644
> +--- a/systemd/nfs-server.service
> ++++ b/systemd/nfs-server.service
> +@@ -2,11 +2,11 @@
> + Description=NFS server and services
> + Requires= network.target proc-fs-nfsd.mount rpcbind.target
> + Requires= nfs-mountd.service
> +-Wants=rpc-statd.service nfs-idmapd.service
> ++Wants=rpc-statd.service
> + Wants=rpc-statd-notify.service
> +
> + After= network.target proc-fs-nfsd.mount rpcbind.target
> nfs-mountd.service
> +-After= nfs-idmapd.service rpc-statd.service
> ++After= rpc-statd.service
> + Before= rpc-statd-notify.service
> +
> + Wants=nfs-config.service
> +--
> +2.3.5
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/
> nfs-utils.mk
> index 095d095..aaca511 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -41,11 +41,35 @@ define NFS_UTILS_INSTALL_FIXUP
>  endef
>  NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
>
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +       NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
> +       NFS_UTILS_DEPENDENCIES += systemd
> +else
> +       NFS_UTILS_CONF_OPTS += --without-systemd
> +endif
> +
>  define NFS_UTILS_INSTALL_INIT_SYSV
>         $(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
>                 $(TARGET_DIR)/etc/init.d/S60nfs
>  endef
>
> +define NFS_UTILS_INSTALL_INIT_SYSTEMD
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +
> +       ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
> +
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
> +       ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
> +
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-client.target
> +
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants
> +
> +       ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
> +
>  $(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants/nfs-client.target
> +
> +       $(INSTALL) -D -m 0755 package/nfs-utils/nfs-utils_env.sh \
> +               $(TARGET_DIR)/usr/lib/systemd/scripts/nfs-utils_env.sh
> +endef
> +
>  define NFS_UTILS_REMOVE_NFSIOSTAT
>         rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
>  endef
> diff --git a/package/nfs-utils/nfs-utils_env.sh
> b/package/nfs-utils/nfs-utils_env.sh
> new file mode 100755
> index 0000000..1a24852
> --- /dev/null
> +++ b/package/nfs-utils/nfs-utils_env.sh
> @@ -0,0 +1 @@
> +#!/bin/sh
> --
> 2.4.6
>
>
I have issue with this patch on buildroot HEAD.
In fact I write it before this commit :

    Author: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
    Date:   Sat Jul 11 16:48:20 2015 +0200
        nfs_utils: Fix for read-only rootfs

Because we now use a tmpfs, the needed file are not there at startup, and
as systemd service don't create them as the sysvinit does, this doesn't
work.
I am not sure how to fix that properly. Any idea ?

And also, I intent to remove the 0007-No-nfsv4-support.patch, replacing it
by a patch that make the service file installation, install only those that
should be, regarding the build options. This new patch will allow later
support of NFSV4 and might be upstream.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150720/b71f6f02/attachment-0001.html>
