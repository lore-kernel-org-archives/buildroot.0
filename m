From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Nov 2016 09:57:06 +0100
Subject: [Buildroot] [PATCH] taskd: add patch for correct gnutls
 libraries in static build
In-Reply-To: <20161120230217.13881-1-arnout@mind.be>
References: <20161120230217.13881-1-arnout@mind.be>
Message-ID: <4cf78572-55e4-78ad-c622-2fad9d842d6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-16 00:02, Arnout Vandecappelle (Essensium/Mind) wrote:
> The CMakeLists.txt was using the wrong variables names to add to
> includes and libs, so the additional libraries for static build
> weren't added to the link command.
> 
> Patch sent upstream to taskwarrior-dev at googlegroups.com but it doesn't
> seem to be very active.

 Well, turns out that they _are_ active, I got feedback immediately and the
patch got rejected. The problem is not in taskd, but in CMake itself.

 FindGnuTLS.cmake does the following:

if (NOT WIN32)
   # try using pkg-config to get the directories and then use these values
   # in the find_path() and find_library() calls
   # also fills in GNUTLS_DEFINITIONS, although that isn't normally useful
   find_package(PkgConfig QUIET)
   PKG_CHECK_MODULES(PC_GNUTLS QUIET gnutls)
   set(GNUTLS_DEFINITIONS ${PC_GNUTLS_CFLAGS_OTHER})
   set(GNUTLS_VERSION_STRING ${PC_GNUTLS_VERSION})
endif ()

find_path(GNUTLS_INCLUDE_DIR gnutls/gnutls.h
   HINTS
   ${PC_GNUTLS_INCLUDEDIR}
   ${PC_GNUTLS_INCLUDE_DIRS}
   )

find_library(GNUTLS_LIBRARY NAMES gnutls libgnutls
   HINTS
   ${PC_GNUTLS_LIBDIR}
   ${PC_GNUTLS_LIBRARY_DIRS}
   )


 Since it is using find_path and find_library, it basically destroys all
information coming from pkg-config and keeps only the gnutls paths and libs.

 It looks like cmake does this in most bundled modules, so I guess we have to
take it with upstream CMake to see what's going on.

 Samuel, any feedback from you?

 For now, I think it's better to accept this patch however. We can revert it
when the fundamental problem in CMake has been resolved.

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/d01e947fa807336ffcfd0fad27397af8e7442833
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...se-correct-variables-for-GnuTLS-detection.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
> 
> diff --git a/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch b/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
> new file mode 100644
> index 0000000..f2365ea
> --- /dev/null
> +++ b/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
> @@ -0,0 +1,32 @@
> +From 88fee5c6eb2271d3de6b9878cd29a0494999aa18 Mon Sep 17 00:00:00 2001
> +From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> +Date: Sun, 20 Nov 2016 23:46:45 +0100
> +Subject: [PATCH] Use correct variables for GnuTLS detection
> +
> +At least with recent CMake, it seems the variables created by
> +find_package (GnuTLS) are called PC_GNUTLS_INCLUDE_DIRS and
> +PC_GNUTLS_LIBRARIES.
> +
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> +---
> + CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d8125d9..ccf827b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -110,8 +110,8 @@ message ("-- Looking for GnuTLS")
> + find_package (GnuTLS REQUIRED)
> + if (GNUTLS_FOUND)
> +   set (HAVE_LIBGNUTLS true)
> +-  set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${GNUTLS_INCLUDE_DIR})
> +-  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${GNUTLS_LIBRARIES})
> ++  set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${PC_GNUTLS_INCLUDE_DIRS})
> ++  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${PC_GNUTLS_LIBRARIES})
> + endif (GNUTLS_FOUND)
> + 
> + message ("-- Looking for libuuid")
> +-- 
> +2.10.2
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
