From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 13:36:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix static build
 with brotli
In-Reply-To: <20200103105706.1500629-1-fontaine.fabrice@gmail.com>
References: <20200103105706.1500629-1-fontaine.fabrice@gmail.com>
Message-ID: <20200103133658.01caf199@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 11:57:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> + cmake/modules/FindBROTLI.cmake | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/cmake/modules/FindBROTLI.cmake b/cmake/modules/FindBROTLI.cmake
> +index 4ab8dbb41c..43fb7ad11c 100644
> +--- a/cmake/modules/FindBROTLI.cmake
> ++++ b/cmake/modules/FindBROTLI.cmake
> +@@ -11,6 +11,9 @@
> + include( FindWSWinLibs )
> + FindWSWinLibs( "brotli-.*" "BROTLI_HINTS" )
> + 
> ++find_package(PkgConfig QUIET)
> ++PKG_CHECK_MODULES(PC_BROTLI QUIET libbrotlidec)
> ++
> + find_path(BROTLI_INCLUDE_DIR
> +   NAMES "brotli/decode.h"
> +   HINTS "${BROTLI_HINTS}/include"
> +@@ -28,6 +31,11 @@ if( BROTLI_FOUND )
> +   set( BROTLI_INCLUDE_DIRS ${BROTLI_INCLUDE_DIR} )
> +   set( BROTLI_LIBRARIES ${BROTLIDEC_LIBRARY} )
> + 
> ++  # Include transitive dependencies for static linking.
> ++  if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")

Testing for the .a suffix shouldn't be necessary: pkg-config will
report transitive dependency only if --static is passed, i.e only if
you're static linking.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
