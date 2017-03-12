From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 15:37:58 +0100
Subject: [Buildroot] [PATCH] package/firejail: mark as broken
In-Reply-To: <1489325570-3550-1-git-send-email-yann.morin.1998@free.fr>
References: <1489325570-3550-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170312153758.169f00a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 14:32:50 +0100, Yann E. MORIN wrote:
> The firejail package does not cross-compile at all, because it is not
> using automake, but a hand-written Makefile.in. So it does not use the
> cross-compiler found by ./configure.
> 
> But when we fix it by passing:
>     FIREJAIL_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
> 
> it then fails to build with symbols redefinitions:
> 
>     /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gnueabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -ggdb  -O2 -DVERSION='"0.9.44.8"' -fstack-protector-all -D_FORTIFY_SOURCE=2 -fPIC -Wformat -Wformat-security  -c libtrace.c -o libtrace.o
>     /tmpfs/cckgOLVz.s: Assembler messages:
>     /tmpfs/cckgOLVz.s:1115: Error: symbol `stat64' is already defined
>     /tmpfs/cckgOLVz.s:1282: Error: symbol `lstat64' is already defined
>     /tmpfs/cckgOLVz.s:2296: Error: symbol `fopen64' is already defined
>     /tmpfs/cckgOLVz.s:2631: Error: symbol `freopen64' is already defined
>     Makefile:16: recipe for target 'libtrace.o' failed
> 
> (ditto for libtracelog)
> 
> Fixing this is not trivial, so we just mark the package as broken.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Chris Frederick <chrisf@cdf123.net>
> 
> ---
> If the package is not fixed before 2017.05-rc1, we will remove it
> altogether (as it was never part of an official release so far).
> ---
>  package/firejail/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, after adding "depends on BROKEN" also on the
Config.in comment, to avoid having it showing up even with the package
itself being broken.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
