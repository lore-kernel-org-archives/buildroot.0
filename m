From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Jun 2012 05:42:41 +0200
Subject: [Buildroot] [PATCH] lighttpd: use standard web root directory
In-Reply-To: <1340634705-20022-1-git-send-email-spdawson@gmail.com>
References: <1340634705-20022-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FE92FB1.4080508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/12 16:31, spdawson at gmail.com wrote:
> The lighttpd package uses /srv/www as its web root directory; this sets it
> apart from other web-related packages in Buildroot, which all use /var/www
> as their web root directory.
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
[snip]
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
  Why is this removed?
> -
> - ##
> - ## The default format produces CLF compatible output.
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index c7fae32..0b75185 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -59,7 +59,7 @@ endif
>   define LIGHTTPD_INSTALL_CONFIG
>       mkdir -p $(TARGET_DIR)/etc/lighttpd
>       mkdir -p $(TARGET_DIR)/etc/lighttpd/conf.d
> -    mkdir -p $(TARGET_DIR)/srv/www/htdocs
> +    mkdir -p $(TARGET_DIR)/var/www/htdocs
  This seems to imply that the actual server root (i.e. what http://hostname/ is
pointing to) is /var/www/htdocs, not /var/www.  So that's still different from
the other packages. But I'm not familiar enough with lighttpd config to be sure.

  Regards,
  Arnout
>
>       [ -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ] || \
>           $(INSTALL) -D -m 755 $(@D)/doc/config/lighttpd.conf \


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
