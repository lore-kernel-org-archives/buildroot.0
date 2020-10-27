From: Giacomo Longo <gabibbo97@gmail.com>
Date: Tue, 27 Oct 2020 16:14:07 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/uftrace: new package
In-Reply-To: <20201027103643.01576b52@windsurf.home>
References: <20201027103643.01576b52@windsurf.home>
Message-ID: <20201027151407.2870851-1-gabibbo97@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First of all, thanks Thomas for your kind words and helping me finding
my way around (this mail is my first git-send-patch).

I have tried to incorporate the feedback inside this second version of
the patch.

Here's a list of the changes I've made:

I added myself to the DEVELOPERS file.

I decided to remove the configuration options concerning TUI and
luajit, replacing them with an if inside the makefile. These are not
core functionalities and probably are not worth of an extra
configuration flag.

I removed the dependency on UTIL_LINUX that was not needed.

I have converted BR2_INSTALL_LIBSTDCPP from "selects" to "depends on".

The flags BR2_USE_WCHAR, BR2_TOOLCHAIN_HAS_THREADS coming from the
selection of BR2_PACKAGE_ELFUTILS have been included as
depends on.

Comment has been moved to the end of the file, and a dependency on the
correct architecture has been added.

The makefile has been shuffled around:

- Standard configuration options are now at the top
- Architecture configuration follows
- Optional feature flags are at the bottom

Concerning the uClibc and musl incompatibility, build fails on non-glibc with this error:

uftrace-v0.9.4/cmds/record.c:2078:19: error: ?ADDR_NO_RANDOMIZE? undeclared (first use in this function)
   if (personality(ADDR_NO_RANDOMIZE) < 0)

I have been able to find the symbol in musl at
https://git.musl-libc.org/cgit/musl/tree/include/sys/personality.h but
apparently it does not work.

The patch as it is passes ./utils/test-pkg with 45 builds, 36 skipped, 0
build failed, 0 legal-info failed and ./utils/check-package
package/uftrace/* with 62 lines processed and 0 warnings generated.

I have been able to test the package by assembling and running buildroot
on QEMU system arm emulation (target arch Cortex A7).

Thanks again for your understanding, have a nice day.
