From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 23:24:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/openfpgaloader: needs gcc >= 4.9
In-Reply-To: <20200820204158.1237689-1-fontaine.fabrice@gmail.com>
References: <20200820204158.1237689-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823212447.GA10811@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, Fabrice, All,

On 2020-08-20 22:41 +0200, Fabrice Fontaine spake thusly:
> openfpgaloader needs C++11 as specified in CMakeLists.txt:
> set(CMAKE_CXX_STANDARD 11)
> 
> The build on gcc 4.8 fails on:
> 
> /home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp: In member function 'void SPIFlash::jtag_write_read(uint8_t, uint8_t*, uint8_t*, uint16_t)':
> /home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp:92:43: error: variable-sized object 'jtx' may not be initialized
>   uint8_t jtx[xfer_len] = {reverseByte(cmd)};
>                                            ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f3f3cc216ae42bb8a8925b0df7c1a3cc79b027d7

Gwenhael, we do have a few build issues with gcc-4.8, and I see you do
have some fixes in your tree about exactly those problems:

  - ftdipp_mpsse.cpp:24:49: error: incompatible types in assignment of 'const char [1]' to 'char [64]'
    Fixed with 16ef558 (ftdipp_mpsse: fix build failure with gcc 4.8)

  - spiFlash.cpp:92:43: error: variable-sized object 'jtx' may not be initialized
    Fixed with the ftdi to jtag revamp: 9c9348f, c94f031.

The second is in your v0.1, but not the first.

We 're currently using 849e5751e0, which is 97 commits behind v0.1, 106
commits behind the gcc 4.8 fix, and 123 commits behind master.

We're close to the release, so I am a bit wary to bump the version, but
fixing those in Buildroot would require some work for very little gain
IMHO, so I'd be tempted to go one of those routes (in order of
preference for me):

  - bump to v0.1 and backport the gcc-4.8 fix,

  - bump to the commit with the gcc-4.8 fix (v0.1 + 9 commits),

  - bump to master.

The alternative being to raise the gcc version requirement in Buildroot,
as Fabrice suggests (but 4.9 is not even enough because of the
spiFlash.cpp issue...)

Thoughts?

Otherwise, we've got another issue that's not yet been addressesd:

    src/gowin.cpp:73:11: error: 'runtime_error' is not a member of 'std'
     throw std::runtime_error("both write-flash and write-sram can't be set");
           ^
    src/gowin.cpp:81:10: error: 'runtime_error' is not a member of 'std'
      throw std::runtime_error("incompatible file format");
            ^

This one may require #include <stdexcept>. Care to have a look too?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openfpgaloader/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
> index 9835b84b64..493fa09c84 100644
> --- a/package/openfpgaloader/Config.in
> +++ b/package/openfpgaloader/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENFPGALOADER
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_INSTALL_LIBSTDCPP # libftdipp1
>  	depends on BR2_USE_WCHAR # libftdipp1
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
>  	select BR2_PACKAGE_ARGP_STANDALONE \
>  	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL # argp
>  	select BR2_PACKAGE_LIBFTDI1
> @@ -13,6 +14,7 @@ config BR2_PACKAGE_OPENFPGALOADER
>  
>  	  https://github.com/trabucayre/openFPGALoader/
>  
> -comment "openfpgaloader needs udev, a toolchain w/ threads, wchar, C++"
> +comment "openfpgaloader needs udev, a toolchain w/ threads, wchar, C++, gcc >= 4.9"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> -		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
