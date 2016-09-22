From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 07:33:05 +0200
Subject: [Buildroot] [RFC v2] mysql: replace mysql with mariadb 10.1
In-Reply-To: <0fedb398-c688-9a22-a97c-c2f2da965f49@mind.be>
References: <20160919034340.4233-1-bluemrp9@gmail.com>
 <20160919034340.4233-2-bluemrp9@gmail.com>
 <20160919074259.144cb649@free-electrons.com>
 <0fedb398-c688-9a22-a97c-c2f2da965f49@mind.be>
Message-ID: <20160922073305.68559e82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 00:02:31 +0200, Arnout Vandecappelle wrote:

> > I don't know if I like the fact that we're hi-jacking the mysql package
> > here. Maybe this should be added as a separate package/mariadb/
> > package, and then the mysql package changed to a virtual package
> > afterwards, in a second patch?  
> 
>  *Someone* wrote in
> http://lists.buildroot.org/pipermail/buildroot/2016-September/172401.html :
> 
> TP> As Floris said, our mysql package is deprecated, so I'm all for
> TP> replacing it with an up-to-date mariadb package. If later on, someone
> TP> else really needs MySQL, we can re-add it, and add the necessary
> TP> virtual package to allow selecting between mysql and mariadb. But until
> TP> there's a decent mysql package available, I believe replacing it
> TP> completely with an up-to-date mariadb package is better.  

Yes, I know. In French we say "only stupid people don't change their
mind" :-)

> >> +wait_for_pid() {
> >> +	WAIT_DELAY=10
> >> +	if [ ! -e $MYSQL_PID ]; then
> >> +		while [ $WAIT_DELAY -gt 0 ]; do
> >> +			if [ -e $MYSQL_PID ]; then
> >> +				return 0
> >> +			fi
> >> +			sleep 1
> >> +			: $((WAIT_DELAY -= 1))
> >> +		done
> >> +		return 1
> >> +	fi
> >> +	return 0
> >> +}  
> > 
> > Do we really need something like this?  
> 
>  Well, we need to wait until mysqld really has started before continuing,
> because later init scripts may depend on it. However, I think it's better to use
> --no-auto-restart to mysqld_safe, which kind of implies the wait. AFAIK there
> are no other daemons that autorestart.

I don't think we're doing this kind of wait for any other service in
Buildroot, so it would be good if MariaDB could daemonize only once it
is ready to listen to connections.

> >>  ################################################################################
> >>  #
> >> -# mysql
> >> +# mariadb  
> 
>  This should remain mysql, because the package is still called mysql. Oh well,
> this entire header is silly, but it is what it is :-)

Except if we ask to have this new package in package/mariadb/, and
mysql be turned into a virtual package (with for now a single provider).

Also, I think mysql should be a virtual package like jpeg, i.e a
virtual package on which "select" can be used.

> >> +MYSQL_SOURCE = mariadb-$(MYSQL_VERSION).tar.gz
> >> +MYSQL_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MYSQL_VERSION)/source
> >>  MYSQL_LICENSE = GPLv2  
> > 
> > Are you sure this license is correct? I believe mariadb is partly under
> > LGPLv2, no?  
> 
>  It's a bit complicated because there is the old mysql client library that is
> GPLv2 with FLOSS exception, and the new mariadb client library that is LGPLv2.
> I'm not entirely sure if this new mariadb client library is the one that is
> actually used by applications that link with libmysql_client. If not, or if the
> old mysql client library is still installed to target, then we have to add the
> three licenses.

Isn't part of the original idea of MariaDB to avoid the GPL-licensed
client library so that proprietary applications can link with the
client library without having to purchase a MySQL license?

>  See https://mariadb.com/kb/en/mariadb/mariadb-license/ for more details.

Reading this, I think we should use:

MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)

> >> +# Jemalloc was added for TokuDB. Since its configure script seems somewhat broken
> >> +# when it comes to cross-compilation we shall disable it and also disable TokuDB.
> >> +MYSQL_OPTS += -DWITH_JEMALLOC=no
> >> +MYSQL_OPTS += -DWITHOUT_TOKUDB=1  
> > 
> > One line is probably enough for both.  
> 
>  Well, since there are a lot more += -D options, I kind of like it like this.
> Principle of least surprise.

I really prefer:

MYSQL_OPTS += \
	-DWITH_JEMALLOC=no \
	-DWITHOUT_TOKUDB=1

or:

MYSQL_OPTS += -DWITH_JEMALLOC=no -DWITHOUT_TOKUDB=1

> > Are these all needed?
> > 
> > Also, we prefer:
> > 
> > MYSQL_OPTS += \
> > 	-DFOO=baz \
> > 	-DBAR=foo \
> > 	-Dthis=that
> > 
> > when there are multiple options to assign.  
> 
>  Ah, do we? :-)

Yes, that's what we're doing everywhere in Buildroot.

> >> +# Some helpers must be compiled for host in order to crosscompile mariadb for
> >> +# the target. They are then included by import_executables.cmake which is
> >> +# generated during the build of the host helpers. It is not necessary to build
> >> +# the whole host package, only the "import_executables" target.
> >> +# -DIMPORT_EXECUTABLES=$(BUILD_DIR)/host-mariadb-galera/import_executables.cmake
> >> +# must then be passed to cmake during target build.
> >> +HOST_MYSQL_MAKE_OPTS = import_executables
> >> +MYSQL_IMPORT_EXECUTABLES += -DIMPORT_EXECUTABLES=$(HOST_MYSQL_BUILDDIR)/import_executables.cmake  
> > 
> > I'm not sure why this import_executables.cmake file contains, but we
> > generally don't like accessing stuff from a build directory during the
> > build of another package. The host-mysql package is supposed to install
> > things in $(HOST_DIR), and the target mysql package to use them from
> > $(HOST_DIR).  
> 
>  As I understand it from
> https://mariadb.com/kb/en/mariadb/cross-compiling-mariadb/
> you basically need a configure-hostbuild-configure-build chain for
> cross-compiling. The binaries generated during the hostbuild are not meant to be
> used outside of the mariadb build process itself, so it really makes no sense to
> make it a host package IMHO. I think it's better to do the hostbuild in a
> pre-configure hook.
> 
>  Problem with that is that
> * the pre-configure hook will also build stuff;
> * the cmake call in the pre-configure hook will also have to pass some/most/all
> of the -D arguments we pass in a host-cmake package's _CONFIGURE_CMDS.
> The first point is not so important IMHO. For the second one, it would be
> convenient if we would define a HOST/TARGET_CMAKE_CONF_OPTS variable that
> contains all these common options.

Well, so in the end, a host package is better :-)

I'm fine with the approach of the host package, I just dislike that the
target package re-uses stuff directly from the host package source
directory.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
