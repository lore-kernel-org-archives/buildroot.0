From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu, 2 Jan 2020 07:25:54 -0800
Subject: [Buildroot] [PATCH 1/2] package/perl-dbd-mysql: bump to version
 4.050
In-Reply-To: <20200102143511.5773b287@windsurf>
References: <20200102114347.2403649-1-chrismcc@gmail.com>
 <CALURroQk+Re-mxVK_=amf0hJRKYb8U8roihZ9=LFwgZSVXXvCQ@mail.gmail.com>
 <20200102143511.5773b287@windsurf>
Message-ID: <CALURroSHL6Vuc3m9J3KKcd=s+d4hg1mvqs0nqc80c3i6qFO+rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 2, 2020 at 5:35 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Thu, 2 Jan 2020 03:55:43 -0800
> Christopher McCrory <chrismcc@gmail.com> wrote:
>
> > For MariaDB I also needed::
> >
> > chrismcc at centos8-lxc git]$ cat external/packages/fixup-mariadb/
> > fixup-mariadb.mk
> >
> ################################################################################
> > #
> > # fixup-mariadb
> > #
> >
> ################################################################################
> >
> > ifeq ($(BR2_PACKAGE_FIXUP_MARIADB),y)
> >
> > define MARIADB_POST_INSTALL_STAGING_MORE
> >         $(RM) -v $(STAGING_DIR)/usr/bin/mariadb_config
> > endef
> >
> > MARIADB_POST_INSTALL_STAGING_HOOKS += MARIADB_POST_INSTALL_STAGING_MORE
>
> Why is it necessary to remove this file from staging? This doesn't seem
> right.
>
>
When selecting mariadb to provide mysql instead of oracle-mysql, every
package in buildroot that wants to link against libmysqlclient will fail.

mysql (from both providers) creates mysql_config, a fancy shell script to
output the same as pkgconf would. -I/foo/bar, -L/baz, etc. MariaDB also
creates mariadb_config which does the same thing, but instead of a shell
script, is written in C. mariadb's mysql_config looks for mariadb_config
and if it exists, uses it. When cross compiling for a different
architecture, this will fail and most output is blank. If it does not
exist, the rest of the shell script is used and outputs the correct bits -

chrismcc at centos8-lxc bin]$ ./mariadb_config
-bash: ./mariadb_config: cannot execute binary file: Exec format error
[chrismcc at centos8-lxc bin]$ file ./mariadb_config
./mariadb_config: ELF 32-bit LSB shared object, ARM, EABI5 version 1
(SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for
GNU/Linux 4.19.0, stripped


[chrismcc at centos8-lxc rpi3]$ ./staging/usr/bin/mysql_config
Usage: ./staging/usr/bin/mysql_config [OPTIONS]
Options:
        --cflags
[-I/home/chrismcc/git/rpi3/staging/usr/include/mysql
-I/home/chrismcc/git/rpi3/staging/usr/include/mysql/.. ]
        --include
 [-I/home/chrismcc/git/rpi3/staging/usr/include/mysql
-I/home/chrismcc/git/rpi3/staging/usr/include/mysql/..]
        --libs           [-L/home/chrismcc/git/rpi3/staging/usr/lib/mysql
 -lmariadb -lpthread -lz -ldl -lm -lssl -lcrypto]
        --libs_r         [-L/home/chrismcc/git/rpi3/staging/usr/lib/mysql
 -lmariadb -lpthread -lz -ldl -lm -lssl -lcrypto]
etc.


[chrismcc at centos8-lxc rpi3]$ cp target/usr/bin/mariadb_config
staging/usr/bin/ -vb
'target/usr/bin/mariadb_config' -> 'staging/usr/bin/mariadb_config'

[chrismcc at centos8-lxc rpi3]$ ./staging/usr/bin/mysql_config
./staging/usr/bin/mysql_config: line 100:
/home/chrismcc/git/rpi3/staging/usr/bin/mariadb_config: cannot execute
binary file: Exec format error
./staging/usr/bin/mysql_config: line 101:
/home/chrismcc/git/rpi3/staging/usr/bin/mariadb_config: cannot execute
binary file: Exec format error
./staging/usr/bin/mysql_config: line 102:
/home/chrismcc/git/rpi3/staging/usr/bin/mariadb_config: cannot execute
binary file: Exec format error
./staging/usr/bin/mysql_config: line 103:
/home/chrismcc/git/rpi3/staging/usr/bin/mariadb_config: cannot execute
binary file: Exec format error
./staging/usr/bin/mysql_config: line 104:
/home/chrismcc/git/rpi3/staging/usr/bin/mariadb_config: cannot execute
binary file: Exec format error
./staging/usr/bin/mysql_config: line 105:
/home/chrismcc/git/rpi3/staging/usr/bin/mariadb_config: cannot execute
binary file: Exec format error
./staging/usr/bin/mysql_config: line 106:
/home/chrismcc/git/rpi3/staging/usr/bin/mariadb_config: cannot execute
binary file: Exec format error
Usage: ./staging/usr/bin/mysql_config [OPTIONS]
Options:
        --cflags         []
        --include        []
        --libs           []
        --libs_r         []
        --plugindir      []
        --socket         []
        --port           []
        --version        []
        --libmysqld-libs [-L/home/chrismcc/git/rpi3/staging/usr/lib/mysql
 -lmysqld]
        --variable=VAR   VAR is one of:
                pkgincludedir
[/home/chrismcc/git/rpi3/staging/usr/include/mysql]
                pkglibdir
[/home/chrismcc/git/rpi3/staging/usr/lib/mysql]
                plugindir     []


 make rsyslog
...
aking all in plugins/ommysql
  CC       ommysql_la-ommysql.lo
ommysql.c:37:10: fatal error: mysql.h: No such file or directory
 #include <mysql.h>
          ^~~~~~~~~
compilation terminated.
make[4]: *** [Makefile:553: ommysql_la-ommysql.lo] Error 1
make[3]: *** [Makefile:918: all-recursive] Error 1
make[2]: *** [Makefile:745: all] Error 2
make[1]: *** [package/pkg-generic.mk:260:
/home/chrismcc/git/rpi3/build/rsyslog-8.1911.0/.stamp_built] Error 2
make: *** [Makefile:23: _all] Error 2

grep -r mysql_config buildroot/package/should show a few others. Other
packages would have it in the source code.



So, When selecting mariadb to provide mysql instead of oracle-mysql, every
package in buildroot that wants to link against libmysqlclient via
mysql_config will fail.
 $(RM) -v $(STAGING_DIR)/usr/bin/mariadb_config
fixes that.

I suspect the autobuilders never select the alternate for a virtual
package. mysql, libssl, etc. Otherwise this should have shown up earlier.




> > define MARIADB_POST_INSTALL_MORE
> > $(RM) -r $(TARGET_DIR)/usr/data
> > endef
>
> What is this removing? Why is it important? Do we want to have this
> removal in mariadb.mk in upstream Buildroot?
>
>
Its extra from all the tests that make install spews out. Yes it could be
in the mariasd.mk file.





> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200102/da27a95d/attachment.html>
