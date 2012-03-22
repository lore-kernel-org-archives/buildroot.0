From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Mar 2012 21:39:34 +0100
Subject: [Buildroot] [PATCH 1/5] Add the systemd package
In-Reply-To: <13349984bf3bf708b18546d37b0761a4890c7bbf.1332408273.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Thu, 22 Mar 2012 10:27:16 +0100")
References: <cover.1332408273.git.maxime.ripard@free-electrons.com>
 <cover.1332408273.git.maxime.ripard@free-electrons.com>
 <13349984bf3bf708b18546d37b0761a4890c7bbf.1332408273.git.maxime.ripard@free-electrons.com>
Message-ID: <87vclw1ibd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> ---
 Maxime>  package/Config.in                               |    1 +
 Maxime>  package/dbus/dbus.mk                            |    4 ++
 Maxime>  package/systemd/Config.in                       |   19 +++++++
 Maxime>  package/systemd/systemd-37-fix-getty-unit.patch |   26 ++++++++++
 Maxime>  package/systemd/systemd.mk                      |   62 +++++++++++++++++++++++
 Maxime>  package/udev/udev.mk                            |    4 ++
 Maxime>  6 files changed, 116 insertions(+), 0 deletions(-)
 Maxime>  create mode 100644 package/systemd/Config.in
 Maxime>  create mode 100644 package/systemd/systemd-37-fix-getty-unit.patch
 Maxime>  create mode 100644 package/systemd/systemd.mk

 Maxime> +++ b/package/systemd/Config.in
 Maxime> @@ -0,0 +1,19 @@
 Maxime> +config BR2_PACKAGE_SYSTEMD
 Maxime> +	bool "systemd"
 Maxime> +	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 Maxime> +	select BR2_PACKAGE_DBUS
 Maxime> +	select BR2_PACKAGE_LIBCAP
 Maxime> +	help

Systemd also depends on BR2_INET_IPV6.


 Maxime> +	  systemd is a system and service manager for Linux, compatible with
 Maxime> +	  SysV and LSB init scripts. systemd provides aggressive parallelization
 Maxime> +	  capabilities, uses socket and D-Bus activation for starting services,
 Maxime> +	  offers on-demand starting of daemons, keeps track of processes using
 Maxime> +	  Linux cgroups, supports snapshotting and restoring of the system
 Maxime> +	  state, maintains mount and automount points and implements an
 Maxime> +	  elaborate transactional dependency-based service control logic.
 Maxime> +	  It can work as a drop-in replacement for sysvinit.
 Maxime> +
 Maxime> +	  http://freedesktop.org/wiki/Software/systemd
 Maxime> +
 Maxime> +comment "systemd not available (depends on udev)"
 Maxime> +	depends on !BR2_PACKAGE_UDEV

As you changed the depend on, this should also say something like:

(depends on /dev management with udev)

and depend on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV


 Maxime> diff --git a/package/systemd/systemd-37-fix-getty-unit.patch b/package/systemd/systemd-37-fix-getty-unit.patch
 Maxime> new file mode 100644
 Maxime> index 0000000..211fb4d
 Maxime> --- /dev/null
 Maxime> +++ b/package/systemd/systemd-37-fix-getty-unit.patch
 Maxime> @@ -0,0 +1,26 @@

Please add a git-style header with description and signed-off-by on all
patches.

 Maxime> +Index: systemd-37/units/getty at .service.m4
 Maxime> +===================================================================
 Maxime> +--- systemd-37.orig/units/getty at .service.m4	2012-03-21 10:05:23.868674099 +0100
 Maxime> ++++ systemd-37/units/getty at .service.m4	2012-03-21 10:06:50.3326

Otherwise it looks good. Care to fix?

-- 
Bye, Peter Korsgaard
