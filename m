From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 07 Jul 2013 16:16:14 +0200
Subject: [Buildroot] need help adding apache to buildroot
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
Message-ID: <51D9782E.1060901@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 16.01.2013 22:30, schrieb Jenkins, Lee (ISS Houston):
>
> Hello. I'm adding apache httpd to my buildroot project but I'm stuck
> and need some help.
>
Hello Lee,

did you finally manage to build apache? If yes, could you provide a patch?

Kind Regards

Stephan
>
>  
>
> Here's what I've done so far:
>
>  
>
> 1.       created a directory buildroot/package/apache
>
> 2.       created buildroot/package/apache/Config.in (see below)
>
> 3.       as a starting point, downloaded the panda-buildroot apache.mk
> (see below)  to buildroot/package/apache
>
> 4.       added a line <<source "package/apache/Config.in">> to
> buildroot/package/Config.in under "Networking applications"
>
> 5.       ran "make menuconfig", selected "apache" in "Package
> Selection" > "Networking applications", saved & exited
>
> 6.       ran "make" and expected httpd to be built and show up in my
> rootfs target. It was not there.
>
> 7.       ran "make apache-source" as a test, but make replies: "No
> rule to make target `apache-source'. Stop."
>
>  
>
> I expected make to pick up the new package, but that's clearly not
> happening. What am I missing?
>
>  
>
> Lee Jenkins
>
>  
>
>  
>
> ----- buildroot/package/apache/Config.in -----
>
>  
>
> config BR2_PACKAGE_APACHE
>
>      bool "apache"
>
>      help
>
>        Apache web server software
>
>  
>
> ----- buildroot/package/apache/apache.mk -----
>
>  
>
> #############################################################
>
> #
>
> # apache
>
> #
>
> #############################################################
>
> APACHE_VERSION    = 2.2.19
>
> #APACHE_SITE       = http://mir2.ovh.net/ftp.apache.org/dist/httpd/
>
> APACHE_SITE       = http://archive.apache.org/dist/httpd/
>
> APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>
> APACHE_INSTALL_STAGING = YES
>
> APACHE_INSTALL_TARGET = YES
>
> APACHE_AUTORECONF = YES
>
>  
>
> APACHE_CONF_ENV += \
>
>         ac_cv_file__dev_zero=yes \
>
>         ac_cv_func_setpgrp_void=yes \
>
>         apr_cv_tcp_nodelay_with_cork=yes \
>
>         ac_cv_sizeof_struct_iovec=8 \
>
>         apr_cv_process_shared_works=yes \
>
>         apr_cv_mutex_robust_shared=no \
>
>         ac_cv_struct_rlimit=yes \
>
>         ap_cv_void_ptr_lt_long=no \
>
>         CC="$(TARGET_CC)" \
>
>         CFLAGS="$(TARGET_CFLAGS)" \
>
>         LDFLAGS="$(TARGET_LDFLAGS)" \
>
>  
>
> APACHE_CONF_OPT += \
>
>         --host="$(REAL_GNU_TARGET_NAME)" \
>
>         --prefix="/apacheSW/" \
>
>         --enable-so \
>
>         --enable-module=all
>
>  
>
>  
>
>        
>
>                 
>
>                 
>
> define APACHE_CONFIGURE_CMDS
>
>         (cd $(@D) && rm -rf config.cache; \
>
>                 $(APACHE_CONF_ENV) \
>
>                 ./configure \
>
>                 $(APACHE_CONF_OPT) \
>
>         )
>
> endef
>
> define ADD_INIT_SCRIPT
>
>  
>
> $(INSTALL) -m 0755 -D
> $(APACHE_DIR_PREFIX)/$(APACHE_NAME)/Apache_InitScript \
>
>         $(TARGET_DIR)/etc/init.d/S90Apache;
>
> endef
>
> APACHE_POST_INSTALL_STAGING_HOOKS += ADD_INIT_SCRIPT
>
>  
>
>  
>
> $(eval $(call AUTOTARGETS))
>
>  
>
>  
>
>  
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130707/614c5484/attachment-0001.html>
