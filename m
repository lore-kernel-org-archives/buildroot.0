From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 23 Mar 2011 23:52:02 +0000
Subject: [Buildroot] [PATCH] readline: link directly against ncurses
In-Reply-To: <1300923775-13739-1-git-send-email-vapier@gentoo.org>
References: <1300923775-13739-1-git-send-email-vapier@gentoo.org>
Message-ID: <AANLkTim0zatp6RRaAj9xf9DB3BgkKYha2LOX6EWCf0mf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike

I can't thank you enough....if it wasn't for yourself and Joakim I would
still have no idea.

I manually tried your "sed" suggestion and can confirm it worked:

[root at dlxarm01 buildroot]# readelf -d
./output/target/usr/lib/libreadline.so.6.1 | grep "]"
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]
 0x0000000e (SONAME)                     Library soname: [libreadline.so.6]
 0x0000000f (RPATH)                      Library rpath: [/usr/lib]
[root at dlxarm01 buildroot]#


And now when I run python:
[root at vx-200 ~]# python
Python 2.7.1 (r271:86832, Mar 23 2011, 23:27:09)
[GCC 4.5.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import readline
>>>
[root at vx-200 ~]#

:))))))))))))))))))))))))))))))))))))))))))))))))))))))








On Wed, Mar 23, 2011 at 11:42 PM, Mike Frysinger <vapier@gentoo.org> wrote:

> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> note: not really tested since external toolchain support is totally broken
>
>  package/readline/readline-6.1-curses-link.patch |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 package/readline/readline-6.1-curses-link.patch
>
> diff --git a/package/readline/readline-6.1-curses-link.patch
> b/package/readline/readline-6.1-curses-link.patch
> new file mode 100644
> index 0000000..56b4770
> --- /dev/null
> +++ b/package/readline/readline-6.1-curses-link.patch
> @@ -0,0 +1,16 @@
> +link readline directly to ncurses since it needs symbols from it
> +
> +upstream readline does this on purpose (no direct linking), but
> +it doesn't make much sense in a Linux world
> +
> +--- a/support/shobj-conf
> ++++ b/support/shobj-conf
> +@@ -42,7 +42,7 @@
> + SHOBJ_LIBS=
> +
> + SHLIB_XLDFLAGS=
> +-SHLIB_LIBS=
> ++SHLIB_LIBS=-lncurses
> +
> + SHLIB_DOT='.'
> + SHLIB_LIBPREF='lib'
> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110323/ea136681/attachment.html>
