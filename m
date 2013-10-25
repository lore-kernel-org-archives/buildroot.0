From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 25 Oct 2013 16:53:09 -0500
Subject: [Buildroot] [PATCH 2/5] boost: add host variant
In-Reply-To: <1382703323-31038-2-git-send-email-gustavo@zacarias.com.ar>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <OFD1D9DF7F.3A82BA27-ON86257C0F.006A97BA-86257C0F.007833C7@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

Please see my comment below, otherwise looks good.

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 10/25/2013 07:15:20 
AM:

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/boost/boost.mk | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index b0b3352..8a1a8f7 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -11,11 +11,19 @@ BOOST_SITE = 
http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSIO
>  BOOST_INSTALL_STAGING = YES
> 
>  TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
> +HOST_CC_VERSION = $(shell $(HOSTCC) -dumpversion)
> 
>  BOOST_DEPENDENCIES =
> 
>  BOOST_FLAGS =
> 
> +# keep host variant as minimal as possible

Could you expand more on what you are leaving enabled and why?

> +HOST_BOOST_FLAGS = --without-icu \
> +   --without-libraries=$(subst $(space),$(comma),atomic chrono context 
\
> +   coroutine date_time exception filesystem graph graph_parallel \
> +   iostreams locale log math mpi program_options python random regex \
> +   serialization signals system test thread timer wave)
> +
>  # atomic library compile only with upstream version, wait for next 
release
>  # coroutine breaks on some weak toolchains and it's new for 1.54+
>  # log breaks with some toolchain combinations and it's new for 1.54+
> @@ -54,6 +62,9 @@ ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
>  BOOST_DEPENDENCIES += bzip2 zlib
>  endif
> 
> +HOST_BOOST_OPT += toolset=gcc threading=multi variant=release 
link=shared \
> +   runtime-link=shared
> +
>  BOOST_OPT += toolset=gcc \
>          threading=multi \
>          variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
> @@ -78,6 +89,12 @@ define BOOST_CONFIGURE_CMDS
>     echo "" >> $(@D)/user-config.jam
>  endef
> 
> +define HOST_BOOST_CONFIGURE_CMDS
> +   (cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
> +   echo "using gcc : $(HOST_CC_VERSION) : $(HOSTCXX) : 
<cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > 
$(@D)/user-config.jam
> +   echo "" >> $(@D)/user-config.jam
> +endef
> +
>  define BOOST_INSTALL_TARGET_CMDS
>     (cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
>     --user-config=$(@D)/user-config.jam \
> @@ -86,6 +103,21 @@ define BOOST_INSTALL_TARGET_CMDS
>     --layout=system install )
>  endef
> 
> +define HOST_BOOST_BUILD_CMDS
> +   (cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
> +   --user-config=$(@D)/user-config.jam \
> +   $(HOST_BOOST_OPT) \
> +   --prefix=$(HOST_DIR)/usr )
> +endef
> +
> +define HOST_BOOST_INSTALL_CMDS
> +   (cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
> +   --user-config=$(@D)/user-config.jam \
> +   $(HOST_BOOST_OPT) \
> +   --prefix=$(HOST_DIR)/usr \
> +   --layout=system install )
> +endef
> +
>  define BOOST_INSTALL_STAGING_CMDS
>     (cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
>     --user-config=$(@D)/user-config.jam \
> @@ -95,3 +127,4 @@ define BOOST_INSTALL_STAGING_CMDS
>  endef
> 
>  $(eval $(generic-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.8.1.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
