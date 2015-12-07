From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Dec 2015 19:37:13 +0100
Subject: [Buildroot] [PATCH] util-linux: fix static builds with uClibc
In-Reply-To: <1448573664-5556-1-git-send-email-abrodkin@synopsys.com>
References: <1448573664-5556-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20151207183713.GG4258@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2015-11-27 00:34 +0300, Alexey Brodkin spake thusly:
> What happens util-linux on configuration step tries to build
> and example that uses timer_create() function. That function
> exists in librt and configuration utility correctly adds this
> lib (-lrt).
> 
> But timer_create() uses pthreads internally and so for successful
> linkage "-lpthread" is required as well (in addition to "-lrt").
> 
> 0005-build-sys-use-REALTIME_LIBS.patch is a back-port of upstream
> commit
> https://github.com/karelzak/util-linux/commit/b97edfe731fdf3d3e92e40494b22658207ab6d3c
> that won't apply cleanly on v2.27.1
> 
> 0006-buildsys-fix-static-configuration-and-building.patch was just
> sent upstream, see https://github.com/karelzak/util-linux/pull/234
> 
> Both patches must be removed on util-linux version bump.

I think there's an even deeper problem, because util-linux checks for
timer_createx (notice the trailing 'x'), which does not exist at all,
not even in glibc.

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> +diff --git a/configure.ac b/configure.ac
> +index 6075f72..e9b8794 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -391,8 +391,8 @@ AC_CHECK_FUNCS([timer_createx],

See here ----------------------------------------^^^

I believe it would warrant a confirmation from upstream that they really
want to check for timer_createx and not tiner_create. And then fix it.

Regards,
Yann E. MORIN.

> + 	[have_time="yes"],
> + 	[AC_CHECK_LIB([rt], [timer_create], [
> + 		have_timer="yes"
> +-		REALTIME_LIBS="-lrt"
> +-	])]
> ++		REALTIME_LIBS="-lrt -lpthread"
> ++	],[],[-lpthread])]
> + )
> + 
> + 
> +-- 
> +2.5.0
> +
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
