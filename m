From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 12:05:07 +0200
Subject: [Buildroot] [PATCH] sane-backends: add systemd support
In-Reply-To: <1444150432-23644-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444150432-23644-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151010120507.0b393f2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

Can you review/ack the below patch?

Thanks,

Thomas

On Tue, 6 Oct 2015 17:53:52 +0100, Vicente Olivert Riera wrote:
> The content and the location of the saned.socket and saned at .service
> files is based on the instructions of the sane-backends manual.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Notes to the maintainer:
>   - This patch is meant to be applied after:
>     http://patchwork.ozlabs.org/patch/526815/
> 
>  package/sane-backends/sane-backends.mk |   14 ++++++++++++++
>  package/sane-backends/saned.socket     |   10 ++++++++++
>  package/sane-backends/saned at .service   |   18 ++++++++++++++++++
>  3 files changed, 42 insertions(+), 0 deletions(-)
>  create mode 100644 package/sane-backends/saned.socket
>  create mode 100644 package/sane-backends/saned at .service
> 
> diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
> index 0c0b5a9..82b5052 100644
> --- a/package/sane-backends/sane-backends.mk
> +++ b/package/sane-backends/sane-backends.mk
> @@ -14,6 +14,13 @@ SANE_BACKENDS_INSTALL_STAGING = YES
>  SANE_BACKENDS_CONF_OPTS = \
>  	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthread,--disable-pthread)
>  
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +SANE_BACKENDS_CONF_OPTS += --with-systemd
> +SANE_BACKENDS_DEPENDENCIES += systemd
> +else
> +SANE_BACKENDS_CONF_OPTS += --without-systemd
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBUSB),y)
>  SANE_BACKENDS_DEPENDENCIES += libusb
>  SANE_BACKENDS_CONF_OPTS += --enable-libusb_1_0
> @@ -50,4 +57,11 @@ endef
>  
>  SANE_BACKENDS_POST_CONFIGURE_HOOKS += SANE_BACKENDS_DISABLE_DOCS
>  
> +define SANE_BACKENDS_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0644 -D package/sane-backends/saned.socket \
> +		$(TARGET_DIR)/etc/systemd/system/saned.socket
> +	$(INSTALL) -m 0644 -D package/sane-backends/saned at .service \
> +		$(TARGET_DIR)/etc/systemd/system/saned at .service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/sane-backends/saned.socket b/package/sane-backends/saned.socket
> new file mode 100644
> index 0000000..1aa19e7
> --- /dev/null
> +++ b/package/sane-backends/saned.socket
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=saned incoming socket
> +
> +[Socket]
> +ListenStream=6566
> +Accept=yes
> +MaxConnections=1
> +
> +[Install]
> +WantedBy=sockets.target
> diff --git a/package/sane-backends/saned at .service b/package/sane-backends/saned at .service
> new file mode 100644
> index 0000000..1905dbf
> --- /dev/null
> +++ b/package/sane-backends/saned at .service
> @@ -0,0 +1,18 @@
> +[Unit]
> +Description=Scanner Service
> +Requires=saned.socket
> +
> +[Service]
> +ExecStart=/usr/sbin/saned
> +User=saned
> +Group=saned
> +StandardInput=null
> +StandardOutput=syslog
> +StandardError=syslog
> +Environment=SANE_CONFIG_DIR=/etc/sane.d
> +# If you need to debug your configuration uncomment the next line and
> +# change it as appropriate to set the desired debug options
> +# Environment=SANE_DEBUG_DLL=255 SANE_DEBUG_BJNP=5
> +
> +[Install]
> +Also=saned.socket



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
