From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat, 10 Aug 2019 13:05:39 +0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib:
 CommentsMenusPackagesOrder: only apply to top-level
In-Reply-To: <20190731230220.32266-1-arnout@mind.be>
References: <20190731230220.32266-1-arnout@mind.be>
Message-ID: <8ed24a74-4e78-a08c-72b1-af8d2f67d8f5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> The CommentsMenusPackagesOrder test is broken in various ways for files
> other than package/Config.in and package/Config.in.host. Therefore, the
> script gives bogus errors for various other Config.in files.
>
> However, we don't really want to check those other files. Indeed, many
> of them have a non-alphabetical ordering for good reasons.
>
> Therefore, skip the check for files other than package/Config.in and
> package/Config.in.host.
>
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/251214899

Sorry for the late response (holidays).

I send a patch to solve those issues.
http://lists.busybox.net/pipermail/buildroot/2019-July/254549.html

Could you please comment it ?

Regards,
Jerzy


>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   utils/checkpackagelib/lib_config.py | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index f0edb9993d..7d7567ac67 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -72,6 +72,11 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>           return len(self.state.split('-')) - 1
>   
>       def check_line(self, lineno, text):
> +        # We only want to force sorting for the top-level menus
> +        if self.filename not in ["package/Config.in",
> +                                 "package/Config.in.host"]:
> +            return
> +
>           if text.startswith("comment") or text.startswith("if") or \
>              text.startswith("menu"):
>   
