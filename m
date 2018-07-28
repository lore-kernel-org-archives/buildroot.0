From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2018 10:21:42 +0200
Subject: [Buildroot] [PATCH 1/1] lighttpd: Adding /var/log/lighttpd
 folder with the owner www-data The lighttpd need to write in his root log
 folder
In-Reply-To: <20180727213514.19361-1-laurent.hartanerot@gmail.com>
References: <20180727213514.19361-1-laurent.hartanerot@gmail.com>
Message-ID: <324085c7-8a71-0481-9b62-71fee6a6ec93@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-07-18 23:35, Laurent Hartanerot wrote:
> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> Lighttpd don't start with the default buildroot configuration
> 
> /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
> 2018-06-22 11:21:34: (server.c.733) opening errorlog '/var/log/lighttpd-error.log' failed: Permission denied
> 2018-06-22 11:21:34: (server.c.1420) Opening errorlog failed. Going down.

 This doesn't sound right. In the default skeleton, /var/log is a symlink to
/tmp and /tmp is world-writable. If you use a custom skeleton, it's your
responsibility to make sure that it contains everything you need.

> 
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> ---
>  package/lighttpd/0001-Fix-default-config-file.patch | 6 ++----
>  package/lighttpd/lighttpd.mk                        | 5 +++++
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lighttpd/0001-Fix-default-config-file.patch b/package/lighttpd/0001-Fix-default-config-file.patch
> index ada1589760..4fa5902718 100644
> --- a/package/lighttpd/0001-Fix-default-config-file.patch
> +++ b/package/lighttpd/0001-Fix-default-config-file.patch
> @@ -1,6 +1,5 @@
>  Modify the default lighttpd configuration file to have one a starting conf
> 
> -  * Changed the log path to /var/log and logs filenames
>    * Disable IPv6
>    * Do not setuid to a user that doesn't exist on the system
>    * Disable pdf ranges fix for Adobe Reader since it uses regex and we
> @@ -27,13 +26,12 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf lighttpd-1.4.3
>  diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/config/lighttpd.conf
>  --- lighttpd-1.4.37.orig/doc/config/lighttpd.conf	2015-09-01 14:38:48.684673663 -0300
>  +++ lighttpd-1.4.37/doc/config/lighttpd.conf	2015-09-01 14:39:40.256442492 -0300
> -@@ -13,8 +13,8 @@
> +@@ -14,8 +14,8 @@
>   ## if you add a variable here. Add the corresponding variable in the
>   ## chroot example aswell.
>   ##
> --var.log_root    = "/var/log/lighttpd"
> + var.log_root    = "/var/log/lighttpd"
>  -var.server_root = "/srv/www"
> -+var.log_root    = "/var/log"
>  +var.server_root = "/var/www"
>   var.state_dir   = "/var/run"
>   var.home_dir    = "/var/lib/lighttpd"
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index c565fed4ff..4fa1614c38 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -67,6 +67,7 @@ endif
>  define LIGHTTPD_INSTALL_CONFIG
>  	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
>  	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/log/lighttpd

 This doesn't work with the default skeleton, because it will create the
directory but at runtime it will be overridden by a tmpfs.

 Hm, I realize now that I don't really know what happens in the systemd case. It
might be necessary to add a /etc/tmpfiles.d config for systemd. But that should
then be part of the LIGHTTPD_INSTALL_INIT_SYSTEMD commands.


 Regards,
 Arnout

>  	$(INSTALL) -D -m 0644 $(@D)/doc/config/lighttpd.conf \
>  		$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
>  	$(INSTALL) -D -m 0644 $(@D)/doc/config/modules.conf \
> @@ -98,4 +99,8 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
>  endef
> 
> +define LIGHTTPD_PERMISSIONS
> +	/var/log/lighttpd d 755 33 33 - - - - -
> +endef
> +
>  $(eval $(autotools-package))
> --
> 2.11.0
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
