From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Aug 2016 22:07:18 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with uClibc
In-Reply-To: <1472144466-17003-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1472144466-17003-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <CAHXCMMKcwoCKAMdiyKJ4P7x5-rHk=52CiwcHw0=+RhuW9+RP3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rahul, all,

On Thu, Aug 25, 2016 at 7:01 PM, Rahul Bedarkar
<rahul.bedarkar@imgtec.com> wrote:
> domoticz.cpp currently assumes that on GNU/Linux systems header
> <execinfo.h> is available. But that is not true. Since it provided by
> C library and uClibc can be built without backtrace support. And in
> such cases we get following build error.
>
>   domoticz-3.4834/main/domoticz.cpp:48:22: fatal error: execinfo.h: No such file or directory
>    #include <execinfo.h>
>                         ^
>   compilation terminated.
>
> This commit adds patch for detecting presence of <execinfo.h>
> and guards code accordingly.
>
> Fixes:
>
>   http://autobuild.buildroot.net/results/393/393f839e160b51ca12ac36058718ad2f0c1b50a6/
>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...per-check-for-detecting-header-execinfo.h.patch | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
>
> diff --git a/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch b/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
> new file mode 100644
> index 0000000..2e07abe
> --- /dev/null
> +++ b/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
> @@ -0,0 +1,61 @@
> +From 5409696dfcbb05d6e4e67e74c97487b1987639e1 Mon Sep 17 00:00:00 2001
> +From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> +Date: Thu, 25 Aug 2016 17:23:38 +0530
> +Subject: [PATCH 1/1] add proper check for detecting header <execinfo.h>
> +
> +domoticz.cpp currently assumes that on GNU/Linux systems header
> +<execinfo.h> is available. But that is not true. Since it provided by
> +C library and uClibc can be built without backtrace support. And in
> +such cases we get following build error.
> +
> +  domoticz-3.4834/main/domoticz.cpp:48:22: fatal error: execinfo.h: No such file or directory
> +   #include <execinfo.h>
> +                        ^
> +  compilation terminated.
> +
> +Instead of depending on __gnu_linux__, add check for detecting
> +presence of <execinfo.h> and guard code for dumpstack accordingly.
> +
> +This build failure is detected by Buildroot autobuilder.
> +http://autobuild.buildroot.net/results/393/393f839e160b51ca12ac36058718ad2f0c1b50a6/
> +
> +Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> +---
> + CMakeLists.txt    | 7 +++++++
> + main/domoticz.cpp | 2 +-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d3113f4..ef32f7b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -61,6 +61,13 @@ SET(EXECUTABLE_OUTPUT_PATH "" CACHE INTERNAL
> +   "Where to put the executables for Domoticz"
> +   )
> +
> ++INCLUDE(CheckIncludeFiles)
> ++CHECK_INCLUDE_FILES (execinfo.h HAVE_EXECINFO_H)

Since only 1 header is checked, CHECK_INCLUDE_FILE (from the
CheckIncludeFile module) could be used.
But this is nitpicking ;)

> ++
> ++IF(HAVE_EXECINFO_H)
> ++  ADD_DEFINITIONS(-DHAVE_EXECINFO_H)
> ++ENDIF(HAVE_EXECINFO_H)
> ++
> + #set(CMAKE_EXE_LINKER_FLAGS "-static")
> +
> + # Macro for setting up precompiled headers. Usage:
> +diff --git a/main/domoticz.cpp b/main/domoticz.cpp
> +index 69d2ef6..c52e5ac 100644
> +--- a/main/domoticz.cpp
> ++++ b/main/domoticz.cpp
> +@@ -44,7 +44,7 @@
> +       #include <string.h>
> + #endif
> +
> +-#ifdef __gnu_linux__
> ++#ifdef HAVE_EXECINFO_H
> + #include <execinfo.h>
> + static void dumpstack(void) {
> +       // Notes :
> +--
> +2.6.2
> +
> --
> 2.6.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

BTW, it'd be great to submit upstream this patch.

Regards,

-- 
Samuel
