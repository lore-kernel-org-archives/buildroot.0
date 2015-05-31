From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 16:07:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/php: Fix static linking by
	reworking static libs handling
In-Reply-To: <1433071782-21109-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 31 May 2015 13:29:42 +0200")
References: <1433071782-21109-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <874mmsx2lm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/157/157749f8b44bc02fbed0232a2b33137aba495134/
 > http://autobuild.buildroot.net/results/df4/df4e2ea098b0126867455af1891837c6d7d99a92/
 > http://autobuild.buildroot.net/results/e69/e6993d66aeebbe994063a60871412b2235ce5455/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: merged sqlite and unixodbc fix, switched to pkgconf for sqlite,
 >     add openssl to new variable PHP_STATIC_LIBS and switch to pkgconf
 >     (Thomas)

 > @@ -225,6 +228,9 @@ endif
 >  ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC),y)
 >  PHP_CONF_OPTS += --with-pdo-odbc=unixODBC,$(STAGING_DIR)/usr
 >  PHP_DEPENDENCIES += unixodbc
 > +ifeq ($(BR2_STATIC_LIBS),y)
 > +PHP_STATIC_LIBS += -lpthread
 > +endif

unixodbc can be built without pthread support (by a patch from you), so
this should be:

ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
