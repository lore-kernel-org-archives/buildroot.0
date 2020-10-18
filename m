From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 21:40:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: drop package
In-Reply-To: <20201018143200.1250673-1-fontaine.fabrice@gmail.com>
References: <20201018143200.1250673-1-fontaine.fabrice@gmail.com>
Message-ID: <20201018194056.GC3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-18 16:32 +0200, Fabrice Fontaine spake thusly:
> opencv 2.x has seen no release since July 2018 and all buildroot
> packages are already compatible with opencv3 so drop it to ease the
> addition of opencv4 which is not fully backward compatible with opencv3
> as "a lot of C API from OpenCV 1.x has been removed.":
> https://opencv.org/opencv-4-0.

opencv 3 depends on _HAS_ATOMIC, but opencv  2.4 does not. Dropping
opencv 2.4 means that peole that were using it on targets without
atomics, will not be able to replace it with eopncv3 .

The situation is not so dire, in fact;

  - with gcc-.48 onward, atomics are a given on all arch, when threads
    are enabled, and both opencv versions need threads,

  - with gcc 4.7, atomics are only available for arm, armeb, xrensa, and
    64-bit archs.

So, people that would suffer if we'd drop opencv 2.4, would be those
that are using gcc 4.7 (or earlier), and are running on something else
than arm, xtensa or a 64-bit arch.

So, this looks like it is a relatively limited set of conditions, but we
need to account for that before we decide.

