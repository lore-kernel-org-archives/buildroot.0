From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2016 21:12:20 +0100
Subject: [Buildroot] [PATCH] procps-ng: remove the remaining busybox
 symlinks
In-Reply-To: <1452608581-9742-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1452608581-9742-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160112211220.2b7c24bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Tue, 12 Jan 2016 14:23:01 +0000, Vicente Olivert Riera wrote:
> procps-ng is installed after busybox to ensure that its tools overwrite
> the ones installed by busybox. However, some busybox symlinks for tools
> which are now provided by procps-ng remain in /bin and /sbin pointing to
> the busybox binary.
> 
> This shouldn't be a problem since the /usr/bin directory is listed
> before /bin in the $PATH variable. However there could be some scripts
> out there hardcoding the path of those tools calling them by "/bin/ps"
> for instance.
> 
> So in order to avoid potential problems we just remove all busybox
> symlinks for the tools which are now provided by procps-ng.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/procps-ng/procps-ng.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
> index 07e98b9..784977d 100644
> --- a/package/procps-ng/procps-ng.mk
> +++ b/package/procps-ng/procps-ng.mk
> @@ -17,8 +17,23 @@ PROCPS_NG_GETTEXTIZE = YES
>  
>  # If both procps-ng and busybox are selected, make certain procps-ng
>  # wins the fight over who gets to have their utils actually installed.
> +# Also remove the remaining busybox symlinks for tools which are now
> +# provided by procps-ng.
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  PROCPS_NG_DEPENDENCIES += busybox
> +
> +define PROCPS_NG_REMOVE_BUSYBOX_COUNTERPARTS
> +	for i in free kill pgrep pidof pkill pmap ps pwdx slabtop tload top uptime vmstat w watch; do \
> +		if [ "$$(readlink $(TARGET_DIR)/bin/$$i)" == "busybox" ]; then \
> +			rm $(TARGET_DIR)/bin/$$i; \
> +		fi; \
> +	done
> +
> +	if [ "$$(readlink $(TARGET_DIR)/sbin/sysctl)" == "../bin/busybox" ]; then \
> +		rm $(TARGET_DIR)/sbin/sysctl; \
> +	fi
> +endef
> +PROCPS_NG_POST_INSTALL_TARGET_HOOKS += PROCPS_NG_REMOVE_BUSYBOX_COUNTERPARTS
>  endif

I don't think we're doing it this way for any other package. In
general, we either:

 * Arrange for the package to install its tools at the same location as
   Busybox installs them.

 * Or add a post-install hook to move the binaries installed by the
   package to where Busybox installs them.

Peter, Yann ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
