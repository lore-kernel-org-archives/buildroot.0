From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2016 22:39:26 +0100
Subject: [Buildroot] problem adding new package libcapn
In-Reply-To: <56C10733.8040706@proximus.be>
References: <56C10733.8040706@proximus.be>
Message-ID: <56C3970E.5090405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Johan,

 It seems you are in the habit of needing packages that are tricky to
cross-compile :-)

On 15-02-16 00:01, Johan Sagaert wrote:
> Hi
> 
> I am trying to add a new package libcapn
> 
> from the README.md
> 
> ## Installation
> ### on *nix
> __Requirements__
> 
> - [CMake](http://cmake.org) >= 2.8.5
> - Clang 3 and later or GCC 4.6 and later

 Remember to encode this dependency in Config.in, i.e.

	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6

(preferably with a comment why it is needed).

> - make
> 
> __Build instructions__
> 
> $ git clone https://github.com/adobkin/libcapn.git
> $ git submodule update --init
> $ mkdir build
> $ cd build
> $ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../
> $ make
> $ sudo make install
> ```
> 
> 
> 1) I am not sure how the git submodule update --init is handled in buildroot.

 If you need it, then you have to:

- add an EXTRA_DOWNLOADS of the tarball (using the github macro);

- add a POST_EXTRACT_HOOKS to extract the tarball in the right subdirectory.

> 
> 2) Building yields this error:
> 
[snip]
> -- Looking for strerror_r - found
> -- Performing test APN_HAVE_GLIBC_STRERROR_R
> CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following
> cache variables appropriately:
>    APN_HAVE_GLIBC_STRERROR_R (advanced)
>    APN_HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT (advanced)
> For details see
> /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/TryRunResults.cmake
> -- Performing test APN_HAVE_GLIBC_STRERROR_R - Failed
> -- Performing test APN_HAVE_POSIX_STRERROR_R
> CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following
> cache variables appropriately:
>    APN_HAVE_POSIX_STRERROR_R (advanced)
>    APN_HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT (advanced)
> For details see
> /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/TryRunResults.cmake

 It's trying to run the cross-compiled program, which obviously won't work. So
you have to pass the correct setting using _CONF_OPTS = -D...

 But as far as I can see, it will _always_ be APN_HAVE_POSIX_STRERROR_R, because
_GNU_SOURCE is not defined and _POSIX_C_SOURCE is explicitly set to 200112L. I
checked this with a native build. So I'd try to upstream a patch that removes
this test completely... The alternative is to set the cache variables explicitly.

> -- Performing test APN_HAVE_POSIX_STRERROR_R - Failed
> -- Found OpenSSL:
> /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libssl.so;/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libcrypto.so
> (found version "1.0.2c")

 Don't forget to add the openssl select to Config.in and dependency to libcapn.mk!


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
