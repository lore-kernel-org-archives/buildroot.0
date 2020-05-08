From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 8 May 2020 08:32:29 +0200
Subject: [Buildroot] [PATCH 2/5] package/apparmor: fix compatibility
 with busybox grep
In-Reply-To: <20200508015956.3270405-2-aduskett@gmail.com>
References: <20200508015956.3270405-1-aduskett@gmail.com>
 <20200508015956.3270405-2-aduskett@gmail.com>
Message-ID: <CA+_SqVYbrj10_Os90XQ-YhT1JLC28j37F2B5v5Q1n3PPxrxrGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On Fri, May 8, 2020 at 4:00 AM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> The following regex string in rc.apparmor.functions
> "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" is broken due to
> the unescaped { at the end of the regex pattern.
> GNU grep ignors the error. However, the Busybox grep does not and throws the
> error "unescaped character {"

Indeed, my original series had:

select BR2_PACKAGE_GREP

to overcome this issue but it went somewhat missing.



>
> Escape the "{" character to fix this issue.
>
> Note: Upstream has rewritten large sections of the rc.apparmor.functions file
> and the function this patch fixes will no longer be necessary after the next
> version is released. However, it is not possible to easily backport the
> upstream patches as the rewrite comes with new features that would not be
> possible with a simple patch such as this one.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...apparmor.functions-to-work-with-busy.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
>
> diff --git a/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch b/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
> new file mode 100644
> index 0000000000..54afcd43a8
> --- /dev/null
> +++ b/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
> @@ -0,0 +1,37 @@
> +From 12764faa0a01bcc4e0ffc92ce308985dbad0d954 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Thu, 7 May 2020 18:25:29 -0700
> +Subject: [PATCH] fix regex in rc.apparmor.functions to work with busybox
> +
> +The following regex string in rc.apparmor.functions
> +"^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" is broken due to
> +the unescaped {. GNU grep ignores the error. However, the Busybox grep does
> +not and throws the error "unescaped character {"
> +
> +Escape the "{" character to fix this issue.
> +
> +Note: Upstream has rewritten large sections of the rc.apparmor.functions file
> +and the function this patch fixes will no longer be necessary after the next
> +version is released.
> +
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +---
> + parser/rc.apparmor.functions | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
> +index f3108f8..db0697c 100644
> +--- a/parser/rc.apparmor.functions
> ++++ b/parser/rc.apparmor.functions
> +@@ -140,7 +140,7 @@ force_complain() {
> +       local profile=$1
> +
> +       # if profile not in complain mode
> +-      if ! egrep -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" $profile ; then
> ++      if ! grep -E -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+\{" $profile ; then
> +               local link="${PROFILE_DIR}/force-complain/`basename ${profile}`"
> +               if [ -e "$link" ] ; then
> +                       aa_log_warning_msg "found $link, forcing complain mode"
> +--
> +2.26.2
> +
> --
> 2.26.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
