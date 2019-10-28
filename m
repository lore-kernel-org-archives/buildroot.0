From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 00:21:25 +0100
Subject: [Buildroot] [PATCH] package/gtest: bump to version 1.10.0
In-Reply-To: <20191028163633.6688-1-unixmania@gmail.com>
References: <20191028163633.6688-1-unixmania@gmail.com>
Message-ID: <23eecb39-fac7-6134-75d7-79f0a8b684e6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 17:36, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Drop custom gtest.pc and gmock.pc, already provided.
> 
> Add a post-install-staging hook to install the gmock-config script.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

 Applied to master, thanks.


[snip]
> -define GTEST_INSTALL_MISSING_FILES
> -	$(INSTALL) -D -m 0644 package/gtest/gtest.pc \
> -		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
> -	# Generate the gtest-config script manually, since the CMake
> -	# build system is not doing it.
> +# Generate the gtest-config script manually, since the CMake build system is
> +# not doing it.

 Ha, you moved those comments out of the define, excellent!

> +define GTEST_INSTALL_GTEST_CONFIG
>  	sed 's%@PACKAGE_TARNAME@%gtest%;\
>  		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
>  		s%@prefix@%$(STAGING_DIR)/usr%;\
> @@ -70,16 +62,30 @@ define GTEST_INSTALL_MISSING_FILES
>  		> $(STAGING_DIR)/usr/bin/gtest-config
>  	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
>  endef
> -
> -GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_MISSING_FILES
> +GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_GTEST_CONFIG
>  
>  ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> -define GTEST_GMOCK_INSTALL_MISSING_FILE
> -	$(INSTALL) -D -m 0644 package/gtest/gmock.pc \
> -		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
> -endef
> +GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
>  
> -GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_GMOCK_INSTALL_MISSING_FILE
> +# Generate the gmock-config script manually, since the CMake build system is
> +# not doing it.
> +define GTEST_INSTALL_GMOCK_CONFIG
> +	sed 's%@PACKAGE_TARNAME@%gmock%;\
> +		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
> +		s%@prefix@%$(STAGING_DIR)/usr%;\
> +		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
> +		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
> +		s%@includedir@%$(STAGING_DIR)/usr/include%;\
> +		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
> +		s%@PTHREAD_CFLAGS@%%;\
> +		s%@PTHREAD_LIBS@%-lpthread%;' \
> +		$(@D)/googlemock/scripts/gmock-config.in \
> +		> $(STAGING_DIR)/usr/bin/gmock-config
> +	chmod +x $(STAGING_DIR)/usr/bin/gmock-config
> +endef

 I've applied, but I wonder if it's really useful/needed to install the
gmock-config and gtest-config files? There are .pc files, and those are
basically better... We don't have any internal package using gtest, so it's hard
to know for sure.

 Regards,
 Arnout

> +GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_GMOCK_CONFIG
> +else
> +GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>  endif
>  
>  define HOST_GTEST_INSTALL_CMDS
> diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
> deleted file mode 100644
> index 594e79d7c5..0000000000
> --- a/package/gtest/gtest.pc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -prefix=/usr
> -exec_prefix=${prefix}
> -libdir=${prefix}/lib/
> -includedir=${prefix}/include
> -
> -Name: gtest
> -Description: Google C++ Testing Framework
> -Version: 1.8.0
> -Libs: -L${libdir} -lgtest
> -Libs.private: -lpthread
> -Cflags: -I${includedir}
> 
