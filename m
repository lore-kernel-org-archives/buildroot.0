From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 25 Sep 2015 16:27:44 +0100
Subject: [Buildroot] [PATCH] glmark2: depend on host-python
In-Reply-To: <1443194731-52284-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443194731-52284-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <560567F0.9060206@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maintainer please,

On 09/25/2015 04:25 PM, Vicente Olivert Riera wrote:
> The waf build system of glmark2 needs Python 2 as stated on its README
> file:
> 
> python 2.x (>= 2.4) for the build system (waf)
> 
> Building it with a system with Python 3 as the default Python version
> will result on a failure like this one:
> 
> File "waflib/Utils.py", line 199
>     except OSError ,e:
>                    ^
> SyntaxError: invalid syntax
> 
> So, in order to fix this, make this package depending on host-python and
> also run the waf script using $(HOST_DIR)/usr/bin/python2.
> 
> At the same time fix a typo in the .mk file. The python-config script is
> localed at $(HOST_DIR)/usr/bin/ instead of $(STAGING_DIR)/usr/bin/.

s/localed/located/

Sorry,

Vincent.

> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fc6/fc6cd2a90bbb0e6f80f6c4afaae1430f82e54046/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/glmark2/glmark2.mk |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> index ffaea73..32112b4 100644
> --- a/package/glmark2/glmark2.mk
> +++ b/package/glmark2/glmark2.mk
> @@ -8,7 +8,7 @@ GLMARK2_VERSION = 499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc
>  GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
>  GLMARK2_LICENSE = GPLv3+ SGIv1
>  GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
> -GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng \
> +GLMARK2_DEPENDENCIES = host-pkgconf host-python jpeg libpng \
>  	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
>  	$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
>  	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
> @@ -47,21 +47,21 @@ GLMARK2_CONF_OPTS += \
>  
>  define GLMARK2_CONFIGURE_CMDS
>  	(cd $(@D); \
> -		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
> +		PYTHON_CONFIG="$(HOST_DIR)/usr/bin/python-config" \
>  		python_LDFLAGS="" \
>  		python_LIBDIR="" \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		$(GLMARK2_CONF_ENV) \
> -		./waf configure $(GLMARK2_CONF_OPTS) \
> +		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GLMARK2_CONF_OPTS) \
>  	)
>  endef
>  
>  define GLMARK2_BUILD_CMDS
> -	cd $(@D) && $(TARGET_MAKE_ENV) ./waf
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf
>  endef
>  
>  define GLMARK2_INSTALL_TARGET_CMDS
> -	cd $(@D) && $(TARGET_MAKE_ENV) ./waf install --destdir=$(TARGET_DIR)
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf install --destdir=$(TARGET_DIR)
>  endef
>  
>  $(eval $(generic-package))
> 
