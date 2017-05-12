From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 11:48:00 +0200
Subject: [Buildroot] [git commit] package/opencv3: regenerate patch without
	renames
Message-ID: <20170512102548.6F7147F8F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6ea64aec80d50b840881bc89d4a2a1102b49d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch using renames are not properly handled by patch < 2.7, which
some users (including autobuilder instances) might be using. Such
renames are silently ignored by old patch versions, caused strange
build failures due to the missed renames.

This patch fixes this by regenerating the patch without renames.

Fixes:

  http://autobuild.buildroot.net/results/347d8fd2e286b3e4e5e18743e64d862bdb66dbb9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-cmake-support-multiple-CPU-targets.patch  | 155 +++++++++++++++------
 1 file changed, 110 insertions(+), 45 deletions(-)

diff --git a/package/opencv3/0001-cmake-support-multiple-CPU-targets.patch b/package/opencv3/0001-cmake-support-multiple-CPU-targets.patch
index 44cc018..017c7bb 100644
--- a/package/opencv3/0001-cmake-support-multiple-CPU-targets.patch
+++ b/package/opencv3/0001-cmake-support-multiple-CPU-targets.patch
@@ -1,4 +1,4 @@
-From 5628a02177eec7adac1fcaf30634a6d6e17bb15d Mon Sep 17 00:00:00 2001
+From 1c54b13cb29463af514a107c42946abd97b5ca41 Mon Sep 17 00:00:00 2001
 From: Alexander Alekhin <alexander.alekhin@intel.com>
 Date: Wed, 7 Sep 2016 18:02:36 +0300
 Subject: [PATCH] cmake: support multiple CPU targets
@@ -16,7 +16,7 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  cmake/checks/cpu_avx.cpp                           |   9 +
  cmake/checks/cpu_avx2.cpp                          |  10 +
  cmake/checks/cpu_avx512.cpp                        |  10 +
- cmake/checks/{fp16.cpp => cpu_fp16.cpp}            |   2 +-
+ cmake/checks/cpu_fp16.cpp                          |  33 ++
  cmake/checks/cpu_popcnt.cpp                        |   8 +
  cmake/checks/cpu_sse.cpp                           |   2 +
  cmake/checks/cpu_sse2.cpp                          |   2 +
@@ -24,6 +24,7 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  cmake/checks/cpu_sse41.cpp                         |   6 +
  cmake/checks/cpu_sse42.cpp                         |   5 +
  cmake/checks/cpu_ssse3.cpp                         |   7 +
+ cmake/checks/fp16.cpp                              |  33 --
  cmake/templates/cv_cpu_config.h.in                 |   5 +
  cmake/templates/cvconfig.h.in                      |  13 +
  .../core/include/opencv2/core/cv_cpu_dispatch.h    | 166 ++++++
@@ -34,12 +35,12 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  modules/highgui/CMakeLists.txt                     |   2 +-
  modules/imgproc/src/imgwarp.cpp                    |   4 +-
  modules/objdetect/src/haar.cpp                     |   5 +-
- 28 files changed, 1440 insertions(+), 386 deletions(-)
+ 29 files changed, 1472 insertions(+), 418 deletions(-)
  create mode 100644 cmake/OpenCVCompilerOptimizations.cmake
  create mode 100644 cmake/checks/cpu_avx.cpp
  create mode 100644 cmake/checks/cpu_avx2.cpp
  create mode 100644 cmake/checks/cpu_avx512.cpp
- rename cmake/checks/{fp16.cpp => cpu_fp16.cpp} (86%)
+ create mode 100644 cmake/checks/cpu_fp16.cpp
  create mode 100644 cmake/checks/cpu_popcnt.cpp
  create mode 100644 cmake/checks/cpu_sse.cpp
  create mode 100644 cmake/checks/cpu_sse2.cpp
@@ -47,12 +48,13 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  create mode 100644 cmake/checks/cpu_sse41.cpp
  create mode 100644 cmake/checks/cpu_sse42.cpp
  create mode 100644 cmake/checks/cpu_ssse3.cpp
