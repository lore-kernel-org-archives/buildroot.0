From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 22:06:15 +0100
Subject: [Buildroot] [PATCH 4/4] package/nfs-utils: use pkg-config to
	find libtirpc
In-Reply-To: <11a2fb7a110021c76aeee7d6ee193932d6c5b569.1416748649.git.yann.morin.1998@free.fr>
References: <cover.1416748649.git.yann.morin.1998@free.fr>
 <11a2fb7a110021c76aeee7d6ee193932d6c5b569.1416748649.git.yann.morin.1998@free.fr>
Message-ID: <20141127210615.GM3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-11-23 14:20 +0100, Yann E. MORIN spake thusly:
> Fixes:
>     http://autobuild.buildroot.net/results/17d/17d1d94e6f1617851e374f4fe9804f1e5ea9e99f/
>     http://autobuild.buildroot.net/results/c08/c08b7be40c8f208147a4f95ad897e4a1df7e108d/
>     and probably some others as well...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/nfs-utils/0008-tirpc-with-pkgconfig.patch | 71 +++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/nfs-utils/0008-tirpc-with-pkgconfig.patch
> 
> diff --git a/package/nfs-utils/0008-tirpc-with-pkgconfig.patch b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
> new file mode 100644
> index 0000000..c94b380
> --- /dev/null
> +++ b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
> @@ -0,0 +1,71 @@
> +configure: use pkg-config to find libtirpc
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN nfs-utils-1.2.6.orig/aclocal/libtirpc.m4 nfs-utils-1.2.6/aclocal/libtirpc.m4
> +--- nfs-utils-1.2.6.orig/aclocal/libtirpc.m4	2012-05-14 16:40:52.000000000 +0200
> ++++ nfs-utils-1.2.6/aclocal/libtirpc.m4	2014-11-23 12:28:53.933717440 +0100
> +@@ -11,40 +11,13 @@
[--SNIP--]
> ++  PKG_CHECK_MODULES([TIRPC], [libtirpc >= 0.2.4],
> ++                    [LIBTIRPC="${TIRPC_LIBS}"
> ++                     AM_CPPFLAGS="${AM_CPPFLAGS} ${TIRPC_CFLAGS}"
> ++                     AC_DEFINE([HAVE_LIBTIRPC], [1],
> ++                               [Define to 1 if you have and wish to use libtirpc.])],
> ++                    [AS_IF([test "$enable_tirpc" != "no"], [AC_MSG_ERROR([libtirpc not found.])],
> ++                           [LIBTIRPC=""])])

There's a latent bug hidiing in there (exercise: find it! ;-) ), and
it's anyway not the patch I submitted upstream.

So I'll respin the series shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
