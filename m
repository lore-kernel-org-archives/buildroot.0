From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Nov 2017 22:18:38 +0100
Subject: [Buildroot] [PATCH] dropbear: change start-up script to honour
 pre-existing keys
In-Reply-To: <20171115194509.78132-1-code@mmayer.net>
References: <20171115194509.78132-1-code@mmayer.net>
Message-ID: <74751d46-877e-ef18-ce79-0e7c6f46e5d9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-11-17 20:45, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> Rather than starting dropbear with option -R at all times, we only do
> so if no existing key file is found. This lets dropbear honour
> pre-existing key files, including keys copied into the root file system
> at build time.

 That's exactly what the -R option does, no? It creates host keys if they don't
exist yet. Cfr. svr_ensure_hostkey in svr-kex.c.

 Regards,
 Arnout

> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/dropbear/S50dropbear | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
> index 9474eaa..8eea9ae 100644
> --- a/package/dropbear/S50dropbear
> +++ b/package/dropbear/S50dropbear
> @@ -7,7 +7,7 @@
>  test -r /etc/default/dropbear && . /etc/default/dropbear
>  
>  start() {
> -	DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
> +	msg=' '
>  
>  	# If /etc/dropbear is a symlink to /var/run/dropbear, and
>  	#   - the filesystem is RO (i.e. we can not rm the symlink),
> @@ -26,7 +26,14 @@ start() {
>  		fi
>  	fi
>  
> -	printf "Starting dropbear sshd: "
> +	ls /etc/dropbear/*host_key >/dev/null 2>&1
> +	if [ $? != 0 ]; then
> +		# No key files found. We need to generate a key.
> +		DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
> +		msg='(with new key) '
> +	fi
> +
> +	printf "Starting dropbear sshd: $msg"
>  	umask 077
>  
>  	start-stop-daemon -S -q -p /var/run/dropbear.pid \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
