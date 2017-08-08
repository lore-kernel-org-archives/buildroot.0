From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 20:43:55 +0200
Subject: [Buildroot] Mysqld startup problems
In-Reply-To: <CAJJ6jxs0YL9hEumc5xwLYdTU0d6iM3CVtSyLiAMVM_9U0S1Erg@mail.gmail.com>
References: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
 <ba440c62-d192-435f-2b3f-099611dd88fd@mind.be>
 <CAJJ6jxs0YL9hEumc5xwLYdTU0d6iM3CVtSyLiAMVM_9U0S1Erg@mail.gmail.com>
Message-ID: <669d2c84-8015-74fe-7c74-54f5101c6891@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-17 17:47, Steve Calfee wrote:
>> So I would appreciate any tips on where to look.
>>
>> Thanks, Steve
>>
>> Here is my dockstar_glibc_buildroot_defconfig
>  I'll try to build with this defconfig when I find the time.

 So I tried the following defconfig

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_MKFSUBIFS=y
BR2_PACKAGE_NFS_UTILS=y
BR2_PACKAGE_NFS_UTILS_RPCDEBUG=y
BR2_PACKAGE_SSHFS=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_PYTHON_UCS4=y
BR2_PACKAGE_PYTHON_HASHLIB=y
BR2_PACKAGE_PYTHON_PYMYSQL=y
BR2_PACKAGE_PYTHON_PYRATEMP=y
BR2_PACKAGE_PYTHON_REQUESTS=y
BR2_PACKAGE_PYTHON_TORNADO=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_ORACLE_MYSQL_SERVER=y
BR2_PACKAGE_NSS_MDNS=y
BR2_PACKAGE_ICU=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_LESS=y
BR2_PACKAGE_MC=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBI=y


and it installs mysqld_safe like it should. Here's the part from the build log
where it gets installed:

Making install in sql-common
make[4]: Nothing to be done for 'install-exec-am'.
make[4]: Nothing to be done for 'install-data-am'.
Making install in scripts
/usr/bin/make  install-am
 /bin/mkdir -p '/gentoo/home2/arnout/sw/buildroot/output/mysql/target/usr/bin'
 /bin/mkdir -p
'/gentoo/home2/arnout/sw/buildroot/output/mysql/target/usr/share/mysql'
 /usr/bin/install -c -m 644 fill_help_tables.sql mysql_fix_privilege_tables.sql
mysql_system_tables.sql mysql_system_tables_data.sql
mysql_test_data_timezone.sql
'/gentoo/home2/arnout/sw/buildroot/output/mysql/target/usr/share/mysql'
 /usr/bin/install -c mysqld_safe mysql_install_db msql2mysql mysql_config
mysql_fix_privilege_tables mysql_fix_extensions mysql_setpermission
mysql_secure_installation mysql_zap mysqlaccess mysqlbug
mysql_convert_table_format mysql_find_rows mysqlhotcopy mysqldumpslow
mysqld_multi '/gentoo/home2/arnout/sw/buildroot/output/mysql/target/usr/bin'
Making install in strings
make[4]: Nothing to be done for 'install-data-am'.
 /bin/mkdir -p '/gentoo/home2/arnout/sw/buildroot/output/mysql/target/usr/lib'
 /usr/bin/install -c -m 644  libmystrings.a
'/gentoo/home2/arnout/sw/buildroot/output/mysql/target/usr/lib'
 ( cd '/gentoo/home2/arnout/sw/buildroot/output/mysql/target/usr/lib' &&
/gentoo/home2/arnout/sw/buildroot/output/mysql/host/bin/arm-none-linux-gnueabi-ranlib
libmystrings.a )


 Can you do 'make oracle-mysql-rebuild' and see how it differs?

 Note, I did this on current master instead of 2017.05.2, but I can see no
relevant differences.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
