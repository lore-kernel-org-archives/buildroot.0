From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 23:18:52 +0200
Subject: [Buildroot] [PATCH] graphite2: new package
In-Reply-To: <1443105369-30869-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1443105369-30869-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20150927231852.11920474@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Thu, 24 Sep 2015 11:36:09 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

I've applied your patch after some minor tweaks:

    [Thomas:
     - tweak description of the patch
     - turn the doc/test removal hook as a post patch hook rather than a
       pre-configure hook.]

However, I have a few suggestions below.


> +diff -Nura graphite2-1.3.3.orig/src/CMakeLists.txt graphite2-1.3.3/src/CMakeLists.txt
> +--- graphite2-1.3.3.orig/src/CMakeLists.txt	2015-09-24 10:06:28.877851596 -0300
> ++++ graphite2-1.3.3/src/CMakeLists.txt	2015-09-24 10:06:48.201519767 -0300
> +@@ -111,9 +111,6 @@
> +         COMPILE_FLAGS   "-Wall -Wextra -Wno-unknown-pragmas -Wendif-labels -Wshadow -Wctor-dtor-privacy -Wnon-virtual-dtor -fno-rtti -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -fno-stack-protector"
> +         LINK_FLAGS      "-nodefaultlibs ${GRAPHITE_LINK_FLAGS}" 
> +         LINKER_LANGUAGE C)
> +-    if (CMAKE_COMPILER_IS_GNUCXX)
> +-        add_definitions(-Wdouble-promotion)
> +-    endif (CMAKE_COMPILER_IS_GNUCXX)

Isn't it possible with CMake to test if the compiler supports a certain
option, and if it does, use it? It would be nicer than this patch, and
would be upstreamable.


> +# Avoid building docs and tests to save time
> +define GRAPHITE2_DISABLE_TESTS_DOC
> +	$(SED) '/^add_subdirectory(doc)/d' \
> +		-e '/^add_subdirectory(tests)/d' \
> +		-e '/add_subdirectory(gr2fonttest)/d' \
> +		$(@D)/CMakeLists.txt
> +endef
> +GRAPHITE2_PRE_CONFIGURE_HOOKS += GRAPHITE2_DISABLE_TESTS_DOC

What about submitting an upstream patch (upstream seems active, 1.3.3
was released 5 days ago) that uses the BUILD_DOCS and BUILD_TESTS
variables, which are somewhat standard in many CMake packages ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
