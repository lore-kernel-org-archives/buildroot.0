From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:18:09 +0200
Subject: [Buildroot] [PATCH v2 2/2] toolchainfile.cmake: rework the
 Buildroot flags addition
In-Reply-To: <20161001163314.10173-2-s.martin49@gmail.com>
References: <20161001163314.10173-1-s.martin49@gmail.com>
 <20161001163314.10173-2-s.martin49@gmail.com>
Message-ID: <20161003231809.1b84ec79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Oct 2016 18:33:14 +0200, Samuel Martin wrote:

> Thus, due to these CMake specifics, the implementation should take care
> of a couple of things:
> - keeping the per-package customization of the standard CMake flags;
> - making sure the Buildroot's flags are added into the standard CMake
>   flags;
> - avoid introducing duplicates in resulting CMake flags.
> 
> So, this change introduces an helper in the toolchainfile.cmake file
> that will extend the standard CMake flags variables with the flags
> defined by Buildroot only when they are not already present (i.e. only
> the first time the toolchain file is processed by CMake when configuring
> a project).
> Then, this helper is used to extend any standard CMake flags variables.

This looks very complicated. What about not passing those
CFLAGS/CXXFLAGS at all from the toolchain file?

After all, for other packages (generic-package or autotools-package),
we are currently:

 * Passing some of the CFLAGS/CXXFLAGS hardcoded into the wrapper. This
   also applies and works well for CMake packages.

 * Passing some of the CFLAGS/CXXFLAGS in the environment, when
   configuring/building. There is no reason why this shouldn't be done
   for CMake as well.

So what about giving up on passing TARGET_CFLAGS/TARGET_CXXFLAGS in the
CMake toolchain file, and instead pass them explicitly when configuring
CMake, in the <pkg>_CONFIGURE_CMDS of pkg-cmake.mk.

Would this solve the problem without this awfully complicated CMake
toolchain file?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
