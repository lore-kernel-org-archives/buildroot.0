From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 09:51:17 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: 0 dbus libxml2
In-Reply-To: <20090130074016.0A323765E9@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Fri\, 30 Jan 2009 07\:40\:15 +0000 \(UTC\)")
References: <20090130074016.0A323765E9@busybox.osuosl.org>
Message-ID: <878wotp46y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-30 07:40:14 +0000 (Fri, 30 Jan 2009)
 ulf> New Revision: 25156

 ulf> Log:
 ulf> Fix dbus dependency on libxml2, without rebuild, works but may need refinement

It sure looks like it does ;) What exactly is it you want to fix, and
why doesn't a normal dbus: libxml2 dependency work?

 ulf> Added:
 ulf>    trunk/buildroot/package/0/
 ulf>    trunk/buildroot/package/0/0-run-first.mk

??

 ulf> Changeset:
 ulf> Added: trunk/buildroot/package/0/0-run-first.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/0/0-run-first.mk	                        (rev 0)
 ulf> +++ trunk/buildroot/package/0/0-run-first.mk	2009-01-30 07:40:14 UTC (rev 25156)
 ulf> @@ -0,0 +1,4 @@
 ulf> +ifeq ($(BR2_TARGET_LIBXML2),y)
 ulf> +TARGETS+=libxml2
 ulf> +endif
 ulf> +

??

 ulf> Modified: trunk/buildroot/package/dbus/dbus.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/dbus/dbus.mk	2009-01-29 23:32:06 UTC (rev 25155)
 ulf> +++ trunk/buildroot/package/dbus/dbus.mk	2009-01-30 07:40:14 UTC (rev 25156)
 ulf> @@ -15,17 +15,17 @@
 ulf>  DBUS_XML:=expat
 ulf>  # depend on the exact library file instead of expat so dbus isn't always
 ulf>  # considered out-of-date
 ulf> -DBUS_XML_DEP_LIB:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 ulf> +DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 ulf>  else
 ulf>  DBUS_XML:=libxml
 ulf>  # Makefile.autotools.in unfortunately has broken dependency handling,
 ulf>  # so we cannot do the same for libxml2
 ulf> -DBUS_XML_DEP_LIB:=$(LIBXML2_HOOK_POST_INSTALL)
 ulf> +DBUS_XML_DEP:=$(LIBXML2_HOOK_POST_INSTALL)

Good, so that's what I asked you to revert.

 ulf>  #libxml2-install-staging
 ulf>  endif
 
 ulf> -DBUS_XML_DEP:=$(DBUS_XML_DEP_LIB)
 
 ulf> +
 ulf>  $(DL_DIR)/$(DBUS_SOURCE):
 ulf>  	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
 
 ulf> @@ -37,6 +37,7 @@
 
 ulf>  $(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked $(DBUS_XML_DEP)
 ulf>  	(cd $(DBUS_DIR); rm -rf config.cache; \
 ulf> +		echo "dbus is depending on  $(DBUS_XML_DEP)"; \

Don't do that.

 ulf>  		$(TARGET_CONFIGURE_OPTS) \
 ulf>  		$(TARGET_CONFIGURE_ARGS) \
 ulf>  		ac_cv_have_abstract_sockets=yes \

 ulf> Modified: trunk/buildroot/package/libxml2/libxml2.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/libxml2/libxml2.mk	2009-01-29 23:32:06 UTC (rev 25155)
 ulf> +++ trunk/buildroot/package/libxml2/libxml2.mk	2009-01-30 07:40:14 UTC (rev 25156)
 ulf> @@ -8,7 +8,7 @@
 ulf>  LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 ulf>  LIBXML2_INSTALL_STAGING = YES
 ulf>  LIBXML2_INSTALL_TARGET = YES
 ulf> -
 ulf> +LIBXML2_LIBTOOL_PATCH = NO

Why?
 
 ulf> -$(LIBXML2_HOOK_POST_INSTALL):
 ulf> +$(LIBXML2_HOOK_POST_INSTALL):\
 ulf> +	$(LIBXML2_TARGET_SOURCE)		\
 ulf> +	$(LIBXML2_TARGET_EXTRACT)		\
 ulf> +	$(LIBXML2_HOOK_POST_EXTRACT)		\
 ulf> +	$(LIBXML2_TARGET_PATCH)			\
 ulf> +	$(LIBXML2_TARGET_AUTORECONF)		\
 ulf> +	$(LIBXML2_TARGET_CONFIGURE)		\
 ulf> +	$(LIBXML2_TARGET_LIBTOOL_PATCH)		\
 ulf> +	$(LIBXML2_TARGET_BUILD)			\
 ulf> +	$(LIBXML2_HOOK_POST_BUILD)		\
 ulf> +	$(LIBXML2_TARGET_INSTALL_STAGING)
 ulf>  	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 ulf>  	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 ulf>  	rm -rf $(TARGET_DIR)/usr/share/aclocal \
 ulf>  	       $(TARGET_DIR)/usr/share/doc/libxml2-$(LIBXML2_VERSION) \
 ulf>  	       $(TARGET_DIR)/usr/share/gtk-doc
 ulf>  	touch $@
 ulf> +

Why?

-- 
Bye, Peter Korsgaard