+ delete mode 100644 cmake/checks/fp16.cpp
  create mode 100644 cmake/templates/cv_cpu_config.h.in
  create mode 100644 modules/core/include/opencv2/core/cv_cpu_dispatch.h
  create mode 100644 modules/core/include/opencv2/core/cv_cpu_helper.h
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cc45f6f39..9c9971ec0 100644
+index cc45f6f..9c9971e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -85,6 +85,10 @@ if(POLICY CMP0042)
@@ -149,7 +151,7 @@ index cc45f6f39..9c9971ec0 100644
    set(OPENCV_COMPILER_STR "${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} (ver ${CMAKE_CXX_COMPILER_VERSION})")
 diff --git a/cmake/OpenCVCompilerOptimizations.cmake b/cmake/OpenCVCompilerOptimizations.cmake
 new file mode 100644
-index 000000000..b849f02b1
+index 0000000..b849f02
 --- /dev/null
 +++ b/cmake/OpenCVCompilerOptimizations.cmake
 @@ -0,0 +1,651 @@
@@ -805,7 +807,7 @@ index 000000000..b849f02b1
 +  ocv_update(CV_ENABLE_UNROLLED 1)
 +endif()
 diff --git a/cmake/OpenCVCompilerOptions.cmake b/cmake/OpenCVCompilerOptions.cmake
-index 5bb047911..0eb68b656 100644
+index 5bb0479..0eb68b6 100644
 --- a/cmake/OpenCVCompilerOptions.cmake
 +++ b/cmake/OpenCVCompilerOptions.cmake
 @@ -31,24 +31,21 @@ endif()
@@ -1055,7 +1057,7 @@ index 5bb047911..0eb68b656 100644
      OUTPUT_VARIABLE TRY_OUT
      )
 diff --git a/cmake/OpenCVGenHeaders.cmake b/cmake/OpenCVGenHeaders.cmake
