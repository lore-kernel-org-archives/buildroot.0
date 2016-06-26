From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 Jun 2016 23:09:25 +0200
Subject: [Buildroot] [PATCH] package/quagga: Add systemd.service file
In-Reply-To: <1466874128-22828-1-git-send-email-nroach44@gmail.com>
References: <1466874128-22828-1-git-send-email-nroach44@gmail.com>
Message-ID: <91c2c2b3-7715-2ab6-31ab-144aa346c54b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-06-16 19:02, Nathaniel Roach wrote:
> Use a template service file as all of the daemons use almost
> identical arguments and generally appear the same to the init
> system.
> 
> We "Wants=" zebra as that's the daemon for interfacing to the
> kernel, and it's not required for the other daemons to work
> but it's probably going to be used in nearly all setups.
> 
> /usr/bin/env is needed as systemd doesn't allow the instance
> variable (%i) in the executable path.
> 
> We don't enable these services by default as this would require
> creating configuration and /etc/default files. (And is easily
> achieved with an FS overlay)
                             ^missing .

 So the goal of this patch is that the user simply can symlink to instead of
having to create the service file.

 However, since the Wants= is added for zebra, it would make sense to create the
zebra symlink, no?

> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
> Changes v1 -> v2:
>  (As suggested by Arnout Vandecappelle)
>  - Completely remove shim and use /usr/bin/env instead
>  - Don't tell quagga to fork as systemd prefers it
>  - Add comment to .service file about /usr/bin/env
>  - Explain not enabling the service on build in patch
> 
> ---
>  package/quagga/quagga.mk       |  3 +++
>  package/quagga/quagga at .service | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/quagga/quagga at .service
> 
> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> index 22e90ad..5b5623f 100644
> --- a/package/quagga/quagga.mk
> +++ b/package/quagga/quagga.mk
> @@ -75,6 +75,9 @@ endif
>  define QUAGGA_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
>  		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
> +

 This empty line is redundant.

> +	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/quagga at .service
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/quagga/quagga at .service b/package/quagga/quagga at .service
> new file mode 100644
> index 0000000..b17af89
> --- /dev/null
> +++ b/package/quagga/quagga at .service
> @@ -0,0 +1,20 @@
> +[Unit]
> +Description=Quagga %i routing daemon
> +PartOf=quagga.service

 I don't understand this. Doesn't the quagga.service actually have to exist for
this to be valid?

> +ReloadPropagatedFrom=quagga.service
> +Wants=quagga at zebra.service

 I just realize now: this line should probably be removed when
BR2_PACKAGE_QUAGGA_ZEBRA is not set.

> +
> +[Service]
> +PrivateTmp=true
> +KillMode=mixed

 It would make sense to keep this together with KillSignal.

> +Type=simple
> +EnvironmentFile=/etc/default/quagga-%i
> +# Systemd doesn't like having %i in the executable path.
> +ExecStart=/usr/bin/env /usr/sbin/%i $OPTS -f /etc/quagga/%i.conf -i /var/run/quagga/%i.pid
> +PIDFile=/var/run/quagga/%i.pid

 I repeat, I'm not very familiar with systemd, but as I understand it PID files
shouldn't be needed anymore with a Type=simple daemon. Unless of course if
quagga uses them somewhere else too.


 Regards,
 Arnout

> +KillSignal=SIGINT
> +Restart=on-failure
> +RestartSec=1
> +
> +[Install]
> +WantedBy=multi-user.target
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
