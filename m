From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Oct 2018 10:43:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/mariadb: add option to disable
 build of embedded server
In-Reply-To: <20181018185920.16430-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 18 Oct 2018 20:59:20 +0200")
References: <20181018185920.16430-1-bernd.kuhls@t-online.de>
Message-ID: <87d0s24bi4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Size of output/target/usr:
 > with embedded: 1,7G
 > without embedded: 648M

 > This config option saves space on the target if the embedded server
 > is not used by any other package:

 > https://mariadb.com/kb/en/library/embedded-mariadb-interface/
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/mariadb/mariadb.mk | 4 ++++
 >  package/mysql/Config.in    | 5 +++++
 >  2 files changed, 9 insertions(+)

 > diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
 > index 2523aaf062..06d6365fab 100644
 > --- a/package/mariadb/mariadb.mk
 > +++ b/package/mariadb/mariadb.mk
 > @@ -56,8 +56,12 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 >  MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
 
 >  ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 > +ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 >  MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
 >  else
 > +MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=OFF
 > +endif
 > +else
 >  MARIADB_CONF_OPTS += -DWITHOUT_SERVER=ON
 >  endif
 
 > diff --git a/package/mysql/Config.in b/package/mysql/Config.in
 > index 6409c8b806..257a2901a4 100644
 > --- a/package/mysql/Config.in
 > +++ b/package/mysql/Config.in
 > @@ -54,6 +54,11 @@ config BR2_PACKAGE_MARIADB_SERVER
 >  	help
 >  	  Install the mariadb server on the target.
 
 > +config BR2_PACKAGE_MARIADB_SERVER_EMBEDDED
 > +	bool "mariadb embedded server"

If the embedded server can only be enabled if MARIADB_SERVER is enabled,
then this Config.in option should also depend on it.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
