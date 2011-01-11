From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jan 2011 11:22:28 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTimq86Kw6oCyacEhwE+YpcQa4H8etr49hCAyNz4y@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<20110107181536.53713c9a@surf> <20110110185013.331f5af1@surf>
	<AANLkTimq86Kw6oCyacEhwE+YpcQa4H8etr49hCAyNz4y@mail.gmail.com>
Message-ID: <20110111112228.263c00cb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jan 2011 19:30:16 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> Yes, I'll add that, thanks! I guess it only matters for the target
> build and not native build (we don't strip HOST_DIR do we?), but I
> think I'll add it to native build anyway, for consistency.

I had another two problems with the CMake toolchain file. The first is
that the CMAKE_C_FLAGS and CMAKE_CXX_FLAGS variables were not taken
into account. It's more or less explained at
http://www.mail-archive.com/cmake at cmake.org/msg33248.html why this
happens. The second problem is that --sysroot was missing at link time,
so I had to add CMAKE_EXE_LINKER_FLAGS as well.

So I have the following changes:

diff --git a/Makefile b/Makefile
index 994dd52..b154007 100644
--- a/Makefile
+++ b/Makefile
@@ -378,8 +378,9 @@ $(O)/toolchainfile.cmake:
        set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)\n\
        set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
        set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
-       set(CMAKE_C_FLAGS \"$(CMAKE_TARGET_CFLAGS)\")\n\
-       set(CMAKE_CXX_FLAGS \"$(CMAKE_TARGET_CXXFLAGS)\")\n\
+       set(CMAKE_C_FLAGS \"$(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"\" FORCE)\n\
+       set(CMAKE_CXX_FLAGS \"$(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"\" FORCE)\n\
+       set(CMAKE_EXE_LINKER_FLAGS \"$(CMAKE_TARGET_LDFLAGS)\" CACHE STRING \"\" FORCE)\n\
        set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
index 08a0395..ce50b10 100644
--- a/package/Makefile.cmake.in
+++ b/package/Makefile.cmake.in
@@ -41,6 +41,7 @@ CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
 CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
 CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
 CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
+CMAKE_TARGET_LDFLAGS = $(filter --sysroot=%,$(TARGET_LD)) $(TARGET_LDFLAGS)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
