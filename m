From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 6 Jun 2020 13:56:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/edid-decode: fix build with gcc
 <= 5
In-Reply-To: <20200606091928.1351706-2-fontaine.fabrice@gmail.com>
References: <20200606091928.1351706-1-fontaine.fabrice@gmail.com>
 <20200606091928.1351706-2-fontaine.fabrice@gmail.com>
Message-ID: <20200606135659.275463ab@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  6 Jun 2020 11:19:28 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Pass -std=c++11 to fix the following build failure with gcc <= 5:
>
> /tmp/instance-0/output-1/host/bin/mips64el-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os       -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -g -DSHA="not available" -o edid-decode edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp parse-displayid-block.cpp parse-ls-ext-block.cpp parse-di-ext-block.cpp parse-vtb-ext-block.cpp -lm
> edid-decode.cpp: In member function 'std::__cxx11::string edid_state::dtd_type()':
> edid-decode.cpp:192:17: error: 'to_string' is not a member of 'std'
>   unsigned len = std::to_string(preparse_total_dtds).length();
>                  ^
>
> Fixes:
>  - http://autobuild.buildroot.org/results/71e4a50542c4551797f1d0404d27244612b427d7
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/edid-decode/edid-decode.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
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

Thanks for taking care of the build failure, but with c++11 something
like 'depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11' (or 4_7/4_8) missing?

Regards,
Peter

>
>  define EDID_DECODE_INSTALL_TARGET_CMDS
