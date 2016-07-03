From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jul 2016 00:06:38 +0200
Subject: [Buildroot] [PATCH 1/1] owncloud: new package
In-Reply-To: <1458223208-7133-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1458223208-7133-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <0c1d17ea-1143-5d74-50ab-7881ec384815@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-03-16 15:00, Sylvain Raybaud wrote:
> Add package owncloud 9.0.0: http://www.owncloud.org
> Copy static files to /usr/lib/owncloud and dynamic files to
> /var/lib/owncloud.
> 
> owncloud needs php, mysql and a webserver. MySQL and the webserver
> can be provided by different packages therefore no specific
> dependency is set.
> 
> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
[snip]
> diff --git a/package/owncloud/owncloud.hash b/package/owncloud/owncloud.hash
> new file mode 100644
> index 0000000..c40c87f
> --- /dev/null
> +++ b/package/owncloud/owncloud.hash
> @@ -0,0 +1,3 @@
> +# Hashes from: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2.{md5,sha256}
> +md5	 1f14d7f2faa0ba704901e062301854db					owncloud-9.0.0.tar.bz2
> +sha256	 d16737510a77a81489f7c4d5e19b0756fa2ea1c5081ba174b0fec0f00da3a77c	owncloud-9.0.0.tar.bz2

 If upstream provides a sha256, that one is sufficient. Of course, having both
doesn't hurt.

> diff --git a/package/owncloud/owncloud.mk b/package/owncloud/owncloud.mk
> new file mode 100644
> index 0000000..ff9e105
> --- /dev/null
> +++ b/package/owncloud/owncloud.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# owncloud
> +#
> +################################################################################
> +
> +OWNCLOUD_VERSION = 9.0.0

 Hm, I wonder how this is going to be used in practice when you want to upgrade.
In buildroot, the assumption is that upgrading is done by replacing the entire
filesystem image. The data would then be kept in a separate partition. However,
owncloud doesn't support this way of upgrading at all: you have to do the
upgrade from the application itself, or you will most likely break your database...

> +OWNCLOUD_SOURCE = owncloud-$(OWNCLOUD_VERSION).tar.bz2
> +OWNCLOUD_SITE = https://download.owncloud.org/community
> +OWNCLOUD_DEPENDENCIES =
> +OWNCLOUD_LICENSE = AGPL

 AGPLv3

> +OWNCLOUD_LICENSE_FILES = COPYING-AGPL
> +
> +define OWNCLOUD_INSTALL_TARGET_CMDS
> +	#install files /usr/lib

 Comments are not needed here. They show up as commands on the output, which is
annoying. If you really want a comment, put it before the _CMDS definition.

> +	mkdir -p $(TARGET_DIR)/usr/lib
> +	cp -a $(@D) $(TARGET_DIR)/usr/lib/owncloud
> +	#move dynamic files in /var/lib and make symbolic links
> +	mkdir -p $(TARGET_DIR)/var/lib/owncloud
> +	mkdir -p $(TARGET_DIR)/var/lib/owncloud/data

 The second is is enough, it implies the first one.


 Regards,
 Arnout

> +	mv $(TARGET_DIR)/usr/lib/owncloud/config $(TARGET_DIR)/var/lib/owncloud/
> +	mv $(TARGET_DIR)/usr/lib/owncloud/apps $(TARGET_DIR)/var/lib/owncloud/
> +	#use relative path so that permissions can be set by OWNCLOUD_PERMISSIONS hook
> +	ln -s ../../../var/lib/owncloud/data $(TARGET_DIR)/usr/lib/owncloud/data
> +	ln -s ../../../var/lib/owncloud/config $(TARGET_DIR)/usr/lib/owncloud/config
> +	ln -s ../../../var/lib/owncloud/apps $(TARGET_DIR)/usr/lib/owncloud/apps
> +endef
> +
> +define OWNCLOUD_PERMISSIONS
> +	/usr/lib/owncloud r -1 root root - - - - -
> +	/var/lib/owncloud r -1 www-data www-data - - - - -
> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
