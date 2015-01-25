From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 15:52:27 +0100
Subject: [Buildroot] [PATCH 1/3] benejson: new package
In-Reply-To: <1421953807-8902-1-git-send-email-codehero@gmail.com>
References: <20150117193703.GB2827@tarshish>
 <1421953807-8902-1-git-send-email-codehero@gmail.com>
Message-ID: <20150125145226.GA3937@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2015-01-22 14:10 -0500, David Bender spake thusly:
> From: David Bender <codehero@yahoo.com>
> 
> Added C/C++ JSON parsing package benejson.

As already suggested, the three patches adding benejson should be
squashed into one.

There are also a few remaining cosmetic issues.

I'll fix all of that locally and re-submit the patches.

Thanks for contribution!

Regards,
Yann E. MORIN.

> Signed-off-by: Dave Bender <bender@benegon.com>
> Signed-off-by: David Bender <codehero@gmail.com>
> ---
>  package/Config.in            |    1 +
>  package/benejson/Config.in   |    6 ++++++
>  package/benejson/benejson.mk |   37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 0 deletions(-)
>  create mode 100644 package/benejson/Config.in
>  create mode 100644 package/benejson/benejson.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 266de13..5a09608 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -761,6 +761,7 @@ menu "Javascript"
>  endmenu
>  
>  menu "JSON/XML"
> +	source "package/benejson/Config.in"
>  	source "package/cjson/Config.in"
>  	source "package/expat/Config.in"
>  	source "package/ezxml/Config.in"
> diff --git a/package/benejson/Config.in b/package/benejson/Config.in
> new file mode 100644
> index 0000000..6d8d2a3
> --- /dev/null
> +++ b/package/benejson/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_BENEJSON
> +	bool "benejson"
> +	help
> +	  "streaming JSON parsing library with C and C++ APIs"
> +
> +		https://codehero.github.io/benejson/
> diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
> new file mode 100644
> index 0000000..851b95e
> --- /dev/null
> +++ b/package/benejson/benejson.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# benejson
> +#
> +################################################################################
> +
> +BENEJSON_VERSION = 0.9.7
> +BENEJSON_SITE =  $(call github,codehero,benejson,$(BENEJSON_VERSION))
> +BENEJSON_LICENSE = BSD-3c
> +BENEJSON_LICENSE_FILES = COPYING
> +BENEJSON_INSTALL_STAGING = YES
> +
> +BENEJSON_DEPENDENCIES = host-scons
> +
> +BENEJSON_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS)
> +
> +define BENEJSON_BUILD_CMDS
> +	(cd $(@D); \
> +		$(BENEJSON_SCONS_ENV) \
> +		$(SCONS) \
> +		$(BENEJSON_SCONS_OPTS))
> +endef
> +
> +define BENEJSON_INSTALL_STAGING_CMDS
> +	(cd $(@D); \
> +		cp -ra include/benejson $(STAGING_DIR)/usr/include; \
> +		cp lib/libbenejson.{so,a} $(STAGING_DIR)/usr/lib \
> +		)
> +endef
> +
> +define BENEJSON_INSTALL_TARGET_CMDS
> +	(cd $(@D); \
> +		cp lib/libbenejson.{so,a} $(TARGET_DIR)/usr/lib \
> +		)
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.7.8.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
