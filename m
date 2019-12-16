From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 09:33:59 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/mariadb: bump version to
 10.4.11
In-Reply-To: <20191215213326.10863-1-bluemrp9@gmail.com>
References: <20191215213326.10863-1-bluemrp9@gmail.com>
Message-ID: <20191216093359.7b3307eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

Thanks for the update. A few questions below.

On Sun, 15 Dec 2019 13:33:24 -0800
Ryan Coe <bluemrp9@gmail.com> wrote:

> diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
> index 62357fa8c4..270eea51dd 100644
> --- a/package/mariadb/S97mysqld
> +++ b/package/mariadb/S97mysqld
> @@ -23,12 +23,13 @@ wait_for_ready() {
>  start() {
>  	if [ `ls -1 $MYSQL_LIB | wc -l` = 0 ] ; then
>  		printf "Creating mysql system tables ... "
> -		$MYSQL_BIN/mysql_install_db --basedir=/usr --user=mysql \
> +		$MYSQL_BIN/mysql_install_db --basedir=/usr \
>  			--datadir=$MYSQL_LIB > /dev/null 2>&1
>  		if [ $? != 0 ]; then
>  			echo "FAIL"
>  			exit 1
>  		fi
> +		chown -R mysql:mysql /var/lib/mysql

Is this change related to the version bump ?

> diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
> index cd308310c6..3eaef173e1 100644
> --- a/package/mariadb/mysqld.service
> +++ b/package/mariadb/mysqld.service
> @@ -2,7 +2,7 @@
>  Description=MySQL database server
>  
>  [Service]
> -ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
> +ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql && chown -R mysql:mysql /var/lib/mysql'

So before this, the database files were owned by root? How could have
the mysqld daemon, which runs as the mysql user, use them? Isn't this
change a bug fix, that is completely independent of the version bump,
and should come before the version bump, and even be backported to
stable versions of Buildroot ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
