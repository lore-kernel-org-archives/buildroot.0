From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2014 01:40:35 +0200
Subject: [Buildroot] [PATCH] support/check-kernel-headers: fix old
	custom toolchains without -print-sysroot
In-Reply-To: <1396894752-21040-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 7 Apr 2014 20:19:12 +0200")
References: <1396894752-21040-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ioqj8k5o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Old toolchains, with old gcc that do not support -print-sysroot, break the
 > kernel-headers version check script: it fails to find the sysroot of the
 > toolchain, and thus ends up including the host's linux/version.h.

 > Most of the time, this will break early, since the host's kernel headers
 > will not match the toolchain settings.

 > But it can happen that the check is succesful, although the configuration
 > of the toolchain is wrong:

 >   - the custom toolchain has kernel headers vX.Y
 >   - the user selected vX.Z  (Z!=Y)
 >   - the host has headers vX.Y

 > In this case, the check passes OK, but the build of some packages later on
 > will break (which is exactly what those _AT_LEAST_XXX options were added to
 > avoid).

 > Fix that by passing the sysroot to the check script, instead of the cross
 > compiler.

 > We get the sysroot as thus:

 >   - for custom toolchains, we use the macro toolchain_find_sysroot. We can
 >     do that, because we already have a complete sysroot with libc.a at that
 >     time.

 >   - for internal toolchain using a custom kernel headers version, we just
 >     use $(STAGING_DIR). We can't use the macro as for custom toolchains
 >     above, because at the time we isntall the kernel headers, we do not yet

s/isntall/install/

Committed, thanks.

-- 
Bye, Peter Korsgaard
