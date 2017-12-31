From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 30 Dec 2017 20:03:50 -0500
Subject: [Buildroot] [PATCH v7 1/1] libcpprestsdk: new package
In-Reply-To: <20171230231328.3299abdc@windsurf>
References: <20171230191655.32606-1-Adamduskett@outlook.com>
 <20171230231328.3299abdc@windsurf>
Message-ID: <CAFSsvmq1G84OF5tR4M47ZHSBeivUHFiE-1rrb1iJcE4DjQF+MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sat, Dec 30, 2017 at 5:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 30 Dec 2017 14:16:55 -0500, Adam Duskett wrote:
>> The C++ REST SDK is a Microsoft project for cloud-based client-server
>> communication in native code using a modern asynchronous C++ API design.
>> This project aims to help C++ developers connect to and interact with
>> services.
>>
>> This package is licensed under the MIT package and depends on BOOST
>> and OpenSSL/LibreSSL.
>>
>> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>
> As discussed on IRC, this fails to build with the following defconfig:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_LIBCPPRESTSDK=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> It fails with:
>
>>>> libcpprestsdk v2.10.1 Building
> PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5  -C /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release
> Scanning dependencies of target cpprest
> [  4%] Building CXX object src/CMakeFiles/cpprest.dir/http/client/http_client_msg.cpp.o
> [  6%] Building CXX object src/CMakeFiles/cpprest.dir/http/client/x509_cert_utilities.cpp.o
> [  6%] Building CXX object src/CMakeFiles/cpprest.dir/http/client/http_client.cpp.o
> [ 10%] Building CXX object src/CMakeFiles/cpprest.dir/http/common/http_helpers.cpp.o
> [ 10%] Building CXX object src/CMakeFiles/cpprest.dir/http/common/http_msg.cpp.o
> In file included from /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/src/pch/stdafx.h:94:0,
>                  from /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/src/http/common/http_helpers.cpp:14:
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h:923:46: error: ?exception_ptr? in namespace ?std? does not name a type
>          explicit _ExceptionHolder(const std::exception_ptr& _E, const _TaskCreationCallstack &_stackTrace) :
>                                               ^
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h:971:14: error: ?exception_ptr? in namespace ?std? does not name a type
>          std::exception_ptr _M_stdException;
>               ^
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h: In constructor ?pplx::details::_ExceptionHolder::_ExceptionHolder(const int&, const pplx::details::_TaskCreationCallstack&)?:
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h:924:34: error: class ?pplx::details::_ExceptionHolder? does not have any field named ?_M_stdException?
>          _M_exceptionObserved(0), _M_stdException(_E), _M_stackTrace(_stackTrace)
>                                   ^
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h: In member function ?void pplx::details::_ExceptionHolder::_RethrowUserException()?:
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h:963:13: error: ?rethrow_exception? is not a member of ?std?
>              std::rethrow_exception(_M_stdException);
>              ^
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h:963:36: error: ?_M_stdException? was not declared in this scope
>              std::rethrow_exception(_M_stdException);
>                                     ^
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h: In member function ?virtual void pplx::details::_PPLTaskHandle<_ReturnType, _DerivedTaskHandle, _BaseTaskHandle>::invoke() const?:
> /home/thomas/projets/buildroot/output/build/libcpprestsdk-v2.10.1/Release/include/pplx/pplxtasks.h:1655:48: error: ?current_exception? is not a member of ?std?
>                  _M_pTask->_CancelWithException(std::current_exception());
>                                                 ^
> Interestingly, it is the same error I had when building opentracing-cpp
> with the same toolchain. Building with the Linaro ARM toolchain works
> fine however.
>
> Could you test this package with ./utils/test-pkg before submitting the
> next version ?
>
So, at this point I always do.  Here are the results from what I normally run:

./utils/test-pkg -c configs/libcpprestsdk_defconfig -p libcpprestsdk
-t /home/adam/Documents/brtest/small_test.csv
                     min_glibc_defconfig [1/3]: OK
                      min_musl_defconfig [2/3]: OK
                    min_uclibc_defconfig [3/3]: OK
3 builds, 0 skipped, 0 build failed, 0 legal-info failed

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

This tells me that at least glibc, musl, and uclibc-ng all build
successfully.  I normally test with gcc 7.x, and the toolchain you
tested with is quite a bit older.

Thanks!

Adam
