From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 10:03:30 +0200
Subject: [Buildroot] [PATCHv3] busybox: improve support for telnetd
In-Reply-To: <1436660410-13431-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436660410-13431-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150712080330.GA4008@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Alexey, All,

On 2015-07-12 02:20 +0200, Thomas Petazzoni spake thusly:
> From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> 
> If target has connection to the network it might be pretty useful to
> have telnet connection to it instead of serial console or even in
> addition to serial console.
[--SNIP--]
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 92874cd..35f1e96 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
[--SNIP--]
> +define BUSYBOX_ADJUST_TELNET_SECURETTY
> +	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
> +		for i in `seq 0 3` ; do \
> +			grep -q "pts/$$i" $(TARGET_DIR)/etc/securetty || \
> +				echo "pts/$$i" >> $(TARGET_DIR)/etc/securetty ; \

Why don't we simply add those four in our securetty, directly in our
skeleton?

> +		done ; \
> +	fi
> +endef
> +
> +BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_ADJUST_TELNET_SECURETTY
> +
>  # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
>  # full-blown versions of apps installed by other packages with sym/hard links.
>  define BUSYBOX_NOCLOBBER_INSTALL
> @@ -185,6 +204,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>  	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
>  	$(BUSYBOX_SET_INIT)
>  	$(BUSYBOX_SET_WATCHDOG)
> +	$(BUSYBOX_SET_STANDALONE_TELNETD)

BUSYBOX_SET_STANDALONE_TELNETD is no longer defined. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
