From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 08:57:56 +0100
Subject: [Buildroot] [PATCH 1/1] netplug (/etc/init.d/S29netplug): Fix
 the quoting of ${NETWORKING}.
In-Reply-To: <20181115134818.11190-1-thomas.claveirole@green-communications.fr>
References: <20181115134818.11190-1-thomas.claveirole@green-communications.fr>
Message-ID: <20181120085756.40fc677c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 14:48:17 +0100, Thomas Claveirole wrote:
> Since 4adaa581b27dc27298eb7cc421ee8f530f88e18e, S29netplug looks for
> /etc/default/network instead of /etc/sysconfig/network.  When this
> file exists but does not define $NETWORKING, the script fails on line
> 29 with something like:
> 
> /etc/init.d/S29netplug: 29: [: =: unexpected operator
> 
> Fix quoting so this error no longer happens.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/netplug/S29netplug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
> index 66459061b3..6c344662bb 100755
> --- a/package/netplug/S29netplug
> +++ b/package/netplug/S29netplug
> @@ -26,7 +26,7 @@ if [ -f /etc/default/network ]; then
>  	. /etc/default/network
>  
>  	# Check that networking is up.
> -	[ ${NETWORKING} = "no" ] && exit 0
> +	[ "$NETWORKING" = no ] && exit 0

I don't think it was really necessary to remove the double quotes
around "no", and to remove the curly braces to reference the variable.
So I've added those back, tweaked the commit title and applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
