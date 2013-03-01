From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 01 Mar 2013 23:03:47 +0100
Subject: [Buildroot] [PATCHv2] dosfstools: bump to version 3.0.15
In-Reply-To: <1362155044-23258-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 1 Mar 2013 13:24:04 -0300")
References: <1362155044-23258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87obf2ydz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/dosfstools/Config.in     |  2 ++
 Gustavo>  package/dosfstools/dosfstools.mk | 10 ++++++----
 Gustavo>  2 files changed, 8 insertions(+), 4 deletions(-)

 Gustavo> diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
 Gustavo> index 1b92026..bd5cf89 100644
 Gustavo> --- a/package/dosfstools/Config.in
 Gustavo> +++ b/package/dosfstools/Config.in
 Gustavo> @@ -1,6 +1,8 @@
 Gustavo>  config BR2_PACKAGE_DOSFSTOOLS
 Gustavo>  	bool "dosfstools"
 Gustavo>  	depends on BR2_LARGEFILE
 Gustavo> +	depends on BR2_USE_WCHAR
 Gustavo> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 Gustavo>  	help
 Gustavo>  	  Tools for creating and checking DOS FAT filesystems.

You forgot to update the comment to say explain why it isn't available.
 
 Gustavo> diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
 Gustavo> index 4f89364..1e1d891 100644
 Gustavo> --- a/package/dosfstools/dosfstools.mk
 Gustavo> +++ b/package/dosfstools/dosfstools.mk
 Gustavo> @@ -4,8 +4,10 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -DOSFSTOOLS_VERSION = 3.0.12
 Gustavo> -DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
 Gustavo> +DOSFSTOOLS_VERSION = 3.0.15
 Gustavo> +DOSFSTOOLS_SITE = http://fossies.org/linux/misc
 Gustavo> +DOSFSTOOLS_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 Gustavo> +DOSFSTOOLS_LDFLAGS = "$(if $(BR2_ENABLE_LOCALE),,-liconv)"
 Gustavo>  DOSFSTOOLS_LICENSE = GPLv3+
 Gustavo>  DOSFSTOOLS_LICENSE_FILES = COPYING
 Gustavo>  MKDOSFS_BINARY = mkdosfs
 Gustavo> @@ -13,8 +15,8 @@ DOSFSCK_BINARY = dosfsck
 Gustavo>  DOSFSLABEL_BINARY = dosfslabel
 
 Gustavo>  define DOSFSTOOLS_BUILD_CMDS
 Gustavo> -	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
 Gustavo> -		CC="$(TARGET_CC)" -C $(@D)
 Gustavo> +	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" \
 Gustavo> +		LDFLAGS="$(TARGET_LDFLAGS) $(DOSFSTOOLS_LDFLAGS)" -C $(@D)

What I ment was to stick all flags in DOSFSTOOLS_LDFLAGS. I've fixed up
these things and committed, thanks.

-- 
Bye, Peter Korsgaard
