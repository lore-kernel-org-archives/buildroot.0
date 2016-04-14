From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 Apr 2016 07:45:36 -0500
Subject: [Buildroot] [PATCH v5] valijson: new package
In-Reply-To: <1460626076-28824-1-git-send-email-santosh.multhalli@rockwellcollins.com>
References: <1460626076-28824-1-git-send-email-santosh.multhalli@rockwellcollins.com>
Message-ID: <CANQCQpbMsy6Qh4wEwMt3xAGZu5T8cyzAhpk4Mo+M+Lb8cUqj2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Thu, Apr 14, 2016 at 4:27 AM, santosh.multhalli <
santosh.multhalli@rockwellcollins.com> wrote:

> Valijson is a header-only JSON Schema Validation library for
> C++.Add a patch
> 0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> to install valijson headers ,provide optional compilation of unit tests and
> examples.
>

Just a comment, so there are no headers in this patchset but you're
mentioning one.  I assume it was part of the upstreaming?


>
> Signed-off-by: santosh.multhalli <santosh.multhalli@rockwellcollins.com>
> ---
> Changes v4 -> v5:
>   - Bumped up the version after updated in the cmake file for which the
> patches were created.
>   - Deleted the Cmake patch files as it is of no use with updated version.
>   - Changes have been upstreamed in valijson community below is the link:
>
> https://github.com/tristanpenman/valijson/commit/0c645c53f3f5535145526c5e49bdf994daa6f44c
>
> Changes v3 -> v4:
>   - Changed master  package/valijson/Config.in
> package/valijson/0001-CMake-Add-options.patch and
>
> package/valijson/0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
>      to implement  Samauel comments
>     1) patch fixing the CMAKE_CXX_FLAGS and variables
> 0001-CMake-Add-options.patch
>     2) patch using these new variables
>
>  0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
>     3) comment  added for the case when these dependencies are not met
>     4) updated the comments to reflect boost dependecy
>
> Changes v2 -> v3:
>   - Changed master package/Config.in and package/valijson/Config.in to
> implement
>     Samauel and Thomas Comments
>     1)changed intendations in package/valijson/Config.in
>     2) updated the comments to reflect boost dependecy
>     3) updated to keep the alphabetical order in package/Config.in
>
> Changes v1 -> v2:
>   - Patch splitted into two
>     0001-CMake-Add-options.patch
>
> 0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
>
>   - Changed Config.in and valijson.mk as per comments ( suggested by
> Samuel and Thomas).
> ---
>  package/Config.in              |  1 +
>  package/valijson/Config.in     | 19 +++++++++++++++++++
>  package/valijson/valijson.hash |  2 ++
>  package/valijson/valijson.mk   | 16 ++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/valijson/Config.in
>  create mode 100644 package/valijson/valijson.hash
>  create mode 100644 package/valijson/valijson.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 64822bf..1404653 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1044,6 +1044,7 @@ menu "JSON/XML"
>         source "package/raptor/Config.in"
>         source "package/tinyxml/Config.in"
>         source "package/tinyxml2/Config.in"
> +       source "package/valijson/Config.in"
>         source "package/xerces/Config.in"
>         source "package/yajl/Config.in"
>         source "package/yaml-cpp/Config.in"
> diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> new file mode 100644
> index 0000000..a5e24c2
> --- /dev/null
> +++ b/package/valijson/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_VALIJSON
> +       bool "valijson"
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       select BR2_PACKAGE_BOOST
> +       select BR2_PACKAGE_BOOST_REGEX
> +
> +       help
> +        Valijson is a header-only JSON Schema Validation library for
> +        C++. Valijson provides a simple validation API that allows you
> +        load JSON Schemas, and validate documents loaded by one of
> +        several supported parser libraries like boost, jsoncpp,
> +        rapidjson and picoJSON.It depends on BOOST Libraries
> +
> +        https://github.com/tristanpenman/valijson
> +
> +comment "valijson needs a toolchain w/ C++, threads, wchar  support"
> +       depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS
> || !BR2_USE_WCHAR
> diff --git a/package/valijson/valijson.hash
> b/package/valijson/valijson.hash
> new file mode 100644
> index 0000000..79b3fb7
> --- /dev/null
> +++ b/package/valijson/valijson.hash
> @@ -0,0 +1,2 @@
> +# Locally Computed:
> +sha256  f2346e995bd95c6b86b0b9e9dd228fe134d529565fa86db764c48496805dd9bc
> valijson-424b706f990a9eb96dfc19cc8e54f2cd6ce5e186.tar.gz
> diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
> new file mode 100644
> index 0000000..0d00df8
> --- /dev/null
> +++ b/package/valijson/valijson.mk
> @@ -0,0 +1,16 @@
>
> +################################################################################
> +#
> +# valijson
> +#
>
> +################################################################################
> +
> +VALIJSON_VERSION = 424b706f990a9eb96dfc19cc8e54f2cd6ce5e186
> +VALIJSON_SITE = $(call github,tristanpenman,valijson,$(VALIJSON_VERSION))
> +VALIJSON_LICENSE = BSD-3c
> +VALIJSON_LICENSE_FILES = LICENSE
> +VALIJSON_INSTALL_STAGING = YES
> +VALIJSON_INSTALL_TARGET = NO
> +VALIJSON_DEPENDENCIES = boost
> +VALIJSON_CONF_OPTS = -DINSTALL_HEADERS=TRUE
> +
> +$(eval $(cmake-package))
> --
> 2.5.0
>
>


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160414/554def72/attachment.html>
