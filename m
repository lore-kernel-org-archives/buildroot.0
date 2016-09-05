From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 5 Sep 2016 22:47:30 +0200
Subject: [Buildroot] [PATCH] add new library: libpugixml
In-Reply-To: <20160904210846.1332-1-theo.debrouwere@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
Message-ID: <CAHXCMM+Z7=q4483WbCbw9zu0MvVMhWqdO+_jEC4Hh_fYAjTzLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Theo, all,

Thanks for this contribution. Hereafter few comments inlined.

The subject should be: "libpugixml: new package"

On Sun, Sep 4, 2016 at 11:08 PM, Theo Debrouwere
<theo.debrouwere@skynet.be> wrote:
> From: Theo Debrouwere <t.debrouwere@televic.com>
>
>     pugixml is a light-weight C++ XML processing library. It features:
>     * DOM-like interface with rich traversal/modification capabilities
>     * Extremely fast non-validating XML parser which constructs the DOM tree from an XML file/buffer
>     * XPath 1.0 implementation for complex data-driven tree queries
>     * Full Unicode support with Unicode interface variants and automatic encoding conversions
>
>     Homepage: http://pugixml.org/
>     Repository: https://github.com/zeux/pugixml
>
> Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
> ---
>  package/Config.in                  |  1 +
>  package/libpugixml/Config.in       | 15 +++++++++++++++
>  package/libpugixml/libpugixml.hash |  2 ++
>  package/libpugixml/libpugixml.mk   | 19 +++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/libpugixml/Config.in
>  create mode 100644 package/libpugixml/libpugixml.hash
>  create mode 100644 package/libpugixml/libpugixml.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1e51a45..d0198ce 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1092,6 +1092,7 @@ menu "JSON/XML"
>         source "package/libxslt/Config.in"
>         source "package/libyaml/Config.in"
>         source "package/mxml/Config.in"
> +       source "package/libpugixml/Config.in"

Keep package list alphabetically sorted please.

>         source "package/rapidjson/Config.in"
>         source "package/rapidxml/Config.in"
>         source "package/raptor/Config.in"
> diff --git a/package/libpugixml/Config.in b/package/libpugixml/Config.in
> new file mode 100644
> index 0000000..17c6eec
> --- /dev/null
> +++ b/package/libpugixml/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBPUGIXML
> +       bool "libpugixml"

Since it is a C++ project, it should depend on BR2_INSTALL_LIBSTDCPP, see [1].

> +       help
> +         Light-weight, simple and fast XML parser for C++ with XPath support
> +
> +         Features:
> +         * DOM-like interface with rich traversal/modification capabilities
> +         * Extremely fast non-validating XML parser which constructs the DOM tree
> +           from an XML file/buffer
> +         * XPath 1.0 implementation for complex data-driven tree queries
> +         * Full Unicode support with Unicode interface variants and automatic
> +           encoding conversions
> +
> +         http://pugixml.org/
> +         https://github.com/zeux/pugixml
> diff --git a/package/libpugixml/libpugixml.hash b/package/libpugixml/libpugixml.hash
> new file mode 100644
> index 0000000..9007f7c
> --- /dev/null
> +++ b/package/libpugixml/libpugixml.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  fbe10d46f61d769f7d92a296102e4e2bd3ee16130f11c5b10a1aae590ea1f5ca  pugixml-1.7.tar.gz
> diff --git a/package/libpugixml/libpugixml.mk b/package/libpugixml/libpugixml.mk
> new file mode 100644
> index 0000000..3c9987e
> --- /dev/null
> +++ b/package/libpugixml/libpugixml.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# libpugixml
> +#
> +################################################################################
> +
> +LIBPUGIXML_VERSION = 1.7
> +LIBPUGIXML_SOURCE = pugixml-$(LIBPUGIXML_VERSION).tar.gz
> +LIBPUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(LIBPUGIXML_VERSION)
> +LIBPUGIXML_LICENSE = MIT
> +LIBPUGIXML_LICENSE_FILES = docs/manual.html
> +LIBPUGIXML_INSTALL_STAGING = YES
> +
> +LIBPUGIXML_SUBDIR = scripts
> +
> +# build libpugixml as a shared library
> +LIBPUGIXML_CONF_OPTS = -DBUILD_SHARED_LIBS=ON

Please do not do that, this will break static only build.
This flag is automatically driven by the cmake infrastructure
depending on kind of build (shared lib only, shared + static lib or
static lib only), check the cmake infrastructure reference section in
the manual [2].
Note that, in case of shared + static lib build, if the build-system
supports building only one kind of libs, shared libs is prefered (see
[3]).

If you really want to forbid the static build of the library, then
consider using "depends on !BR2_STATIC_LIBS", see the package section
in the manual [1].

> +
> +$(eval $(cmake-package))
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] http://nightly.buildroot.org/manual.html#dependencies-target-toolchain-options
[2] http://nightly.buildroot.org/manual.html#cmake-package-reference
[3] https://github.com/buildroot/buildroot/blob/master/package/pkg-cmake.mk#L100

Regards,

-- 
Samuel
