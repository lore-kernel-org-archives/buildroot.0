From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jun 2016 11:36:38 +0200
Subject: [Buildroot] [PATCH 00/24] system: properly handle systemd as
 init system (branch yem/systemd-skeleton)
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <20160618093638.GA3573@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-06-12 23:55 +0200, Yann E. MORIN spake thusly:
> Hello All!
> 
> This series is a proposal to fix our handling of systemd as an init
> system.

I've marked this series as Changes Requested: the commit logs were not
really complete. So I detaield each commit a bit more. 

I'll respin a new version of the series by the end of the day.

Regards,
Yann E. MORIN.

> Our default skeleton is not well suited for systemd:
> 
>   - we have /var/log a symlink to /tmp/log, but the way systemd starts
>     hides the journals:
>     - start systemd-journald, stores journals in /tmp/log/ (because of
>       the redirection above)
>     - mounts a tmpfs over /tmp, thus hidding the journals.
> 
>   - on a read-only rootfs, systemd expects /var to be read-write, which
>     we do not provide.
> 
> 
> All of this sounds trivial, but fixing it is definitely not.
> 
> The overall idea is that we need different skeletons, one for each of
> the init systems (and as can be seen later, there is in fact none for
> systeemd).
> 
> Also, the organisation of the rootfs is different between the different
> init systems, with different mount points in some cases.
> 
> First comes a long and rather boring sub-series aimed at preparing for
> the various skeletons, with patches 1-11 some cleanups and re-factoring
> of the system sub-menu, plus limiting our tweaks in the custom skeleton.
> 
> Then comes more in-depth preparatory works in the core infra: allow
> packages to explicitly declare target-finalize hooks, or avoid the
> dependency on the skeleton.
> 
> Third, we split the current skeleton into various parts: one skeleton
> for the sysv-like init systems (busybox, sysv-init), one skeleton for
> sysv-like network management (because shared between sysv and
> systemd-without-networkd) and a third to handle the custom skeleton.
> 
> Finally, we introduce the skeleton for systemd, add missing pieces it
> really needs (timezones) and make it work flawlessly on a read-only
> rootfs.
> 
> Please have a look at the various commit logs for more in-depth
> explanations for the vairious pieces.
> 
> With this series, I was able to build and run without issues those
> combinations:
> 
>     init system         rootfs      DHCP?   target
>     ----------------------------------------------------
>     busybox             ext4        no      rpi0
>     busybox             ext4        eth0    rpi1-B
>     busybox             squashfs    no      rpi0
>     busybox             squashfs    eth0    rpi1-B
>   * systemd-minimal     ext4        no      rpi0
>     systemd-minimal     ext4        eth0    rpi1-B
>     systemd-minimal     squashfs    no      rpi0
>     systemd-minimal     squashfs    eth0    rpi1-B
>  ** systemd-full        ext4        no      rpi0
>     systemd-full        ext4        eth0    rpi1-B
>     systemd-full        squashfs    no      rpi0
>     systemd-full        squashfs    eth0    rpi1-B
> 
> 
> *  systemd-minimal: only what gets selected automatically when systemd
>    is used as init system, with all other options unset
> 
> ** systemd-full: all systemd options enabled
> 
> To be noted for future work:
> 
>   - systemd-230 (which we currently have) has dropped support for legacy
>     libs, patch should be trivial;
> 
>   - systemd-230 also ditched systemd-bootchartd, which is now a separate
>     package; until recently it did not compile against systemd-230; its
>     repository was recently updated to supposedly fix this issue, but I
>     did not have time to test;
> 
>   - I also had a look at all the pending patches on the list; I'll
>     handle them after this series has been completed (i.e. applied after
>     any necessary rework). I don;t want to carry a series with tens and
>     tens of patches... ;-)
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit 494b0a5b6b0018bfd05ae5d7c09f57c881ed2b72
> 
>   gst1-imx: make kernel dependency optional (2016-06-12 22:38:19 +0200)
> 
> 
> are available in the git repository at:
> 
>   https://git.busybox.net/~ymorin/git/buildroot
> 
> for you to fetch changes up to 4bfd9509ba59300ae2fa25be5cebfd6786ca7f7c
> 
>   system: allow DHCP interface with systemd-networkd (2016-06-12 22:46:00 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (24):
>       package/skeleton: remove useless .empty file
>       system: sysvinit only selects busybox-show-others if busybox is enabled
>       package/skeleton: respect variables namespace
>       system/skeleton: update etc/mtab with a more sensible link
>       system: systemd only really supports a R/W rootfs
>       package/systemd: disabling tty1 getty is a post-install hook
>       system: provide no default for custom skeleton path
>       system: move the rootfs skeleton choice
>       system: do not handle network settings for custom skeleton
>       package/perl: use dummy hostname
>       system: do not set hostname and issue for custom skeleton
>       core/pkg-generic: add variable to skip skeleton dependency
>       package/skeleton: add macro to rsync skeleton directory
>       core/pkg-generic: allow packages to declare target-finalize hooks
>       packages: use the <PKG>_TARGET_FINALIZE_HOOKS
>       package/skeleton: split into sysv and custom skeleton
>       package/skeleton: make it a virtual package
>       package/skeleton-sysv: split into skeleton-common
>       system: split skeleton
>       package/skeleton-systemd: new package
>       system/systemd: needs timezone
>       fs: add pre- and post-command hooks
>       system: make systemd work on a read-only rootfs
>       system: allow DHCP interface with systemd-networkd
> 
>  docs/manual/adding-packages-hooks.txt              |   7 +
>  fs/common.mk                                       |   4 +
>  package/Config.in                                  |   4 +
>  package/google-breakpad/google-breakpad.mk         |   6 +-
>  package/libglib2/libglib2.mk                       |   6 +-
>  package/libgtk3/libgtk3.mk                         |   4 +-
>  package/luarocks/luarocks.mk                       |   3 +-
>  package/perl/perl.mk                               |   6 +-
>  package/pkg-generic.mk                             |  13 +-
>  package/python/python.mk                           |  10 +-
>  package/python3/python3.mk                         |  10 +-
>  package/skeleton-common/Config.in                  |   2 +
>  package/skeleton-common/skeleton-common.mk         |  99 ++++++++++
>  package/skeleton-custom/Config.in                  |   6 +
>  package/skeleton-custom/skeleton-custom.mk         | 114 +++++++++++
>  package/skeleton-systemd/Config.in                 |   7 +
>  package/skeleton-systemd/skeleton-systemd.mk       | 106 ++++++++++
>  package/skeleton-sysv/Config.in                    |   7 +
>  package/skeleton-sysv/skeleton-sysv.mk             |  79 ++++++++
>  package/skeleton/Config.in                         |  10 +
>  package/skeleton/skeleton.mk                       | 213 +++------------------
>  package/systemd/systemd.mk                         |  12 +-
>  system/Config.in                                   |  78 ++++----
>  .../etc/network/if-down.d}/.empty                  |   0
>  .../etc/network/if-post-down.d}/.empty             |   0
>  .../etc/network/if-pre-up.d/wait_iface             |   0
>  .../etc/network/if-up.d}/.empty                    |   0
>  system/{skeleton => skeleton-sysv}/dev/log         |   0
>  .../if-down.d => skeleton-sysv/dev/pts}/.empty     |   0
>  system/{skeleton => skeleton-sysv}/dev/shm/.empty  |   0
>  system/{skeleton => skeleton-sysv}/etc/fstab       |   0
>  system/{skeleton => skeleton-sysv}/etc/resolv.conf |   0
>  system/{skeleton => skeleton-sysv}/var/cache       |   0
>  system/{skeleton => skeleton-sysv}/var/lib/misc    |   0
>  system/{skeleton => skeleton-sysv}/var/lock        |   0
>  system/{skeleton => skeleton-sysv}/var/log         |   0
>  system/{skeleton => skeleton-sysv}/var/run         |   0
>  system/{skeleton => skeleton-sysv}/var/spool       |   0
>  system/{skeleton => skeleton-sysv}/var/tmp         |   0
>  system/skeleton/dev/{pts => }/.empty               |   0
>  system/skeleton/etc/mtab                           |   2 +-
>  41 files changed, 548 insertions(+), 260 deletions(-)
>  create mode 100644 package/skeleton-common/Config.in
>  create mode 100644 package/skeleton-common/skeleton-common.mk
>  create mode 100644 package/skeleton-custom/Config.in
>  create mode 100644 package/skeleton-custom/skeleton-custom.mk
>  create mode 100644 package/skeleton-systemd/Config.in
>  create mode 100644 package/skeleton-systemd/skeleton-systemd.mk
>  create mode 100644 package/skeleton-sysv/Config.in
>  create mode 100644 package/skeleton-sysv/skeleton-sysv.mk
>  rename system/{skeleton/etc/network/if-up.d => skeleton-net/etc/network/if-down.d}/.empty (100%)
>  rename system/{skeleton/etc/network/if-pre-up.d => skeleton-net/etc/network/if-post-down.d}/.empty (100%)
>  rename system/{skeleton => skeleton-net}/etc/network/if-pre-up.d/wait_iface (100%)
>  rename system/{skeleton/etc/network/if-post-down.d => skeleton-net/etc/network/if-up.d}/.empty (100%)
>  rename system/{skeleton => skeleton-sysv}/dev/log (100%)
>  rename system/{skeleton/etc/network/if-down.d => skeleton-sysv/dev/pts}/.empty (100%)
>  rename system/{skeleton => skeleton-sysv}/dev/shm/.empty (100%)
>  rename system/{skeleton => skeleton-sysv}/etc/fstab (100%)
>  rename system/{skeleton => skeleton-sysv}/etc/resolv.conf (100%)
>  rename system/{skeleton => skeleton-sysv}/var/cache (100%)
>  rename system/{skeleton => skeleton-sysv}/var/lib/misc (100%)
>  rename system/{skeleton => skeleton-sysv}/var/lock (100%)
>  rename system/{skeleton => skeleton-sysv}/var/log (100%)
>  rename system/{skeleton => skeleton-sysv}/var/run (100%)
>  rename system/{skeleton => skeleton-sysv}/var/spool (100%)
>  rename system/{skeleton => skeleton-sysv}/var/tmp (100%)
>  rename system/skeleton/dev/{pts => }/.empty (100%)
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
