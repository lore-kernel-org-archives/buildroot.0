From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 1 Nov 2018 22:28:17 -0500
Subject: [Buildroot] [PATCH] ifupdown-script: send current hostname in
 DHCP request
In-Reply-To: <20181030171614.32609-1-peter@korsgaard.com>
References: <20181030171614.32609-1-peter@korsgaard.com>
Message-ID: <CANQCQpbA-2rdHtpBs8sE=R0UE0R+GGY4fXza-kxtY+x_7LrLdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, Oct 30, 2018 at 12:16 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> For the default (BR2_SYSTEM_DHCP) /etc/network/interfaces handling.
>
> Both the "big" and busybox ifupdown variants pass the hostname argument to
> the DHCP client through the shell, so we can use $() to expand to the
> current hostname value.
>
The man page for the interfaces file mentioned that only pump, dhcpcd
and udhcpc use the hostname value from interfaces.  With dhclient
requiring the dhclient.conf to specify the set hostname option with
the hostname string.  Would it be worth mentioning that here in the
comment that for most (pump, dhcpcd, udhcpc) the hostname parameter
will work but some clients like dhclient require a separate
configuration file?

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/ifupdown-scripts/ifupdown-scripts.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
> index ebc89b3872..17364aed03 100644
> --- a/package/ifupdown-scripts/ifupdown-scripts.mk
> +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
> @@ -23,6 +23,7 @@ define IFUPDOWN_SCRIPTS_DHCP
>                 echo "iface $(IFUPDOWN_SCRIPTS_DHCP_IFACE) inet dhcp"; \
>                 echo "  pre-up /etc/network/nfs_check"; \
>                 echo "  wait-delay 15"; \
> +               echo "  hostname \$$(hostname)"; \
>         ) >> $(TARGET_DIR)/etc/network/interfaces
>         $(INSTALL) -m 0755 -D $(IFUPDOWN_SCRIPTS_PKGDIR)/nfs_check \
>                 $(TARGET_DIR)/etc/network/nfs_check
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
