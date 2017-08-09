From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 12:07:10 +0200
Subject: [Buildroot] Mysqld startup problems
In-Reply-To: <CAJJ6jxutio48UzYa_bK-CRc7t834Ds16+05+bO5EKfnrQL1tgA@mail.gmail.com>
References: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
 <ba440c62-d192-435f-2b3f-099611dd88fd@mind.be>
 <CAJJ6jxs0YL9hEumc5xwLYdTU0d6iM3CVtSyLiAMVM_9U0S1Erg@mail.gmail.com>
 <669d2c84-8015-74fe-7c74-54f5101c6891@mind.be>
 <CAJJ6jxutio48UzYa_bK-CRc7t834Ds16+05+bO5EKfnrQL1tgA@mail.gmail.com>
Message-ID: <93435a55-386a-c2df-abb2-8ed7e496d7f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-17 22:52, Steve Calfee wrote:
> Hi Arnout,
> 
> Thanks I really appreciate you trying to help. '
> 
> Here is the version of mysql I am using (the buildroot default)
> mysql-5.1.73.tar.gz: OK (md5: 887f869bcc757957067b9198f707f32f)
> mysql-5.1.73.tar.gz: OK (sha256:
> 05ebe21305408b24407d14b77607a3e5ffa3c300e03f1359d3066f301989dcb5)
> 
> 
> I cut my output to match what yours did and no mysql_safe was installed. :
> Making install in sql-common
> make[4]: Nothing to be done for 'install-exec-am'.
> make[4]: Nothing to be done for 'install-data-am'.
> Making install in scripts
> /usr/bin/make  install-am
>  /bin/mkdir -p '/home/calfee/nobu/br/dockstar/ds_9_2914/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin'
>  /bin/mkdir -p '/home/calfee/nobu/br/dockstar/ds_9_2914/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/mysql'
>  /usr/bin/install -c -m 644 fill_help_tables.sql
> mysql_fix_privilege_tables.sql mysql_system_tables.sql
> mysql_system_tables_data.sql mysql_test_data_timezone.sql
> '/home/calfee/nobu/br/dockstar/ds_9_2914/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/mysql'
>  /usr/bin/install -c msql2mysql mysql_config
> mysql_fix_privilege_tables mysql_fix_extensions mysql_setpermission
> mysql_secure_installation mysql_zap mysqlaccess mysqlbug
> mysql_convert_table_format mysql_find_rows mysqlhotcopy mysqldumpslow
> mysqld_multi '/home/calfee/nobu/br/dockstar/ds_9_2914/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin'

 Right, so looking at Makefile.am leads me to this fragment in configure.in:

if test "$with_server" != "no"
then
  server_scripts="mysqld_safe mysql_install_db"
  sql_server_dirs="strings mysys dbug extra regex storage plugin"

  sql_server="vio sql"
fi

 So apparently, with_server is not set to yes in your case. We pass
--with-embedded-server and a bit higher up configure.in we find

if test "$with_embedded_server" = "yes"
then
  libmysqld_dirs=libmysqld

  # We can't build embedded library without building the server, because
  # we depend on libmysys, libmystrings, libmyisam, etc.
  with_server=yes
fi

 So really, with_server should be yes...

 Could you add some debug echos in configure.in and do a
'make oracle-mysql-reconfigure' to try to find out what is going on? Or first,
check config.log to see if you can find anything there.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
