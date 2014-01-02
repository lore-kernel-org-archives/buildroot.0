From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jan 2014 14:27:38 +0100
Subject: [Buildroot] [PATCH alternative 2] dropbear: add support for
 custom arguments through config file
In-Reply-To: <989a4f7aa922a740098b.1388666082@argentina>
References: <989a4f7aa922a740098b.1388666082@argentina>
Message-ID: <20140102132738.GB3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-02 13:34 +0100, Thomas De Schampheleire spake thusly:
> The default port 22 used by dropbear for its SSH connections is not always
> desired. Dropbear accepts an option '-p' to set the port, but doing this was
> not possible from the buildroot-provided init script.
[--SNIP--]
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I prefer this second solution: let's keep it simple.

Regards,
Yann E. MORIN.

> ---
>  package/dropbear/S50dropbear |  10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> NOTE: this is alternative 2, using one variable for all config knobs.
> 
> diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
> --- a/package/dropbear/S50dropbear
> +++ b/package/dropbear/S50dropbear
> @@ -3,14 +3,20 @@
>  # Starts dropbear sshd.
>  #
>  
> +# Allow a few customizations from a config file
> +test -r /etc/default/dropbear && . /etc/default/dropbear
> +
>  start() {
> - 	echo -n "Starting dropbear sshd: "
> +	DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
> +
> +	echo -n "Starting dropbear sshd: "
>  	# Make sure dropbear directory exists
>  	if [ ! -d /etc/dropbear ] ; then
>  		mkdir -p /etc/dropbear
>  	fi
>  	umask 077
> -	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear -- -R
> +	start-stop-daemon -S -q -p /var/run/dropbear.pid \
> +		--exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
>  	[ $? == 0 ] && echo "OK" || echo "FAIL"
>  }
>  stop() {

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
