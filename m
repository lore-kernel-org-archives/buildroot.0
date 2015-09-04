From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 14:20:24 +0100
Subject: [Buildroot] [PATCH v2 6/6] targetcli-fb: systemd support
In-Reply-To: <1441266926-2942-6-git-send-email-cvubrugier@fastmail.fm>
References: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
 <1441266926-2942-6-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <55E99A98.1030309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On 09/03/2015 08:55 AM, Christophe Vu-Brugier wrote:
> The systemd service file is taken from Fedora.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/targetcli-fb/target.service  | 14 ++++++++++++++
>  package/targetcli-fb/targetcli-fb.mk |  8 +++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 package/targetcli-fb/target.service
> 
> diff --git a/package/targetcli-fb/target.service b/package/targetcli-fb/target.service
> new file mode 100644
> index 0000000..400284e
> --- /dev/null
> +++ b/package/targetcli-fb/target.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Restore LIO kernel target configuration
> +Requires=sys-kernel-config.mount
> +After=sys-kernel-config.mount network.target local-fs.target
> +
> +[Service]
> +Type=oneshot
> +RemainAfterExit=yes
> +ExecStart=/usr/bin/targetctl restore
> +ExecStop=/usr/bin/targetctl clear
> +SyslogIdentifier=target
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
> index 0a64c46..cf7f29f 100644
> --- a/package/targetcli-fb/targetcli-fb.mk
> +++ b/package/targetcli-fb/targetcli-fb.mk
> @@ -12,7 +12,13 @@ TARGETCLI_FB_SETUP_TYPE = setuptools
>  TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
>  
>  define TARGETCLI_FB_INSTALL_INIT_SYSV
> -	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target $(TARGET_DIR)/etc/init.d/S50target
> +	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
> +		$(TARGET_DIR)/etc/init.d/S50target
> +endef
> +
> +define TARGETCLI_FB_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0644 -D package/targetcli-fb/target.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/target.service
>  endef
>  
>  # Targetcli stores its configuration in /etc/target/saveconfig.json
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ file output/target/usr/lib/systemd/system/target.service
output/target/usr/lib/systemd/system/target.service: ASCII text

Although I'm a bit confused since I googled about it and it seems the
target.service file should be installed by python-rtslib-fb instead:

https://github.com/agrover/targetcli-fb/issues/39#issuecomment-37868163
https://wiki.archlinux.org/index.php/ISCSI_Target#Setup_with_LIO_Target

Regards,

Vincent.
