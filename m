From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 23:57:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
 HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <20160725195227.21112-1-draeman@bbn.com>
References: <20160725195227.21112-1-draeman@bbn.com>
Message-ID: <20160725235757.6d78cd4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 15:52:26 -0400, David Raeman wrote:
> HOST_CFLAGS includes a search path for HOST_DIR/usr/include using -I.  When
> HOST_CFLAGS is used by a package, these flags are passed to the compiler ahead
> of flags passed by the package's internal make system.  If a package has a
> header file with the same name as a header file in HOST_DIR, this causes the
> toolchain to prefer the file from the system include directory because its -I
> appears first on the command line.  I believe conflicts should prefer the file
> provided by the package.  This can be accomplished by using -isystem, which is
> more appropriate then -I for system-level include paths.
> 
> Real-world example: I need libfdt present in my HOST_DIR to install a patched
> version of QEMU.  Meanwhile, the u-boot package provides its own copy of
> libfdt.h that is modified from upstream.  If I have libfdt installed into
> HOST_DIR, then host-uboot-tools fails to build because it grabs the libfdt.h
> from the HOST_DIR area instead of using the patched version from its own
> source tree.  This patch corrects this issue.
> 
> This assumes the -isystem flag is supported by the host compiler.
> 
> Signed-off-by: David Raeman <draeman@bbn.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It makes sense, and -isystem exists since at least gcc 3.0. I've
slightly tweaked your commit log, and applied. We'll see what our
autobuilders say, since it's really hard to judge all the possible
impacts of such a subtle change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
