From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 15 Jan 2011 14:50:18 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <20110111112228.263c00cb@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<20110107181536.53713c9a@surf> <20110110185013.331f5af1@surf>
	<AANLkTimq86Kw6oCyacEhwE+YpcQa4H8etr49hCAyNz4y@mail.gmail.com>
	<20110111112228.263c00cb@surf>
Message-ID: <AANLkTinF8S5BZw_+6kuP810=72jX=akd_KW3gpeJgnDc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sorry for the late reply.

2011/1/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 10 Jan 2011 19:30:16 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> Yes, I'll add that, thanks! I guess it only matters for the target
>> build and not native build (we don't strip HOST_DIR do we?), but I
>> think I'll add it to native build anyway, for consistency.
>
> I had another two problems with the CMake toolchain file. The first is
> that the CMAKE_C_FLAGS and CMAKE_CXX_FLAGS variables were not taken
> into account. It's more or less explained at
> http://www.mail-archive.com/cmake at cmake.org/msg33248.html why this
> happens. The second problem is that --sysroot was missing at link time,
> so I had to add CMAKE_EXE_LINKER_FLAGS as well.
>
> So I have the following changes:
>
> diff --git a/Makefile b/Makefile
> index 994dd52..b154007 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -378,8 +378,9 @@ $(O)/toolchainfile.cmake:
> ? ? ? ?set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)\n\
> ? ? ? ?set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
> ? ? ? ?set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
> - ? ? ? set(CMAKE_C_FLAGS \"$(CMAKE_TARGET_CFLAGS)\")\n\
> - ? ? ? set(CMAKE_CXX_FLAGS \"$(CMAKE_TARGET_CXXFLAGS)\")\n\
> + ? ? ? set(CMAKE_C_FLAGS \"$(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"\" FORCE)\n\
> + ? ? ? set(CMAKE_CXX_FLAGS \"$(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"\" FORCE)\n\
> + ? ? ? set(CMAKE_EXE_LINKER_FLAGS \"$(CMAKE_TARGET_LDFLAGS)\" CACHE STRING \"\" FORCE)\n\
> ? ? ? ?set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
> ? ? ? ?set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> ? ? ? ?set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
> diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
> index 08a0395..ce50b10 100644
> --- a/package/Makefile.cmake.in
> +++ b/package/Makefile.cmake.in
> @@ -41,6 +41,7 @@ CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
> ?CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
> ?CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
> ?CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
> +CMAKE_TARGET_LDFLAGS = $(filter --sysroot=%,$(TARGET_LD)) $(TARGET_LDFLAGS)

The FORCE stuff seems like a good idea, thanks!

Hm... I've been thinking about --sysroot, -I and -L flags in the
toolchain-file lately. AFAIK, any CMake package should be able to
build perfectly without manually specifying these flags. Actually, I
would go so far as saying that passing -I, -L (or --sysroot) may hide
bugs in CMakeLists.txt files because a package should use FIND_XXX()
macros and not depend on -I, -L or --sysroot.

However, my impression is that not all CMake packages are looking for
headers and libs using FIND_XXX() and actually relies on -I, -L flags
(or built-in compiler config) to build. Thus, it may be easier to add
these flags to the CMake infrastructure than to fix the packages. But I
think it is a bit of a hack/workaround...

CMAKE_C_FLAGS is a bit special because it includes not only (unneeded)
-I flags, but some important flags such as the -march flag. So we at
least need some way to get -march into the compiler line and using the whole
TARGET_CFLAGS is an easy way to do that. CMAKE_EXE_LINKER_FLAGS
is just -L flags, so this is IMO just a workaround broken packages...

There is also the possibility to pass CMAKE_EXE_LINKER_FLAGS as
<PKG>_CONF_OPT in each broken package.

What do you think?

Best regards,
Bj?rn Forsman
