From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 3 Jun 2020 13:49:37 +0200
Subject: [Buildroot] Cross-compile mariadb-connector-c for MySQL use
In-Reply-To: <CADJjDh8aS9LK2GT6z1wXipURHrPtm1jF7av4WCgdm8Q5pLerzg@mail.gmail.com>
References: <CADJjDh_2Uhs7bTefPUhvEZedWnXyekZ1dR5Z5DOVtvfoLfqK_g@mail.gmail.com>
 <20200602223328.26e660f6@gmx.net>
 <CADJjDh8aS9LK2GT6z1wXipURHrPtm1jF7av4WCgdm8Q5pLerzg@mail.gmail.com>
Message-ID: <20200603134937.52dfe2ab@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Todd,

On Tue, 2 Jun 2020 18:12:07 -0400, Todd Sampson <sampsonats@gmail.com> wrote:

> Thanks for your quick reply.  Another person set up the environment.  I'm
> trying to update the mariadb-connector-c.  It uses an out of buildroot
> source tree as below:  Towards the bottom, you'll see packages that have
> been added.  mariadb-connector-c was added because the connector wasn't
> part of mariadb.  m9k-poco was added.  I don't know why the built-in poco
> wasn't used.  m9kservd is our app that uses poco to connect to MySQL
> server.  Buildroot is started with:
> 
> export MCU=~/m9k2/MCU/firmware/m9000/buildroot
> > make BR2_EXTERNAL='$(MCU)/' m9000_defconfig  
> 
> 
> I've done *make clean all*.  Hopefully that's the same as: *make clean &&
> make*
> 
> mariadb-connector-c comes from:
> 
> MARIADB_CONNECTOR_C_VERSION = 3.1.8
> > #MARIADB_CONNECTOR_C_SITE =
> > https://downloads.mariadb.org/interstitial/connector-c-$(MARIADB_CONNECTOR_C_VERSION)
> > <--- 2.3.7
> > MARIADB_CONNECTOR_C_SITE =
> > https://downloads.mariadb.com/Connectors/c/connector-c-$(MARIADB_CONNECTOR_C_VERSION)
> > <--- 3.1.8
> > MARIADB_CONNECTOR_C_SOURCE =
> > mariadb-connector-c-$(MARIADB_CONNECTOR_C_VERSION)-src.tar.gz
> > MARIADB_CONNECTOR_C_LICENSE = LGPL-2.0
> > MARIADB_CONNECTOR_C_LICENSE_FILES = README COPYING.LIB
> > MARIADB_CONNECTOR_C_INSTALL_STAGING = YES  
> 
> 
> MySQL 8 is not involved in the target.  It is run in another linux host.
> MySQL 8 comes from: sudo apt install mysql-server
> 
> So, it looks like I need to build mariadb for the connector, *but I don't
> want it to be installed in the target*.
> 
> The project is somewhat complex.  I'm not sure how I could send you a
> complete project to try.  Do you have a suggestion?  Maybe I can pare it
> down to the minimum.
> 
> Can you tell me how I should proceed?  Should I abandon the add-on m9kpoco
> and mariadb-connector-c packages and:
> 1. Use the built-in poco
> 2. Somehow get poco to use the connector in mariadb
> 3. Somehow get mariadb to be available for poco to link to but not be
> installed in the target

Thanks for your defconfig, as expected only the client tools/libs from mariadb
are build and installed, e.g.:

	$ find target/usr/bin -name "mysql*"
target/usr/bin/mysqltest
target/usr/bin/mysql
target/usr/bin/mysqlcheck
target/usr/bin/mysqldump
target/usr/bin/mysqlimport
target/usr/bin/mysqlshow
target/usr/bin/mysql_plugin
target/usr/bin/mysqlbinlog
target/usr/bin/mysqladmin
target/usr/bin/mysqlslap
target/usr/bin/mysql_waitpid
target/usr/bin/mysqlaccess
target/usr/bin/mysql_find_rows

Thirteen binaries, each one ca. 3.5-4.0M of size...

If I understand your use case right the mysql libraries (or a selection of it
for maridb-connector-c/poco) would be enough? You an trim down your
target with a post-build script...

Yes, I would try the buildroot-poco (BR2_PACKAGE_POCO=y, BR2_PACKAGE_POCO_DATA_MYSQL=y)
in the best case your application builds/runs without further problems with the
provided versions ;-)

Regards,
Peter


