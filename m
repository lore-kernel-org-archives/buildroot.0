From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:02:10 +0100
Subject: [Buildroot] [PATCH] package/ncurses: fix builds with both
 shared and static libs
In-Reply-To: <1419193723-7911-1-git-send-email-yann.morin.1998@free.fr>
References: <1419193723-7911-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141221220210.2d60ff00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 21 Dec 2014 21:28:43 +0100, Yann E. MORIN wrote:
> When both shared and static libs are enabled, we have two shell
> constructs to run, but they are not properly separated, leading to build
> failures like:
> 
>     ln -sf libncursesw.a /home/idnc_sk/IOLINUX/builds/micro-x86_64-corei7/
>     output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libcurse
>     s.a for lib in libncurses libmenu libpanel libform; do ln -sf ${lib}w.
>     so /home/idnc_sk/IOLINUX/builds/micro-x86_64-corei7/output/host/usr/x8
>     6_64-buildroot-linux-uclibc/sysroot/usr/lib/${lib}.so; done
>     /bin/bash: -c: line 0: syntax error near unexpected token `do'
>     /bin/bash: -c: line 0: `ln -sf libncursesw.a /home/idnc_sk/IOLINUX/bui
>     lds/micro-x86_64-corei7/output/host/usr/x86_64-buildroot-linux-uclibc/
>     sysroot/usr/lib/libcurses.a for lib in libncurses libmenu libpanel lib
>     form; do ln -sf ${lib}w.so /home/idnc_sk/IOLINUX/builds/micro-x86_64-c
>     orei7/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/${
>     lib}.so; done'
> 
> As can be seen, there is a missing semi-colon ';' between the symlink
> command and the for loop:
> 
>     ln -sf libncursesw.a [...]/libcurses.a for lib in [...]
> 
> Fix that by adding a semi-colon after each first shell constructs, to
> properly separate the two. If the second one is not enabled (i.e. for a
> static-only build), there is a trailing semi-colon, but that's perfectly
> valid shell syntax.
> 
> Reported-by: idnc_sk on IRC
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
