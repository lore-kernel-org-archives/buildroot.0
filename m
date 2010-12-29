From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 29 Dec 2010 20:52:31 +0100
Subject: [Buildroot] building mysqlclient fails when using gcc 4.51 :
	do_abi_check needs perl ?
Message-ID: <E1292EBFD5E7463BA24ECFD251C4CCE0@apexjs>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi
 
This build seems to fail on do_abi_check when using GCC 451 (EABI or OABI
selection in buildroot does not matter):

I have no idea if this is a GCC 4.5 issue or something with mysql client or
some other reason.

Maybe do_abi_check needs perl (see the PATH below) but i do not have any
perl stuff enabled in buildroot ? 

Regards ,
Johan


[7m>>> mysql_client 5.1.47 Building[27m
PATH="/home/johan/buildroot/output/host/bin:/home/johan/buildroot/output/hos
t/usr/bin:/home/johan/buildroot/output/host/usr/sbin/:/usr/local/sbin:/usr/l
ocal/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/johan/buildroot/output/build/st
aging_dir/usr/bin" PERLLIB="/home/johan/buildroot/output/host/usr/lib/perl"
/usr/bin/make -j2  -C
/home/johan/buildroot/output/build/mysql_client-5.1.47/
make[1]: Entering directory
`/home/johan/buildroot11/output/build/mysql_client-5.1.47'
Making all in .
make[2]: Entering directory
`/home/johan/buildroot11/output/build/mysql_client-5.1.47'
/usr/bin/make abi_headers="include/mysql/plugin.h include/mysql.h"
do_abi_check
make[3]: Entering directory
`/home/johan/buildroot11/output/build/mysql_client-5.1.47'
set -ex; \
	for file in include/mysql/plugin.h include/mysql.h; do \
	
/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-unknown-linux-ucl
ibc-gcc --sysroot=/home/johan/buildroot/output/build/staging_dir -E
-nostdinc -dI \
	                  -I./include \
	                  -I./include/mysql \
	                  -I./sql \
	                  -I./include \
	                  -I./include/mysql \
	                  -I./sql \
	                                 $file 2>/dev/null | \
	                  /bin/sed -e '/^# /d' \
	                            -e '/^[ 	]*$/d' \
	                            -e '/^#pragma GCC set_debug_pwd/d' \
	                            -e '/^#ident/d' > \
	                                       ./abi_check.out; \
	                  /usr/bin/diff -w $file.pp ./abi_check.out; \
	                  /bin/rm ./abi_check.out; \
	done
+ for file in include/mysql/plugin.h include/mysql.h
+
/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-unknown-linux-ucl
ibc-gcc --sysroot=/home/johan/buildroot/output/build/staging_dir -E
-nostdinc -dI -I./include -I./include/mysql -I./sql -I./include
-I./include/mysql -I./sql include/mysql/plugin.h
+ /bin/sed -e '/^# /d' -e '/^[ 	]*$/d' -e '/^#pragma GCC set_debug_pwd/d' -e
'/^#ident/d'
+ /usr/bin/diff -w include/mysql/plugin.h.pp ./abi_check.out
+ /bin/rm ./abi_check.out
+ for file in include/mysql/plugin.h include/mysql.h
+
/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-unknown-linux-ucl
ibc-gcc --sysroot=/home/johan/buildroot/output/build/staging_dir -E
-nostdinc -dI -I./include -I./include/mysql -I./sql -I./include
-I./include/mysql -I./sql include/mysql.h
+ /bin/sed -e '/^# /d' -e '/^[ 	]*$/d' -e '/^#pragma GCC set_debug_pwd/d' -e
'/^#ident/d'
+ /usr/bin/diff -w include/mysql.h.pp ./abi_check.out
2,674d1
< typedef char my_bool;
< typedef int my_socket;
< #include "mysql_version.h"
< #include "mysql_com.h"
< enum enum_server_command
< {
<   COM_SLEEP, COM_QUIT, COM_INIT_DB, COM_QUERY, COM_FIELD_LIST,
<   COM_CREATE_DB, COM_DROP_DB, COM_REFRESH, COM_SHUTDOWN, COM_STATISTICS,
<   COM_PROCESS_INFO, COM_CONNECT, COM_PROCESS_KILL, COM_DEBUG, COM_PING,
<   COM_TIME, COM_DELAYED_INSERT, COM_CHANGE_USER, COM_BINLOG_DUMP,
<   COM_TABLE_DUMP, COM_CONNECT_OUT, COM_REGISTER_SLAVE,
<   COM_STMT_PREPARE, COM_STMT_EXECUTE, COM_STMT_SEND_LONG_DATA,
COM_STMT_CLOSE,
<   COM_STMT_RESET, COM_SET_OPTION, COM_STMT_FETCH, COM_DAEMON,
<   COM_END
< };
< struct st_vio;
< typedef struct st_vio Vio;
< typedef struct st_net {
<   Vio *vio;
<   unsigned char *buff,*buff_end,*write_pos,*read_pos;
<   my_socket fd;
<   unsigned long remain_in_buf,length, buf_length, where_b;
<   unsigned long max_packet,max_packet_size;
<   unsigned int pkt_nr,compress_pkt_nr;
<   unsigned int write_timeout, read_timeout, retry_count;
<   int fcntl;
....
snip 
....

< my_bool mysql_autocommit(MYSQL * mysql, my_bool auto_mode);
< my_bool mysql_more_results(MYSQL *mysql);
< int mysql_next_result(MYSQL *mysql);
< void mysql_close(MYSQL *sock);
make[3]: *** [do_abi_check] Error 1
make[3]: Leaving directory
`/home/johan/buildroot11/output/build/mysql_client-5.1.47'
make[2]: *** [abi_check] Error 2
make[2]: Leaving directory
`/home/johan/buildroot11/output/build/mysql_client-5.1.47'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/johan/buildroot11/output/build/mysql_client-5.1.47'
make: ***
[/home/johan/buildroot/output/build/mysql_client-5.1.47/.stamp_built] Error
2
 
 
 
 
 
