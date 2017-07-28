From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:22:55 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump version to 234
In-Reply-To: <20170728113516.17944-1-aduskett@gmail.com>
References: <20170728113516.17944-1-aduskett@gmail.com>
Message-ID: <294dfd60-ae61-9003-def5-1a7ce08eadde@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 28-07-17 13:35, Adam Duskett wrote:
> Other changes:
> - Removed the following patches due to being merged upstream:
>     - resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
>     - resolved-simplify-alloc-size-calculation.patch
>     - resolved-do-not-allocate-packets-with-minimum-size.patch
> - Updated the following patches to work with 234:
>     - fix-getty-unit.patch
>     - build-check-for-ln-relative.patch
>     - fix-am-path-libgcrypt-no-found.patch
> - Updated ordering of remaining patches.
> - Reformatted remaining patches as git style patches.
> - Updated Upstream-Status comment in "build-check-for-ln-relative.patch" to
>   "Denied [No desire to support building on old distributions]"

 This is a pretty darn big patch to review. It would have been nice to split it
a little, e.g. split off the reformatting to git style. Also, before sending,
it's nice to check if git has detected the renames correctly, and if not give an
argument to -M so it tries harder.


> Signed-off-by: Adam Duskett <aduskett@gmail.com>
[snip]
> diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
> new file mode 100644
> index 000000000..c8d53d04a
> --- /dev/null
> +++ b/package/systemd/0001-fix-getty-unit.patch
> @@ -0,0 +1,43 @@
> +From 82dc074213122ef32c7a9cbfc406a827e5afed64 Mon Sep 17 00:00:00 2001
> +From: Maxime Ripard <maxime.ripard@free-electrons.com>
> +Date: Fri, 28 Jul 2017 06:58:45 -0400
> +Subject: [PATCH] Prefer getty to agetty in console setup systemd units

 You apparently didn't *really* create it with git format-patch, otherwise the
file name would have been 0001-Prefer-getty-to-agetty-...

> +
> +Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +Refresh for 234

 The usual way to do this is:

[Adam: Refresh for 234]
Signed-off-by: Adam

> +---
> + units/getty at .service.m4        | 2 +-
> + units/serial-getty at .service.m4 | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
> +index 2a84061..e6e8685 100644
> +--- a/units/getty at .service.m4
> ++++ b/units/getty at .service.m4
> +@@ -36,7 +36,7 @@ ConditionPathExists=/dev/tty0
> + # The '-o' option value tells agetty to replace 'login' arguments with an
> + # option to preserve environment (-p), followed by '--' for safety, and then
> + # the entered username.

 Please also remove the comment above, otherwise it looks really weird to anyone
looking into this file on the target.

> +-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM
> ++ExecStart=-/sbin/getty -L %I 115200 vt100
> + Type=idle
> + Restart=always
> + RestartSec=0

[snip]
> @@ -8,17 +11,25 @@ development files are available. Though libgcrypt support is optional in
>  systemd, this macro should be available whenever autoreconf is used, otherwise
>  the re-configuration will fail with:
>  
> -  configure.ac:616: warning: macro 'AM_PATH_LIBGCRYPT' not found in library
> +configure.ac:616: warning: macro 'AM_PATH_LIBGCRYPT' not found in library

 Why do you remove the indentation here?

 Regards,
 Arnout

>  
>  As asking the user to install the development package of libgcrypt on the host
>  machine or adding libgcrypt as a build dependency to systemd is not
>  acceptable, the required file is added to the m4 directory.
>  
>  Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