-index 298897904..477b91055 100644
+index 2988979..477b910 100644
 --- a/cmake/OpenCVGenHeaders.cmake
 +++ b/cmake/OpenCVGenHeaders.cmake
 @@ -3,6 +3,10 @@ configure_file("${OpenCV_SOURCE_DIR}/cmake/templates/cvconfig.h.in" "${OPENCV_CO
@@ -1070,7 +1072,7 @@ index 298897904..477b91055 100644
  #  opencv_modules.hpp based on actual modules list
  # ----------------------------------------------------------------------------
 diff --git a/cmake/OpenCVModule.cmake b/cmake/OpenCVModule.cmake
-index 742a287ec..3e98bf569 100644
+index 742a287..3e98bf5 100644
 --- a/cmake/OpenCVModule.cmake
 +++ b/cmake/OpenCVModule.cmake
 @@ -65,6 +65,7 @@ foreach(mod ${OPENCV_MODULES_BUILD} ${OPENCV_MODULES_DISABLED_USER} ${OPENCV_MOD
@@ -1091,7 +1093,7 @@ index 742a287ec..3e98bf569 100644
    set(OPENCV_MODULE_${the_module}_SOURCES ${OPENCV_MODULE_${the_module}_SOURCES} CACHE INTERNAL "List of source files for ${the_module}")
  endmacro()
 diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
-index 90437cb20..45968e78b 100644
+index 90437cb..45968e7 100644
 --- a/cmake/OpenCVPCHSupport.cmake
 +++ b/cmake/OpenCVPCHSupport.cmake
 @@ -326,7 +326,10 @@ MACRO(ADD_NATIVE_PRECOMPILED_HEADER _targetName _input)
@@ -1107,7 +1109,7 @@ index 90437cb20..45968e78b 100644
              if(NOT oldProps)
                set(newProperties "/Yu\"${_input}\" /FI\"${_input}\"")
 diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
-index cdf257d5f..8a5ee28f6 100644
+index cdf257d..8a5ee28 100644
 --- a/cmake/OpenCVUtils.cmake
 +++ b/cmake/OpenCVUtils.cmake
 @@ -37,7 +37,11 @@ endmacro()
@@ -1242,7 +1244,7 @@ index cdf257d5f..8a5ee28f6 100644
  endfunction()
 diff --git a/cmake/checks/cpu_avx.cpp b/cmake/checks/cpu_avx.cpp
 new file mode 100644
-index 000000000..05536f443
+index 0000000..05536f4
 --- /dev/null
 +++ b/cmake/checks/cpu_avx.cpp
 @@ -0,0 +1,9 @@
@@ -1257,7 +1259,7 @@ index 000000000..05536f443
 +int main() { return 0; }
 diff --git a/cmake/checks/cpu_avx2.cpp b/cmake/checks/cpu_avx2.cpp
 new file mode 100644
-index 000000000..3ab1143b8
+index 0000000..3ab1143
 --- /dev/null
 +++ b/cmake/checks/cpu_avx2.cpp
 @@ -0,0 +1,10 @@
@@ -1273,7 +1275,7 @@ index 000000000..3ab1143b8
 +int main() { return 0; }
 diff --git a/cmake/checks/cpu_avx512.cpp b/cmake/checks/cpu_avx512.cpp
 new file mode 100644
-index 000000000..d0898ab3e
+index 0000000..d0898ab
 --- /dev/null
 +++ b/cmake/checks/cpu_avx512.cpp
 @@ -0,0 +1,10 @@
@@ -1287,24 +1289,48 @@ index 000000000..d0898ab3e
 +#error "AVX512 is not supported"
 +#endif
 +int main() { return 0; }
-diff --git a/cmake/checks/fp16.cpp b/cmake/checks/cpu_fp16.cpp
-similarity index 86%
-rename from cmake/checks/fp16.cpp
-rename to cmake/checks/cpu_fp16.cpp
-index c77c84483..6951f1c4f 100644
---- a/cmake/checks/fp16.cpp
+diff --git a/cmake/checks/cpu_fp16.cpp b/cmake/checks/cpu_fp16.cpp
+new file mode 100644
+index 0000000..6951f1c
+--- /dev/null
 +++ b/cmake/checks/cpu_fp16.cpp
-@@ -1,6 +1,6 @@
- #include <stdio.h>
- 
--#if defined __F16C__ || (defined _MSC_VER && _MSC_VER >= 1700)
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++
 +#if defined __F16C__ || (defined _MSC_VER && _MSC_VER >= 1700) || (defined __INTEL_COMPILER && defined __AVX__)
- #include <immintrin.h>
- int test()
- {
++#include <immintrin.h>
++int test()
++{
++    const float src[] = { 0.0f, 0.0f, 0.0f, 0.0f };
++    short dst[8];
++    __m128 v_src = _mm_load_ps(src);
++    __m128i v_dst = _mm_cvtps_ph(v_src, 0);
++    _mm_storel_epi64((__m128i*)dst, v_dst);
++    return (int)dst[0];
++}
++#elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
++#include "arm_neon.h"
++int test()
++{
++    const float src[] = { 0.0f, 0.0f, 0.0f, 0.0f };
++    short dst[8];
++    float32x4_t v_src = *(float32x4_t*)src;
++    float16x4_t v_dst = vcvt_f16_f32(v_src);
++    *(float16x4_t*)dst = v_dst;
++    return (int)dst[0];
++}
++#else
++#error "FP16 is not supported"
++#endif
++
++int main()
++{
++  printf("%d\n", test());
++  return 0;
++}
 diff --git a/cmake/checks/cpu_popcnt.cpp b/cmake/checks/cpu_popcnt.cpp
 new file mode 100644
-index 000000000..f55c9f3c5
+index 0000000..f55c9f3
 --- /dev/null
 +++ b/cmake/checks/cpu_popcnt.cpp
 @@ -0,0 +1,8 @@
@@ -1318,7 +1344,7 @@ index 000000000..f55c9f3c5
 +}
 diff --git a/cmake/checks/cpu_sse.cpp b/cmake/checks/cpu_sse.cpp
 new file mode 100644
-index 000000000..c6269acdb
+index 0000000..c6269ac
 --- /dev/null
 +++ b/cmake/checks/cpu_sse.cpp
 @@ -0,0 +1,2 @@
@@ -1326,7 +1352,7 @@ index 000000000..c6269acdb
 +int main() { return 0; }
 diff --git a/cmake/checks/cpu_sse2.cpp b/cmake/checks/cpu_sse2.cpp
 new file mode 100644
-index 000000000..68a69f88c
+index 0000000..68a69f8
 --- /dev/null
 +++ b/cmake/checks/cpu_sse2.cpp
 @@ -0,0 +1,2 @@
@@ -1334,7 +1360,7 @@ index 000000000..68a69f88c
 +int main() { return 0; }
 diff --git a/cmake/checks/cpu_sse3.cpp b/cmake/checks/cpu_sse3.cpp
 new file mode 100644
-index 000000000..98ce2191e
+index 0000000..98ce219
 --- /dev/null
 +++ b/cmake/checks/cpu_sse3.cpp
 @@ -0,0 +1,7 @@
@@ -1347,7 +1373,7 @@ index 000000000..98ce2191e
 +}
 diff --git a/cmake/checks/cpu_sse41.cpp b/cmake/checks/cpu_sse41.cpp
 new file mode 100644
-index 000000000..ddd835b0e
+index 0000000..ddd835b
 --- /dev/null
 +++ b/cmake/checks/cpu_sse41.cpp
 @@ -0,0 +1,6 @@
@@ -1359,7 +1385,7 @@ index 000000000..ddd835b0e
 +}
 diff --git a/cmake/checks/cpu_sse42.cpp b/cmake/checks/cpu_sse42.cpp
 new file mode 100644
-index 000000000..56f56658a
+index 0000000..56f5665
 --- /dev/null
 +++ b/cmake/checks/cpu_sse42.cpp
 @@ -0,0 +1,5 @@
@@ -1370,7 +1396,7 @@ index 000000000..56f56658a
 +}
 diff --git a/cmake/checks/cpu_ssse3.cpp b/cmake/checks/cpu_ssse3.cpp
 new file mode 100644
