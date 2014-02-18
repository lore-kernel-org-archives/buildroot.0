From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 18 Feb 2014 21:34:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] manual: add virtual package tutorial.
In-Reply-To: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMMJuED9xj9wVS0d0d+USa=-7_MdD6ZwoKQNj3zyg2+1vpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Fri, Feb 14, 2014 at 4:11 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> The 'Tips and Tricks' section now features instructions about how to add a
> virtual package.
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

The generic way of presenting the virtual/provider "infra" in Buildroot is:
we want to use the virtual/provider infrastructure when there is one
API, but several packages implementing this API, so we want an
extensible mechanism allowing to choose what implementation we want in
the target rootfs.

The example is good btw.

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
> +whose value will be set to the name of the provider, by the provider.
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

I think the "exit 1" here is not needed, "$(error ...)" will stop make anyway.
Someone can confirm?

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

I would move this line at the beginning of the "Provider" section,
telling that (and emphasizing that) only the Config.in of the provider
needs  few changes, the *.mk follows the buildroot infrastructure with
no change at all.


Regards,

-- 
Samuel
