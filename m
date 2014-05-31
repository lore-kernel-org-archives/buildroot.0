From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 31 May 2014 23:20:24 +0200
Subject: [Buildroot] [PATCH 05/11 RFC] support/scripts: who's
 responsibile to decide what is a package
In-Reply-To: <422547083c511f283426d0c0bae5ecc4d4dcee4e.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <422547083c511f283426d0c0bae5ecc4d4dcee4e.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMK3RmhWzW5CgBLp8ozRupGReETKCG-QJ8yzvSyQoAzLiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> When generating the package lists, the reponsibility to decide what is

s/reponsibility/responsibility/

> actually a package symbol is currently split between the _is_package(),/
> the get_symbol_subset() and the format_asciidoc_table() funtions.
>
> The two latter functions check that an item is really a symbol, and that
> is has a prompt.
>
> While this is currently correct for real packages, this will no longer
> be the case when we also generate a list of virtual packages, since they
> do not have a prompt.
>
> Move the responsibility to verify that a symbol is indeed a package symbol
> to is_package(), so it's all in one place, and makes it easier to change

s/ is_package()/ _is_package()/

> for virtual packages.

I fully agree with this! :-)

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  support/scripts/gen-manual-lists.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> index 10dbbd3..7144ca3 100644
> --- a/support/scripts/gen-manual-lists.py
> +++ b/support/scripts/gen-manual-lists.py
> @@ -75,8 +75,6 @@ def get_symbol_subset(root, filter_func):
>          raise Exception(message)
>      for item in get_items():
>          if item.is_symbol():
> -            if not item.prompts:
> -                continue
>              if not filter_func(item):
>                  continue
>              yield item
> @@ -134,8 +132,6 @@ def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
>              return "| {0:<40}\n".format(item)
>      lines = []
>      for item in get_symbol_subset(root, filter_func):
> -        if not item.is_symbol() or not item.prompts:
> -            continue
>          loc = get_symbol_parents(item, root, enable_choice=enable_choice)
>          lines.append(_format_entry(get_label_func(item), loc, sub_menu))
>      if sorted:
> @@ -247,6 +243,10 @@ class Buildroot:
>                          Note: only 'real' is (implictly) handled for now
>
>          """
> +        if not symbol.is_symbol():
> +            return False
> +        if type == 'real' and not symbol.prompts:
> +            return False
>          if not self.re_pkg_prefix.match(symbol.get_name()):
>              return False
>          pkg_name = self._get_pkg_name(symbol)
> --
> 1.8.3.2
>

Regards,

-- 
Samuel
