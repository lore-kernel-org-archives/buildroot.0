From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  1 Nov 2016 09:56:54 +0100
Subject: [Buildroot] [PATCH 2/2] package/opencv: convert diff patch to git
	patch
In-Reply-To: <20161101085654.3571-1-s.martin49@gmail.com>
References: <20161101085654.3571-1-s.martin49@gmail.com>
Message-ID: <20161101085654.3571-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/0001-atomic.patch | 134 ++++++++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 52 deletions(-)

diff --git a/package/opencv/0001-atomic.patch b/package/opencv/0001-atomic.patch
index bbe8d43..8c9724d 100644
--- a/package/opencv/0001-atomic.patch
+++ b/package/opencv/0001-atomic.patch
@@ -1,5 +1,8 @@
-Bug#714923: opencv FTBFS on sparc64
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=714923
+From f71c288c6d853e623461f97cd72e6a9e6541f61a Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Tue, 1 Nov 2016 09:25:30 +0100
+Subject: [PATCH 1/4] Bug#714923: opencv FTBFS on sparc64
+ https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=714923
 
 opencv uses functions from <ext/atomicity.h>, but it wrongly assumes
 this functions apply to an int type. While it is true for some
@@ -7,11 +10,26 @@ architectures, some architectures are using a long type there. The
 correct type to use is _Atomic_word.
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Samuel Martin: convert to git diff]
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ modules/core/include/opencv2/core/core.hpp       | 10 +++++-----
+ modules/core/include/opencv2/core/gpumat.hpp     |  2 +-
+ modules/core/include/opencv2/core/operations.hpp |  4 ++--
+ modules/core/src/gpumat.cpp                      |  2 +-
+ modules/core/src/matrix.cpp                      |  4 ++--
+ modules/core/src/system.cpp                      |  8 ++++----
+ modules/gpu/include/opencv2/gpu/gpu.hpp          |  2 +-
+ modules/ocl/include/opencv2/ocl/ocl.hpp          |  2 +-
+ modules/ocl/src/matrix_operations.cpp            |  2 +-
+ modules/python/src2/cv2.cpp                      |  8 ++++----
+ 10 files changed, 22 insertions(+), 22 deletions(-)
 
-diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp opencv-2.4.12.3/modules/core/include/opencv2/core/core.hpp
---- opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/core/include/opencv2/core/core.hpp	2016-04-03 00:10:50.455774144 +0200
-@@ -1290,7 +1290,7 @@
+diff --git a/modules/core/include/opencv2/core/core.hpp b/modules/core/include/opencv2/core/core.hpp
+index 591d50a..5b4261e 100644
+--- a/modules/core/include/opencv2/core/core.hpp
++++ b/modules/core/include/opencv2/core/core.hpp
+@@ -1290,7 +1290,7 @@ public:
      operator const _Tp*() const;
  
      _Tp* obj; //< the object pointer.
@@ -20,7 +38,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp opencv
  };
  
  template<typename T>
-@@ -1490,9 +1490,9 @@
+@@ -1490,9 +1490,9 @@ class CV_EXPORTS MatAllocator
  public:
      MatAllocator() {}
      virtual ~MatAllocator() {}
