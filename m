From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 14:39:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/systemd: set machine id file
 instalation as optional choice
In-Reply-To: <20191117113345.159653-1-b.bilas@grinn-global.com>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
Message-ID: <0b8bd9be-3109-f998-5a44-cca063d1e207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bartosz,

On 17/11/2019 12:33, Bartosz Bilas wrote:
> In case of e.g writable systems there is no neccesity to have
                 writeable                    necessity

> pre-installed empty machine-id file on target because systemd
> generates that automatically during system boot.
> Also in case of having empty machine-id file we are not able
> to use a service with ConditionFirstBoot because systemd recognizes
> machine-id file in system therefore we can't detect new system instance boots up.
> Set this option as enable by default to keep compatibility with old builds.

 Nice that you take a look at this! I'm immediately going to follow it up with
more feature requests though :-)

- If there is a writeable persistent partition, but /etc is not writeable, can
we create a symlink and will systemd still create it correctly at first boot?

- Maybe if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set, we should default it or
even force it to no.


 Regards,
 Arnout

> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/systemd/Config.in  | 13 +++++++++++++
>  package/systemd/systemd.mk |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index aef39abe27..fadc1a32c8 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -112,6 +112,19 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
>  	default "x64"   if BR2_x86_64
>  	depends on BR2_PACKAGE_SYSTEMD_BOOT
>  
> +config BR2_PACKAGE_SYSTEMD_MACHINEID_FILE
> +	bool "Install empty machine id file"
> +	default y
> +	help
> +	  The /etc/machine-id file contains the unique machine ID
> +	  of the local system that is set during installation or
> +	  boot. The machine ID is a single newline-terminated,
> +	  hexadecimal, 32-character, lowercase ID. When decoded from
> +	  hexadecimal, this corresponds to a 16-byte/128-bit value.
> +	  This ID may not be all zeros.
> +
> +	  https://www.freedesktop.org/software/systemd/man/machine-id.html
> +
>  config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
>  	bool "HTTP server for journal events"
>  	select BR2_PACKAGE_LIBMICROHTTPD
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 92490eb86b..fc348fe120 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -461,9 +461,11 @@ define SYSTEMD_INSTALL_INIT_HOOK
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/remote-fs.target
>  endef
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINEID_FILE),y)
>  define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
> +endif
>  
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_TARGET_CRYPTSETUP \
> 
