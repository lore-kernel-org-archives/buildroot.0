From: hartleys <hartleys@visionengravers.com>
Date: Wed, 13 Aug 2008 21:29:30 -0400
Subject: [Buildroot] Problem compiling c++ files
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190966BEED@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190966BEED@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190966BEF4@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 13, 2008 5:49 PM, hartleys wrote:
> Hello all,
>
> I'm not sure if this is a buildroot problem or something with
> automake. Hopefully someone can help.
>
> I'm trying to cross-compile a c++ program under buildroot with
> an external toolchain. For some reason the ./configure output
> does not set the CXX and CXXCPP variables with the full path to
> the executables. Then during the make step I get the following
> error:

<SNIP>

I think I found the problem but I'm not sure where to fix it...

Toward the end of package/Makefile.in there is this setting:

ifneq ($(BR2_GCC_CROSS_CXX),y)
TARGET_CONFIGURE_OPTS+=CXX=""
endif

I think that's what's mucking up automake. As far as I can tell
BR2_GCC_CROSS_CXX is only set in toolchain/gcc/Config.in. Walking thru
the various configs I get.

1) I'm using an external binary toolchain (BR2_TOOLCHAIN_EXTERNAL=y from
toolchain/Config.in).
   This results in BR2_TOOLCHAIN_SOURCE=n (same file).
2) When toolchain/Config.in.2 then gets processed the whole file gets
skipped except for the source "toolchain/kernel-headers/Config.in" at
the beginning.
   This results in toolchain/gcc/Config.in getting skipped.

If I add the following to toolchain/external-toolchain/Config.in the
build works fine.

config BR2_GCC_CROSS_CXX
	bool "C++ cross-compiler support"
	help
	  Enable C++ cross-compiler support.

I'm just not sure if this is the correct approach.

Thanks,
Hartley
