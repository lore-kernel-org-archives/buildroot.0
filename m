From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 18 Dec 2009 18:55:13 +0000 (UTC)
Subject: [Buildroot] How to use external toolchain that requires --sysroot ?
Message-ID: <hggj6h$b5r$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to use an external toolchain (it happens to have
been built by buildroot, but I don't think that matters).

If it is to find library files, the external toolchain requires
that it be passed the --sysroot option.  For example:

  BTEP=$(BR2_TOOLCHAIN_EXTERNAL_PATH)
  
  $(BTEP)/bin/arm-liux-gcc --sysroot=$(BTEP)/.. -print-file-name=libc.so

If buildroot would go ahead and copy it into staging and then
pass it an appropriate --sysroot, the toolchain would work
fine.  However the external toolchain checks in
toolchain/external-toolchain/ext-tool.mk are failing with the
message:

   Checking external toolchain settings
   Incorrect selection of the C library

This is happens because there is no way to specify that the
external toolchain needs a --sysroot option if it is to be
executed where it's at.

I'd like to be able to have developers all use the same
pre-compiled toolchain.  However, I think it's impractical to
expect the external toolchain to always be located in the same
absolute path on the various developer machines.  Requiring
that be so makes it difficult to deal with a variety of
situations:
  
  * You might want to be able to switch back and forth between
    different toolchains.  Building the toolchains with unique
    install paths is painful.

  * Developers want to be able to do development in "isolated"
    non-system directories without having to put the external
    toolchain in a global, hard-wired location -- a location
    that might be in use by a different project for a different
    version/flavor of the toolchain.

I've looked briefly through ext-tool.mk, and it doesn't look
like it would be too difficult to support optionally passing a
sysroot value (perhaps with a default value of "$(BR2_TOOLCHAIN_EXTERNAL_PATH)/..")
to the external toolchain during the checking and importing
steps.

Would such a patch be looked upon favorably?

Or is there already a way to do what I'm trying to do?
  
-- 
Grant Edwards                   grante             Yow! I'm encased in the
                                  at               lining of a pure pork
                               visi.com            sausage!!
