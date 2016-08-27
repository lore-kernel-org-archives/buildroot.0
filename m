From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 09:22:07 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: add patch to fix LTO support
In-Reply-To: <20160826213442.19246-1-arnout@mind.be>
References: <20160826213442.19246-1-arnout@mind.be>
Message-ID: <20160827092207.17b2bf79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 23:34:42 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The LTO support in the kmsxx package uses the host gcc-ar and gcc-ranlib
> instead of the ones from the cross-toolchain. Add a patch that tries to
> find the right one based on CMAKE_C_COMPILER.

Thanks for this patch! One quick question though.

> +     if (HAS_LTO_FLAG)
> +-        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
> +-        set(CMAKE_AR gcc-ar)
> +-        set(CMAKE_RANLIB gcc-ranlib)
> ++        find_program(LTO_AR NAMES "${CMAKE_C_COMPILER}-ar" gcc-ar)
> ++        find_program(LTO_RANLIB NAMES "${CMAKE_C_COMPILER}-ranlib" /usr/bin/gcc-ranlib)

Why is the last attempted value for AR "gcc-ar", and for RANLIB it's
"/usr/bin/gcc-ranlib" ? I.e while just the program name in one case,
and a full path in the other case.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
