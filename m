From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 15:11:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with atomic
In-Reply-To: <20200211175511.12719-1-fontaine.fabrice@gmail.com>
References: <20200211175511.12719-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017131128.GN3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-11 18:55 +0100, Fabrice Fontaine spake thusly:
> Use HAVE_CXX_ATOMICS_WITHOUT_LIB variable to tell opencv3 to check for
> atomic library and add it in $(REQUIRED_LIBRARIES) if needed (atomic
> workaround was removed when bumping to version 3.4.9 in commit
> id=f6fb2cae0691d25b034b12a16261ee26096db7d1 but it seems tha opencv3
> still needs help to detect atomic library)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9162b29725f8d9b891eb74fcb8078f211140a841
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So, while applying your recent bump to 3.4.12, I noticed this old patch
of yours.

So, I tried and was able to reproduce the original issue with the bump.
Applying this patch in addition, did not fix the issue, though:

     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_core.dir/test/ocl/test_opencl.cpp.o: in function `cv::Mat::~Mat()':
     test_opencl.cpp:(.text._ZN2cv3MatD2Ev[_ZN2cv3MatD5Ev]+0x1c): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_core.dir/test/test_arithm.cpp.o: in function `cv::Ptr<opencv_test::(anonymous namespace)::BaseElemWiseOp>::Ptr(cv::Ptr<opencv_test::(anonymous namespace)::BaseElemWiseOp> const&)':
     test_arithm.cpp:(.text._ZN2cv3PtrIN11opencv_test12_GLOBAL__N_114BaseElemWiseOpEEC2ERKS4_+0x28): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_core.dir/test/test_arithm.cpp.o: in function `cv::detail::PtrOwner::decRef()':
     test_arithm.cpp:(.text._ZN2cv6detail8PtrOwner6decRefEv[_ZN2cv6detail8PtrOwner6decRefEv]+0xc): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_core.dir/test/test_arithm.cpp.o: in function `cv::Mat::Mat(cv::Mat const&)':
     test_arithm.cpp:(.text._ZN2cv3MatC2ERKS0_[_ZN2cv3MatC5ERKS0_]+0x7c): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_core.dir/test/test_arithm.cpp.o: in function `cv::Mat::release()':
     test_arithm.cpp:(.text._ZN2cv3Mat7releaseEv[_ZN2cv3Mat7releaseEv]+0x18): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_core.dir/test/test_arithm.cpp.o:test_arithm.cpp:(.text._ZN2cv3MataSERKS0_[_ZN2cv3MataSERKS0_]+0x24): more undefined references to `__atomic_fetch_add_4' follow
     collect2: error: ld returned 1 exit status
     make[4]: *** [modules/core/CMakeFiles/opencv_test_core.dir/build.make:555: bin/opencv_test_core] Error 1
     make[3]: *** [CMakeFiles/Makefile2:1565: modules/core/CMakeFiles/opencv_test_core.dir/all] Error 2
     [ 92%] Linking CXX executable ../../bin/opencv_test_imgproc
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_imgproc.dir/test/test_bilateral_filter.cpp.o: in function `cv::Mat::~Mat()':
     test_bilateral_filter.cpp:(.text._ZN2cv3MatD2Ev[_ZN2cv3MatD5Ev]+0x1c): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_imgproc.dir/test/test_canny.cpp.o: in function `cv::Mat::Mat(cv::Mat const&)':
     test_canny.cpp:(.text._ZN2cv3MatC2ERKS0_[_ZN2cv3MatC5ERKS0_]+0x7c): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_imgproc.dir/test/test_canny.cpp.o: in function `cv::Mat::release()':
     test_canny.cpp:(.text._ZN2cv3Mat7releaseEv[_ZN2cv3Mat7releaseEv]+0x18): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_imgproc.dir/test/test_color.cpp.o: in function `cv::detail::PtrOwner::decRef()':
     test_color.cpp:(.text._ZN2cv6detail8PtrOwner6decRefEv[_ZN2cv6detail8PtrOwner6decRefEv]+0xc): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_imgproc.dir/test/test_connectedcomponents.cpp.o: in function `opencv_test::(anonymous namespace)::CV_ConnectedComponentsTest::run(int)':
     test_connectedcomponents.cpp:(.text._ZN11opencv_test12_GLOBAL__N_126CV_ConnectedComponentsTest3runEi+0x434): undefined reference to `__atomic_fetch_add_4'
     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/opencv_test_imgproc.dir/test/test_convhull.cpp.o:test_convhull.cpp:(.text._ZN2cv3PtrI12CvMemStorageE7releaseEv[_ZN2cv3PtrI12CvMemStorageE7releaseEv]+0x18): more undefined references to `__atomic_fetch_add_4' follow
     collect2: error: ld returned 1 exit status
     make[4]: *** [modules/imgproc/CMakeFiles/opencv_test_imgproc.dir/build.make:870: bin/opencv_test_imgproc] Error 1
     make[3]: *** [CMakeFiles/Makefile2:1684: modules/imgproc/CMakeFiles/opencv_test_imgproc.dir/all] Error 2
     make[2]: *** [Makefile:163: all] Error 2
     make[1]: *** [package/pkg-generic.mk:250: /home/ymorin/dev/buildroot/O/build/opencv3-3.4.12/.stamp_built] Error 2
     make: *** [Makefile:23: _all] Error 2

So maybe the simplest solution owuld be to partially revert f6fb2cae069,
to restore the explicit link to libatomic?

Regards,
Yann E. MORIN.

> ---
>  package/opencv3/opencv3.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index fab6716340..ffe5ca44ae 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -347,6 +347,10 @@ OPENCV3_CONF_OPTS += \
>  	-DBUILD_opencv_python3=OFF
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +OPENCV3_CONF_OPTS += -DHAVE_CXX_ATOMICS_WITHOUT_LIB=OFF
> +endif
> +
>  # Installation hooks:
>  define OPENCV3_CLEAN_INSTALL_DOC
>  	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
> -- 
> 2.24.1
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
