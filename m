From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 22:39:59 +0100
Subject: [Buildroot] [PATCH 1/1] cgroupsfs: new package
In-Reply-To: <1455116556-3449-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455116556-3449-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <56BBAE2F.5010504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 16:02, Niranjan Reddy wrote:
> From: Niranjan <niranjan.reddy@rockwellcollins.com>
> 
> This package consists of scripts that setup cgroups at boot
> without doing any cgroup management or classification of
> tasks into cgroups
> 
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> ---
>  package/Config.in            |  1 +
>  package/cgroupfs/Config.in   |  6 ++++++
>  package/cgroupfs/cgroupfs.mk | 17 +++++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 package/cgroupfs/Config.in
>  create mode 100644 package/cgroupfs/cgroupfs.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a5b31aa..452fd0b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1571,6 +1571,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/dcron/Config.in"
>  	source "package/debianutils/Config.in"
>  endif
> +	source "package/cgroupfs/Config.in"
>  	source "package/dsp-tools/Config.in"
>  	source "package/emlog/Config.in"
>  	source "package/ftop/Config.in"
> diff --git a/package/cgroupfs/Config.in b/package/cgroupfs/Config.in
> new file mode 100644
> index 0000000..f83432e
> --- /dev/null
> +++ b/package/cgroupfs/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_CGROUPFS
> +	bool "cgroupfs"

 I think this package makes no sense at all under systemd, since systemd already
mounts all cgroups. So I'd make this depend on !BR2_INIT_SYSTEMD.

> +	help
> +	  cgroupfs mount and umount scripts.
> +
> +	  https://github.com/tianon/cgroupfs-mount/blob/master/README.md

 Remove the last bit, https://github.com/tianon/cgroupfs-mount shows the readme
as well and has more navigation options.

> diff --git a/package/cgroupfs/cgroupfs.mk b/package/cgroupfs/cgroupfs.mk
> new file mode 100644
> index 0000000..06d430a
> --- /dev/null
> +++ b/package/cgroupfs/cgroupfs.mk
> @@ -0,0 +1,17 @@
> +#############################################################
> +#
> +# cgroupfs
> +#
> +#############################################################
> +CGROUPFS_VERSION = 1.0
> +CGROUPFS_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_VERSION))
> +CGROUPFS_INSTALL_TARGET = YES

 That's the default, not needed.

> +
> +define CGROUPFS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount

 Instead of $(BUILD_DIR)/cgroupfs-1.0 use $(@D)

> +	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
> +	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/debian/cgroupfs-mount.init $(TARGET_DIR)/etc/init.d/cgroupfs-mount.init

 If it doesn't start with Snn (where nn is a number) it will not be executed.
Also, it should not be part of the INSTALL_TARGET_CMDS, but it should be part of
CGROUPFS_INSTALL_INIT_SYSV (check the manual).

 However, this script is full of debianisms and will just not work. You'll have
to create your own simple start script. And it can be extremely simple, just a
case statement to handle start, stop and restart.

> +	$(INSTALL) -D -m 0755 $(BUILD_DIR)/cgroupfs-1.0/debian/cgroupfs-mount.upstart $(TARGET_DIR)/etc/init.d/cgroupfs-mount.upstart

 Since we don't have upstart, this makes no sense.


 Regards,
 Arnout

> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
