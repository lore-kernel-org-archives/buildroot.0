From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 25 Nov 2007 09:28:03 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
In-Reply-To: <20071123132456.77C9430080@busybox.net>
References: <20071123132456.77C9430080@busybox.net>
Message-ID: <1195979283.4613.2.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-11-23 klockan 05:24 -0800 skrev jacmet at uclibc.org:
> Author: jacmet
> Date: 2007-11-23 05:24:55 -0800 (Fri, 23 Nov 2007)
> New Revision: 20501
> 
> Log:
> Compile in dbus support if available
> 
> Modified:
>    trunk/buildroot/package/avahi/avahi.mk

Could you please try this patch.
I dont have the time to test it right now.


> 
> Changeset:
> Modified: trunk/buildroot/package/avahi/avahi.mk
> ===================================================================
> --- trunk/buildroot/package/avahi/avahi.mk	2007-11-23 13:23:25 UTC (rev 20500)
> +++ trunk/buildroot/package/avahi/avahi.mk	2007-11-23 13:24:55 UTC (rev 20501)
> @@ -22,17 +22,26 @@
>  AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-autoipd
>  endif
>  
> +AVAHI_EXTRA_DEPS:=
> +
>  ifeq ($(strip $(BR2_PACKAGE_AVAHI_DAEMON)),y)
>  AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-daemon
>  AVAHI_DISABLE_EXPAT:=
>  # depend on the exact library file instead of expat so avahi isn't always
>  # considered out-of-date
> -AVAHI_EXPAT_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
> +AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/lib/libexpat.so.1
>  else
>  AVAHI_DISABLE_EXPAT:=--disable-expat
> -AVAHI_EXPAT_DEP:=
> +
>  endif
>  
> +ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
> +AVAHI_DISABLE_DBUS:=
> +AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/lib/libdbus-1.so
> +else
> +AVAHI_DISABLE_DBUS:=--disable-dbus
> +endif
> +
>  $(DL_DIR)/$(AVAHI_SOURCE):
>  	 $(WGET) -P $(DL_DIR) $(AVAHI_SITE)/$(AVAHI_SOURCE)
>  
> @@ -43,13 +52,9 @@
>  	toolchain/patch-kernel.sh $(AVAHI_DIR) package/avahi/ \*.patch
>  	touch $@
>  
> -$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXPAT_DEP)
> +$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXTRA_DEPS)
>  	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
>  	(cd $(AVAHI_DIR) && \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(TARGET_CONFIGURE_ARGS) \
> -		LIBDAEMON_CFLAGS="-I$(STAGING_DIR)/usr/include" \
> -		LIBDAEMON_LIBS="-L$(STAGING_DIR)/lib -ldaemon" \
>  		ac_cv_func_strtod=yes \
>  		ac_fsusage_space=yes \
>  		fu_cv_sys_stat_statfs2_bsize=yes \
> @@ -125,7 +130,7 @@
>  		--disable-qt3 \
>  		--disable-qt4 \
>  		--disable-gtk \
> -		--disable-dbus \
> +		$(AVAHI_DISABLE_DBUS) \
>  		$(AVAHI_DISABLE_EXPAT) \
>  		--disable-gdbm \
>  		--disable-python \
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards
Ulf Samuelsson
Atmel Nordic AB
Mail: Box 2033, 174 50 Sundbyberg
Visit:Kavalleriv?gen 24, 174 58 Sundbyberg
Phone: +46 8 441 54 22, GSM: +46 706 22 44 57
eMail: ulf at atmel.com

-------------- next part --------------
A non-text attachment was scrubbed...
Name: avahi.patch
Type: text/x-patch
Size: 2218 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071125/dbee2ce1/attachment.bin 
