From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 27 Dec 2020 18:19:40 +0100
Subject: [Buildroot] [PATCH v1] package/iwd: fix static linking
 (readline needs ncurses)
In-Reply-To: <20201227170832.23903-1-ps.report@gmx.net>
References: <20201227170832.23903-1-ps.report@gmx.net>
Message-ID: <20201227181940.60e15575@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Dec 2020 18:08:32 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
>
>   - http://autobuild.buildroot.net/results/26c7536b95cc475bc10d4283e93ea9ccd6ced665
>
>   .../arm-buildroot-linux-musleabihf/bin/ld: .../arm-buildroot-linux-musleabihf/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
>   display.c:(.text+0x1164): undefined reference to `tputs'
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...tatic-linking-readline-needs-ncurses.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/iwd/0001-iwctl-fix-static-linking-readline-needs-ncurses.patch
>
> diff --git a/package/iwd/0001-iwctl-fix-static-linking-readline-needs-ncurses.patch b/package/iwd/0001-iwctl-fix-static-linking-readline-needs-ncurses.patch
> new file mode 100644
> index 0000000000..a204d982b8
> --- /dev/null
> +++ b/package/iwd/0001-iwctl-fix-static-linking-readline-needs-ncurses.patch
> @@ -0,0 +1,31 @@
> +From 84a4eb23ccca883d3823785225858bd437e3833a Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sun, 27 Dec 2020 17:56:35 +0100
> +Subject: [PATCH] iwctl: fix static linking (readline needs ncurses)
> +
> +Fixes:
> +
> +  .../arm-buildroot-linux-musleabihf/bin/ld: .../arm-buildroot-linux-musleabihf/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
> +  display.c:(.text+0x1164): undefined reference to `tputs'
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 1f0b0d3..5ae4a98 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -286,7 +286,7 @@ client_iwctl_SOURCES = client/main.c \
> + 			client/network.h client/network.c \
> + 			client/properties.h client/properties.c \
> + 			client/wsc.c client/station.c
> +-client_iwctl_LDADD = $(ell_ldadd) -lreadline
> ++client_iwctl_LDADD = $(ell_ldadd) -lreadline -lncurses
> +
> + if MANUAL_PAGES
> + man_MANS += client/iwctl.1
> +--
> +2.29.2
> +

There is already a prior (and better) fix by Fabrice Fontaine ([1]) which
is accepted upstream ([2])..., forget about this one (and sorry for the
noise)...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2020-December/298672.html
[2] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=62d31539d6e31a40d7d33c73637e37b50c59ef40
