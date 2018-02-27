From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Feb 2018 22:01:46 +0100
Subject: [Buildroot] [PATCH] systemd: Fix relative ln add-wants wrapper
In-Reply-To: <20180223201835.16143-1-tpiepho@impinj.com>
References: <20180223201835.16143-1-tpiepho@impinj.com>
Message-ID: <20180227210146.GC11186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-02-23 12:18 -0800, Trent Piepho spake thusly:
> The patch to allow systemd to work with old "ln" versions that don't
> support --relative didn't work properly in the the meson-add-wants.sh
> script.
> 
> This results in all the links in systemd's "*.wants" directories being
> broken, e.g.
> /usr/lib/systemd/system/multi-user.target.wants/getty.target ->
>   ../../../../usr/lib/systemd/system/getty.target
> There is one too few ".." in that relative link.
> 
> The problem is that the script is called with the link name being either a
> file or an existing directory.  In the latter case, ln creates the link in
> the directory using the name of the target.  This means the link is one
> level deeper than the relative link making code thinks.
> 
> The solution used is to only dirname the link, moving up a level, if it's
> not a directory, to mimic ln's logic in how it creates links.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../0002-install-don-t-use-ln-relative.patch       | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0002-install-don-t-use-ln-relative.patch
> index 5f34b56969..61a139e2a2 100644
> --- a/package/systemd/0002-install-don-t-use-ln-relative.patch
> +++ b/package/systemd/0002-install-don-t-use-ln-relative.patch
> @@ -1,4 +1,4 @@
> -From ecf3b9baaebda1d9182c22dc504e32ed275d4abb Mon Sep 17 00:00:00 2001
> +From 17560d52e9ec0afebbfe31e694870c6433b36f60 Mon Sep 17 00:00:00 2001
>  From: Adam Duskett <Adamduskett@outlook.com>
>  Date: Sun, 31 Dec 2017 12:46:04 -0500
>  Subject: [PATCH] install: don't use ln --relative
> @@ -21,17 +21,20 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  [aduskett at gmail.com: Added meson.build section and dirname wrapper in add-wants]
>  [aduskett at gmail.com: Update for systemd v237]
>  Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> +[tpiepho at impinj.com: Fix add-wants wrapper]
> +Signed-off-by: Trent Piepho <tpiepho@impinj.com>
>  ---
>   meson.build                 | 2 +-
>   tools/meson-make-symlink.sh | 3 ++-
> - units/meson-add-wants.sh    | 5 +++--
> - 3 files changed, 6 insertions(+), 4 deletions(-)
> + units/meson-add-wants.sh    | 6 ++++--
> + 3 files changed, 7 insertions(+), 4 deletions(-)
>  
>  diff --git a/meson.build b/meson.build
> -index ddc061c..614201a 100644
> +index d4af95a44..d75f2b34c 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -572,6 +572,6 @@ conf.set_quoted('TELINIT', get_option('telinit-path'))
> +@@ -586,7 +586,7 @@ endforeach
> + conf.set_quoted('TELINIT', get_option('telinit-path'))
>   
>   if run_command('ln', '--relative', '--help').returncode() != 0
>  -        error('ln does not support --relative')
> @@ -40,7 +43,7 @@ index ddc061c..614201a 100644
>   
>   ############################################################
>  diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
> -index 47a5e70..e9002ad 100755
> +index 501cd43d4..25e7f89fd 100755
>  --- a/tools/meson-make-symlink.sh
>  +++ b/tools/meson-make-symlink.sh
>  @@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
> @@ -52,7 +55,7 @@ index 47a5e70..e9002ad 100755
>  +        ln -vfs -T "${dds}$1" "${DESTDIR:-}$2"
>   fi
>  diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
> -index dfd287e..8c08283 100755
> +index 70f7172ae..bb8155075 100755
>  --- a/units/meson-add-wants.sh
>  +++ b/units/meson-add-wants.sh
>  @@ -14,7 +14,7 @@ case "$target" in
> @@ -64,12 +67,13 @@ index dfd287e..8c08283 100755
>   
>   case "$target" in
>           */)
> -@@ -25,4 +25,5 @@ case "$target" in
> +@@ -25,4 +25,6 @@ case "$target" in
>                   ;;
>   esac
>   
>  -ln -vfs --relative "$unitpath" "$dir"
> -+dds="$( dirname `printf "%s" "${dir#${DESTDIR:-}}" |sed -r -e 's:/+[^/]+:../:g; s:/$::'` )"
> ++[ ! -d "${dir}" ] && linkdir=`dirname "${dir}"` || linkdir="${dir}"
> ++dds="$(printf "%s" "${linkdir#${DESTDIR:-}}" |sed -r -e 's:/+[^/]+:../:g; s:/$::')"
>  +ln -vfs "$dds$unitpath" "$dir"
>  -- 
>  2.14.3
> -- 
> 2.14.3
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
