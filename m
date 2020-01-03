From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 15:23:08 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: fix static build with brotli
In-Reply-To: <20200103134821.1505736-1-fontaine.fabrice@gmail.com>
References: <20200103134821.1505736-1-fontaine.fabrice@gmail.com>
Message-ID: <20200103152308.5a27124c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for your new iteration!

On Fri,  3 Jan 2020 14:48:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ++find_package(PkgConfig QUIET)
> ++PKG_CHECK_MODULES(PC_BROTLI QUIET libbrotlidec)
> ++
> + find_path(BROTLI_INCLUDE_DIR
> +   NAMES "brotli/decode.h"
> +   HINTS "${BROTLI_HINTS}/include"
> +@@ -28,6 +31,10 @@ if( BROTLI_FOUND )
> +   set( BROTLI_INCLUDE_DIRS ${BROTLI_INCLUDE_DIR} )
> +   set( BROTLI_LIBRARIES ${BROTLIDEC_LIBRARY} )
> + 
> ++  if(UNIX)
> ++    list(APPEND BROTLI_LIBRARIES ${PC_BROTLI_LIBRARIES})
> ++  endif()

I'm not sure the UNIX condition is needed.

Also, if pkg-config is available, I guess you could simply set
BROTLI_INCLUDE_DIRS and BROTLI_LIBRARIES from the results given by
pkg-config.

Ah, but looking at cmake/modules/FindLibXml2.cmake, I see that this is
where you took the:

    # Include transitive dependencies for static linking.
    if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")
        list(APPEND LIBXML2_LIBRARIES ${PC_LIBXML_LIBRARIES})
    endif()

logic.

So, I'm not sure what Wireshark upstream wants to do. It's probably
best to work with them directly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
