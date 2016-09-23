From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 23 Sep 2016 16:00:15 -0700
Subject: [Buildroot] [RFC v2] mysql: replace mysql with mariadb 10.1
In-Reply-To: <20160919074259.144cb649@free-electrons.com>
References: <20160919034340.4233-1-bluemrp9@gmail.com>
 <20160919034340.4233-2-bluemrp9@gmail.com>
 <20160919074259.144cb649@free-electrons.com>
Message-ID: <57E5B3FF.1060506@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 09/18/2016 10:42 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Sun, 18 Sep 2016 20:43:40 -0700, Ryan Coe wrote:
>> Replaces the old mysql 5.1 with mariadb 10.1. The package was not renamed
>> as mariadb is a drop-in replacement for mysql.
>>
>> Based on the work by:
>> Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
>> https://patchwork.ozlabs.org/patch/538045/
>>
>> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> I don't know if I like the fact that we're hi-jacking the mysql package
> here. Maybe this should be added as a separate package/mariadb/
> package, and then the mysql package changed to a virtual package
> afterwards, in a second patch?
>
> This would also have the benefit of making this patch easier to review.
Will do.  I will make mariadb a separate package and create a virtual 
package for mysql.
>
>> diff --git a/package/mysql/0001-add-extra-check-for-librt.patch b/package/mysql/0001-add-extra-check-for-librt.patch
>> new file mode 100644
>> index 0000000..aea7064
>> --- /dev/null
>> +++ b/package/mysql/0001-add-extra-check-for-librt.patch
>> @@ -0,0 +1,26 @@
>> +From 31094bd1fcccba2fb8b234735bb9bf60ba4afa28 Mon Sep 17 00:00:00 2001
>> +From: Ryan Coe <bluemrp9@gmail.com>
>> +Date: Sun, 18 Sep 2016 16:35:59 -0700
>> +Subject: [PATCH 1/1] add extra check for librt
>> +
>> +Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
>> +---
>> + configure.cmake | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/configure.cmake b/configure.cmake
>> +index 896226de954f4642a238ca6a72e0930590dc1681..77ca485fb05e6b63bb69f9561b4eabfaa208a419 100644
>> +--- a/configure.cmake
>> ++++ b/configure.cmake
>> +@@ -126,6 +126,9 @@ IF(UNIX)
>> +   IF(NOT LIBRT)
>> +     MY_SEARCH_LIBS(clock_gettime rt LIBRT)
>> +   ENDIF()
>> ++  IF(NOT LIBRT)
>> ++    MY_SEARCH_LIBS(posix_spawn_file_actions_addclose rt LIBRT)
>> ++  ENDIF()
> Please remember to send this patch to the upstream MariaDB project.
Sent upstream: https://jira.mariadb.org/browse/MDEV-10841
>
>> diff --git a/package/mysql/Config.in b/package/mysql/Config.in
>> index 7133892..f1b70db 100644
>> --- a/package/mysql/Config.in
>> +++ b/package/mysql/Config.in
>> @@ -1,24 +1,30 @@
>>   config BR2_PACKAGE_MYSQL
>> -	bool "MySQL"
>> +	bool "mariadb"
>>   	depends on BR2_INSTALL_LIBSTDCPP
>>   	depends on BR2_USE_MMU # fork()
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	select BR2_PACKAGE_LIBAIO
> Then you need to:
>
> 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
Added.
>
>> +	select BR2_PACKAGE_LIBTOOL
> Are you sure you need libtool on the target? This seems odd.
Removed.
>
>> -comment "MySQL needs a toolchain w/ C++, threads"
>> +comment "mariadb needs a toolchain w/ C++, threads"
>>   	depends on BR2_USE_MMU
> 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
Added.
>
>>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>> +MYSQL_LIB="/var/lib/mysql"
>> +MYSQL_RUN="/run/mysqld"
>> +MYSQL_PID="$MYSQL_RUN/mysqld.pid"
>> +
>> +wait_for_pid() {
>> +	WAIT_DELAY=10
>> +	if [ ! -e $MYSQL_PID ]; then
>> +		while [ $WAIT_DELAY -gt 0 ]; do
>> +			if [ -e $MYSQL_PID ]; then
>> +				return 0
>> +			fi
>> +			sleep 1
>> +			: $((WAIT_DELAY -= 1))
>> +		done
>> +		return 1
>> +	fi
>> +	return 0
>> +}
> Do we really need something like this?
I will rework this per the other conservations on this.
>
>> diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
>> index 7af4711..0c05162 100644
>> --- a/package/mysql/mysql.mk
>> +++ b/package/mysql/mysql.mk
>> @@ -1,110 +1,98 @@
>>   ################################################################################
>>   #
>> -# mysql
>> +# mariadb
>>   #
>>   ################################################################################
>>   
>> -MYSQL_VERSION_MAJOR = 5.1
>> -MYSQL_VERSION = $(MYSQL_VERSION_MAJOR).73
>> -MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz
>> -MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_VERSION_MAJOR)
>> -MYSQL_INSTALL_STAGING = YES
>> -MYSQL_DEPENDENCIES = readline ncurses
>> -MYSQL_AUTORECONF = YES
>> +MYSQL_VERSION = 10.1.17
>> +MYSQL_SOURCE = mariadb-$(MYSQL_VERSION).tar.gz
>> +MYSQL_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MYSQL_VERSION)/source
>>   MYSQL_LICENSE = GPLv2
> Are you sure this license is correct? I believe mariadb is partly under
> LGPLv2, no?
Updated per other conservations.
>
>> +# Jemalloc was added for TokuDB. Since its configure script seems somewhat broken
>> +# when it comes to cross-compilation we shall disable it and also disable TokuDB.
>> +MYSQL_OPTS += -DWITH_JEMALLOC=no
>> +MYSQL_OPTS += -DWITHOUT_TOKUDB=1
> One line is probably enough for both.
Fixed.
>
>> +MYSQL_OPTS += -DCMAKE_BUILD_TYPE=Release
> Not needed, already passed by Buildroot in pkg-cmake.mk.
Removed.
>
>> +MYSQL_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
> Not needed, already passed by Builroot in pkg-cmake.mk.
Removed.
>
>> +MYSQL_OPTS += -DINSTALL_DOCDIR=share/doc/mariadb-$(MYSQL_VERSION)
>> +MYSQL_OPTS += -DINSTALL_DOCREADMEDIR=share/doc/mariadb-$(MYSQL_VERSION)
>> +MYSQL_OPTS += -DINSTALL_MANDIR=share/man
>> +MYSQL_OPTS += -DINSTALL_MYSQLSHAREDIR=share/mysql
>> +MYSQL_OPTS += -DINSTALL_MYSQLTESTDIR=share/mysql/test
>> +MYSQL_OPTS += -DINSTALL_PLUGINDIR=lib/mysql/plugin
>> +MYSQL_OPTS += -DINSTALL_SBINDIR=sbin
>> +MYSQL_OPTS += -DINSTALL_SCRIPTDIR=bin
>> +MYSQL_OPTS += -DINSTALL_SQLBENCHDIR=share/mysql/bench
>> +MYSQL_OPTS += -DINSTALL_SUPPORTFILESDIR=share/mysql
> Are these all needed?
>
> Also, we prefer:
>
> MYSQL_OPTS += \
> 	-DFOO=baz \
> 	-DBAR=foo \
> 	-Dthis=that
>
> when there are multiple options to assign.
Updated.
>
>> +MYSQL_DEPENDENCIES = \
>> +	host-mysql \
>> +	ncurses \
>> +	openssl \
>> +	zlib \
>> +	libaio \
>> +	libxml2 \
>> +	libtool \
> You really need libtool?
Removed.
>
>> +	readline
>> +
>> +HOST_MYSQL_DEPENDENCIES =
> Not needed.
Removed.
>
>> +# Some helpers must be compiled for host in order to crosscompile mariadb for
>> +# the target. They are then included by import_executables.cmake which is
>> +# generated during the build of the host helpers. It is not necessary to build
>> +# the whole host package, only the "import_executables" target.
>> +# -DIMPORT_EXECUTABLES=$(BUILD_DIR)/host-mariadb-galera/import_executables.cmake
>> +# must then be passed to cmake during target build.
>> +HOST_MYSQL_MAKE_OPTS = import_executables
>> +MYSQL_IMPORT_EXECUTABLES += -DIMPORT_EXECUTABLES=$(HOST_MYSQL_BUILDDIR)/import_executables.cmake
> I'm not sure why this import_executables.cmake file contains, but we
> generally don't like accessing stuff from a build directory during the
> build of another package. The host-mysql package is supposed to install
> things in $(HOST_DIR), and the target mysql package to use them from
> $(HOST_DIR).
See https://mariadb.com/kb/en/mariadb/cross-compiling-mariadb/
This has also been discussed in the other threads.
>> +
>> +HOST_MYSQL_CONF_OPTS = $(MYSQL_OPTS)
> This seems very wrong, a MYSQL_OPTS is for the target. As an example,
> the host should be configured with
> CMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr. Please use an explicit value for
> HOST_MYSQL_CONF_OPTS, with only the necessary options.
>
>> +HOST_MYSQL_CONF_OPTS += $(MYSQL_HOST_OPTS)
> Why do we have an intermediate MYSQL_HOST_OPTS variable then, rather
> than using HOST_MYSQL_CONF_OPTS directly?
>
>> +
>> +MYSQL_CONF_OPTS = $(MYSQL_OPTS)
> Why do we have an intermediate MYSQL_OPTS variable? Just use
> MYSQL_CONF_OPTS directly.
>
>> +MYSQL_CONF_OPTS += $(MYSQL_IMPORT_EXECUTABLES)
> Intermediate variable not needed.
I will update.
>
>> +
>> +# Don't install host-mysql. We just need to build import_executable
>> +# Therefore only run 'true' and do nothing, not even the default action.
>> +HOST_MYSQL_INSTALL_CMDS = true
> This would be the place where you could install the host-mysql stuff in
> $(HOST_DIR).
>
>>   [Service]
>> -ExecStartPre=/bin/sh -c 'test -d /var/mysql/mysql || mysql_install_db --user=mysql --ldata=/var/mysql'
>> +ExecStartPre=/bin/sh -c '[ "`ls -1 /var/lib/mysql | wc -l`" = "0" ] && mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
> Why is the test on /var/mysql/mysql existence no longer good enough? It
> was much nicer than the test of the number of files in this directory.
I am using /var/lib/mysql as the data directory.  This is the same 
directory as the home for the mysql user.  The directory must be created 
or makedevs will fail.  Therefore, the test on the directory will never 
allow mysql_install_db to run.
>
> Thanks for this effort, it is much appreciated that someone takes care
> of updating this complicated package.
>
> Thanks!
>
> Thomas
Thanks to everyone for your reviews.

-Ryan
