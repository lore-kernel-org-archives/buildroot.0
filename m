From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2016 00:02:31 +0200
Subject: [Buildroot] [RFC v2] mysql: replace mysql with mariadb 10.1
In-Reply-To: <20160919074259.144cb649@free-electrons.com>
References: <20160919034340.4233-1-bluemrp9@gmail.com>
 <20160919034340.4233-2-bluemrp9@gmail.com>
 <20160919074259.144cb649@free-electrons.com>
Message-ID: <0fedb398-c688-9a22-a97c-c2f2da965f49@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-09-16 07:42, Thomas Petazzoni wrote:
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
> 
> I don't know if I like the fact that we're hi-jacking the mysql package
> here. Maybe this should be added as a separate package/mariadb/
> package, and then the mysql package changed to a virtual package
> afterwards, in a second patch?

 *Someone* wrote in
http://lists.buildroot.org/pipermail/buildroot/2016-September/172401.html :

TP> As Floris said, our mysql package is deprecated, so I'm all for
TP> replacing it with an up-to-date mariadb package. If later on, someone
TP> else really needs MySQL, we can re-add it, and add the necessary
TP> virtual package to allow selecting between mysql and mariadb. But until
TP> there's a decent mysql package available, I believe replacing it
TP> completely with an up-to-date mariadb package is better.


> This would also have the benefit of making this patch easier to review.

 That is true.


[snip]
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
> 
> Do we really need something like this?

 Well, we need to wait until mysqld really has started before continuing,
because later init scripts may depend on it. However, I think it's better to use
--no-auto-restart to mysqld_safe, which kind of implies the wait. AFAIK there
are no other daemons that autorestart.

> 
>> diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
>> index 7af4711..0c05162 100644
>> --- a/package/mysql/mysql.mk
>> +++ b/package/mysql/mysql.mk
>> @@ -1,110 +1,98 @@
>>  ################################################################################
>>  #
>> -# mysql
>> +# mariadb

 This should remain mysql, because the package is still called mysql. Oh well,
this entire header is silly, but it is what it is :-)

>>  #
>>  ################################################################################
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
>>  MYSQL_LICENSE = GPLv2
> 
> Are you sure this license is correct? I believe mariadb is partly under
> LGPLv2, no?

 It's a bit complicated because there is the old mysql client library that is
GPLv2 with FLOSS exception, and the new mariadb client library that is LGPLv2.
I'm not entirely sure if this new mariadb client library is the one that is
actually used by applications that link with libmysql_client. If not, or if the
old mysql client library is still installed to target, then we have to add the
three licenses.

 See https://mariadb.com/kb/en/mariadb/mariadb-license/ for more details.


> 
>> +# Jemalloc was added for TokuDB. Since its configure script seems somewhat broken
>> +# when it comes to cross-compilation we shall disable it and also disable TokuDB.
>> +MYSQL_OPTS += -DWITH_JEMALLOC=no
>> +MYSQL_OPTS += -DWITHOUT_TOKUDB=1
> 
> One line is probably enough for both.

 Well, since there are a lot more += -D options, I kind of like it like this.
Principle of least surprise.

> 
>> +MYSQL_OPTS += -DCMAKE_BUILD_TYPE=Release
> 
> Not needed, already passed by Buildroot in pkg-cmake.mk.
> 
>> +MYSQL_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
> 
> Not needed, already passed by Builroot in pkg-cmake.mk.
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
> 
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

 Ah, do we? :-)


[snip]
>> +# Some helpers must be compiled for host in order to crosscompile mariadb for
>> +# the target. They are then included by import_executables.cmake which is
>> +# generated during the build of the host helpers. It is not necessary to build
>> +# the whole host package, only the "import_executables" target.
>> +# -DIMPORT_EXECUTABLES=$(BUILD_DIR)/host-mariadb-galera/import_executables.cmake
>> +# must then be passed to cmake during target build.
>> +HOST_MYSQL_MAKE_OPTS = import_executables
>> +MYSQL_IMPORT_EXECUTABLES += -DIMPORT_EXECUTABLES=$(HOST_MYSQL_BUILDDIR)/import_executables.cmake
> 
> I'm not sure why this import_executables.cmake file contains, but we
> generally don't like accessing stuff from a build directory during the
> build of another package. The host-mysql package is supposed to install
> things in $(HOST_DIR), and the target mysql package to use them from
> $(HOST_DIR).

 As I understand it from
https://mariadb.com/kb/en/mariadb/cross-compiling-mariadb/
you basically need a configure-hostbuild-configure-build chain for
cross-compiling. The binaries generated during the hostbuild are not meant to be
used outside of the mariadb build process itself, so it really makes no sense to
make it a host package IMHO. I think it's better to do the hostbuild in a
pre-configure hook.

 Problem with that is that
* the pre-configure hook will also build stuff;
* the cmake call in the pre-configure hook will also have to pass some/most/all
of the -D arguments we pass in a host-cmake package's _CONFIGURE_CMDS.
The first point is not so important IMHO. For the second one, it would be
convenient if we would define a HOST/TARGET_CMAKE_CONF_OPTS variable that
contains all these common options.

> 
>> +
>> +HOST_MYSQL_CONF_OPTS = $(MYSQL_OPTS)
> 
> This seems very wrong, a MYSQL_OPTS is for the target. As an example,
> the host should be configured with
> CMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr. Please use an explicit value for
> HOST_MYSQL_CONF_OPTS, with only the necessary options.

 Indeed, I expect most of them are not needed for the hostbuild.

> 
>> +HOST_MYSQL_CONF_OPTS += $(MYSQL_HOST_OPTS)
> 
> Why do we have an intermediate MYSQL_HOST_OPTS variable then, rather
> than using HOST_MYSQL_CONF_OPTS directly?
> 
>> +
>> +MYSQL_CONF_OPTS = $(MYSQL_OPTS)
> 
> Why do we have an intermediate MYSQL_OPTS variable? Just use
> MYSQL_CONF_OPTS directly.
> 
>> +MYSQL_CONF_OPTS += $(MYSQL_IMPORT_EXECUTABLES)
> 
> Intermediate variable not needed.
> 
>> +
>> +# Don't install host-mysql. We just need to build import_executable
>> +# Therefore only run 'true' and do nothing, not even the default action.
>> +HOST_MYSQL_INSTALL_CMDS = true
> 
> This would be the place where you could install the host-mysql stuff in
> $(HOST_DIR).
> 
>>  [Service]
>> -ExecStartPre=/bin/sh -c 'test -d /var/mysql/mysql || mysql_install_db --user=mysql --ldata=/var/mysql'
>> +ExecStartPre=/bin/sh -c '[ "`ls -1 /var/lib/mysql | wc -l`" = "0" ] && mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
> 
> Why is the test on /var/mysql/mysql existence no longer good enough? It
> was much nicer than the test of the number of files in this directory.

 I agree with that. Same goes for the init script by the way.

 However, is there a reason why the systemd unit file bundled with mariadb
doesn't work? Or is it too complicated?

 By the way, there is also the option of generating the system database at build
time. It would be kind of nice if we had a convention in buildroot to install
defaults somewhere and then copy the defaults to their final location on a
writable partition at boot time when they don't exist yet. Like the
/usr/share/factory/ default of systemd-tmpfiles...

 Regards,
 Arnout

> 
> Thanks for this effort, it is much appreciated that someone takes care
> of updating this complicated package.
> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
