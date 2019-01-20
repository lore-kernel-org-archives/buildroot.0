From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Jan 2019 07:35:05 +0200
Subject: [Buildroot] [PATCH 1/1] libftdi1: fix python build with cmake <
 3.7
In-Reply-To: <20190119205308.31175-1-fontaine.fabrice@gmail.com>
References: <20190119205308.31175-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef97oprq.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sat, Jan 19 2019, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/1091872e2b77d789e361d1ddefd235c738933c55
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...n-CMakeLists.txt-fix-build-with-cmake-3.7.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/libftdi1/0005-python-CMakeLists.txt-fix-build-with-cmake-3.7.patch
>
> diff --git a/package/libftdi1/0005-python-CMakeLists.txt-fix-build-with-cmake-3.7.patch b/package/libftdi1/0005-python-CMakeLists.txt-fix-build-with-cmake-3.7.patch
> new file mode 100644
> index 0000000000..c9fcb0ee4f
> --- /dev/null
> +++ b/package/libftdi1/0005-python-CMakeLists.txt-fix-build-with-cmake-3.7.patch
> @@ -0,0 +1,34 @@
> +From ddfbe611fd273ea6a0c1ac86c184fa8b395fa2fe Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 19 Jan 2019 21:09:22 +0100
> +Subject: [PATCH] python/CMakeLists.txt: fix build with cmake < 3.7
> +
> +VERSION_GREATER_EQUAL has been added only in cmake 3.7:
> +https://cmake.org/cmake/help/v3.7/release/3.7.html
> +
> +So replace this statement by NOT CMAKE_VERSION VERSION_LESS
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/1091872e2b77d789e361d1ddefd235c738933c55
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +http://developer.intra2net.com/mailarchive/html/libftdi/2019/msg00009.html]
> +---
> + python/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
> +index 7bdd9f9..376dae6 100644
> +--- a/python/CMakeLists.txt
> ++++ b/python/CMakeLists.txt
> +@@ -1,5 +1,5 @@
> +   # workaround for cmake bug #0013449
> +-  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH OR CMAKE_VERSION VERSION_GREATER_EQUAL 3.0.0 )
> ++  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH OR NOT CMAKE_VERSION VERSION_LESS 3.0.0 )

VERSION_GREATER_EQUAL is added in Buildroot patch 0004. Why not fix it
there?

> +     find_package ( SWIG )
> +   else ()
> +     find_program ( SWIG_EXECUTABLE NAMES swig2.0 swig )
> +--
> +2.14.1
> +

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
