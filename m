From: Martin Bark <martin@barkynet.com>
Date: Tue, 4 Aug 2015 12:40:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs/0.10.x: add patch to fix
 musl build error
In-Reply-To: <1438447939-25905-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438447939-25905-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <CAFGQKxeBA14CTtj94NPNiq2Sw6HWkGrVinq6gMZMgRTyZCurew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On 1 August 2015 at 17:52, J?rg Krause <joerg.krause@embedded.rocks> wrote:
> The musl C library does not understand the feature test macro __USE_MISC and so
> libuv (built-in dependency of nodejs) does not use the correct struct stat
> definition for musl:
>         error: ?uv_statbuf_t? has no member named ?st_ctimensec?
>         error: ?uv_statbuf_t? has no member named ?st_mtimensec?
>
> The macro __USE_MISC is defined by glibc if _BSD_SOURCE or _SVID_SOURCE is
> defined.
>
> The libuv build system enables the feature test macro _GNU_SOURCE for linux
> builds.
>
> Since glibc 2.19, defining _GNU_SOURCE also has the effect of implicitly
> defining _DEFAULT_SOURCE - the replacement for _BSD_SOURCE and _SVID_SOURCE.
>
> In glibc versions before 2.20, defining _GNU_SOURCE also had the effect of
> implicitly defining _BSD_SOURCE and _SVID_SOURCE. This is also true for uClibc.
>
> Alltogether, we can safely replace __USE_MISC by _GNU_SOURCE to support building
> nodejs 0.10.x with the musl C library.
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0005-fix-musl-USE-MISC-build-issue.patch       | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/nodejs/0.10.40/0005-fix-musl-USE-MISC-build-issue.patch
>
> diff --git a/package/nodejs/0.10.40/0005-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.40/0005-fix-musl-USE-MISC-build-issue.patch
> new file mode 100644
> index 0000000..128058d
> --- /dev/null
> +++ b/package/nodejs/0.10.40/0005-fix-musl-USE-MISC-build-issue.patch
> @@ -0,0 +1,47 @@
> +From 0bc482abeb814573251ecafb5a1e045c885b13a2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Mon, 25 May 2015 16:22:57 +0200
> +Subject: [PATCH 1/1] Fix musl __USE_MISC issue
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The musl C library does not define __USE_MISC and so libuv (built-in dependency)
> +does not use the correct struct stat definition for musl.
> +
> +The feature test macro __USE_MISC is defined by glibc if _BSD_SOURCE or
> +_SVID_SOURCE is defined.
> +
> +The libuv build system enables the feature test macro _GNU_SOURCE for linux
> +builds.
> +
> +Since glibc 2.19, defining _GNU_SOURCE also has the effect of implicitly
> +defining _DEFAULT_SOURCE - the replacement for _BSD_SOURCE and _SVID_SOURCE.
> +
> +In glibc versions before 2.20, defining _GNU_SOURCE also had the effect of
> +implicitly defining _BSD_SOURCE and _SVID_SOURCE. This is also true for uClibc.
> +
> +Alltogether, we can safely replace __USE_MISC by _GNU_SOURCE to support building
> +nodejs 0.10.x with the musl C library.
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + deps/uv/src/fs-poll.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/deps/uv/src/fs-poll.c b/deps/uv/src/fs-poll.c
> +index ad27f18..094447e 100644
> +--- a/deps/uv/src/fs-poll.c
> ++++ b/deps/uv/src/fs-poll.c
> +@@ -198,7 +198,7 @@ static int statbuf_eq(const uv_statbuf_t* a, const uv_statbuf_t* b) {
> +
> +   /* Jump through a few hoops to get sub-second granularity on Linux. */
> + # if defined(__linux__)
> +-#  if defined(__USE_MISC) /* _BSD_SOURCE || _SVID_SOURCE */
> ++#  if defined(_GNU_SOURCE) /* _BSD_SOURCE || _SVID_SOURCE */
> +   if (a->st_ctim.tv_nsec != b->st_ctim.tv_nsec) return 0;
> +   if (a->st_mtim.tv_nsec != b->st_mtim.tv_nsec) return 0;
> + #  else
> +--
> +2.4.1
> +
> --
> 2.5.0

I tested your patch.  I can confirm it fixed building node.js v0.10.40
using musl on a qemu x86_64 build and node ran OK too.  I also see
this is not an issue in v0.12.7 as it uses a newer libuv.

Tested-by "Martin Bark" <martin@barkynet.com>

Thanks

Martin

>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