> 
> Thanks.  Very much appreciated.
> 
> > dfr at cmake:~/m9k2/MCU/firmware/m9000/buildroot$ tree
> > .
> > ??? board
> > ?   ??? usi
> > ?       ??? m9000
> > ?       ?   ??? configs
> > ?       ?   ?   ??? busybox.config
> > ?       ?   ?   ??? linux.config
> > ?       ?   ?   ??? uboot.config
> > ?       ?   ?   ??? user_table.txt
> > ?       ?   ??? debian_package
> > ?       ?   ?   ??? DEBIAN
> > ?       ?   ?   ?   ??? config
> > ?       ?   ?   ?   ??? control
> > ?       ?   ?   ?   ??? postinst
> > ?       ?   ?   ?   ??? preinst
> > ?       ?   ?   ??? var
> > ?       ?   ?       ??? tmp
> > ?       ?   ?           ??? m9kfirmware
> > ?       ?   ?               ??? update.sh
> > ?       ?   ??? images
> > ?       ?   ?   ??? boot.its
> > ?       ?   ?   ??? m9000.dts
> > ?       ?   ?   ??? override.env
> > ?       ?   ?   ??? preboot.scr
> > ?       ?   ?   ??? update.its
> > ?       ?   ??? m9000.mk
> > ?       ?   ??? patches
> > ?       ?   ?   ??? dropbear
> > ?       ?   ?   ?   ??? 0001-dropbear-allow-legacy-key-exchange.patch
> > ?       ?   ?   ??? e2fsprogs
> > ?       ?   ?   ?   ??? 0002-e2fsprogs-nodiscard-default.patch
> > ?       ?   ?   ??? linux
> > ?       ?   ?   ?   ??? 001-add-m9000.patch
> > ?       ?   ?   ??? uboot
> > ?       ?   ?   ?   ??? 0001-uboot-m9000-modify.patch
> > ?       ?   ?   ?   ??? 0002-uboot-m9000-add.patch
> > ?       ?   ?   ?   ??? 0003-uboot-disable-tools.patch
> > ?       ?   ?   ?   ??? 0004-uboot-fix-gcc-inline.patch
> > ?       ?   ?   ?   ??? 0005-uboot-add-update-to-kconfig.patch
> > ?       ?   ?   ?   ??? 0006-uboot-fix-fit-update.patch
> > ?       ?   ?   ??? uboot-tools
> > ?       ?   ?       ???
> > 0001-uboot-tools-fw_printenv-dont-use-gnu-sscanf-m.patch
> > ?       ?   ?       ??? 0002-uboot-tools-m9000-defaults.patch
> > ?       ?   ??? rootfs_overlay
> > ?       ?   ?   ??? etc
> > ?       ?   ?   ?   ??? default
> > ?       ?   ?   ?   ?   ??? dropbear
> > ?       ?   ?   ?   ?   ??? ntpd
> > ?       ?   ?   ?   ??? dropbear
> > ?       ?   ?   ?   ?   ??? dropbear_rsa_host_key
> > ?       ?   ?   ?   ??? fw_env.config
> > ?       ?   ?   ?   ??? init.d
> > ?       ?   ?   ?   ?   ??? S49ntp
> > ?       ?   ?   ?   ?   ??? S50dropbear
> > ?       ?   ?   ?   ?   ??? S70modules
> > ?       ?   ?   ?   ?   ??? S90m9000
> > ?       ?   ?   ?   ??? profile
> > ?       ?   ?   ??? fl
> > ?       ?   ?   ?   ??? app
> > ?       ?   ?   ?   ?   ??? init.sh
> > ?       ?   ?   ?   ??? config
> > ?       ?   ?   ?       ??? config.xml
> > ?       ?   ?   ?       ??? default.xml
> > ?       ?   ?   ?       ??? verbose.txt
> > ?       ?   ?   ??? hd
> > ?       ?   ?   ?   ??? dat
> > ?       ?   ?   ??? sbin
> > ?       ?   ?       ??? watchdog
> > ?       ?   ??? scripts
> > ?       ?       ??? post_build.sh
> > ?       ?       ??? post_image.sh
> > ?       ??? usi.mk
> > ??? Config.in
> > ??? configs
> > ?   ??? m9000_defconfig
> > ??? external.desc
> > ??? external.mk
> > ??? local.mk
> > ??? package
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > *?   ??? usi?       ??? Config.in?       ??? m9kbootstrap?       ?   ???
> > Config.in?       ?   ??? m9kbootstrap.mk <http://m9kbootstrap.mk>?
> > ??? m9kdriver?       ?   ??? Config.in?       ?   ??? m9kdriver.mk
> > <http://m9kdriver.mk>?       ??? m9kfpga?       ?   ??? Config.in?
> > ?   ??? m9kfpga.mk <http://m9kfpga.mk>?       ??? m9k-poco?       ?   ???
> > Config.in?       ?   ??? m9k-poco.mk <http://m9k-poco.mk>?       ???
> > m9kservd?       ?   ??? Config.in?       ?   ??? m9kservd.mk
> > <http://m9kservd.mk>?       ??? mariadb-connector-c?       ?   ???
> > Config.in?       ?   ??? mariadb-connector-c.mk
> > <http://mariadb-connector-c.mk>**?       ??? usi.mk <http://usi.mk>*
> > ??? version
> > ??? version.txt  
> 
> 
> 
> 
> 
> On Tue, Jun 2, 2020 at 4:33 PM Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Hello Todd,
> >
> > On Tue, 2 Jun 2020 15:47:34 -0400, Todd Sampson <sampsonats@gmail.com>
> > wrote:
> >  
> > > I want to cross-compile mariadb-connector-c to link with the Poco library
> > > to create a MySQL client.
> > >
> > > Everything was working with mariadb-connector-c version 2.3.7.  I need to
> > > update to 3.1.8 for compatibility with MySQL version 8.  When I changed  
> > the  
> > > mariadb-connector-c  buildroot target to 3.1.8, the build failed because
> > > mariadb-connector-c had more dependencies.
> > >
> > > It seems like mariadb-connector-c depends on the mariadb server to be
> > > built.  If I build the server, mariadb-connector-c is happy.  The problem
> > > is, the mariadb server is installed on the target and there is no room  
> > for  
> > > it.
> > >
> > > I tried putting:
> > >  
> > > > MARIADB_INSTALL_TARGET = NO  
> > >
> > > in the mariadb server .mk file but it still was installed.
> > >
> > > If I don't select mariadb server, I get these errors and lots more  
> > similar:  
> > >
> > >  
> > home/dfr/m9k2/buildroot/output/host/lib/gcc/powerpc-buildroot-linux-gnu/8.4.0/../../../../powerpc-buildroot-linux-gnu/bin/ld:  
> > > >  
> > /home/dfr/m9k2/buildroot/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/mariadb/libmariadbclient.a(openssl.c.o):  
> > > > in function `ma_tls_set_error':
> > > > openssl.c:(.text+0x28): undefined reference to `ERR_get_error'
> > > >  
> > /home/dfr/m9k2/buildroot/output/host/lib/gcc/powerpc-buildroot-linux-gnu/8.4.0/../../../../powerpc-buildroot-linux-gnu/bin/ld:  
> > > > openssl.c:(.text+0x64): undefined reference to  
> > `ERR_reason_error_string'  
> > >
> > >
> > > *buildroot version 2020.05*
> > > *QUESTIONS*
> > > 1. Is there a better way to approach this?
> > > 2. How do I let mariadb server be built but *not *installed in the  
> > target?  
> > > 3. Should I be able to use the Poco library built into buildroot? It  
> > seems  
> > > like there should be an option in Poco to build the mariadb-connector-c
> > > library and just work.
> > > 4. Is anyone else in the world besides me trying to do this?
> > >
> > > I've been working on this for over two weeks now.  I sure would  
> > appreciate  
> > > any help!  
> >
> > First thing to do is support the buildroot people by providing your config
> > (or defconfig)
> > file which produces your problem (against a vanilla buildroot release or
> > git tree, so
> > other people can try to re-produce your problem)...
> >
> > Try to reproduce your problem with an complete re-build (make clean &&
> > make), see [1]
> >
> > As far as I can see in the builroot-2020.05 source mariadb is at version
> > 10.3.23,
> > where does your 2.3.7, 3.1.8 and MySQL version 8 come from?
> >
> > According to [2] mariadb-connector-c is included in mariadb-10.3.23 and
> > the buildroot package poco mysql component (BR2_PACKAGE_POCO_DATA_MYSQL)
> > simple
> > selects BR2_PACKAGE_MYSQL....do your try to build some packages outside of
> > buildroot? If yes...why?
> >
> > Regards,
> > Peter
> >
> > [1] https://buildroot.org/downloads/manual/manual.html#full-rebuild
> > [2] https://mariadb.com/kb/en/mariadb-connector-c-318-release-notes/
> >  
> > > Thanks  
> >
> >  
