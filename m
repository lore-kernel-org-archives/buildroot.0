From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 3 Jul 2016 18:51:18 +0200
Subject: [Buildroot] [PATCH v2 1/1] taskd: support linking against
 static gnutls and uuid
In-Reply-To: <20160622021946.30144-1-mathstuf@gmail.com>
References: <20160617020836.9765-1-mathstuf@gmail.com>
 <20160622021946.30144-1-mathstuf@gmail.com>
Message-ID: <CAHXCMMLNt6bBoyxMTRLZaFx2CYU1xpqtR9=DWY0D_Q=eveVtCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben, all,

On Wed, Jun 22, 2016 at 4:19 AM, Ben Boeckel <mathstuf@gmail.com> wrote:
> The FindGnuTLS module shipped with CMake does not expose the information
> required for proper linking if it is a static library.
>
> Similarly, the code which searches for the uuid library is insufficient
> for such a task.
>
> Also, find_package(Threads) was missing, so pthreads was not properly
> linked.
>
> Do not send this patch to taskwarrior upstream; it is not a proper fix.
>
I would have done 2 distinct patches, one for pthread since it may be
not-static-build specific (though it could be triggered more easily on
static-build), and a second one fixing the missing dependencies for
gnutls and uuid in case of static-build.

> Fixes:
> http://autobuild.buildroot.net/results/67f574af0cc4348ffe2bce026c44766e49c29124/
>
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> ---
> Changes v1 -> v2:
>   - renamed patch to be 0002- for unambiguous application order
>   - added SoB to taskd patch (with admonition that it is a hack) (via Baruch)
> ---
>  ...ix-linking-against-deps-statically-on-arc.patch | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/taskd/0002-buildroot-fix-linking-against-deps-statically-on-arc.patch
>
> diff --git a/package/taskd/0002-buildroot-fix-linking-against-deps-statically-on-arc.patch b/package/taskd/0002-buildroot-fix-linking-against-deps-statically-on-arc.patch
> new file mode 100644
> index 0000000..6983f37
> --- /dev/null
> +++ b/package/taskd/0002-buildroot-fix-linking-against-deps-statically-on-arc.patch
> @@ -0,0 +1,53 @@
> +From b916016eaf3a3bdb555de11610c0b7964d52da96 Mon Sep 17 00:00:00 2001
> +From: Ben Boeckel <mathstuf@gmail.com>
> +Date: Thu, 16 Jun 2016 21:58:47 -0400
> +Subject: [PATCH] buildroot: fix linking against deps statically on arc
> +
> +Also find the Threads package so that CMAKE_THREAD_LIBS_INIT is actually
> +set.
> +
> +Do not send upstream; it is a hack.
> +
> +Signed-off-by:: Ben Boeckel <mathstuf@gmail.com>
> +---
> + CMakeLists.txt     | 4 ++--
> + src/CMakeLists.txt | 1 +
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 9a049b0..09f3209 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -49,7 +49,7 @@ find_package (GnuTLS REQUIRED)
> + if (GNUTLS_FOUND)
> +   set (HAVE_LIBGNUTLS true)
> +   set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${GNUTLS_INCLUDE_DIR})
> +-  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${GNUTLS_LIBRARIES})
> ++  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${PC_GNUTLS_STATIC_LIBRARIES})
This fortunately works because FindGnuTLS.cmake provided by CMake use
pkg_check_modules on non-windows platform to find GNU-TLS [1], but
this is a bit... hackish.
A cleaner way would be to explicitly (re-)call pkg_check_modules in
this if-block.

> + endif (GNUTLS_FOUND)
> +
> + check_function_exists (timegm          HAVE_TIMEGM)
> +@@ -68,7 +68,7 @@ else (DARWIN OR FREEBSD OR OPENBSD)
> +   find_library (UUID_LIBRARY NAMES uuid)
> +   if (UUID_INCLUDE_DIR AND UUID_LIBRARY)
> +     set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${UUID_INCLUDE_DIR})
> +-    set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${UUID_LIBRARY})
> ++    set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${UUID_LIBRARY} -lintl)
Here, I think the right fix would be using pkg_check_modules for uuid,
then use the _STATIC_LIBRARIES variable to fill TASKD_LIBRARIES.

> +     # Look for uuid_unparse_lower
> +     set (CMAKE_REQUIRED_INCLUDES  ${CMAKE_REQUIRED_INCLUDES}  ${UUID_INCLUDE_DIR})
> +     set (CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${UUID_LIBRARY})
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 5820392..243b0f9 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -35,6 +35,7 @@ add_library (taskd admin.cpp
> +                    util.cpp       util.h
> +                    wcwidth6.cpp)
> +
> ++find_package(Threads REQUIRED)
It seems taskd can not depend on threads [2,3].
So, if Threads is actually mandatory, I'd prefer the REQUIRED flag to
be added to [2], otherwise figure out exactly what happens (check with
upstream).

> + add_executable (taskd_executable taskd.cpp)
> + target_link_libraries (taskd_executable taskd ${TASKD_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
> + set_property (TARGET taskd_executable PROPERTY OUTPUT_NAME "taskd")
> +--
> +2.9.0
> +
> --
> 2.9.0
>
[1] https://github.com/Kitware/CMake/blob/master/Modules/FindGnuTLS.cmake#L42
[2] https://github.com/taskwarrior/taskd/blob/s1.1.0/CMakeLists.txt#L62
[3] https://github.com/taskwarrior/taskd/blob/s1.1.0/src/Thread.h#L31

Regards,

-- 
Samuel
