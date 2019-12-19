From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 19:20:26 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/xenomai: smokey's not a skin
In-Reply-To: <b034c8f77c378ee90c8e0a97db5a1933aaa4a5d6.1576743874.git.jan.kiszka@siemens.com>
References: <cover.1576743874.git.jan.kiszka@siemens.com>
 <b034c8f77c378ee90c8e0a97db5a1933aaa4a5d6.1576743874.git.jan.kiszka@siemens.com>
Message-ID: <20191219182026.GN26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2019-12-19 09:24 +0100, Jan Kiszka spake thusly:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> That's a testsuite tool.
> 
> Rename XENOMAI_REMOVE_SKIN_LIST at this chance as it's cleaning
> libraries, not only skins.

I also renamed the hook accordingly, too, and applied to master. Thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  package/xenomai/Config.in  |  5 -----
>  package/xenomai/xenomai.mk | 23 ++++++++++-------------
>  2 files changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index 83ba8ca162..0cb0b343de 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -170,11 +170,6 @@ config BR2_PACKAGE_XENOMAI_RTAI_SKIN
>  	help
>  	  This option allows to install the RTAI Xenomai skin
>  
> -config BR2_PACKAGE_XENOMAI_SMOKEY_SKIN
> -	bool "Smokey skin"
> -	help
> -	  This option allows to install the Smokey Xenomai skin
> -
>  config BR2_PACKAGE_XENOMAI_UITRON_SKIN
>  	bool "uITRON skin"
>  	help
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index 16c486eb34..f25adf747b 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -73,7 +73,7 @@ XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UNNEEDED_FILES
>  ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
>  define XENOMAI_REMOVE_TESTSUITE
>  	rm -rf $(TARGET_DIR)/usr/share/xenomai/
> -	for i in clocktest gpiotest latency spitest switchtest \
> +	for i in clocktest gpiotest latency smokey spitest switchtest \
>  		xeno-test-run-wrapper dohell xeno-test-run xeno-test ; do \
>  		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
>  	done
> @@ -109,24 +109,21 @@ endef
>  XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_ANALOGY
>  endif
>  
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,alchemy)
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_POSIX_SKIN),,posix)
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_PSOS_SKIN),,psos)
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_RTAI_SKIN),,rtai)
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_SMOKEY_SKIN),,smokey)
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_UITRON_SKIN),,uitron)
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
> -XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,alchemy)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_POSIX_SKIN),,posix)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_PSOS_SKIN),,psos)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_RTAI_SKIN),,rtai)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_TESTSUITE),,smokey)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_UITRON_SKIN),,uitron)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
> +XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
>  
>  define XENOMAI_REMOVE_SKINS
> -	for i in $(XENOMAI_REMOVE_SKIN_LIST) ; do \
> +	for i in $(XENOMAI_REMOVE_LIBS_LIST) ; do \
>  		rm -f $(TARGET_DIR)/usr/lib/lib$$i.* ; \
>  		if [ $$i == "posix" ] ; then \
>  			rm -f $(TARGET_DIR)/usr/lib/posix.wrappers ; \
>  		fi ; \
> -		if [ $$i == "smokey" ] ; then \
> -			rm -f $(TARGET_DIR)/usr/bin/smokey* ; \
> -		fi ; \
>  	done
>  endef
>  
> -- 
> 2.16.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
