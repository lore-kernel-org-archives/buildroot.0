From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Mar 2017 19:34:20 +0200
Subject: [Buildroot] [PATCH 1/1] lighttpd: source default file from
 startup script
In-Reply-To: <20170308152114.14851-1-philipp.skadorov@savoirfairelinux.com>
References: <20170308152114.14851-1-philipp.skadorov@savoirfairelinux.com>
Message-ID: <20170308173420.525msvchrmgpajia@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Philipp,

On Wed, Mar 08, 2017 at 10:21:14AM -0500, Philipp Skadorov wrote:
> lighttpd server runs cgi application that has no way to get environment
> variables that are set up for it.
> 
> S50lighttpd is changed to source /etc/default/lighttpd file where these
> environment variables can be set up.
> 
> Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
> ---
>  package/lighttpd/S50lighttpd | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lighttpd/S50lighttpd b/package/lighttpd/S50lighttpd
> index 44ac257c1..b3518cd27 100644
> --- a/package/lighttpd/S50lighttpd
> +++ b/package/lighttpd/S50lighttpd
> @@ -2,15 +2,21 @@
>  #
>  # Starts lighttpd.
>  #
> +NAME=lighttpd
> +DAEMON=/usr/sbin/$NAME
> +PID_FILE="/var/run/$NAME.pid"
> +CONF_FILE="/etc/$NAME/$NAME.conf"

Should be

  CONF_FILE="/etc/default/$NAME.conf"

to mach the commit log text.

> +
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
>  
>  start() {
>  	printf "Starting lighttpd: "
> -	start-stop-daemon -S -q -p /var/run/lighttpd.pid --exec /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf
> +	start-stop-daemon -S -q -p $PID_FILE --exec $DAEMON -- -f $CONF_FILE
>  	echo "OK"
>  }
>  stop() {
>  	printf "Stopping lighttpd: "
> -	start-stop-daemon -K -q -p /var/run/lighttpd.pid
> +	start-stop-daemon -K -q -p $PID_FILE
>  	echo "OK"
>  }
>  restart() {

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
