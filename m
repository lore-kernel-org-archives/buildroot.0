From: Heiko Zuerker <heiko@zuerker.org>
Date: Sat, 4 Jun 2011 08:48:33 -0500
Subject: [Buildroot] [PATCH] mysql server and client 5.1.x and 5.5.x
In-Reply-To: <20110604105204.543ebf70@surf>
References: <383b905e1557b0da1bc0cdb5b9e5bab7dbace620.1306605163.git.smiley73@users.sourceforge.net>
	<20110604105204.543ebf70@surf>
Message-ID: <001201cc22be$183a5b30$48af1190$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Saturday, June 04, 2011 3:52 AM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] mysql server and client 5.1.x and 5.5.x
> 
> Hello Heiko!
> 
> Thanks for taking care of the MySQL package. I have a few comments below,
> but first, is there a good reason to support both MySQL 5.1 and MySQL 5.5
?
> Wouldn't supporting MySQL 5.5 be enough ?

I'm worried about compatibility of other software with the new MySQL 5.5. I
had a lot of problems with that in the past.
I still have to add a lot more software and was planning to remove the 5.1
support once we know that all other packages play nice with the 5.5 version.
If you guys really don't like this then we can remove it.
 
> On Sat, 28 May 2011 12:56:20 -0500
> heiko at zuerker.org wrote:
> 
> > diff --git a/package/mysql/Config.in b/package/mysql/Config.in new
> > file mode 100644 index 0000000..3c44ec3
> > --- /dev/null
> > +++ b/package/mysql/Config.in
> > @@ -0,0 +1,91 @@
> > +config BR2_PACKAGE_MYSQL
> > +	bool "MySQL"
> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	select BR2_PACKAGE_NCURSES
> > +	select BR2_PACKAGE_READLINE
> > +	help
> > +	  MySQL client and optional server
> > +
> > +menu "MySQL options"
> > +depends on BR2_PACKAGE_MYSQL
> > +
> > +choice
> > +	prompt "MySQL Version"
> > +	default BR2_PACKAGE_MYSQL_51
> > +	help
> > +	  The version of MySQL
> > +
> > +config BR2_PACKAGE_MYSQL_51
> > +	bool "5.1.x"
> > +	select BR2_TARGET_SYSLINUX
> > +
> > +config BR2_PACKAGE_MYSQL_55
> > +	bool "5.5.x"
> > +
> > +endchoice
> > +
> > +config BR2_PACKAGE_MYSQL_SERVER
> > +	bool "Build the MySQL Server"
> > +	depends on BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_MYSQL
> > +	select BR2_PACKAGE_NCURSES
> > +	select BR2_PACKAGE_READLINE
> 
> Since this depends on BR2_PACKAGE_MYSQL, which already selects ncurses
> and readline, do we really need those selects again ?

Good point, I'll remove it in the next revision.
 
> > diff --git a/package/mysql/mysql-5.5.12/mysql-5.5.11-tool-path.patch
> > b/package/mysql/mysql-5.5.12/mysql-5.5.11-tool-path.patch
> > new file mode 100644
> > index 0000000..03de86d
> > --- /dev/null
> > +++ b/package/mysql/mysql-5.5.12/mysql-5.5.11-tool-path.patch
> 
> This patch needs a description + Signed-off-by line.

Will do.

> > --- /dev/null
> > +++ b/package/mysql/mysql.mk
> > @@ -0,0 +1,143 @@
> >
> +#########################################################
> ####
> > +#
> > +# MySQL Server & Client
> > +#
> >
> +#########################################################
> ####
> > +
> > +ifeq ($(BR2_PACKAGE_MYSQL_51),y)
> > +	MYSQL_MAIN_VERSION = 5.1
> > +	MYSQL_VERSION = $(MYSQL_MAIN_VERSION).57 endif
> > +
> > +ifeq ($(BR2_PACKAGE_MYSQL_55),y)
> > +	MYSQL_MAIN_VERSION = 5.5
> > +	MYSQL_VERSION = $(MYSQL_MAIN_VERSION).12 endif
> > +
> > +MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz MYSQL_SITE =
> > +http://mirror.services.wisc.edu/mysql/Downloads/MySQL-
> $(MYSQL_MAIN_VE
> > +RSION)
> > +MYSQL_INSTALL_TARGET = YES
> > +MYSQL_INSTALL_STAGING = YES
> > +MYSQL_DEPENDENCIES = readline ncurses host-mysql
> 
> Could you detail why host-mysql is needed as a dependency ? (For example
> by adding a comment).

I'll put it in. MySQL cross-compiling is such a clutch.....
 
> > +		-DMYSQL_DATADIR=/var/mysql
> 
> What about using the configuration option for the data directory ?

Ah crap. Will fix it.
 
> > +# Generic section
> > +define MYSQL_REMOVE_TEST_PROGS
> > +	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
> > +endef
> > +
> > +define MYSQL_ADD_MYSQL_LIB_PATH
> > +	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf endef
> > +
> > +ifeq ($(BR2_PACKAGE_MYSQL_REMOVE_TEST_PROGS),y)
> > +	MYSQL_POST_INSTALL_TARGET_HOOKS +=
> MYSQL_REMOVE_TEST_PROGS endif
> > +
> > +MYSQL_POST_INSTALL_TARGET_HOOKS +=
> MYSQL_ADD_MYSQL_LIB_PATH
> > +
> > +MYSQL_POST_CONFIGURE_HOOKS += MYSQL_COPY_HOST_BINARIES
> > +
> > +define MYSQL_COPY_HOST_BINARIES
> > +	cp $(@D)/../host-mysql-$(MYSQL_VERSION)/sql/gen_lex_hash
> $(@D)/sql/
> > +	cp $(@D)/../host-mysql-$(MYSQL_VERSION)/scripts/comp_sql
> $(@D)/scripts/
> > +	cp $(@D)/../host-mysql-$(MYSQL_VERSION)/extra/comp_err
> $(@D)/extra/
> > +	# set the file dates far into the future to prevent recompilation
> > +	touch -t "203012120101" $(@D)/sql/gen_lex_hash
> > +	touch -t "203012120101" $(@D)/scripts/comp_sql
> > +	touch -t "203012120101" $(@D)/extra/comp_err endef
> > +
> > +define HOST_MYSQL_BUILD_CMDS
> > +	make -C $(@D)/vio
> > +	make -C $(@D)/mysys
> > +	make -C $(@D)/strings
> > +	make -C $(@D)/dbug
> > +	make -C $(@D)/regex
> > +	make -C $(@D)/sql gen_lex_hash
> > +	make -C $(@D)/scripts comp_sql
> > +	make -C $(@D)/extra comp_err
> > +endef
> > +
> > +define HOST_MYSQL_INSTALL_CMDS
> > +	# no need to really install this
> > +	exit 0
> 
> Really ?

Yup. ;-)
All we need is a couple of binaries from the host-mysql. 
I have a "bug" open with the guys at mysql on cross-compiling, but don't
think it'll go anywhere. :(
 
> > +endef
> 
> Normally, all those definitions should be before the
> AUTOTARGETS/CMAKETARGETS calls.

No problem, I'll fix that. (Not sure when I'll get a chance to work on it.)

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
