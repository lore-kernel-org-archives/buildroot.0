From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jun 2018 13:40:58 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: Fix ld.so copying for
 multilib toolchains.
In-Reply-To: <20180629113339.59102-1-christoph.muellner@theobroma-systems.com>
References: <20180629113339.59102-1-christoph.muellner@theobroma-systems.com>
Message-ID: <20180629134058.2fde536c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christoph,

Thanks for this contribution!

On Fri, 29 Jun 2018 13:33:39 +0200, Christoph Muellner wrote:
> Multilib toolchains can have more than one ld.so files in lib/.
> Typically one for each lib* directory.
> However the current copy_toolchain_sysroot implemenation does
> not support more than one ld.so.
> 
> This patch addresses this by iterating over all ld.so files
> in the lib/ directory and choose the one, which has a symlink
> into $ARCH_LIB_DIR/.
> 
> An example is a multilib toolchain for aarch64 (LP64 and ILP32),
> which includes the following entries in lib/:
> 
> $ ls -l lib/
> lrwxrwxrwx 1 user group ld-linux-aarch64_ilp32.so.1 -> ../libilp32/ld-2.27.so
> lrwxrwxrwx 1 user group ld-linux-aarch64.so.1 -> ../lib64/ld-2.27.so
> 
> $ARCH_LIB_DIR/ will be detected as lib64.
> Without the patch no ld.so will be copied.
> With the patch the second ld.so (the one for LP64) will be copied.
> 
> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>

Is it possible to access the problematic toolchain ?

It would be useful to understand better the problem, and potentially
add some test cases to verify that future changes in the external
toolchain logic does not break this special situation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
