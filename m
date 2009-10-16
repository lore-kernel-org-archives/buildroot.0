From: Marco Braga <marco.braga@gmail.com>
Date: Fri, 16 Oct 2009 17:51:40 +0200
Subject: [Buildroot] libstdc++ with external toolchain
Message-ID: <d459bb380910160851r2481b32dy3f25a9379dd2c0a6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am successfully using buildroot-2009.08 with external toolchain from
CodeSourcery, but I have a problem with the "Build/install c++
compiler and libstdc++?" option that sets BR2_INSTALL_LIBSTDCPP.
Basically the libstdc++ is not installed because buildroot expects
this to be in "lib" directory of the toolchain instead of "usr/lib"
(as is in CodeSourcery's toolchain for ARM).

I'd like to understand if this is the expected behavior or it is a bug.

Looking deeper into the issue, I've traced it to
"toolchain/external-toolchain/ext-tool.mk". If BR2_INSTALL_LIBSTDCPP
is set, then libstdc++.so is added to EXTERNAL_LIBS variable:

ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
EXTERNAL_LIBS+=libstdc++.so
endif

But then EXTERNAL_LIBS are searched only in "lib" dir and not in "usr/lib":

$(Q)for libs in $(EXTERNAL_LIBS); do \
  $(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP));
\
done

The result is tha copy_toolchain_lib_root only looks into "/lib" and
since the library is not found it is not copied.

Regards,
Marco
