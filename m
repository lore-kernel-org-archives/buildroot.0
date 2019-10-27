From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 20:25:54 +0100
Subject: [Buildroot] [PATCH] package/gpsd: Fix systemd service
 installation and paths
In-Reply-To: <1559170961-14091-1-git-send-email-hancock@sedsystems.ca>
References: <1559170961-14091-1-git-send-email-hancock@sedsystems.ca>
Message-ID: <bf65beff-5d0d-a679-11c7-fe55f773e218@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/05/2019 01:02, Robert Hancock wrote:
> Fix several issues with systemd service file installation for gpsd:
> 
> -systemd support in the gpsd build was defaulting to enabled or not
> based on whether the host system had systemd directories present. Set
> this explicitly based on whether BR2_INIT_SYSTEMD is set.
> 
> -The installed systemd service files referenced paths in /usr/local when
> the actual binaries are installed in /usr. Replace /usr/local with /usr
> in the installed service files.
> 
> -When BR2_PACKAGE_HAS_UDEV was enabled, all of the binaries were
> re-installed again, along with the udev rules, as part of the
> post-install hooks. Just choose between using install and udev-install
> based on whether udev is enabled to avoid redundant re-installations.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

 Applied to master, thanks, with a small changes.


>  
> +define GPSD_INSTALL_INIT_SYSTEMD
> +# systemd unit files are installed automatically, but need to update the
> +# /usr/local path references in the provided files to /usr.

 Comments inside a define get passed to the shell, which is not so nice. So I
moved these out before the define.

 Regards,
 Arnout

> +	$(SED) 's%/usr/local%/usr%' \
> +		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/gpsdctl at .service
> +endef
> +
>  define GPSD_INSTALL_STAGING_CMDS
>  	(cd $(@D); \
>  		$(GPSD_SCONS_ENV) \
> @@ -233,16 +242,10 @@ define GPSD_INSTALL_STAGING_CMDS
>  		install)
>  endef
>  
> -# After installing the udev rule, make it writable so that this
> +# After the udev rule is installed, make it writable so that this
>  # package can be re-built/re-installed.
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>  define GPSD_INSTALL_UDEV_RULES
> -	(cd $(@D); \
> -		$(GPSD_SCONS_ENV) \
> -		DESTDIR=$(TARGET_DIR) \
> -		$(HOST_DIR)/bin/python2 $(SCONS) \
> -		$(GPSD_SCONS_OPTS) \
> -		udev-install)
>  	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
>  endef
>  
> 
