From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 00:54:48 +0200
Subject: [Buildroot] [PATCH v2] tcl: bump to version 8.6.1
In-Reply-To: <1396899466-13715-1-git-send-email-andrew.ruder@elecsyscorp.com>
 (Andrew Ruder's message of "Mon, 7 Apr 2014 14:37:46 -0500")
References: <1396899466-13715-1-git-send-email-andrew.ruder@elecsyscorp.com>
Message-ID: <87mwfwda2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

 > Turn off building compatibility layers for old/broken versions of
 > standard functions (strstr, strtoul, strtod) with the assumption that
 > anything buildroot is using as a standard C library will be good enough
 > to not have broken behavior.

 > Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > ---
 > This addresses the issues in the first version of the patch (courtesy Peter
 > Korsgaard).  Sorry for the long delay on bugfixes.  Seems like my patch-submit
 > days are few and far between.

Thanks, but I still see issues :/

tclUnixSock.c needs IPv6 support, so the package need to depend on
BR2_INET_IPV6.


 > +define TCL_REMOVE_EXTRA
 > +	rm -fr $(TARGET_DIR)/usr/lib/tdbcmysql1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbcodbc1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbcpostgres1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tclConfig.sh \
 > +	       $(TARGET_DIR)/usr/lib/tclooConfig.sh
 >  endef
 > +TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
 > -TCL_POST_INSTALL_TARGET_HOOKS += TCL_FIXUP_RO_LIB
 > +ifeq ($(BR2_PACKAGE_SQLITE),y)
 > +TCL_DEPENDENCIES = sqlite
 > +HOST_TCL_DEPENDENCIES =
 > +else
 > +define TCL_REMOVE_SQLITE
 > +	rm -fr $(TARGET_DIR)/usr/lib/sqlite3.8.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbcsqlite3-1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbc1.0.0
 > +endef
 > +TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_SQLITE
 > +endif

It seems suboptional to build stuff and then just throw it away. Even
worse, the embedded sqlite fails to build if the system doesn't have
largefile support.

Looking at the Makefile, it looks like we can just rm pkgs/<pkg> for the
unwanted packages in a post-patch hook.

In the context of buildroot, does it ever make sense to build the
embedded sqlite copy instead of using the existing package?

Care to fix those issues and resend? Thanks.

-- 
Bye, Peter Korsgaard