-index 000000000..e583199bc
+index 0000000..e583199
 --- /dev/null
 +++ b/cmake/checks/cpu_ssse3.cpp
 @@ -0,0 +1,7 @@
@@ -1381,9 +1407,48 @@ index 000000000..e583199bc
 +    __m128i b = _mm_abs_epi32(a);
 +    return 0;
 +}
+diff --git a/cmake/checks/fp16.cpp b/cmake/checks/fp16.cpp
+deleted file mode 100644
+index c77c844..0000000
+--- a/cmake/checks/fp16.cpp
++++ /dev/null
+@@ -1,33 +0,0 @@
+-#include <stdio.h>
+-
+-#if defined __F16C__ || (defined _MSC_VER && _MSC_VER >= 1700)
+-#include <immintrin.h>
+-int test()
+-{
+-    const float src[] = { 0.0f, 0.0f, 0.0f, 0.0f };
+-    short dst[8];
+-    __m128 v_src = _mm_load_ps(src);
+-    __m128i v_dst = _mm_cvtps_ph(v_src, 0);
+-    _mm_storel_epi64((__m128i*)dst, v_dst);
+-    return (int)dst[0];
+-}
+-#elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
+-#include "arm_neon.h"
+-int test()
+-{
+-    const float src[] = { 0.0f, 0.0f, 0.0f, 0.0f };
+-    short dst[8];
+-    float32x4_t v_src = *(float32x4_t*)src;
+-    float16x4_t v_dst = vcvt_f16_f32(v_src);
+-    *(float16x4_t*)dst = v_dst;
+-    return (int)dst[0];
+-}
+-#else
+-#error "FP16 is not supported"
+-#endif
+-
+-int main()
+-{
+-  printf("%d\n", test());
+-  return 0;
+-}
 diff --git a/cmake/templates/cv_cpu_config.h.in b/cmake/templates/cv_cpu_config.h.in
 new file mode 100644
-index 000000000..27b27315c
+index 0000000..27b2731
 --- /dev/null
 +++ b/cmake/templates/cv_cpu_config.h.in
 @@ -0,0 +1,5 @@
@@ -1393,7 +1458,7 @@ index 000000000..27b27315c
 +// OpenCV supported CPU dispatched features
 + at OPENCV_CPU_DISPATCH_DEFINITIONS_CONFIGMAKE@
 diff --git a/cmake/templates/cvconfig.h.in b/cmake/templates/cvconfig.h.in
-index 05add9e2c..658d12c14 100644
+index 05add9e..658d12c 100644
 --- a/cmake/templates/cvconfig.h.in
 +++ b/cmake/templates/cvconfig.h.in
 @@ -1,6 +1,15 @@
@@ -1422,7 +1487,7 @@ index 05add9e2c..658d12c14 100644
 +#endif // OPENCV_CVCONFIG_H_INCLUDED
 diff --git a/modules/core/include/opencv2/core/cv_cpu_dispatch.h b/modules/core/include/opencv2/core/cv_cpu_dispatch.h
 new file mode 100644
