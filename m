From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Sep 2016 22:58:17 +0200
Subject: [Buildroot] [PATCH] qt5: Disable pkg-config usage for
	cross-building
In-Reply-To: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
References: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20160922205817.GC3179@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2016-09-22 22:48 +0300, Alexey Brodkin spake thusly:
> Some Qt sub-projects use pkg-config to recover compiler and linker
> flags. Among other things include paths will be pulled in CFLAGS.
> 
> What's interesting Qt tries to play smart and convert include
> paths from simple "-I" to "-isystem" if they match ones returned by [1]
> ---------------------------->8---------------------------
> XXX/output/host/usr/bin/yyy-buildroot-linux-g++
> --sysroot=XXX/output/host/usr/yyy-buildroot-linux/sysroot
> -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -Os  -xc++ -E -v - < /dev/null
> ---------------------------->8---------------------------
> 
> Most probably that [2] was done to mute tons of warnings generated for
> "system" headers. But commit message gives no hint here :(
> 
> So Qt's subprojects [and 3-rd party apps written on Qt] may end-up
> having "-system ZZZ" in their Makefile. That's all right until an
> application wants to use an STL header that includes for example
> "stdlib.h" with gcc 6.x, see what happens then [3].
> 
> That fixes building of Qt5Webkit on ARM with gcc 6.x, see [4].
> 
> [1] http://code.qt.io/cgit/qt/qtbase.git/tree/configure?h=5.6.1#n3660
> [2] http://code.qt.io/cgit/qt/qtbase.git/commit?id=0b144bc76a368ecc6c5c1121a1b51e888a0621ac
> [3] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129
> [4] http://lists.busybox.net/pipermail/buildroot/2016-September/172666.html
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/qt5/qt5base/qt5base.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index bf541b0..2c52e2c 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -26,6 +26,7 @@ QT5BASE_CONFIGURE_OPTS += \
>  	-system-zlib \
>  	-system-pcre \
>  	-no-pch \
> +	-no-pkg-config \

I have not paid much attention to the previous discussion on the topic.

However, I think disabling use of pkg-config is wrong. That is qmake
that is at fault here because, from what I understood from the previous
discussion, it emits -isystem where it should not.

So qmake needs to be fixed to not emit -isystem in those conditions.

Removing the use of pkg-config is just papering over the real problem.

Usually, using pkg-config solves more issues than not using it.

So, I am not very happy with this patch, to say the least... :-(

Yes, I undestand this is a complex issue. Yes, I understand it will be
hard to fix, and even if we can come up with something, it will be hard
to get something upstream that reverts this change.

At worst, let's see if we can at least try to revert that patch from
upstream and see if it fixes the issues.

Regards,
Yann E. MORIN.

>  	-shared
>  
>  # Uses libgbm from mesa3d
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
