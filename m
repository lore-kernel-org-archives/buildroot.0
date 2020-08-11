From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 15:46:12 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/mariadb: patch
 mariadb_config to add sysroot path
In-Reply-To: <20200213174655.17309-1-bluemrp9@gmail.com>
References: <20200213174655.17309-1-bluemrp9@gmail.com>
Message-ID: <20200811154612.777ac5d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Thu, 13 Feb 2020 09:46:55 -0800
Ryan Coe <bluemrp9@gmail.com> wrote:

> This patch adds @CMAKE_SYSROOT@ to mariadb_config.c.in. Without it,
> mariadb_config and mysql_config incorrectly returns host paths for
> include paths and library paths.
> 
> Upstream report and status:
> https://jira.mariadb.org/browse/CONC-454
> https://github.com/mariadb-corporation/mariadb-connector-c/pull/127
> 
> Reported-by: Alexey Lukyanchuk <skif@skif-web.ru>
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

I am getting back to this older e-mail, because today I tried to use
mysql_config when MariaDB is the MySQL provider, and it doesn't work,
because it calls mariadb_config, which itself is a program compiled for
the target:

$ ./output/staging/usr/bin/mysql_config --cflags
/lib/ld-uClibc.so.0: No such file or directory
/lib/ld-uClibc.so.0: No such file or directory
/lib/ld-uClibc.so.0: No such file or directory
/lib/ld-uClibc.so.0: No such file or directory

And indeed:

$ file output/staging/usr/bin/mariadb_config 
output/staging/usr/bin/mariadb_config: ELF 32-bit LSB shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, with debug_info, not stripped

In other projects, the <something>_config program is a script, so it
works fine on the host.

How have you been using mariadb_config ?

Here, the issue is that we don't have a consistent behavior between
oracle-mysql (which installs a working
$(STAGING_DIR)/usr/bin/mysql_config) and mariadb (which doesn't install
a working $(STAGING_DIR)/usr/bin/mysql_config).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
