From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Apr 2021 22:24:41 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/libosmium: new package
In-Reply-To: <20210415150356.775904-2-fido_max@inbox.ru>
References: <20210415150356.775904-1-fido_max@inbox.ru>
 <20210415150356.775904-2-fido_max@inbox.ru>
Message-ID: <a735cf9d-33d9-cf32-19e7-a5e2df0f53a2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2021 17:03, Maxim Kochetkov wrote:
> A fast and flexible C++ library for working with OpenStreetMap data.
> Libosmium works on Linux, macOS and Windows.
> 
> https://osmcode.org/libosmium/
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

 I wanted to apply, however, it fails to build in a very basic config for me:

CMake Error at cmake/FindProtozero.cmake:47 (file):
  file STRINGS file

"/home/arnout/src/buildroot/output/build/libosmium-2.16.0/PROTOZERO_INCLUDE_DIR-NOTFOUND/protozero/version.hpp"
  cannot be read.
Call Stack (most recent call first):
  cmake/FindOsmium.cmake:118 (find_package)
  CMakeLists.txt:170 (find_package)


-- Could NOT find Protozero: Found unsuitable version "unknown", but required is
at least "1.6.3" (found PROTOZERO_INCLUDE_DIR-NOTFOUND)
CMake Warning at cmake/FindOsmium.cmake:138 (message):
  Osmium: Can not find some libraries for PBF input/output, please install
  them or configure the paths.
Call Stack (most recent call first):
  CMakeLists.txt:170 (find_package)


-- Found EXPAT:
/home/arnout/src/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libexpat.so
(found version "2.3.0")
-- Found BZip2:
/home/arnout/src/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libbz2.so
(found version "1.0.8")
-- Looking for BZ2_bzCompressInit
-- Looking for BZ2_bzCompressInit - found
CMake Warning at cmake/FindOsmium.cmake:190 (message):
  Osmium: GEOS library is required but not found, please install it or
  configure the paths.
Call Stack (most recent call first):
  CMakeLists.txt:170 (find_package)


-- Could NOT find GDAL (missing: GDAL_LIBRARY GDAL_INCLUDE_DIR) (found version
"GDAL_VERSION-NOTFOUND")
CMake Warning at cmake/FindOsmium.cmake:204 (message):
  Osmium: GDAL library is required but not found, please install it or
  configure the paths.
Call Stack (most recent call first):
  CMakeLists.txt:170 (find_package)


CMake Warning at cmake/FindOsmium.cmake:220 (message):
  Osmium: PROJ.4 library is required but not found, please install it or
  configure the paths.
Call Stack (most recent call first):
  CMakeLists.txt:170 (find_package)


CMake Warning at cmake/FindOsmium.cmake:254 (message):
  Osmium: Google SparseHash library is required but not found, please install
  it or configure the paths.
Call Stack (most recent call first):
  CMakeLists.txt:170 (find_package)


-- Could NOT find Osmium (missing: PROTOZERO_INCLUDE_DIR GEOS_INCLUDE_DIR
GEOS_LIBRARY GDAL_FOUND PROJ_INCLUDE_DIR PROJ_LIBRARY SPARSEHASH_INCLUDE_DIR)


 So it seems that the dependencies on protozero, gdal, geos, proj and sparsehash
are not optional. And in fact, the bzip2, zlib, expat dependencies are also not
optional, if I read cmake/FindOsmium.cmake correctly.

 Also I can't find sparsehash in buildroot, so how did you manage to build this?


> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/libosmium/Config.in      | 17 +++++++++++++++++
>  package/libosmium/libosmium.hash |  3 +++
>  package/libosmium/libosmium.mk   | 30 ++++++++++++++++++++++++++++++
>  5 files changed, 52 insertions(+)
>  create mode 100644 package/libosmium/Config.in
>  create mode 100644 package/libosmium/libosmium.hash
>  create mode 100644 package/libosmium/libosmium.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9390daa2fa..ceb7428e95 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1840,6 +1840,7 @@ N:	Max Filippov <jcmvbkbc@gmail.com>
>  F:	arch/Config.in.xtensa
>  
>  N:	Maxim Kochetkov <fido_max@inbox.ru>
> +F:	package/libosmium/
>  F:	package/protozero/
>  F:	package/timescaledb/
>  
> diff --git a/package/Config.in b/package/Config.in
> index c5014faba1..61c67e5ce1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1936,6 +1936,7 @@ menu "Other"
>  	source "package/libtasn1/Config.in"
>  	source "package/libtommath/Config.in"
>  	source "package/libtpl/Config.in"
> +	source "package/libosmium/Config.in"

 Alphabetical ordering (as reported by check-package).


 Regards,
 Arnout

[snip]