-index 000000000..9a8537f90
+index 0000000..9a8537f
 --- /dev/null
 +++ b/modules/core/include/opencv2/core/cv_cpu_dispatch.h
 @@ -0,0 +1,166 @@
@@ -1594,7 +1659,7 @@ index 000000000..9a8537f90
 +#endif
 diff --git a/modules/core/include/opencv2/core/cv_cpu_helper.h b/modules/core/include/opencv2/core/cv_cpu_helper.h
 new file mode 100644
-index 000000000..cb755d615
+index 0000000..cb755d6
 --- /dev/null
 +++ b/modules/core/include/opencv2/core/cv_cpu_helper.h
 @@ -0,0 +1,133 @@
@@ -1732,7 +1797,7 @@ index 000000000..cb755d615
 +#  define CV_CPU_CALL_NEON(...)
 +#endif
 diff --git a/modules/core/include/opencv2/core/cvdef.h b/modules/core/include/opencv2/core/cvdef.h
-index 699b1667b..0a46e0236 100644
+index 699b166..0a46e02 100644
 --- a/modules/core/include/opencv2/core/cvdef.h
 +++ b/modules/core/include/opencv2/core/cvdef.h
 @@ -48,6 +48,10 @@
@@ -1911,7 +1976,7 @@ index 699b1667b..0a46e0236 100644
  /* fundamental constants */
  #define CV_PI   3.1415926535897932384626433832795
 diff --git a/modules/core/include/opencv2/core/fast_math.hpp b/modules/core/include/opencv2/core/fast_math.hpp
-index c76936afe..31c106232 100644
+index c76936a..31c1062 100644
 --- a/modules/core/include/opencv2/core/fast_math.hpp
 +++ b/modules/core/include/opencv2/core/fast_math.hpp
 @@ -47,6 +47,12 @@
@@ -2060,7 +2125,7 @@ index c76936afe..31c106232 100644
  
  /** @overload */
 diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
-index 3c8f39d74..a9838382f 100644
+index 3c8f39d..a983838 100644
 --- a/modules/core/src/system.cpp
 +++ b/modules/core/src/system.cpp
 @@ -237,24 +237,81 @@ void Exception::formatMessage()
@@ -2444,7 +2509,7 @@ index 3c8f39d74..a9838382f 100644
  
  bool checkHardwareSupport(int feature)
 diff --git a/modules/highgui/CMakeLists.txt b/modules/highgui/CMakeLists.txt
-index eb5617751..6d9c650bc 100644
+index eb56177..6d9c650 100644
 --- a/modules/highgui/CMakeLists.txt
 +++ b/modules/highgui/CMakeLists.txt
 @@ -65,7 +65,7 @@ elseif(HAVE_QT)
@@ -2457,7 +2522,7 @@ index eb5617751..6d9c650bc 100644
      set_source_files_properties(${_RCC_OUTFILES} PROPERTIES COMPILE_FLAGS -Wno-missing-declarations)
    endif()
 diff --git a/modules/imgproc/src/imgwarp.cpp b/modules/imgproc/src/imgwarp.cpp
-index 0fa520228..dcf2e44b5 100644
+index 0fa5202..dcf2e44 100644
 --- a/modules/imgproc/src/imgwarp.cpp
 +++ b/modules/imgproc/src/imgwarp.cpp
 @@ -1649,7 +1649,7 @@ struct VResizeLanczos4
@@ -2479,7 +2544,7 @@ index 0fa520228..dcf2e44b5 100644
                  b = beta[k]; S = src[k];
                  s0 += S[x]*b; s1 += S[x+1]*b;
 diff --git a/modules/objdetect/src/haar.cpp b/modules/objdetect/src/haar.cpp
-index 51843fa48..bb37ee91e 100644
+index 51843fa..bb37ee9 100644
 --- a/modules/objdetect/src/haar.cpp
 +++ b/modules/objdetect/src/haar.cpp
 @@ -824,10 +824,7 @@ cvRunHaarClassifierCascadeSum( const CvHaarClassifierCascade* _cascade,
@@ -2495,5 +2560,5 @@ index 51843fa48..bb37ee91e 100644
  #  ifdef CV_HAAR_USE_SSE
      bool haveSSE2 = cv::checkHardwareSupport(CV_CPU_SSE2);
 -- 
-2.12.2
+2.7.4
 
