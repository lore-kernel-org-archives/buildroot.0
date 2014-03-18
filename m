From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 23:55:42 +0100
Subject: [Buildroot] [PATCH] eigen: (optionally) install unsupported
 modules
In-Reply-To: <1395173894-4811-2-git-send-email-zinosat@tiscali.it>
References: <1395173894-4811-1-git-send-email-zinosat@tiscali.it>
 <1395173894-4811-2-git-send-email-zinosat@tiscali.it>
Message-ID: <20140318235542.2eb029b1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Tue, 18 Mar 2014 21:18:14 +0100, Davide Viti wrote:
> From: Davide Viti <d.viti@infosolution.it>
> 
> 
> Signed-off-by: Davide Viti <zinosat@tiscali.it>

We probably want the title of the patch to be:

	eigen: add an option to install unsupported modules

>  
> +if BR2_PACKAGE_EIGEN
> +
> +config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
> +        bool "unsupported modules"

Indentation is wrong here: there should be one tab before the "bool"
statement.

> +	help
> +	  Install eigen unsupported modules
> +endif
> +
>  comment "eigen needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
> index 5abd464..388dd63 100644
> --- a/package/eigen/eigen.mk
> +++ b/package/eigen/eigen.mk
> @@ -13,6 +13,14 @@ EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
>  EIGEN_INSTALL_STAGING = YES
>  EIGEN_INSTALL_TARGET = NO
>  
> +define EIGEN_INSTALL_UNSUPPORTED_MODULES
> +	cp -a $(@D)/unsupported $(STAGING_DIR)/usr/include/

I'm a bit worried about having a directory called
$(STAGING_DIR)/usr/include/unsupported. Shouldn't this directory be
installed *below* the $(STAGING_DIR)/usr/include/Eigen directory
created by the normal installation of Eigen?

> +endef
> +
> +ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
> +	EIGEN_POST_INSTALL_STAGING_HOOKS += EIGEN_INSTALL_UNSUPPORTED_MODULES
> +endif

I believe we normally don't really use post install hooks when there is
a definition of the staging install commands. Instead, we use the
following idiom:

ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
define EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
	cp -a ...
endef
endif

define EIGEN_INSTALL_STAGING_CMDS
	... existing installation steps ...
	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
endef

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
