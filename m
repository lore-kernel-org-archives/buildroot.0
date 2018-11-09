From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Nov 2018 15:54:54 +0100
Subject: [Buildroot] [PATCH 1/1] mariadb: fix mysql_config when cross
 compiling
In-Reply-To: <20181108170950.30189-2-chrismcc@gmail.com> (Christopher
 McCrory's message of "Thu, 8 Nov 2018 09:09:50 -0800")
References: <20181108170950.30189-1-chrismcc@gmail.com>
 <20181108170950.30189-2-chrismcc@gmail.com>
Message-ID: <87lg627135.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher McCrory <chrismcc@gmail.com> writes:

 > Mariadb_config in staging is not a shell script, this breaks
 > mysql_config when cross-compiling.  This in turn breaks package builds
 > needing the location of the include and library files. So remove it after
 > installation into $TARGET_DIR

 > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
 > ---
 >  package/mariadb/mariadb.mk | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
 > index 06d6365fab..52d47f98fc 100644
 > --- a/package/mariadb/mariadb.mk
 > +++ b/package/mariadb/mariadb.mk
 > @@ -125,10 +125,15 @@ endif
 
 >  # We don't need mysql_config on the target as it's only useful in staging
 >  # We also don't need the test suite on the target
 > +# Also mariadb_config in staging is not a shell script, this breaks
 > +# mysql_config when cross-compiling.  This in turn breaks package builds
 > +# needing the location of the include and library files. So remove it after
 > +# installation into $TARGET_DIR

Ehh, STAGING_DIR or TARGET_DIR?

What then happens when those packages try to run mariadb_config to get
the include/library locations? What if the build machine already has
mariadb_config in the path?

>  define MARIADB_POST_INSTALL
 >  	mkdir -p $(TARGET_DIR)/var/lib/mysql
 >  	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
 >  	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 > +	$(RM) $(STAGING_DIR)/usr/bin/mariadb_config

Fixups to STAGING_DIR should not be mixed up wiith the TARGET_DIR
installation logic, please add a POST_INSTALL_STAGING_HOOK instead.

>  endef
 
 >  MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL
 > -- 
 > 2.14.5

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
