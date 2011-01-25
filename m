From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 00:21:13 +0100
Subject: [Buildroot] [PATCH v2 1/4] Makefile: generate CMake
 toolchain-file in $(O)
In-Reply-To: <1295124808-5649-2-git-send-email-bjorn.forsman@gmail.com>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
	<1295124808-5649-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20110126002113.51aeb0f0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bjorn,

On Sat, 15 Jan 2011 21:53:25 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> +	set(CMAKE_SYSTEM_NAME Linux)\n\
> +	set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
> +	set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
> +	set(CMAKE_C_FLAGS \"${CMAKE_C_FLAGS} $(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
> +	set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} $(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
> +	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
> +	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
> +	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
> +	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> +	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
> +	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
> +	" > $@

Could you also add:

+       set(ENV{PKG_CONFIG_SYSROOT_DIR} $(STAGING_DIR))\n\

This is needed to get CMake pkg-config module to work properly.

I am not entirely happy with the name/location of the CMake toolchain
file, but that's something we can sort out later.

I have tested your patchset with my qserialport library (that uses
CMake as its build system and relies on Qt) and my custom application
(that uses CMake, Qt and qserialport), and it worked fine with  the
PKG_CONFIG_SYSROOT_DIR change mentionned above.

So, once this change is done, your patch gets my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
