From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 22:58:23 +0200
Subject: [Buildroot] [PATCH 1/1] boost: detect missing selects
In-Reply-To: <20180707124940.15961-1-fontaine.fabrice@gmail.com>
References: <20180707124940.15961-1-fontaine.fabrice@gmail.com>
Message-ID: <cbe8aae4-f0a0-4da6-5dac-114955f122c5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-07-18 14:49, Fabrice Fontaine wrote:
> As suggested by Arnout during the review of
> http://patchwork.ozlabs.org/patch/934589, add a mechanism to detect a
> missing boost select by checking that we do not install a boost library
> which hasn't been selected by the user.
> 
> To manage a change of boost configuration by the user between two
> builds, add a BOOST_PRE_INSTALL_TARGET_HOOKS to remove all boost
> libraries before installing them.
> 
> Also, use ls with a wildcard instead of test to avoid trying to guess
> library names if boost layout is set to tagged or versionned (the
> wildcard will also help us to manage shared or static library)

 We could still have used $(if $(wildcard ... but OK.

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index cf0cea7edd..b2605a70b7 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -159,6 +159,24 @@ define BOOST_INSTALL_STAGING_CMDS
>  	--layout=$(BOOST_LAYOUT) install)
>  endef
>  
> +# These hooks will help us to detect missing select in Config.in
> +# Indeed boost buildsystem can select a library even if the user has
> +# disable it
     disabled

 It was not immediately obvious to me that this comment applied to the two
following hooks, but I don't see how it could be improved.

> +define BOOST_REMOVE_TARGET_LIBRARIES
> +	rm -rf $(TARGET_DIR)/usr/lib/libboost_*
> +endef
> +
> +BOOST_PRE_INSTALL_TARGET_HOOKS += BOOST_REMOVE_TARGET_LIBRARIES
> +
> +define BOOST_CHECK_TARGET_LIBRARIES
> +	@$(foreach disabled,$(BOOST_WITHOUT_FLAGS),\

 Maybe $Q instead of @

> +		! ls $(TARGET_DIR)/usr/lib/libboost_$(disabled)* 1>/dev/null 2>&1 || \
> +			! echo "libboost_$(disabled) shouldn't have been installed: missing select in boost/Config.in" || \

 The ! echo looks pretty weird. Would be simpler with a simple condition if ! ls
...; then echo; exit 1; fi

> +			exit 1;)

 The ; is redundant.

 But all of that is just bikeshedding, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> +endef
> +
> +BOOST_POST_INSTALL_TARGET_HOOKS += BOOST_CHECK_TARGET_LIBRARIES
> +
>  define HOST_BOOST_CONFIGURE_CMDS
>  	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
>  	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
