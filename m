From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 30 May 2011 13:54:51 -0500
Subject: [Buildroot] [PATCH 1/2] Add package acl
In-Reply-To: <1306779390-19947-2-git-send-email-zonque@gmail.com>
References: <1306779390-19947-1-git-send-email-zonque@gmail.com>
	<1306779390-19947-2-git-send-email-zonque@gmail.com>
Message-ID: <006301cc1efb$0e37e330$2aa7a990$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did send both of these packages in last year, but they never made it into
git....

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Daniel Mack
> Sent: Monday, May 30, 2011 1:16 PM
> To: buildroot at busybox.net
> Subject: [Buildroot] [PATCH 1/2] Add package acl
> 
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
>  package/Config.in     |    1 +
>  package/acl/Config.in |    7 +++++++
>  package/acl/acl.mk    |   27 +++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 package/acl/Config.in
>  create mode 100644 package/acl/acl.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 40f523d..cefe90e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -483,6 +483,7 @@ source "package/xmlstarlet/Config.in"
>  endmenu
> 
>  menu "System tools"
> +source "package/acl/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/bootutils/Config.in"
>  endif
> diff --git a/package/acl/Config.in b/package/acl/Config.in
> new file mode 100644
> index 0000000..0a07d1e
> --- /dev/null
> +++ b/package/acl/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_ACL
> +	bool "ACL tools"
> +	depends on BR2_PACKAGE_ATTR
> +	help
> +	  Commands for Manipulating POSIX Access Control Lists
> +	  See http://savannah.nongnu.org/projects/acl
> +
> diff --git a/package/acl/acl.mk b/package/acl/acl.mk
> new file mode 100644
> index 0000000..30faad1
> --- /dev/null
> +++ b/package/acl/acl.mk
> @@ -0,0 +1,27 @@
> +#########################################################
> ####
> +#
> +# acl
> +#
> +#########################################################
> ####
> +ACL_VERSION = 2.2.51
> +ACL_SOURCE = acl-$(ACL_VERSION).src.tar.gz
> +ACL_SITE = http://mirror.its.uidaho.edu/pub/savannah/acl/
> +ACL_LIBTOOL_PATCH = NO
> +ACL_INSTALL_STAGING = YES
> +ACL_INSTALL_TARGET = YES
> +ACL_DEPENDENCIES = attr
> +ACL_CONF_OPT = --enable-gettext=no
> +
> +define ACL_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/getfacl/.libs/getfacl
> $(TARGET_DIR)/usr/bin/
> +	$(INSTALL) -m 0755 -D $(@D)/setfacl/.libs/setfacl
> $(TARGET_DIR)/usr/bin/
> +	$(INSTALL) -m 0644 -D $(@D)/libacl/.libs/libacl.so*
> $(STAGING_DIR)/usr/lib/
> +endef
> +
> +define ACL_INSTALL_STAGING_CMDS
> +	test -d $(STAGING_DIR)/usr/include/acl/ || mkdir
> $(STAGING_DIR)/usr/include/acl/
> +	$(INSTALL) -m 0644 -D $(@D)/include/*.h
> $(STAGING_DIR)/usr/include/acl/
> +	$(SED) s,sys/acl.h,acl/acl.h, -i
> $(STAGING_DIR)/usr/include/acl/libacl.h
> +endef
> +
> +$(eval $(call AUTOTARGETS,package,acl))
> --
> 1.7.5.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
