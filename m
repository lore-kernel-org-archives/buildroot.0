From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 17:19:59 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/brltty: explicitly check if
 ioperm is available
In-Reply-To: <20171229140641.13882-2-mlang@blind.guru>
References: <20171229140641.13882-1-mlang@blind.guru>
 <20171229140641.13882-2-mlang@blind.guru>
Message-ID: <20171229171959.419ba4ae@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:06:41 +0100, Mario Lang wrote:

> +diff --git a/configure.ac b/configure.ac
> +index 5e94d33bd..07119dd9f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1446,7 +1446,9 @@ BRLTTY_ARG_PACKAGE([ports], [I/O ports], [], [dnl
> +       ports_package="kfreebsd"
> +       ;;
> +    linux*)
> +-      ports_package="glibc"
> ++      AC_CHECK_FUNC([ioperm], [
> ++         ports_package="glibc"

This seems weird. What happens then when ioperm() is not available ?
Which ports_package is used ?


> -BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> +BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf
>  
>  BRLTTY_CONF_OPTS = \
>  	--disable-java-bindings \
> @@ -24,6 +24,12 @@ BRLTTY_CONF_OPTS = \
>  	--without-mikropuhe --without-speechd --without-swift \
>  	--without-theta --without-viavoice
>  
> +define BRLTTY_AUTOCONF
> +	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
> +endef
> +
> +BRLTTY_PRE_CONFIGURE_HOOKS += BRLTTY_AUTOCONF

Please use BRLTTY_AUTORECONF = YES instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
