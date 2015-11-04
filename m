From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 11:14:07 +0100
Subject: [Buildroot] [PATCH v3 06/13] package/dhcp: systemd: allow
	missing environment file
In-Reply-To: <1445734779-7212-6-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-6-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <CAGduivxGQHa11h1WRwTj53eWZ0zgDReDEZz-=mmQjyrUuYjjxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <
benoit.thebaudeau.dev@gmail.com> wrote:

> The dhcpd daemon does not require network interface names to be
> specified on the command line.
>
> >From dhcpd(8):
> "The names of the network interfaces on which dhcpd should listen for
> broadcasts may be specified on the command line.  This should be done
> on systems where dhcpd is unable to identify non-broadcast interfaces,
> but should not be required on other systems.  If no interface names
> are specified on the command line dhcpd will identify all network
> interfaces which are up, eliminating non-broadcast interfaces if
> possible, and listen for DHCP broadcasts on each interface."
>
> dhcpd exits with "Not configured to listen on any interfaces!" only if
> no requested (those in INTERFACES, or all if empty) non-broadcast
> interfaces matching the subnet declarations in dhcpd.conf are up.
>
> Also, no extra options are required on the command line, which means
> that the EnvironmentFile file does not have to be present, so make it
> optional.
>
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
>
> ---
> Changes v2 -> v3: new patch.
> ---
>  package/dhcp/dhcpd.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
> index ad1300c..98cc54b 100644
> --- a/package/dhcp/dhcpd.service
> +++ b/package/dhcp/dhcpd.service
> @@ -7,7 +7,7 @@ Type=forking
>  PIDFile=/run/dhcpd.pid
>  ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $OPTIONS $INTERFACES
>  KillSignal=SIGINT
> -EnvironmentFile=/etc/default/dhcpd
> +EnvironmentFile=-/etc/default/dhcpd
>
>  [Install]
>  WantedBy=multi-user.target
>
Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/c3ae58c8/attachment.html>
