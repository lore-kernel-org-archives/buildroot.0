From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:15:26 +0200
Subject: [Buildroot] [PATCH v2] vlc: fix compile error with uClibc-ng
 Linuxthreads
In-Reply-To: <20160825190832.GA4674@waldemar-brodkorb.de>
References: <20160825190832.GA4674@waldemar-brodkorb.de>
Message-ID: <20160826111526.10e4606b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 21:08:32 +0200, Waldemar Brodkorb wrote:

> diff --git a/package/vlc/0008-fix-fallback-time.patch b/package/vlc/0008-fix-fallback-time.patch
> new file mode 100644
> index 0000000..9692001
> --- /dev/null
> +++ b/package/vlc/0008-fix-fallback-time.patch
> @@ -0,0 +1,27 @@
> +fix fallback code and add missing libraries to link command
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

VLC is hosted in a Git repository, so a Git-formatted patch would be
preferred.

> ++    AC_CHECK_LIB([rt], [posix_spawnp], [VLC_ADD_LIBS([libvlccore],[-lpthread -lrt])], [], [-lpthread])

Why are you linking with -lpthread here?

With uClibc, seems like linking with -lrt is sufficient:

thomas at skate:~/projets/buildroot (master)$ ./output/host/usr/bin/arm-linux-gcc -o foo foo.c 
/tmp/ccigljuI.o: In function `main':
foo.c:(.text+0x2c): undefined reference to `posix_spawn'
collect2: error: ld returned 1 exit status
thomas at skate:~/projets/buildroot (master)$ ./output/host/usr/bin/arm-linux-gcc -o foo foo.c -lrt
thomas at skate:~/projets/buildroot (master)$

And it builds fine with glibc with no additional library at all
(neither -lrt nor -lpthread).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
