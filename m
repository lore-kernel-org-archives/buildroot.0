From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Dec 2010 23:27:59 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTi=R7C0yXPepZWz=Pj=-Vc2B62-qBPZ6L-GkjBpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bj?rn,

Again, this reviews may refer to the other patch reviews of the set...

+$(O)/toolchainfile.cmake:

+       @echo -en "\

+       set(CMAKE_SYSTEM_NAME Linux)\n\

+       set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\

+       set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\

In my version (not submitted), i also set the following
variables: CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH

+       set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\

+       set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\

Here is the main point of disagreement. Because in BR the cross-compiler and
all tools around are located somewhere in a subdirectory of $(STAGING_DIR),
i do set CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to "ONLY".


> +       set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\

+       set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\

+       " > $@



The generated toolchain file does not seem to support external
 cross-toolchain (btw, from my understanding, CTNG is installed in the
staging, so no problem)
To do that, I think CMAKE_FIND_ROOT_PATH is a list (so are
CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH), so adjust them, CMAKE_C_COMPILER
and CMAKE_CXX_COMPILER.


Regards,

Samuel

2010/12/12 Bj?rn Forsman <bjorn.forsman@gmail.com>

> A CMake toolchain file makes it easy to develop CMake-based packages
> outside of Buildroot. Just give the toolchain file path to CMake via the
> -DCMAKE_TOOLCHAIN_FILE=... option.
>
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  Makefile |   12 +++++++++++-
>  1 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 7d6e4af..0cf49d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -358,7 +358,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
>  dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR)
> \
>        $(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
>
> -$(BASE_TARGETS): dirs
> +$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
>
>  $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
>        $(MAKE) $(EXTRAMAKEARGS) silentoldconfig
> @@ -367,6 +367,16 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
>  world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
>
> +$(O)/toolchainfile.cmake:
> +       @echo -en "\
> +       set(CMAKE_SYSTEM_NAME Linux)\n\
> +       set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
> +       set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
> +       set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
> +       set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> +       set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
> +       set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
> +       " > $@
>
>  .PHONY: all world dirs clean distclean source outputmakefile \
>        $(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
> --
> 1.7.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/9964ef11/attachment.html>
