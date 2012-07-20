From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 20 Jul 2012 14:23:50 +0200
Subject: [Buildroot] [PATCH v3] lighttpd: use standard web root directory
In-Reply-To: <1342779436-3427-1-git-send-email-spdawson@gmail.com>
References: <1342779436-3427-1-git-send-email-spdawson@gmail.com>
Message-ID: <50094DD6.6080102@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 20/07/2012 12:17, spdawson at gmail.com a ?crit :
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  v3: Update patch to reduce fuzz caused by changes to package build
>  infrastructure.
>  v2: Fixed creation of web root directory during install. Also fixed makefile
>  to use $(INSTALL) and $(RM) instead of mkdir and rm -f
> 
>  .../lighttpd-Fix-default-config-file.patch         |   52 +++++++++-----------
>  package/lighttpd/lighttpd.mk                       |   11 ++---
>  2 files changed, 29 insertions(+), 34 deletions(-)
> 
> diff --git a/package/lighttpd/lighttpd-Fix-default-config-file.patch b/package/lighttpd/lighttpd-Fix-default-config-file.patch
> index 59ce907..d7900e9 100644
> --- a/package/lighttpd/lighttpd-Fix-default-config-file.patch
> +++ b/package/lighttpd/lighttpd-Fix-default-config-file.patch
> @@ -8,25 +8,34 @@ Modify the default lighttpd configuration file to have one a starting conf
>    * Change the network backend to writev since linux-sendfile fails on buildroot
>  
>  Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Since you are modifying this patch, could you add your signed-off-by as
well ?

> ----
> - doc/config/conf.d/access_log.conf |    2 +-
> - doc/config/lighttpd.conf          |   18 +++++++++---------
> - 2 files changed, 10 insertions(+), 10 deletions(-)
>  
> -Index: lighttpd-1.4.30/doc/config/lighttpd.conf
> -===================================================================
> ---- lighttpd-1.4.30.orig/doc/config/lighttpd.conf
> -+++ lighttpd-1.4.30/doc/config/lighttpd.conf
> -@@ -13,7 +13,7 @@
> +diff -Nurp a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
> +--- a/doc/config/conf.d/access_log.conf	2010-07-11 18:01:32.000000000 +0100
> ++++ b/doc/config/conf.d/access_log.conf	2012-06-25 15:20:29.053260085 +0100
> +@@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
> + ##
> + ## Default access log.
> + ##
> +-accesslog.filename          = log_root + "/access.log"
> ++accesslog.filename          = log_root + "/lighttpd-access.log"
> + 
> + ##
> + ## The default format produces CLF compatible output.
> +diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
> +--- a/doc/config/lighttpd.conf	2011-12-18 12:57:25.000000000 +0000
> ++++ b/doc/config/lighttpd.conf	2012-06-25 15:21:49.469256500 +0100
> +@@ -13,8 +13,8 @@
>   ## if you add a variable here. Add the corresponding variable in the
>   ## chroot example aswell.
>   ##
>  -var.log_root    = "/var/log/lighttpd"
> +-var.server_root = "/srv/www"
>  +var.log_root    = "/var/log"
> - var.server_root = "/srv/www"
> ++var.server_root = "/var/www"
>   var.state_dir   = "/var/run"
>   var.home_dir    = "/var/lib/lighttpd"
> -@@ -90,7 +90,7 @@
> + var.conf_dir    = "/etc/lighttpd"
> +@@ -90,7 +90,7 @@ server.port = 80
>   ##
>   ## Use IPv6?
>   ##
> @@ -35,7 +44,7 @@ Index: lighttpd-1.4.30/doc/config/lighttpd.conf
>   
>   ##
>   ## bind to a specific IP
> -@@ -101,8 +101,8 @@
> +@@ -101,8 +101,8 @@ server.use-ipv6 = "enable"
>   ## Run as a different username/groupname.
>   ## This requires root permissions during startup. 
>   ##
> @@ -46,7 +55,7 @@ Index: lighttpd-1.4.30/doc/config/lighttpd.conf
>   
>   ## 
>   ## enable core files.
> -@@ -138,7 +138,7 @@
> +@@ -138,7 +138,7 @@ server.pid-file = state_dir + "/lighttpd
>   ##
>   ## Path to the error log file
>   ##
> @@ -55,7 +64,7 @@ Index: lighttpd-1.4.30/doc/config/lighttpd.conf
>   
>   ##
>   ## If you want to log to syslog you have to unset the 
> -@@ -188,7 +188,7 @@
> +@@ -188,7 +188,7 @@ server.event-handler = "linux-sysepoll"
>   ## linux-sendfile - is recommended for small files.
>   ## writev         - is recommended for sending many large files
>   ##
> @@ -64,7 +73,7 @@ Index: lighttpd-1.4.30/doc/config/lighttpd.conf
>   
>   ##
>   ## As lighttpd is a single-threaded server, its main resource limit is
> -@@ -311,9 +311,9 @@
> +@@ -311,9 +311,9 @@ url.access-deny             = ( "~", ".i
>   ## disable range requests for pdf files
>   ## workaround for a bug in the Acrobat Reader plugin.
>   ##
> @@ -77,16 +86,3 @@ Index: lighttpd-1.4.30/doc/config/lighttpd.conf
>   
>   ##
>   ## url handling modules (rewrite, redirect)
> -Index: lighttpd-1.4.30/doc/config/conf.d/access_log.conf
> -===================================================================
> ---- lighttpd-1.4.30.orig/doc/config/conf.d/access_log.conf
> -+++ lighttpd-1.4.30/doc/config/conf.d/access_log.conf
> -@@ -9,7 +9,7 @@
> - ##
> - ## Default access log.
> - ##
> --accesslog.filename          = log_root + "/access.log"
> -+accesslog.filename          = log_root + "/lighttpd-access.log"
> - 
> - ##
> - ## The default format produces CLF compatible output.
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 5ff4ce6..48f733a 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -57,9 +57,8 @@ LIGHTTPD_CONF_OPT += --without-lua
>  endif
>  
>  define LIGHTTPD_INSTALL_CONFIG
> -	mkdir -p $(TARGET_DIR)/etc/lighttpd
> -	mkdir -p $(TARGET_DIR)/etc/lighttpd/conf.d
> -	mkdir -p $(TARGET_DIR)/srv/www/htdocs
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www

Why do you remove the mkdirs here ?

>  	[ -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ] || \
>  		$(INSTALL) -D -m 755 $(@D)/doc/config/lighttpd.conf \
> @@ -89,9 +88,9 @@ endef
>  LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
>  
>  define LIGHTTPD_UNINSTALL_TARGET_CMDS
> -	rm -f $(TARGET_DIR)/usr/sbin/lighttpd
> -	rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
> -	rm -rf $(TARGET_DIR)/usr/lib/lighttpd
> +	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd
> +	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd-angel
> +	$(RM) -r $(TARGET_DIR)/usr/lib/lighttpd
>  endef

Why do you drop the -f here ? Depending on the user's shell and its
configuration, rm might require the user to confirm this removal, which
is not the case with rm -f.


Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
