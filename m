From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 09 Aug 2015 20:59:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/jsoncpp: Broken on musl
In-Reply-To: <1439121001-14787-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439121001-14787-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439146794.12501.25.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On So, 2015-08-09 at 13:50 +0200, Bernd Kuhls wrote:
> Also propagate to reverse dependencies, to keep bisectability do this 
> in
> one commit.
> 
> Fixes compile error:
> 
> [ 16%] Building CXX object 
> src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o
> In file included from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64
> -buildroot-linux-musl/4.9.2/include/xmmintrin.h:34:0,
>                  from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64
> -buildroot-linux-musl/4.9.2/include/x86intrin.h:31,
>                  from /home/fli4l/br3/output/host/usr/x86_64
> -buildroot-linux-musl/include/c++/4.9.2/x86_64-buildroot-linux
> -musl/bits/opt_random.h:33,
>                  from /home/fli4l/br3/output/host/usr/x86_64
> -buildroot-linux-musl/include/c++/4.9.2/random:50,
>                  from /home/fli4l/br3/output/host/usr/x86_64
> -buildroot-linux-musl/include/c++/4.9.2/bits/stl_algo.h:66,
>                  from /home/fli4l/br3/output/host/usr/x86_64
> -buildroot-linux-musl/include/c++/4.9.2/algorithm:62,
>                  from /home/fli4l/br3/output/build/jsoncpp
> -1.6.1/src/lib_json/json_value.cpp:20:
> /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux
> -musl/4.9.2/include/mm_malloc.h:34:64: error: declaration of 'int 
> posix_memalign(void**, size_t, size_t) throw ()' has a different 
> exception specifier
>  extern "C" int posix_memalign (void **, size_t, size_t) throw ();
>                                                                 ^
> In file included from /home/fli4l/br3/output/build/jsoncpp
> -1.6.1/include/json/assertions.h:9:0,
>                  from /home/fli4l/br3/output/build/jsoncpp
> -1.6.1/src/lib_json/json_value.cpp:7:
> /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux
> -musl/sysroot/usr/include/stdlib.h:98:5: error: from previous 
> declaration 'int posix_memalign(void**, size_t, size_t)'
>  int posix_memalign (void **, size_t, size_t);
>      ^
> make[2]: *** 
> [src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o] Error 1
> 
> using this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_JSONCPP=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: - rebased
>     - updated comments (Yann)
>     - added reverse dependencies to kodi-pvr-filmon & kodi-pvr-pctv
> v2: Disable jsoncpp and reverse dependency with musl toolchain 
> instead of patching gcc (Thomas)
>     FTR: gcc patches can be found here: 
> http://patchwork.ozlabs.org/patch/460337/
> 

After a short investigation [1] I realized this error only applies for
x86 targets.

[1] https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01084.html

Best regards
J?rg Krause
