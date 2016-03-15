From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Mar 2016 16:58:39 -0700
Subject: [Buildroot] Another lame user question.
In-Reply-To: <CAHXCMMKHC8ktrqF9aH61Vhck_W6_-Z6Qg1L=oiN-1KuT5Aw1fg@mail.gmail.com>
References: <CAJJ6jxvqALyD4=1wPUdh7JKpv1fKkfoYcj-m4FZLe+1P2wnnFQ@mail.gmail.com>
 <20160314053654.GF7678@tarshish>
 <CAJJ6jxs-aPoTBv6OMoKkKN64OAscmG41dTCqrqsB6xkVSnAD+w@mail.gmail.com>
 <CAHXCMMKHC8ktrqF9aH61Vhck_W6_-Z6Qg1L=oiN-1KuT5Aw1fg@mail.gmail.com>
Message-ID: <CAJJ6jxv+a42YL5wbzusd2y-4aSL_d15W4JWhrKCvQ5e70YkVRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the tips. The user/group thing was a wild goose chase from
other internet users trying to get mysql to work.

I got mysql relocated. But still a mystery is how it SHOULD be done.
There are two files involved in configuring it. The
/etc/init.d/S97mysql starts/stops the service, but also passes some
command line args:

#!/bin/sh

case "$1" in
    start)
        if [ ! -d /data/mysql/mysql ] ; then
            echo "Creating MySQL system tables..."
            mysql_install_db --user=mysql --ldata=/data/mysql
        fi

        # mysqld runs as user mysql, but /run is only writable by root
        # so create a subdirectory for mysql.
        install -d -o mysql -g root -m 0700 /data/mysql

        # We don't use start-stop-daemon because mysqld has
        # its own wrapper script.
        printf "Starting mysql..."
        /usr/bin/mysqld_safe --pid-file=/data/mysql/mysqld.pid &
        echo "done."
        ;;
    stop)
        printf "Stopping mysql..."
        if test -f /data/mysql/mysqld.pid ; then
            kill `cat /data/mysql/mysqld.pid`
        fi
        echo "done."
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
        ;;
esac


and the important parts of my.cnf

# The following options will be passed to all MySQL clients
[client]
#password    = your_password
port        = 3306
socket        = /data/mysql/mysqld.sock

# Here follows entries for some specific programs

# The MySQL server
[mysqld]
port        = 3306
socket        = /data/mysql/mysqld.sock
skip-locking
key_buffer_size = 256M
max_allowed_packet = 1M
table_open_cache = 256
sort_buffer_size = 1M
read_buffer_size = 1M
read_rnd_buffer_size = 4M
myisam_sort_buffer_size = 64M
thread_cache_size = 8
query_cache_size= 16M
# Try number of CPU's*2 for thread_concurrency
thread_concurrency = 2
#dockstar data directory on r/w ubi partition.
datadir=/data/mysql


When I aligned these two files I could relocate the mysql data and pid
storage. But I don't know if I need all this redundant info or not.
When I get over my next unrelated hurdle I will come back and remove
one thing at a time and see what is needed and what isn't.

Thanks for the tips, Steve
