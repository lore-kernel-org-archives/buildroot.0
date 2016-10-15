From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 15 Oct 2016 10:38:55 +0200
Subject: [Buildroot] [PATCH 1/1] mysql: Make S97mysqld source a default
 file
In-Reply-To: <1476383282-10739-1-git-send-email-eloi.bail@savoirfairelinux.com>
References: <1476383282-10739-1-git-send-email-eloi.bail@savoirfairelinux.com>
Message-ID: <0dd340cf-7cd1-497b-9ce4-cc344dd0d2a4@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eloi,

On 13/10/16 20:28, Eloi BAIL wrote:
> Hardcoded parameters are used for mysql installation.
> Make S97mysqld source a /etc/default/mysql file where these
> parameters can be overridden.
>
> Signed-off-by: Eloi BAIL <eloi.bail@savoirfairelinux.com>

I've done a run test on qemu creating different /etc/default/mysql 
files. Everything worked as expected, so...

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

However I'm not sure if this approach is correct as someone may expect a 
different content in the default file. For instance a content compatible 
to be used with the --defaults-file and --defaults-extra-file options:

[mysql_install_db]
user    = mysql
datadir = /var/mysql

Why don't we call mysql_install_db with those options passing that kind 
of default file, instead of sourcing it as you do in your patch? There 
are two options to do that. The first one is doing it manually (not in 
the init script). The second one is to do it in the init script, as is 
done right now, but we would need to grab the value of "datadir" with 
something like "grep datadir /etc/default/mysql | cut -d= -f2".

Let's see what the others devs think about it.

Regards,

Vincent.

> ---
>  package/mysql/S97mysqld | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/mysql/S97mysqld b/package/mysql/S97mysqld
> index 5a660e9..638790f 100644
> --- a/package/mysql/S97mysqld
> +++ b/package/mysql/S97mysqld
> @@ -1,10 +1,14 @@
>  #!/bin/sh
>
> +MYSQL_DIR="/var/mysql"
> +MYSQL_USER="mysql"
> +[ -r /etc/default/mysql ] && . /etc/default/mysql
> +
>  case "$1" in
>  	start)
> -		if [ ! -d /var/mysql/mysql ] ; then
> +		if [ ! -d $MYSQL_DIR/mysql ] ; then
>  			echo "Creating MySQL system tables..."
> -			mysql_install_db --user=mysql --ldata=/var/mysql
> +			mysql_install_db --user=$MYSQL_USER --ldata=$MYSQL_DIR
>  		fi
>
>  		# mysqld runs as user mysql, but /run is only writable by root
>
