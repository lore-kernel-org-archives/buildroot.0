From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jul 2015 19:17:12 +0200
Subject: [Buildroot] [PATCH v2] package/dropbear: Fix symlink only if
 pointing to the right directory
In-Reply-To: <1438071691-9078-1-git-send-email-paul@crapouillou.net>
References: <1438071691-9078-1-git-send-email-paul@crapouillou.net>
Message-ID: <20150728171712.GA3694@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2015-07-28 10:21 +0200, Paul Cercueil spake thusly:
> This commit ensures that the /etc/dropbear symlink won't be removed if
> it points elsewhere than /var/run/dropbear.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> v2: Use "readlink -f", as the symbolic link might be pointing to a relative
> path and not an absolute path.
> 
>  package/dropbear/S50dropbear      | 6 ++++--
>  package/dropbear/dropbear.service | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
> index af50ccf..f551677 100644
> --- a/package/dropbear/S50dropbear
> +++ b/package/dropbear/S50dropbear
> @@ -12,12 +12,14 @@ start() {
>  	echo -n "Starting dropbear sshd: "
>  	umask 077
>  
> -	# If /etc/dropbear is not a directory, and
> +	# If /etc/dropbear is a symlink to /var/run/dropbear, and
>  	#   - the filesystem is RO (i.e. we can not rm the symlink),
>  	#     create the directory pointed to by the symlink.
>  	#   - the filesystem is RW (i.e. we can rm the symlink),
>  	#     replace the symlink with an actual directory
> -	if ! [ -d /etc/dropbear ]; then
> +	if [ -L /etc/dropbear \
> +		-a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]

Indentation here is a bit too much, I'd line up the '-a' below the '-L'.

> +	then
>  		if rm -f /etc/dropbear; then
>  			mkdir -p /etc/dropbear
>  		else
> diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
> index 0e2cf54..f1d4d5d 100644
> --- a/package/dropbear/dropbear.service
> +++ b/package/dropbear/dropbear.service
> @@ -3,13 +3,13 @@ Description=Dropbear SSH daemon
>  After=syslog.target network.target auditd.service
>  
>  [Service]
> -# If /etc/dropbear is not a directory, and
> +# If /etc/dropbear is a symlink to /var/run/dropbear, and
>  #   - the filesystem is RO (i.e. we can not rm the symlink),
>  #     create the directory pointed to by the symlink.
>  #   - the filesystem is RW (i.e. we can rm the symlink),
>  #     replace the symlink with an actual directory
>  ExecStartPre=/bin/sh -c '\
> -if ! [ -d /etc/dropbear ]; then \
> +if [ -L /etc/dropbear -a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]; then \

It would be good here to keep the lines short, too.

Otherwise, I'm OK; once you fix this (or the maintainer applies this,
you can add my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>      if rm -f /etc/dropbear; then \
>          mkdir -p /etc/dropbear; \
>      else \
> -- 
> 2.4.6
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