For my part, I would be OK to do the drop, though.I would be OK to do the drop.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy                              |   8 +
>  DEVELOPERS                                    |   1 -
>  package/Config.in                             |   1 -
>  package/ffmpeg/ffmpeg.mk                      |   5 +-
>  package/freeswitch/Config.in                  |   3 -
>  package/freeswitch/freeswitch.mk              |   5 -
>  ...0001-Fix-build-of-grfmt_jpeg2000-cpp.patch |  37 ---
>  package/opencv/0001-atomic.patch              | 259 -----------------
>  ...o-not-add-libdl-to-LINKER_LIBS-for-s.patch |  39 ---
>  package/opencv/Config.in                      | 275 ------------------
>  package/opencv/opencv.hash                    |   3 -
>  package/opencv/opencv.mk                      | 255 ----------------
>  package/opencv3/Config.in                     |   1 -
>  package/vlc/Config.in                         |   6 -
>  package/vlc/vlc.mk                            |   6 +-
>  package/zxing-cpp/zxing-cpp.mk                |   5 +-
>  16 files changed, 11 insertions(+), 898 deletions(-)
>  delete mode 100644 package/opencv/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
>  delete mode 100644 package/opencv/0001-atomic.patch
>  delete mode 100644 package/opencv/0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
>  delete mode 100644 package/opencv/Config.in
>  delete mode 100644 package/opencv/opencv.hash
>  delete mode 100644 package/opencv/opencv.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a620005d2e..5d77315fd8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>  
>  comment "Legacy options removed in 2020.11"
>  
> +config BR2_PACKAGE_OPENCV
> +	bool "opencv package was removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_OPENCV3 if BR2_TOOLCHAIN_HAS_ATOMIC && \
> +		!BR2_STATIC_LIBS
> +	help
> +	  This package has been removed, use opencv3 instead.
> +
>  config BR2_PACKAGE_LIBCROCO
>  	bool "libcroco package was removed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5d8808d569..f8ccac288d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2323,7 +2323,6 @@ F:	package/clapack/
>  F:	package/cwiid/
>  F:	package/flite/
>  F:	package/nginx/
> -F:	package/opencv/
>  F:	package/opencv3/
>  F:	package/openobex/
>  F:	package/pkg-cmake.mk
> diff --git a/package/Config.in b/package/Config.in
> index 673ececf37..13c190d54a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1473,7 +1473,6 @@ menu "Graphics"
>  	source "package/libvips/Config.in"
>  	source "package/libwpe/Config.in"
>  	source "package/menu-cache/Config.in"
> -	source "package/opencv/Config.in"
>  	source "package/opencv3/Config.in"
>  	source "package/opengl/Config.in"
>  	source "package/openjpeg/Config.in"
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 1b311ebaea..6b7437411c 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -282,10 +282,7 @@ endif
>  
>  # To avoid a circular dependency only use opencv if opencv itself does
>  # not depend on ffmpeg.
> -ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
> -FFMPEG_CONF_OPTS += --enable-libopencv
> -FFMPEG_DEPENDENCIES += opencv
> -else ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
> +ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
>  FFMPEG_CONF_OPTS += --enable-libopencv
>  FFMPEG_DEPENDENCIES += opencv3
>  else
> diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
> index a2bb6f4fb0..bad101486c 100644
> --- a/package/freeswitch/Config.in
> +++ b/package/freeswitch/Config.in
> @@ -11,9 +11,6 @@ config BR2_PACKAGE_FREESWITCH
>  	select BR2_PACKAGE_JPEG
>  	# src/mod/applications/mod_cv/mod_cv.cpp includes
>  	# highgui.h, imgproc.hpp & objdetect.hpp
> -	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
> -	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
>  	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
>  	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
>  	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index e4438e5f04..7219880530 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -274,11 +274,6 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
>  FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENCV),y)
> -FREESWITCH_DEPENDENCIES += opencv
> -FREESWITCH_ENABLED_MODULES += applications/mod_cv
> -endif
> -
>  ifeq ($(BR2_PACKAGE_OPENCV3),y)
>  FREESWITCH_DEPENDENCIES += opencv3
>  FREESWITCH_ENABLED_MODULES += applications/mod_cv
> diff --git a/package/opencv/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch b/package/opencv/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
> deleted file mode 100644
> index 683dd95d97..0000000000
> --- a/package/opencv/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From f66fc199a20882c546fa31142e9c0f5a8b3cf983 Mon Sep 17 00:00:00 2001
> -From: Florian Jung <flo@windfis.ch>
> -Date: Wed, 29 Jul 2020 18:51:55 +0200
> -Subject: [PATCH] Fix build of grfmt_jpeg2000.cpp
> -
> -libjasper has recently changed `jas_matrix_get` from a macro to an inline function
> -(389951d071 in https://github.com/jasper-software/jasper), causing the build to fail.
> -
> -[Retrieved (and backported) from:
> -https://github.com/opencv/opencv/commit/f66fc199a20882c546fa31142e9c0f5a8b3cf983]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - modules/imgcodecs/src/grfmt_jpeg2000.cpp | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/modules/highgui/src/grfmt_jpeg2000.cpp b/modules/highgui/src/grfmt_jpeg2000.cpp
> -index fe69f80c86f..0f4d28d6f4d 100644
> ---- a/modules/highgui/src/grfmt_jpeg2000.cpp
> -+++ b/modules/highgui/src/grfmt_jpeg2000.cpp
> -@@ -377,7 +377,7 @@ bool  Jpeg2KDecoder::readComponent8u( uchar *data, void *_buffer,
> - 
> -     for( y = 0; y < yend - ystart; )
> -     {
> --        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
> -+        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
> -         uchar* dst = data + (y - yoffset) * step - xoffset;
> - 
> -         if( xstep == 1 )
> -@@ -443,7 +443,7 @@ bool  Jpeg2KDecoder::readComponent16u( unsigned short *data, void *_buffer,
> - 
> -     for( y = 0; y < yend - ystart; )
> -     {
> --        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
> -+        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
> -         ushort* dst = data + (y - yoffset) * step - xoffset;
> - 
> -         if( xstep == 1 )
> diff --git a/package/opencv/0001-atomic.patch b/package/opencv/0001-atomic.patch
> deleted file mode 100644
> index 8c9724d25e..0000000000
> --- a/package/opencv/0001-atomic.patch
> +++ /dev/null
> @@ -1,259 +0,0 @@
> -From f71c288c6d853e623461f97cd72e6a9e6541f61a Mon Sep 17 00:00:00 2001
> -From: Waldemar Brodkorb <wbx@openadk.org>
> -Date: Tue, 1 Nov 2016 09:25:30 +0100
> -Subject: [PATCH 1/4] Bug#714923: opencv FTBFS on sparc64
> - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=714923
> -
> -opencv uses functions from <ext/atomicity.h>, but it wrongly assumes
> -this functions apply to an int type. While it is true for some
> -architectures, some architectures are using a long type there. The
> -correct type to use is _Atomic_word.
> -
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -[Samuel Martin: convert to git diff]
> -Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ----
> - modules/core/include/opencv2/core/core.hpp       | 10 +++++-----
> - modules/core/include/opencv2/core/gpumat.hpp     |  2 +-
> - modules/core/include/opencv2/core/operations.hpp |  4 ++--
> - modules/core/src/gpumat.cpp                      |  2 +-
> - modules/core/src/matrix.cpp                      |  4 ++--
> - modules/core/src/system.cpp                      |  8 ++++----
> - modules/gpu/include/opencv2/gpu/gpu.hpp          |  2 +-
> - modules/ocl/include/opencv2/ocl/ocl.hpp          |  2 +-
> - modules/ocl/src/matrix_operations.cpp            |  2 +-
> - modules/python/src2/cv2.cpp                      |  8 ++++----
> - 10 files changed, 22 insertions(+), 22 deletions(-)
> -
> -diff --git a/modules/core/include/opencv2/core/core.hpp b/modules/core/include/opencv2/core/core.hpp
> -index 591d50a..5b4261e 100644
> ---- a/modules/core/include/opencv2/core/core.hpp
> -+++ b/modules/core/include/opencv2/core/core.hpp
> -@@ -1290,7 +1290,7 @@ public:
> -     operator const _Tp*() const;
> - 
> -     _Tp* obj; //< the object pointer.
> --    int* refcount; //< the associated reference counter
> -+    _Atomic_word* refcount; //< the associated reference counter
> - };
> - 
> - template<typename T>
> -@@ -1490,9 +1490,9 @@ class CV_EXPORTS MatAllocator
> - public:
> -     MatAllocator() {}
> -     virtual ~MatAllocator() {}
> --    virtual void allocate(int dims, const int* sizes, int type, int*& refcount,
> -+    virtual void allocate(int dims, const int* sizes, int type, _Atomic_word*& refcount,
> -                           uchar*& datastart, uchar*& data, size_t* step) = 0;
> --    virtual void deallocate(int* refcount, uchar* datastart, uchar* data) = 0;
> -+    virtual void deallocate(_Atomic_word* refcount, uchar* datastart, uchar* data) = 0;
> - };
> - 
> - /*!
> -@@ -1985,7 +1985,7 @@ public:
> - 
> -     //! pointer to the reference counter;
> -     // when matrix points to user-allocated data, the pointer is NULL
> --    int* refcount;
> -+    _Atomic_word* refcount;
> - 
> -     //! helper fields used in locateROI and adjustROI
> -     uchar* datastart;
> -@@ -3449,7 +3449,7 @@ public:
> -     {
> -         Hdr(int _dims, const int* _sizes, int _type);
> -         void clear();
> --        int refcount;
> -+        _Atomic_word refcount;
> -         int dims;
> -         int valueOffset;
> -         size_t nodeSize;
> -diff --git a/modules/core/include/opencv2/core/gpumat.hpp b/modules/core/include/opencv2/core/gpumat.hpp
> -index 68647d9..d488c27 100644
> ---- a/modules/core/include/opencv2/core/gpumat.hpp
> -+++ b/modules/core/include/opencv2/core/gpumat.hpp
> -@@ -301,7 +301,7 @@ namespace cv { namespace gpu
> - 
> -         //! pointer to the reference counter;
> -         // when GpuMatrix points to user-allocated data, the pointer is NULL
> --        int* refcount;
> -+        _Atomic_word* refcount;
> - 
> -         //! helper fields used in locateROI and adjustROI
> -         uchar* datastart;
> -diff --git a/modules/core/include/opencv2/core/operations.hpp b/modules/core/include/opencv2/core/operations.hpp
> -index 0ae51c6..a455502 100644
> ---- a/modules/core/include/opencv2/core/operations.hpp
> -+++ b/modules/core/include/opencv2/core/operations.hpp
> -@@ -2589,7 +2589,7 @@ template<typename _Tp> inline Ptr<_Tp>::Ptr(_Tp* _obj) : obj(_obj)
> - {
> -     if(obj)
> -     {
> --        refcount = (int*)fastMalloc(sizeof(*refcount));
> -+        refcount = (_Atomic_word*)fastMalloc(sizeof(*refcount));
> -         *refcount = 1;
> -     }
> -     else
> -@@ -2628,7 +2628,7 @@ template<typename _Tp> inline Ptr<_Tp>& Ptr<_Tp>::operator = (const Ptr<_Tp>& _p
> - {
> -     if (this != &_ptr)
> -     {
> --      int* _refcount = _ptr.refcount;
> -+      _Atomic_word* _refcount = _ptr.refcount;
> -       if( _refcount )
> -           CV_XADD(_refcount, 1);
> -       release();
> -diff --git a/modules/core/src/gpumat.cpp b/modules/core/src/gpumat.cpp
> -index 9669191..0bd2568 100644
> ---- a/modules/core/src/gpumat.cpp
> -+++ b/modules/core/src/gpumat.cpp
> -@@ -716,7 +716,7 @@ void cv::gpu::GpuMat::create(int _rows, int _cols, int _type)
> -         datastart = data = static_cast<uchar*>(devPtr);
> -         dataend = data + nettosize;
> - 
> --        refcount = static_cast<int*>(fastMalloc(sizeof(*refcount)));
> -+        refcount = static_cast<_Atomic_word*>(fastMalloc(sizeof(*refcount)));
> -         *refcount = 1;
> -     }
> - }
> -diff --git a/modules/core/src/matrix.cpp b/modules/core/src/matrix.cpp
> -index 57abffc..7b840a0 100644
> ---- a/modules/core/src/matrix.cpp
> -+++ b/modules/core/src/matrix.cpp
> -@@ -213,7 +213,7 @@ void Mat::create(int d, const int* _sizes, int _type)
> -         {
> -             size_t totalsize = alignSize(step.p[0]*size.p[0], (int)sizeof(*refcount));
> -             data = datastart = (uchar*)fastMalloc(totalsize + (int)sizeof(*refcount));
> --            refcount = (int*)(data + totalsize);
> -+            refcount = (_Atomic_word*)(data + totalsize);
> -             *refcount = 1;
> -         }
> -         else
> -@@ -228,7 +228,7 @@ void Mat::create(int d, const int* _sizes, int _type)
> -                 allocator = 0;
> -                 size_t totalSize = alignSize(step.p[0]*size.p[0], (int)sizeof(*refcount));
> -                 data = datastart = (uchar*)fastMalloc(totalSize + (int)sizeof(*refcount));
> --                refcount = (int*)(data + totalSize);
> -+                refcount = (_Atomic_word*)(data + totalSize);
> -                 *refcount = 1;
> -             }
> - #else
> -diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
> -index f5a1af2..9a7b262 100644
> ---- a/modules/core/src/system.cpp
> -+++ b/modules/core/src/system.cpp
> -@@ -892,7 +892,7 @@ struct Mutex::Impl
> -     void unlock() { LeaveCriticalSection(&cs); }
> - 
> -     CRITICAL_SECTION cs;
> --    int refcount;
> -+    _Atomic_word refcount;
> - };
> - 
> - #ifndef __GNUC__
> -@@ -920,7 +920,7 @@ struct Mutex::Impl
> -     void unlock() { OSSpinLockUnlock(&sl); }
> - 
> -     OSSpinLock sl;
> --    int refcount;
> -+    _Atomic_word refcount;
> - };
> - 
> - #elif defined __linux__ && !defined ANDROID && !defined __LINUXTHREADS_OLD__
> -@@ -935,7 +935,7 @@ struct Mutex::Impl
> -     void unlock() { pthread_spin_unlock(&sl); }
> - 
> -     pthread_spinlock_t sl;
> --    int refcount;
> -+    _Atomic_word refcount;
> - };
> - 
> - #else
> -@@ -950,7 +950,7 @@ struct Mutex::Impl
> -     void unlock() { pthread_mutex_unlock(&sl); }
> - 
> -     pthread_mutex_t sl;
> --    int refcount;
> -+    _Atomic_word refcount;
> - };
> - 
> - #endif
> -diff --git a/modules/gpu/include/opencv2/gpu/gpu.hpp b/modules/gpu/include/opencv2/gpu/gpu.hpp
> -index de16982..266fa2f 100644
> ---- a/modules/gpu/include/opencv2/gpu/gpu.hpp
> -+++ b/modules/gpu/include/opencv2/gpu/gpu.hpp
> -@@ -125,7 +125,7 @@ public:
> -     size_t step;
> - 
> -     uchar* data;
> --    int* refcount;
> -+    _Atomic_word* refcount;
> - 
> -     uchar* datastart;
> -     uchar* dataend;
> -diff --git a/modules/ocl/include/opencv2/ocl/ocl.hpp b/modules/ocl/include/opencv2/ocl/ocl.hpp
> -index e8eb3e8..5ea05fc 100644
> ---- a/modules/ocl/include/opencv2/ocl/ocl.hpp
> -+++ b/modules/ocl/include/opencv2/ocl/ocl.hpp
> -@@ -404,7 +404,7 @@ namespace cv
> - 
> -             //! pointer to the reference counter;
> -             // when oclMatrix points to user-allocated data, the pointer is NULL
> --            int *refcount;
> -+            _Atomic_word *refcount;
> - 
> -             //! helper fields used in locateROI and adjustROI
> -             //datastart and dataend are not used in current version
> -diff --git a/modules/ocl/src/matrix_operations.cpp b/modules/ocl/src/matrix_operations.cpp
> -index 331e432..c61dca4 100644
> ---- a/modules/ocl/src/matrix_operations.cpp
> -+++ b/modules/ocl/src/matrix_operations.cpp
> -@@ -591,7 +591,7 @@ void cv::ocl::oclMat::createEx(int _rows, int _cols, int _type, DevMemRW rw_type
> -         datastart = data = (uchar *)dev_ptr;
> -         dataend = data + nettosize;
> - 
> --        refcount = (int *)fastMalloc(sizeof(*refcount));
> -+        refcount = (_Atomic_word *)fastMalloc(sizeof(*refcount));
> -         *refcount = 1;
> -     }
> - }
> -diff --git a/modules/python/src2/cv2.cpp b/modules/python/src2/cv2.cpp
> -index 04cea39..40e5d43 100644
> ---- a/modules/python/src2/cv2.cpp
> -+++ b/modules/python/src2/cv2.cpp
> -@@ -157,12 +157,12 @@ static PyObject* failmsgp(const char *fmt, ...)
> - static size_t REFCOUNT_OFFSET = (size_t)&(((PyObject*)0)->ob_refcnt) +
> -     (0x12345678 != *(const size_t*)"\x78\x56\x34\x12\0\0\0\0\0")*sizeof(int);
> - 
> --static inline PyObject* pyObjectFromRefcount(const int* refcount)
> -+static inline PyObject* pyObjectFromRefcount(const _Atomic_word* refcount)
> - {
> -     return (PyObject*)((size_t)refcount - REFCOUNT_OFFSET);
> - }
> - 
> --static inline int* refcountFromPyObject(const PyObject* obj)
> -+static inline _Atomic_word* refcountFromPyObject(const PyObject* obj)
> - {
> -     return (int*)((size_t)obj + REFCOUNT_OFFSET);
> - }
> -@@ -173,7 +173,7 @@ public:
> -     NumpyAllocator() {}
> -     ~NumpyAllocator() {}
> - 
> --    void allocate(int dims, const int* sizes, int type, int*& refcount,
> -+    void allocate(int dims, const int* sizes, int type, _Atomic_word*& refcount,
> -                   uchar*& datastart, uchar*& data, size_t* step)
> -     {
> -         PyEnsureGIL gil;
> -@@ -206,7 +206,7 @@ public:
> -         datastart = data = (uchar*)PyArray_DATA((PyArrayObject*) o);
> -     }
> - 
> --    void deallocate(int* refcount, uchar*, uchar*)
> -+    void deallocate(_Atomic_word* refcount, uchar*, uchar*)
> -     {
> -         PyEnsureGIL gil;
> -         if( !refcount )
> --- 
> -2.10.2
> -
> diff --git a/package/opencv/0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch b/package/opencv/0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
> deleted file mode 100644
> index 6d63411b01..0000000000
> --- a/package/opencv/0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 22e03ef8a9e3adcbc6b2f16c3cc98e4e14443eed Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Date: Sat, 24 Sep 2016 17:51:22 +0200
> -Subject: [PATCH 1/1] CMakeLists.txt: Do not add libdl to LINKER_LIBS for
> - static builds
> -
> -Without this patch -ldl is present in opencv.pc which breaks OpenCV
> -detection by ffmpeg, detected by buildroot autobuilders:
> -
> -http://autobuild.buildroot.net/results/765/7657e01481995a4f0d725467e935a83928a59a04//ffmpeg-3.1.3/config.log
> -
> -/home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -ldl
> -
> -Patch sent upstream: https://github.com/opencv/opencv/pull/7337
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - CMakeLists.txt | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 007b80d..99b047d 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -457,7 +457,10 @@ if(UNIX)
> -     elseif(${CMAKE_SYSTEM_NAME} MATCHES "QNX")
> -       set(OPENCV_LINKER_LIBS ${OPENCV_LINKER_LIBS} m)
> -     else()
> --      set(OPENCV_LINKER_LIBS ${OPENCV_LINKER_LIBS} dl m pthread rt)
> -+      if(BUILD_SHARED_LIBS)
> -+        set(OPENCV_LINKER_LIBS ${OPENCV_LINKER_LIBS} dl)
> -+      endif()
> -+      set(OPENCV_LINKER_LIBS ${OPENCV_LINKER_LIBS} m pthread rt)
> -     endif()
> -   else()
> -     set(HAVE_LIBPTHREAD YES)
> --- 
> -2.9.3
> -
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> deleted file mode 100644
> index 836f5c96e8..0000000000
> --- a/package/opencv/Config.in
> +++ /dev/null
> @@ -1,275 +0,0 @@
> -menuconfig BR2_PACKAGE_OPENCV
> -	bool "opencv-2.4"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_WCHAR
> -	select BR2_PACKAGE_ZLIB
> -	help
> -	  OpenCV (Open Source Computer Vision) is a library of
> -	  programming functions for real time computer vision.
> -
> -	  http://opencv.org/
> -
> -if BR2_PACKAGE_OPENCV
> -
> -comment "OpenCV modules"
> -
> -config BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	bool "calib3d"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	help
> -	  Include opencv_calib3d module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_CONTRIB
> -	bool "contrib"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_ML
> -	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	help
> -	  Include opencv_contrib module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	bool "features2d"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_FLANN
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	help
> -	  Include opencv_features2d module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_FLANN
> -	bool "flann"
> -	default y
> -	# opencv_core dependency is already enabled
> -	help
> -	  Include opencv_flann module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_GPU
> -	bool "gpu"
> -	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_LEGACY
> -	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> -	select BR2_PACKAGE_OPENCV_LIB_PHOTO
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	help
> -	  Include opencv_gpu module into the OpenCV build.
> -
> -comment "gpu module needs a toolchain w/ dynamic libraries"
> -	depends on BR2_STATIC_LIBS
> -
> -config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	bool "highgui"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	help
> -	  Include opencv_highgui module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	bool "imgproc"
> -	default y
> -	# opencv_core dependency is already enabled
> -	help
> -	  Include opencv_imgproc module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_LEGACY
> -	bool "legacy"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_ML
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	help
> -	  Include opencv_legacy module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_ML
> -	bool "ml (machine learning)"
> -	default y
> -	# opencv_core dependency is already enabled
> -	help
> -	  Include opencv_ml module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_NONFREE
> -	bool "nonfree"
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	help
> -	  Include opencv_nonfree module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> -	bool "objdetect"
> -	default y
> -	# opencv_core dependency is already enabled
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	help
> -	  Include opencv_objdetect module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_PHOTO
> -	bool "photo"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	help
> -	  Include opencv_photo module into the OpenCV build.
> -
> -comment "opencv_python module requires numpy which is not yet available."
> -
> -config BR2_PACKAGE_OPENCV_LIB_STITCHING
> -	bool "stitching"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> -	help
> -	  Include opencv_stitching module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_SUPERRES
> -	bool "superres"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	help
> -	  Include opencv_superres "super resolution" - module into the
> -	  OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_TS
> -	bool "ts (touchscreen)"
> -	default y
> -	# opencv_core dependency is already enabled
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	help
> -	  Include opencv_ts module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	bool "video"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	help
> -	  Include opencv_video module into the OpenCV build.
> -
> -config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
> -	bool "videostab"
> -	default y
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_PHOTO
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	help
> -	  Include opencv_videostab module into the OpenCV build.
> -
> -if !BR2_STATIC_LIBS
> -
> -comment "Test sets"
> -
> -config BR2_PACKAGE_OPENCV_BUILD_TESTS
> -	bool "build tests"
> -
> -config BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS
> -	bool "build performance tests"
> -
> -endif
> -
> -comment "Tests sets need a toolchain w/ dynamic libraries"
> -	depends on BR2_STATIC_LIBS
> -
> -comment "3rd party support"
> -
> -config BR2_PACKAGE_OPENCV_WITH_FFMPEG
> -	bool "ffmpeg support"
> -	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> -	select BR2_PACKAGE_BZIP2
> -	select BR2_PACKAGE_FFMPEG
> -	select BR2_PACKAGE_FFMPEG_SWSCALE
> -	help
> -	  Use ffmpeg from the target system.
> -
> -config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
> -	bool "gstreamer support"
> -	depends on BR2_USE_MMU # gstreamer1 -> libglib2
> -	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2
> -	select BR2_PACKAGE_GSTREAMER1
> -	select BR2_PACKAGE_GST1_PLUGINS_BASE
> -	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
> -	help
> -	  Enable gstreamer support.
> -
> -comment "gstreamer support needs a toolchain w/ wchar, threads"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -config BR2_PACKAGE_OPENCV_WITH_GTK
> -	bool "gtk support"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_MMU # libgtk2 -> glib2
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	select BR2_PACKAGE_LIBGTK2
> -
> -config BR2_PACKAGE_OPENCV_WITH_JASPER
> -	bool "jpeg2000 support"
> -	select BR2_PACKAGE_JASPER
> -	help
> -	  Enable jpeg2000 support.
> -
> -	  Note: this does not use the libjasper bundled with opencv,
> -	  but uses the libjasper package installed system-wide by
> -	  Buildroot.
> -
> -config BR2_PACKAGE_OPENCV_WITH_JPEG
> -	bool "jpeg support"
> -	select BR2_PACKAGE_JPEG
> -	help
> -	  Use shared libjpeg from the target system.
> -
> -config BR2_PACKAGE_OPENCV_WITH_PNG
> -	bool "png support"
> -	select BR2_PACKAGE_LIBPNG
> -	help
> -	  Use shared libpng from the target system.
> -
> -config BR2_PACKAGE_OPENCV_WITH_TIFF
> -	bool "tiff support"
> -	select BR2_PACKAGE_TIFF
> -	help
> -	  Use shared libtiff from the target system.
> -
> -config BR2_PACKAGE_OPENCV_WITH_V4L
> -	bool "v4l support"
> -	help
> -	  Enable Video 4 Linux support.
> -
> -	  If the package libv4l is enabled, its support is
> -	  automatically enabled.
> -
> -comment "Install options"
> -
> -config BR2_PACKAGE_OPENCV_INSTALL_DATA
> -	bool "install extra data"
> -	help
> -	  Install various data that is used by cv libraries and/or demo
> -	  applications, specifically for haarcascades and lbpcascades
> -	  features.
> -
> -	  For further information: see OpenCV documentation.
> -
> -endif # BR2_PACKAGE_OPENCV
> -
> -comment "opencv needs a toolchain w/ C++, NPTL, wchar"
> -	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
> diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
> deleted file mode 100644
> index dfb3b28581..0000000000
> --- a/package/opencv/opencv.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256 192d903588ae2cdceab3d7dc5a5636b023132c8369f184ca89ccec0312ae33d0  opencv-2.4.13.7.tar.gz
> -sha256 46e42877dfc3ac65769292cb4dc1a04b204ad9e40859a390f4c035d6179fbcc4  LICENSE
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> deleted file mode 100644
> index 939058e4ed..0000000000
> --- a/package/opencv/opencv.mk
> +++ /dev/null
> @@ -1,255 +0,0 @@
> -################################################################################
> -#
> -# opencv
> -#
> -################################################################################
> -
> -OPENCV_VERSION = 2.4.13.7
> -OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
> -OPENCV_INSTALL_STAGING = YES
> -OPENCV_LICENSE = BSD-3-Clause
> -OPENCV_LICENSE_FILES = LICENSE
> -OPENCV_SUPPORTS_IN_SOURCE_BUILD = NO
> -OPENCV_CXXFLAGS = $(TARGET_CXXFLAGS)
> -
> -# OpenCV component options
> -OPENCV_CONF_OPTS += \
> -	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
> -	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
> -	-DBUILD_WITH_DEBUG_INFO=OFF
> -
> -# OpenCV build options
> -OPENCV_CONF_OPTS += \
> -	-DBUILD_WITH_STATIC_CRT=OFF \
> -	-DENABLE_FAST_MATH=ON \
> -	-DENABLE_NOISY_WARNINGS=OFF \
> -	-DENABLE_OMIT_FRAME_POINTER=ON \
> -	-DENABLE_PRECOMPILED_HEADERS=OFF \
> -	-DENABLE_PROFILING=OFF \
> -	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
> -
> -# OpenCV link options
> -OPENCV_CONF_OPTS += \
> -	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
> -	-DCMAKE_SKIP_RPATH=OFF \
> -	-DCMAKE_USE_RELATIVE_PATHS=OFF
> -
> -# OpenCV packaging options:
> -OPENCV_CONF_OPTS += \
> -	-DBUILD_PACKAGE=OFF \
> -	-DENABLE_SOLUTION_FOLDERS=OFF \
> -	-DINSTALL_CREATE_DISTRIB=OFF
> -
> -# OpenCV module selection
> -OPENCV_CONF_OPTS += \
> -	-DBUILD_opencv_androidcamera=OFF \
> -	-DBUILD_opencv_apps=OFF \
> -	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
> -	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
> -	-DBUILD_opencv_core=ON \
> -	-DBUILD_opencv_dynamicuda=OFF \
> -	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
> -	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
> -	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
> -	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
> -	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
> -	-DBUILD_opencv_java=OFF \
> -	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
> -	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
> -	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
> -	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
> -	-DBUILD_opencv_ocl=OFF \
> -	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
> -	-DBUILD_opencv_python=OFF \
> -	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
> -	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
> -	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
> -	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
> -	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
> -	-DBUILD_opencv_world=OFF
> -
> -# Hardware support options.
> -#
> -# * PowerPC support is turned off since its only effect is altering CFLAGS,
> -#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
> -OPENCV_CONF_OPTS += \
> -	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
> -	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
> -	-DENABLE_POWERPC=OFF \
> -	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
> -	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
> -	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
> -	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
> -	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
> -	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
> -	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)
> -
> -# Cuda stuff
> -OPENCV_CONF_OPTS += \
> -	-DWITH_CUBLAS=OFF \
> -	-DWITH_CUDA=OFF \
> -	-DWITH_CUFFT=OFF
> -
> -# NVidia stuff
> -OPENCV_CONF_OPTS += -DWITH_NVCUVID=OFF
> -
> -# AMD stuff
> -OPENCV_CONF_OPTS += \
> -	-DWITH_OPENCLAMDBLAS=OFF \
> -	-DWITH_OPENCLAMDFFT=OFF
> -
> -# Intel stuff
> -OPENCV_CONF_OPTS += \
> -	-DWITH_INTELPERC=OFF \
> -	-DWITH_IPP=OFF \
> -	-DWITH_TBB=OFF
> -
> -# Smartek stuff
> -OPENCV_CONF_OPTS += -DWITH_GIGEAPI=OFF
> -
> -# Prosilica stuff
> -OPENCV_CONF_OPTS += -DWITH_PVAPI=OFF
> -
> -# Ximea stuff
> -OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
> -
> -# Non-Linux support (Android options) must remain OFF:
> -OPENCV_CONF_OPTS += \
> -	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
> -	-DBUILD_ANDROID_EXAMPLES=OFF \
> -	-DBUILD_FAT_JAVA_LIB=OFF \
> -	-DBUILD_JAVA_SUPPORT=OFF \
> -	-DINSTALL_ANDROID_EXAMPLES=OFF \
> -	-DWITH_ANDROID_CAMERA=OFF
> -
> -# Non-Linux support (Mac OSX options) must remain OFF:
> -OPENCV_CONF_OPTS += \
> -	-DWITH_AVFOUNDATION=OFF \
> -	-DWITH_CARBON=OFF \
> -	-DWITH_QUICKTIME=OFF
> -
> -# Non-Linux support (Windows options) must remain OFF:
> -OPENCV_CONF_OPTS += \
> -	-DWITH_CSTRIPES=OFF \
> -	-DWITH_DSHOW=OFF \
> -	-DWITH_MSMF=OFF \
> -	-DWITH_VFW=OFF \
> -	-DWITH_VIDEOINPUT=OFF \
> -	-DWITH_WIN32UI=OFF
> -
> -# Software/3rd-party support options.
> -OPENCV_CONF_OPTS += \
> -	-DBUILD_JASPER=OFF \
> -	-DBUILD_JPEG=OFF \
> -	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
> -	-DBUILD_OPENEXR=OFF \
> -	-DBUILD_PNG=OFF \
> -	-DBUILD_TIFF=OFF \
> -	-DBUILD_ZLIB=OFF \
> -	-DINSTALL_C_EXAMPLES=OFF \
> -	-DINSTALL_PYTHON_EXAMPLES=OFF \
> -	-DINSTALL_TO_MANGLED_PATHS=OFF
> -
> -# Disabled features (mostly because they are not available in Buildroot), but
> -# - eigen: OpenCV does not use it, not take any benefit from it.
> -OPENCV_CONF_OPTS += \
> -	-DWITH_1394=OFF \
> -	-DWITH_EIGEN=OFF \
> -	-DWITH_GSTREAMER_0_10=OFF \
> -	-DWITH_IMAGEIO=OFF \
> -	-DWITH_OPENCL=OFF \
> -	-DWITH_OPENEXR=OFF \
> -	-DWITH_OPENGL=OFF \
> -	-DWITH_OPENMP=OFF \
> -	-DWITH_OPENNI=OFF \
> -	-DWITH_QT=OFF \
> -	-DWITH_UNICAP=OFF \
> -	-DWITH_XINE=OFF
> -
> -OPENCV_DEPENDENCIES += zlib
> -
> -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> -OPENCV_CXXFLAGS += -O0
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
> -OPENCV_CONF_OPTS += -DWITH_FFMPEG=ON
> -OPENCV_DEPENDENCIES += ffmpeg bzip2
> -else
> -OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
> -OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
> -else
> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
> -OPENCV_CONF_OPTS += -DWITH_GTK=ON
> -OPENCV_DEPENDENCIES += libgtk2
> -else
> -OPENCV_CONF_OPTS += -DWITH_GTK=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
> -OPENCV_CONF_OPTS += -DWITH_JASPER=ON
> -OPENCV_CXXFLAGS += -D__STDC_LIMIT_MACROS
> -OPENCV_DEPENDENCIES += jasper
> -else
> -OPENCV_CONF_OPTS += -DWITH_JASPER=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
> -OPENCV_CONF_OPTS += -DWITH_JPEG=ON
> -OPENCV_DEPENDENCIES += jpeg
> -else
> -OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
> -OPENCV_CONF_OPTS += -DWITH_PNG=ON
> -OPENCV_DEPENDENCIES += libpng
> -else
> -OPENCV_CONF_OPTS += -DWITH_PNG=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
> -OPENCV_CONF_OPTS += -DWITH_TIFF=ON
> -OPENCV_DEPENDENCIES += tiff
> -else
> -OPENCV_CONF_OPTS += -DWITH_TIFF=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
> -OPENCV_CONF_OPTS += \
> -	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
> -	-DWITH_V4L=ON
> -OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
> -else
> -OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
> -endif
> -
> -OPENCV_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(OPENCV_CXXFLAGS)"
> -
> -# Installation hooks:
> -define OPENCV_CLEAN_INSTALL_DOC
> -	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
> -endef
> -OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC
> -
> -define OPENCV_CLEAN_INSTALL_CMAKE
> -	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
> -endef
> -OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_CMAKE
> -
> -ifneq ($(BR2_PACKAGE_OPENCV_INSTALL_DATA),y)
> -define OPENCV_CLEAN_INSTALL_DATA
> -	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
> -		$(TARGET_DIR)/usr/share/OpenCV/lbpcascades
> -endef
> -OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
> -endif
> -
> -$(eval $(cmake-package))
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index 22dcb67f3a..ac7da67c5f 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -5,7 +5,6 @@ menuconfig BR2_PACKAGE_OPENCV3
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS # include dlfcn.h
> -	depends on !BR2_PACKAGE_OPENCV
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  OpenCV (Open Source Computer Vision) is a library of
> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> index 70e1ca41a1..96ff8f2fcb 100644
> --- a/package/vlc/Config.in
> +++ b/package/vlc/Config.in
> @@ -8,7 +8,6 @@ config BR2_PACKAGE_VLC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>  	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
> -	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
>  	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
>  	select BR2_PACKAGE_ZLIB if BR2_PACKAGE_TAGLIB
>  	help
> @@ -18,11 +17,6 @@ config BR2_PACKAGE_VLC
>  
>  	  http://www.videolan.org/vlc/
>  
> -config BR2_PACKAGE_VLC_OPENCV_BACKEND
> -	bool
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> -
>  config BR2_PACKAGE_VLC_OPENCV3_BACKEND
>  	bool
>  	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 23bd695e02..de878f4acc 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -209,13 +209,9 @@ else
>  VLC_CONF_OPTS += --disable-gles2
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENCV)$(BR2_PACKAGE_OPENCV3),y)
> +ifeq ($(BR2_PACKAGE_OPENCV3),y)
>  VLC_CONF_OPTS += --enable-opencv
> -ifeq ($(BR2_PACKAGE_OPENCV),y)
> -VLC_DEPENDENCIES += opencv
> -else
>  VLC_DEPENDENCIES += opencv3
> -endif
>  else
>  VLC_CONF_OPTS += --disable-opencv
>  endif
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> index fbe3cc7dd9..e9c80b4453 100644
> --- a/package/zxing-cpp/zxing-cpp.mk
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -16,10 +16,7 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  ZXING_CPP_DEPENDENCIES += libiconv
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),y)
> -ZXING_CPP_DEPENDENCIES += opencv
> -ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
> -else ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
> +ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
>  ZXING_CPP_DEPENDENCIES += opencv3
>  ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
>  else
> -- 
> 2.28.0
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
