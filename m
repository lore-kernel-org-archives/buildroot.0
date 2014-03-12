From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Mar 2014 08:01:33 +0100
Subject: [Buildroot] [PATCH] boost binary names layout configuration
In-Reply-To: <531F2DF8.3080502@web.de>
References: <531F2DF8.3080502@web.de>
Message-ID: <5320064D.2080705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Uwe,

On 03/11/14 16:38, Uwe Kindler wrote:
> Hi,
> 
> the following patch adds support for configuration of boost binary names
> layout. We have a cross platform library that uses boost. On Windows it
> is not possible to build boost with system layout and we have to use
> tagged layout. Also for Ubuntu we use tagged layout and therefore it
> would be great to have the option to use tagged layout for buildroot.

 Could you resend your patch as a proper patch? See
http://buildroot.net/downloads/manual/manual.html#submitting-patches

 Make sure that your personal reference is removed from the commit log. E.g.

Boost has several naming schemes for its libraries. One use case for
being able to select the naming scheme is for cross-platform support,
because on Windows it is not possible to use the system layout. It is
more convenient if the same layout can be used on all platforms.


 Also make sure you send the patch with proper whitespace, preferably
with git send-email.


 When you do resubmit, you can add my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

below your Signed-off-by.

 I do have one comment below but it's optional.


> 
> 
>  package/boost/Config.in | 28 ++++++++++++++++++++++++++++
>  package/boost/boost.mk  | 14 +++++++++++---
>  2 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 68c3909..3ccb659 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -16,6 +16,34 @@ config BR2_PACKAGE_BOOST
> 
>  if BR2_PACKAGE_BOOST
> 
> +choice
> +    prompt "Layout"
> +    default BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> +    help
> +      Selects the layout of boost binary names
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> +    bool "system"
> +    help
> +      Binaries names do not include the Boost version number or the name
> and
> +      version number of the compiler.
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
> +    bool "tagged"
> +    help
> +      Names of boost binaries include the encoded build properties such as
> +      variant and threading, but do not including compiler name and
> version, or
> +      Boost version. This option is useful if you build several variants of
> +      Boost, using the same compiler.
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
> +    bool "versioned"
> +    help
> +      Names of boost binaries include the Boost version number, name and
> +      version of the compiler and encoded build properties.
> +
> +endchoice
> +
>  config BR2_PACKAGE_BOOST_CHRONO
>      bool "boost-chrono"
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 7aab614..05e7cf6 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -82,6 +82,14 @@ endif
>  BOOST_WITHOUT_FLAGS_COMMASEPERATED += $(subst $(space),$(comma),$(strip
> $(BOOST_WITHOUT_FLAGS)))
>  BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED),
> --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPERATED))
> 
> +ifeq ($(BR2_PACKAGE_BOOST_LAYOUT_SYSTEM),y)
> +BOOST_LAYOUT = system
> +else ifeq ($(BR2_PACKAGE_BOOST_LAYOUT_TAGGED),y)
> +BOOST_LAYOUT = tagged
> +else
> +BOOST_LAYOUT = versioned
> +endif

 Such "switch statements" are often easier to handle in the Config.in:

config BR2_PACKAGE_BOOST_LAYOUT
	string
	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
	default "versioned" if BR2_PACKAGE_BOOST_LAYOUT_VERSIONED

and in the .mk file the uses become
$(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))

 However, that's just a suggestion. If you're happy with the way things
are now, feel free to keep it.


 Regards,
 Arnout

> +
>  define BOOST_CONFIGURE_CMDS
>      (cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
>      echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) :
> <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" >
> $(@D)/user-config.jam
> @@ -99,7 +107,7 @@ define BOOST_INSTALL_TARGET_CMDS
>      --user-config=$(@D)/user-config.jam \
>      $(BOOST_OPT) \
>      --prefix=$(TARGET_DIR)/usr \
> -    --layout=system install )
> +    --layout=$(BOOST_LAYOUT) install )
>  endef
> 
>  define HOST_BOOST_BUILD_CMDS
> @@ -114,7 +122,7 @@ define HOST_BOOST_INSTALL_CMDS
>      --user-config=$(@D)/user-config.jam \
>      $(HOST_BOOST_OPT) \
>      --prefix=$(HOST_DIR)/usr \
> -    --layout=system install )
> +    --layout=$(BOOST_LAYOUT) install )
>  endef
> 
>  define BOOST_INSTALL_STAGING_CMDS
> @@ -122,7 +130,7 @@ define BOOST_INSTALL_STAGING_CMDS
>      --user-config=$(@D)/user-config.jam \
>      $(BOOST_OPT) \
>      --prefix=$(STAGING_DIR)/usr \
> -    --layout=system install)
> +    --layout=$(BOOST_LAYOUT) install)
>  endef
> 
>  $(eval $(generic-package))
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