@@ -32,7 +50,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp opencv
  };
  
  /*!
-@@ -1985,7 +1985,7 @@
+@@ -1985,7 +1985,7 @@ public:
  
      //! pointer to the reference counter;
      // when matrix points to user-allocated data, the pointer is NULL
@@ -41,7 +59,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp opencv
  
      //! helper fields used in locateROI and adjustROI
      uchar* datastart;
-@@ -3408,7 +3408,7 @@
+@@ -3449,7 +3449,7 @@ public:
      {
          Hdr(int _dims, const int* _sizes, int _type);
          void clear();
@@ -50,10 +68,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp opencv
          int dims;
          int valueOffset;
          size_t nodeSize;
-diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/gpumat.hpp opencv-2.4.12.3/modules/core/include/opencv2/core/gpumat.hpp
---- opencv-2.4.12.3.orig/modules/core/include/opencv2/core/gpumat.hpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/core/include/opencv2/core/gpumat.hpp	2016-04-02 23:08:58.116874218 +0200
-@@ -301,7 +301,7 @@
+diff --git a/modules/core/include/opencv2/core/gpumat.hpp b/modules/core/include/opencv2/core/gpumat.hpp
+index 68647d9..d488c27 100644
+--- a/modules/core/include/opencv2/core/gpumat.hpp
++++ b/modules/core/include/opencv2/core/gpumat.hpp
+@@ -301,7 +301,7 @@ namespace cv { namespace gpu
  
          //! pointer to the reference counter;
          // when GpuMatrix points to user-allocated data, the pointer is NULL
@@ -62,10 +81,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/gpumat.hpp open
  
          //! helper fields used in locateROI and adjustROI
          uchar* datastart;
-diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/operations.hpp opencv-2.4.12.3/modules/core/include/opencv2/core/operations.hpp
---- opencv-2.4.12.3.orig/modules/core/include/opencv2/core/operations.hpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/core/include/opencv2/core/operations.hpp	2016-04-02 23:12:59.148385306 +0200
-@@ -2589,7 +2589,7 @@
+diff --git a/modules/core/include/opencv2/core/operations.hpp b/modules/core/include/opencv2/core/operations.hpp
+index 0ae51c6..a455502 100644
+--- a/modules/core/include/opencv2/core/operations.hpp
++++ b/modules/core/include/opencv2/core/operations.hpp
+@@ -2589,7 +2589,7 @@ template<typename _Tp> inline Ptr<_Tp>::Ptr(_Tp* _obj) : obj(_obj)
  {
      if(obj)
      {
@@ -74,7 +94,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/operations.hpp
          *refcount = 1;
      }
      else
-@@ -2628,7 +2628,7 @@
+@@ -2628,7 +2628,7 @@ template<typename _Tp> inline Ptr<_Tp>& Ptr<_Tp>::operator = (const Ptr<_Tp>& _p
  {
      if (this != &_ptr)
      {
@@ -83,10 +103,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/operations.hpp
        if( _refcount )
            CV_XADD(_refcount, 1);
        release();
-diff -Nur opencv-2.4.12.3.orig/modules/core/src/gpumat.cpp opencv-2.4.12.3/modules/core/src/gpumat.cpp
---- opencv-2.4.12.3.orig/modules/core/src/gpumat.cpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/core/src/gpumat.cpp	2016-04-02 23:14:38.894804300 +0200
-@@ -716,7 +716,7 @@
+diff --git a/modules/core/src/gpumat.cpp b/modules/core/src/gpumat.cpp
+index 9669191..0bd2568 100644
+--- a/modules/core/src/gpumat.cpp
++++ b/modules/core/src/gpumat.cpp
+@@ -716,7 +716,7 @@ void cv::gpu::GpuMat::create(int _rows, int _cols, int _type)
          datastart = data = static_cast<uchar*>(devPtr);
          dataend = data + nettosize;
  
@@ -95,10 +116,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/src/gpumat.cpp opencv-2.4.12.3/modul
          *refcount = 1;
      }
  }
-diff -Nur opencv-2.4.12.3.orig/modules/core/src/matrix.cpp opencv-2.4.12.3/modules/core/src/matrix.cpp
---- opencv-2.4.12.3.orig/modules/core/src/matrix.cpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/core/src/matrix.cpp	2016-04-02 23:59:53.405491031 +0200
-@@ -213,7 +213,7 @@
+diff --git a/modules/core/src/matrix.cpp b/modules/core/src/matrix.cpp
+index 57abffc..7b840a0 100644
+--- a/modules/core/src/matrix.cpp
++++ b/modules/core/src/matrix.cpp
+@@ -213,7 +213,7 @@ void Mat::create(int d, const int* _sizes, int _type)
          {
              size_t totalsize = alignSize(step.p[0]*size.p[0], (int)sizeof(*refcount));
              data = datastart = (uchar*)fastMalloc(totalsize + (int)sizeof(*refcount));
@@ -107,7 +129,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/src/matrix.cpp opencv-2.4.12.3/modul
              *refcount = 1;
          }
          else
-@@ -228,7 +228,7 @@
+@@ -228,7 +228,7 @@ void Mat::create(int d, const int* _sizes, int _type)
                  allocator = 0;
                  size_t totalSize = alignSize(step.p[0]*size.p[0], (int)sizeof(*refcount));
                  data = datastart = (uchar*)fastMalloc(totalSize + (int)sizeof(*refcount));
@@ -116,10 +138,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/src/matrix.cpp opencv-2.4.12.3/modul
                  *refcount = 1;
              }
  #else
-diff -Nur opencv-2.4.12.3.orig/modules/core/src/system.cpp opencv-2.4.12.3/modules/core/src/system.cpp
---- opencv-2.4.12.3.orig/modules/core/src/system.cpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/core/src/system.cpp	2016-04-02 23:33:19.298905578 +0200
-@@ -892,7 +892,7 @@
+diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
+index f5a1af2..9a7b262 100644
+--- a/modules/core/src/system.cpp
++++ b/modules/core/src/system.cpp
+@@ -892,7 +892,7 @@ struct Mutex::Impl
      void unlock() { LeaveCriticalSection(&cs); }
  
      CRITICAL_SECTION cs;
@@ -128,7 +151,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/src/system.cpp opencv-2.4.12.3/modul
  };
  
  #ifndef __GNUC__
-@@ -920,7 +920,7 @@
+@@ -920,7 +920,7 @@ struct Mutex::Impl
      void unlock() { OSSpinLockUnlock(&sl); }
  
      OSSpinLock sl;
@@ -137,7 +160,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/src/system.cpp opencv-2.4.12.3/modul
  };
  
  #elif defined __linux__ && !defined ANDROID && !defined __LINUXTHREADS_OLD__
-@@ -935,7 +935,7 @@
+@@ -935,7 +935,7 @@ struct Mutex::Impl
      void unlock() { pthread_spin_unlock(&sl); }
  
      pthread_spinlock_t sl;
@@ -146,7 +169,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/src/system.cpp opencv-2.4.12.3/modul
  };
  
  #else
-@@ -950,7 +950,7 @@
+@@ -950,7 +950,7 @@ struct Mutex::Impl
      void unlock() { pthread_mutex_unlock(&sl); }
  
      pthread_mutex_t sl;
@@ -155,10 +178,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/core/src/system.cpp opencv-2.4.12.3/modul
  };
  
  #endif
-diff -Nur opencv-2.4.12.3.orig/modules/gpu/include/opencv2/gpu/gpu.hpp opencv-2.4.12.3/modules/gpu/include/opencv2/gpu/gpu.hpp
---- opencv-2.4.12.3.orig/modules/gpu/include/opencv2/gpu/gpu.hpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/gpu/include/opencv2/gpu/gpu.hpp	2016-04-02 23:16:19.737293785 +0200
-@@ -125,7 +125,7 @@
+diff --git a/modules/gpu/include/opencv2/gpu/gpu.hpp b/modules/gpu/include/opencv2/gpu/gpu.hpp
+index de16982..266fa2f 100644
+--- a/modules/gpu/include/opencv2/gpu/gpu.hpp
++++ b/modules/gpu/include/opencv2/gpu/gpu.hpp
+@@ -125,7 +125,7 @@ public:
      size_t step;
  
      uchar* data;
@@ -167,10 +191,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/gpu/include/opencv2/gpu/gpu.hpp opencv-2.
  
      uchar* datastart;
      uchar* dataend;
-diff -Nur opencv-2.4.12.3.orig/modules/ocl/include/opencv2/ocl/ocl.hpp opencv-2.4.12.3/modules/ocl/include/opencv2/ocl/ocl.hpp
---- opencv-2.4.12.3.orig/modules/ocl/include/opencv2/ocl/ocl.hpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/ocl/include/opencv2/ocl/ocl.hpp	2016-04-02 23:18:55.715331443 +0200
-@@ -404,7 +404,7 @@
+diff --git a/modules/ocl/include/opencv2/ocl/ocl.hpp b/modules/ocl/include/opencv2/ocl/ocl.hpp
+index e8eb3e8..5ea05fc 100644
+--- a/modules/ocl/include/opencv2/ocl/ocl.hpp
++++ b/modules/ocl/include/opencv2/ocl/ocl.hpp
+@@ -404,7 +404,7 @@ namespace cv
  
              //! pointer to the reference counter;
              // when oclMatrix points to user-allocated data, the pointer is NULL
@@ -179,10 +204,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/ocl/include/opencv2/ocl/ocl.hpp opencv-2.
  
              //! helper fields used in locateROI and adjustROI
              //datastart and dataend are not used in current version
-diff -Nur opencv-2.4.12.3.orig/modules/ocl/src/matrix_operations.cpp opencv-2.4.12.3/modules/ocl/src/matrix_operations.cpp
---- opencv-2.4.12.3.orig/modules/ocl/src/matrix_operations.cpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/ocl/src/matrix_operations.cpp	2016-04-02 23:19:23.633128033 +0200
-@@ -591,7 +591,7 @@
+diff --git a/modules/ocl/src/matrix_operations.cpp b/modules/ocl/src/matrix_operations.cpp
+index 331e432..c61dca4 100644
+--- a/modules/ocl/src/matrix_operations.cpp
++++ b/modules/ocl/src/matrix_operations.cpp
+@@ -591,7 +591,7 @@ void cv::ocl::oclMat::createEx(int _rows, int _cols, int _type, DevMemRW rw_type
          datastart = data = (uchar *)dev_ptr;
          dataend = data + nettosize;
  
@@ -191,10 +217,11 @@ diff -Nur opencv-2.4.12.3.orig/modules/ocl/src/matrix_operations.cpp opencv-2.4.
          *refcount = 1;
      }
  }
-diff -Nur opencv-2.4.12.3.orig/modules/python/src2/cv2.cpp opencv-2.4.12.3/modules/python/src2/cv2.cpp
---- opencv-2.4.12.3.orig/modules/python/src2/cv2.cpp	2015-10-26 08:56:34.000000000 +0100
-+++ opencv-2.4.12.3/modules/python/src2/cv2.cpp	2016-04-02 23:18:34.897991791 +0200
-@@ -157,12 +157,12 @@
+diff --git a/modules/python/src2/cv2.cpp b/modules/python/src2/cv2.cpp
+index 04cea39..40e5d43 100644
+--- a/modules/python/src2/cv2.cpp
++++ b/modules/python/src2/cv2.cpp
+@@ -157,12 +157,12 @@ static PyObject* failmsgp(const char *fmt, ...)
  static size_t REFCOUNT_OFFSET = (size_t)&(((PyObject*)0)->ob_refcnt) +
      (0x12345678 != *(const size_t*)"\x78\x56\x34\x12\0\0\0\0\0")*sizeof(int);
  
@@ -209,7 +236,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/python/src2/cv2.cpp opencv-2.4.12.3/modul
  {
      return (int*)((size_t)obj + REFCOUNT_OFFSET);
  }
-@@ -173,7 +173,7 @@
+@@ -173,7 +173,7 @@ public:
      NumpyAllocator() {}
      ~NumpyAllocator() {}
  
@@ -218,7 +245,7 @@ diff -Nur opencv-2.4.12.3.orig/modules/python/src2/cv2.cpp opencv-2.4.12.3/modul
                    uchar*& datastart, uchar*& data, size_t* step)
      {
          PyEnsureGIL gil;
-@@ -206,7 +206,7 @@
+@@ -206,7 +206,7 @@ public:
          datastart = data = (uchar*)PyArray_DATA((PyArrayObject*) o);
      }
  
@@ -227,3 +254,6 @@ diff -Nur opencv-2.4.12.3.orig/modules/python/src2/cv2.cpp opencv-2.4.12.3/modul
      {
          PyEnsureGIL gil;
          if( !refcount )
+-- 
+2.10.2
+
-- 
2.10.2
