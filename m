From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 16 Feb 2012 09:59:16 +0100
Subject: [Buildroot] [PATCH 1/1] toolchainfile.cmake: fix lifetime
In-Reply-To: <1329382425-2288-1-git-send-email-s.martin49@gmail.com>
References: <1329382425-2288-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMMLsaGQqK6cwB2QW_YziSdmTJz8kv9aC3zRgJr8=NjQCrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Note that another way to correctly mange the lifetime of the
toolchainfile.cmake file could be to store it in the TOOLCHAIN_DIR.

Regards,

Sam

2012/2/16 Samuel Martin <s.martin49@gmail.com>:
> This file must be consistent with the toolchain, so manage it lifetime
> in the same way of the toolchain directory.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
> ?Makefile ? ? ? ? ? ? ? ? ?| ? 10 ++++++----
> ?package/Makefile.cmake.in | ? ?2 +-
> ?2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 7d8dd2e..927925c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,7 +1,7 @@
> ?# Makefile for buildroot2
> ?#
> ?# Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
> -# Copyright (C) 2006-2011 by the Buildroot developers <buildroot@uclibc.org>
> +# Copyright (C) 2006-2012 by the Buildroot developers <buildroot@uclibc.org>
> ?#
> ?# This program is free software; you can redistribute it and/or modify
> ?# it under the terms of the GNU General Public License as published by
> @@ -282,6 +282,7 @@ STAMP_DIR:=$(BASE_DIR)/stamps
> ?BINARIES_DIR:=$(BASE_DIR)/images
> ?TARGET_DIR:=$(BASE_DIR)/target
> ?TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
> +CMAKE_TOOLCHAIN_FILE=$(BASE_DIR)/toolchainfile.cmake
> ?TARGET_SKELETON=$(TOPDIR)/fs/skeleton
>
> ?ifeq ($(BR2_CCACHE),y)
> @@ -368,7 +369,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
> ?dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> ? ? ? ?$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
>
> -$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
> +$(BASE_TARGETS): dirs $(CMAKE_TOOLCHAIN_FILE)
>
> ?$(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
> ? ? ? ?$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
> @@ -377,7 +378,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
> ?world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
>
> -$(O)/toolchainfile.cmake:
> +$(CMAKE_TOOLCHAIN_FILE):
> ? ? ? ?@echo -en "\
> ? ? ? ?set(CMAKE_SYSTEM_NAME Linux)\n\
> ? ? ? ?set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
> @@ -626,7 +627,8 @@ endif
>
> ?clean:
> ? ? ? ?rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
> - ? ? ? ? ? ? ? $(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
> + ? ? ? ? ? ? ? $(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(CMAKE_TOOLCHAIN_FILE) \
> + ? ? ? ? ? ? ? $(BASE_DIR)/staging
>
> ?distclean: clean
> ?ifeq ($(DL_DIR),$(TOPDIR)/dl)
> diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
> index 38e459b..8a81c3b 100644
> --- a/package/Makefile.cmake.in
> +++ b/package/Makefile.cmake.in
> @@ -72,7 +72,7 @@ define $(2)_CONFIGURE_CMDS
> ? ? ? ?(cd $$($$(PKG)_BUILDDIR) && \
> ? ? ? ?rm -f CMakeCache.txt && \
> ? ? ? ?$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> - ? ? ? ? ? ? ? -DCMAKE_TOOLCHAIN_FILE="$$(BASE_DIR)/toolchainfile.cmake" \
> + ? ? ? ? ? ? ? -DCMAKE_TOOLCHAIN_FILE="$$(CMAKE_TOOLCHAIN_FILE)" \
> ? ? ? ? ? ? ? ?-DCMAKE_INSTALL_PREFIX="/usr" \
> ? ? ? ? ? ? ? ?$$($$(PKG)_CONF_OPT) \
> ? ? ? ?)
> --
> 1.7.9.1
>
