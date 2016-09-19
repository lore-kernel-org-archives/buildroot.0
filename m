From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 07:23:48 +0200
Subject: [Buildroot] [PATCH 1/2] Openjpeg: Add patch to enable finding
 pthreads library by default
In-Reply-To: <1474232179-19811-2-git-send-email-olivier.schonken@gmail.com>
References: <1474232179-19811-1-git-send-email-olivier.schonken@gmail.com>
 <1474232179-19811-2-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160919072348.0a715f61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Sep 2016 22:56:18 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

Missing commit log and autobuilder reference.

> diff --git a/package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch b/package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch
> new file mode 100644
> index 0000000..c31ad06
> --- /dev/null
> +++ b/package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch
> @@ -0,0 +1,49 @@
> +From 0465bc4be814f01073cd31bbd6ad1f3a87a599c1 Mon Sep 17 00:00:00 2001
> +From: Olivier Schonken <olivier.schonken@gmail.com>
> +Date: Sun, 18 Sep 2016 22:23:06 +0200
> +Subject: [PATCH] Modify CmakeLists to include finding of pthreads by default
> +
> +Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> +---
> + CMakeLists.txt             | 8 ++++----
> + src/bin/jp2/CMakeLists.txt | 2 +-
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 229da1e..66cf631 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -219,13 +219,13 @@ OPJ_TEST_LARGE_FILES(OPJ_HAVE_LARGEFILES)
> + 
> + #-----------------------------------------------------------------------------
> + # Build Library
> ++find_package(Threads REQUIRED)
> ++if(NOT CMAKE_USE_PTHREADS_INIT)
> ++  message(FATAL_ERROR "Only pthread are supported")
> ++endif()
> + if(BUILD_JPIP_SERVER)
> +   find_package(CURL REQUIRED)
> +   find_package(FCGI REQUIRED)
> +-  find_package(Threads REQUIRED)
> +-  if(NOT CMAKE_USE_PTHREADS_INIT)
> +-    message(FATAL_ERROR "Only pthread are supported")
> +-  endif()
> + endif()
> + add_subdirectory(src/lib)

While I agree that this will work around the build issue
http://autobuild.buildroot.net/results/2ca/2ca3e1b0eaadaf0cf5bf2fde756163ac5786a21c/build-end.log,
it is not really the proper solution.

The problem here is that lcms2 uses pthread, but the pkg-config file
installed by lcms2 doesn't take this into account.

So the proper fix is to change the lcms2.pc file so that it includes
-lpthread in Libs.private. Could you have a look at doing this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
