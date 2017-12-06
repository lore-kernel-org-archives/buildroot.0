From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 23:06:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: Install default config and
 systemd .service file
In-Reply-To: <20171206110906.18712-1-mlang@blind.guru>
References: <20171206110906.18712-1-mlang@blind.guru>
Message-ID: <20171206230603.1761a8b8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Dec 2017 12:09:06 +0100, Mario Lang wrote:
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
>  package/tor/tor.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 6a42dbce53..690772f5c0 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -47,4 +47,16 @@ endif
>  # uses gnu extensions
>  TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  
> +define TOR_INSTALL_CONF
> +	$(INSTALL) -D -m 644 $(@D)/src/config/torrc.minimal \
> +		$(TARGET_DIR)/etc/tor/torrc
> +endef
> +
> +TOR_POST_INSTALL_TARGET_HOOKS += TOR_INSTALL_CONF
> +
> +define TOR_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 664 $(@D)/contrib/dist/tor.service \

This 664 mode didn't make much sense to me, we're using 644 everywhere
else to install systemd .service files.

So I've fixed that to use 644 instead and applied.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
