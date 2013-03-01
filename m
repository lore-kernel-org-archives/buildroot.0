From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 01 Mar 2013 16:14:27 +0100
Subject: [Buildroot] [PATCH 4/7] dosfstools: bump to version 3.0.15
In-Reply-To: <1362133407-5840-4-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 1 Mar 2013 07:23:24 -0300")
References: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
 <1362133407-5840-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txovywx8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/dosfstools/Config.in     | 1 +
 Gustavo>  package/dosfstools/dosfstools.mk | 8 +++++---
 Gustavo>  2 files changed, 6 insertions(+), 3 deletions(-)

 Gustavo> diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
 Gustavo> index 1b92026..6573cda 100644
 Gustavo> --- a/package/dosfstools/Config.in
 Gustavo> +++ b/package/dosfstools/Config.in
 Gustavo> @@ -1,6 +1,7 @@
 Gustavo>  config BR2_PACKAGE_DOSFSTOOLS
 Gustavo>  	bool "dosfstools"
 Gustavo>  	depends on BR2_LARGEFILE
 Gustavo> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 Gustavo>  	help
 Gustavo>  	  Tools for creating and checking DOS FAT filesystems.
 
 Gustavo> diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
 Gustavo> index 4f89364..3bb6a2f 100644
 Gustavo> --- a/package/dosfstools/dosfstools.mk
 Gustavo> +++ b/package/dosfstools/dosfstools.mk
 Gustavo> @@ -4,8 +4,10 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -DOSFSTOOLS_VERSION = 3.0.12
 Gustavo> +DOSFSTOOLS_VERSION = 3.0.15
 Gustavo>  DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
 Gustavo> +DOSFSTOOLS_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 Gustavo> +DOSFSTOOLS_LINK_ICONV = $(if $(BR2_ENABLE_LOCALE),,-liconv)
 Gustavo>  DOSFSTOOLS_LICENSE = GPLv3+
 Gustavo>  DOSFSTOOLS_LICENSE_FILES = COPYING
 Gustavo>  MKDOSFS_BINARY = mkdosfs
 Gustavo> @@ -13,8 +15,8 @@ DOSFSCK_BINARY = dosfsck
 Gustavo>  DOSFSLABEL_BINARY = dosfslabel
 
 Gustavo>  define DOSFSTOOLS_BUILD_CMDS
 Gustavo> -	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
 Gustavo> -		CC="$(TARGET_CC)" -C $(@D)
 Gustavo> +	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" \
 Gustavo> +		LDFLAGS="$(TARGET_LDFLAGS) $(DOSFSTOOLS_LINK_ICONV)" -C $(@D)

I would prefer to see A DOSFSTOOLS_LDFLAGS instead of this. Care to
resend with that fixed?

-- 
Bye, Peter Korsgaard
