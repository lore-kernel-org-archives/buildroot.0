From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Apr 2018 18:07:25 +0200
Subject: [Buildroot] [PATCH 1/2] modem-manager: fix test of unset
 variable in init script
In-Reply-To: <20180413162521.7078-2-casantos@datacom.ind.br>
References: <20180413162521.7078-1-casantos@datacom.ind.br>
 <20180413162521.7078-2-casantos@datacom.ind.br>
Message-ID: <20180414180725.4964d59d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 13:25:20 -0300, Carlos Santos wrote:
> MODEMMANAGER_BIN was never set. Fortunately it did not break the script
> execution due to the permissive behavior of "test":
> 
>     $ test -x non-existing || echo error
>     error
>     $ test -x  || echo error
>     test -x && echo success
>     success
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/modem-manager/S44modem-manager | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
> index cf6d89601d..05803fe198 100755
> --- a/package/modem-manager/S44modem-manager
> +++ b/package/modem-manager/S44modem-manager
> @@ -3,6 +3,7 @@
>  # Starts ModemManager
>  #
>  
> +MODEMMANAGER_BIN=/usr/sbin/ModemManager
>  PIDFILE=/var/run/ModemManager.pid
>  
>  [ -x $MODEMMANAGER_BIN ] || exit 0

In fact, I think this test doesn't make sense. It just exits without
any error if the binary doesn't exists, which is silly.

I'm advocating for removing such tests altogether, which would make the
MODEMMANAGER_BIN variable unnecessary.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
