From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Apr 2020 14:26:11 +0200
Subject: [Buildroot] [PATCH 2/4] package/openjdk: fix installation with
 merged usr directories
In-Reply-To: <20200417232922.3762195-2-aduskett@gmail.com>
References: <20200417232922.3762195-1-aduskett@gmail.com>
 <20200417232922.3762195-2-aduskett@gmail.com>
Message-ID: <20200418122611.GQ5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-04-17 16:29 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> Currently, Buildroot installs the jre libraries using
> cp -dprf /build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> 
> However, if a system has a merged /usr directory, and there is a
> built kernel before installing OpenJDK, the installation fails because
> jre/lib has binary modules file, which causes the following error:
> cp: cannot overwrite directory '/usr/lib/modules with non-directory
[--SNIP--]
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index edc86c6fbe..d540b65edc 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
[--SNIP--]
> @@ -114,8 +123,12 @@ endef
>  # Calling make install always builds and installs the JDK instead of the JRE,
>  # which makes manual installation necessary.
>  define OPENJDK_INSTALL_TARGET_CMDS
> -	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/* $(TARGET_DIR)/usr/bin/
> -	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> +	mkdir -p $(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
> +	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
> +		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
> +	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
> +		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)

Additional nit in addition to the previous review...

When the target is a directory, make it sure to copy to a directory by
appending a trailing '/' :

    cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
        (TARGET_DIR)/$(OPENJDK_INSTALL_BASE)/

Regards,
Yann E. MORIN.

> +	cd $(TARGET_DIR)/usr/bin && ln -snf ../../$(OPENJDK_INSTALL_BASE)/bin/* .
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.25.2
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
