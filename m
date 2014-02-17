From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 18:19:51 +0100
Subject: [Buildroot] [PATCH v2 1/1] manual: add virtual package tutorial.
In-Reply-To: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <530244B7.402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/14 16:11, Eric Le Bihan wrote:
> The 'Tips and Tricks' section now features instructions about how to add a
> virtual package.

 Good plan!

> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
> Changes v1 -> v2:
>   - correct grammar errors (reported by ThomasDS).
> ---
>  docs/manual/adding-packages-tips.txt |   83 ++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 73c25be..5992860 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -55,3 +55,86 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
>    Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
>    so it is not necessary to specify it in the +.mk+ file.
>  - When using a commit ID as version, you should use the full 40 hex characters.
> +
> +[[virtual-package-tutorial]]
> +How to add a virtual package
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +In Buildroot, a virtual package is a package whose functionalities are
> +provided by one or more packages, referred to as 'providers'.
> +
> +For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
> +The implementation of this API is different for the 'Allwinner Tech Sunxi' and
> +the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
> +package and +sunxi-mali+ and +ti-gfx+ will be the providers.
> +
> +.Virtual package +Config.in+ file
> +=================================
> +The +Config.in+ file of virtual package 'foo' should contain:
> +
> +---------------------------
> +01: config BR2_PACKAGE_HAS_FOO
> +02:	bool
> +03:
> +04: config BR2_PACKAGE_PROVIDES_FOO
> +05:	depends on BR2_PACKAGE_HAS_FOO
> +06:	string
> +---------------------------
> +=================================

 I haven't checked, but isn't this === line redundant?

> +
> +On line 1, we declare the option +BR2_PACKAGE_HAS_FOO+, which will be selected
> +by the provider. On line 4, we declare the option +BR2_PACKAGE_PROVIDES_FOO+
> +whose value will be set to the name of the provider, by the provider.

 I think an example would be better here. All those providers are a bit
confusing. So it would be nice if you could make a complete example with
Config.in and *.mk fragments for the virtual package and for a provider.

 To make it easier for the reader to distinguish between them, perhaps it
would be better to the virtual package V and the provider package P.

> +
> +.Virtual package +*.mk+ file
> +============================
> +The Makefile +package/foo/foo.mk+ should contain:
> +
> +---------------------------
> +01: ################################################################################
> +02: #
> +03: # foo
> +04: #
> +05: ################################################################################
> +06:
> +07: FOO_SOURCE =
> +08: FOO_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_FOO))
> +09:
> +10: ifeq ($(FOO_DEPENDENCIES),)
> +11: define FOO_CONFIGURE_CMDS
> +12:	$(error No Foo implementation selected. Configuration error)
> +13:	exit 1
> +14: endef
> +15: endif

 This is missing an $(eval $(generic-package))

> +---------------------------
> +============================

 Again, isn't this redundant?

> +
> +The Makefile is quite small as it will only check if a provider for the
> +virtual package has been selected.
> +
> +.Provider +Config.in+ file
> +==========================
> +The +Config.in+ file of the package 'libbaz', which provides the functionalities
> +of 'foo', should contain:
> +
> +---------------------------
> +01: config BR2_PACKAGE_LIBBAZ
> +02:	bool "libbaz"
> +03:	select BR2_PACKAGE_HAS_FOO
> +04:	help
> +05:	  This is a comment that explains what libbaz is.
> +06:
> +07:	  http://bazsoftware.org/libbaz/
> +08:
> +09: if BR2_PACKAGE_LIBBAZ
> +10: config BR2_PACKAGE_PROVIDES_FOO
> +11:	default "libbaz"
> +12: endif
> +---------------------------
> +==========================

 Redundant

> +
> +On line 3, we select +BR2_PACKAGE_HAS_FOO+, and on line 11, we set the value
> +of +BR2_PACKAGE_PROVIDES_FOO+ to the name of the provider, but only if it is
> +selected.
> +
> +No modifications to +package/libbaz/libbaz.mk+ are required.

 ... when you add a provider package.

(Just making things a little more explicit.)

 Thanks!

 Regards,
 Arnout

> --
> 1.7.9.5
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
