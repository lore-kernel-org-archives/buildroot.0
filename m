From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 6 Jun 2020 21:44:48 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/edid-decode: fix build with gcc <= 5
In-Reply-To: <20200606122810.2745801-2-fontaine.fabrice@gmail.com>
References: <20200606122810.2745801-1-fontaine.fabrice@gmail.com>
 <20200606122810.2745801-2-fontaine.fabrice@gmail.com>
Message-ID: <20200606214449.39fc4e02@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  6 Jun 2020 14:28:10 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Pass -std=c++11 to fix the following build failure with gcc <= 5:
>
> /tmp/instance-0/output-1/host/bin/mips64el-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os       -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -g -DSHA="not available" -o edid-decode edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp parse-displayid-block.cpp parse-ls-ext-block.cpp parse-di-ext-block.cpp parse-vtb-ext-block.cpp -lm
> edid-decode.cpp: In member function 'std::__cxx11::string edid_state::dtd_type()':
> edid-decode.cpp:192:17: error: 'to_string' is not a member of 'std'
>   unsigned len = std::to_string(preparse_total_dtds).length();
>                  ^
>
> Also add a dependency on gcc 4.7
>
> Fixes:
>  - http://autobuild.buildroot.org/results/71e4a50542c4551797f1d0404d27244612b427d7
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Add dependency on gcc 4.7
>
>  package/edid-decode/Config.in      | 6 ++++--
>  package/edid-decode/edid-decode.mk | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
> index d2d21288de..ddf1942c68 100644
> --- a/package/edid-decode/Config.in
> +++ b/package/edid-decode/Config.in
> @@ -1,10 +1,12 @@
>  config BR2_PACKAGE_EDID_DECODE
>  	bool "edid-decode"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
>  	help
>  	  Decode EDID data in human-readable format.
>
>  	  https://git.linuxtv.org/edid-decode.git/
>
> -comment "edid-decode needs a toolchain w/ C++"
> -	depends on !!BR2_INSTALL_LIBSTDCPP
> +comment "edid-decode needs a toolchain w/ C++, gcc >= 4.7"
> +	depends on !!BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
> index c41a9f2a76..7e463c02b1 100644
> --- a/package/edid-decode/edid-decode.mk
> +++ b/package/edid-decode/edid-decode.mk
> @@ -11,7 +11,7 @@ EDID_DECODE_LICENSE_FILES = LICENSE
>
>  define EDID_DECODE_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> -		CFLAGS="$(TARGET_CXXFLAGS)"
> +		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>  endef
>
>  define EDID_DECODE_INSTALL_TARGET_CMDS

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
