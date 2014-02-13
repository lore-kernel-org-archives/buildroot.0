From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Feb 2014 17:02:43 +0100
Subject: [Buildroot] [PATCH 1/1] manual: add virtual package tutorial.
In-Reply-To: <1392305755-29431-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1392305755-29431-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAAXf6LV2Wyi+c4-cx6hAMdiwONE0s42bAdbf4oVMB1nbb=qByg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Thu, Feb 13, 2014 at 4:35 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> The 'Tips and Tricks' section now features instructions about how to add a
> virtual package.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  docs/manual/adding-packages-tips.txt |   83 ++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 73c25be..6d467a7 100644
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
> +In Buildroot, a virtual package is a package which functionalities are

I think this should be 'whose functionalities'

> +provided by one or more packages, referred as 'providers'.

referred to as 'providers'.

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
> +02:    bool
> +03:
> +04: config BR2_PACKAGE_PROVIDES_FOO
> +05:    depends on BR2_PACKAGE_HAS_FOO
> +06:    string
> +---------------------------
> +=================================
> +
> +On line 1, we declare the option +BR2_PACKAGE_HAS_FOO+, which will be selected
> +by the provider. On line 4, we declare the option +BR2_PACKAGE_PROVIDES_FOO+
> +which value will be set to the name of the provider, by the provider.

whose value

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
> +12:    $(error No Foo implementation selected. Configuration error)
> +13:    exit 1
> +14: endef
> +15: endif
> +---------------------------
> +============================
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
> +02:    bool "libbaz"
> +03:    select BR2_PACKAGE_HAS_FOO
> +04:    help
> +05:      This is a comment that explains what libbaz is.
> +06:
> +07:      http://bazsoftware.org/libbaz/
> +08:
> +09: if BR2_PACKAGE_LIBBAZ
> +10: config BR2_PACKAGE_PROVIDES_FOO
> +11:    default "libbaz"
> +12: endif
> +---------------------------
> +==========================
> +
> +On line 3, we select +BR2_PACKAGE_HAS_FOO+, and on line 11, we set the value
> +of +BR2_PACKAGE_PROVIDES_FOO+ to the name of the provider, but only if it is
> +selected.
> +
> +No modifications to +package/libbaz/libbaz.mk+ are required.
> --


Best regards,
Thomas
