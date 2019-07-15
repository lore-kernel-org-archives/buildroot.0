From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jul 2019 22:46:32 +0200
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib:
 CommentsMenusPackagesOrder: append elements to arrays if needed
In-Reply-To: <20190715083209.7319-1-jerzy.m.grzegorek@gmail.com>
References: <20190715083209.7319-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190715204632.GP29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

On 2019-07-15 10:32 +0200, Jerzy Grzegorek spake thusly:
> To be "future-proof" append elements to arrays if needed.
> Also change order of variables.

Is that a fix for the existing issues, or just an improvement/cleanup?

> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> ---
>  utils/checkpackagelib/lib_config.py | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index f0edb9993d..f55bb33d69 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -61,9 +61,9 @@ class AttributesOrder(_CheckFunction):
>  
>  
>  class CommentsMenusPackagesOrder(_CheckFunction):
> -    print_package_warning = [True, True, True, True, True, True]
> -    menu_of_packages = ["", "", "", "", "", ""]
> -    package = ["", "", "", "", "", ""]
> +    menu_of_packages = [""]
> +    package = [""]
> +    print_package_warning = [True]

Why do we need an initial value in the arrays? Can't we do something
like:

    package = []
    ...
    if level > len(self.package):
        append the stuff here.

Of course, that is not very nice either... All of that because we can't
assigne to an index that does not already exists. In python, the moto is
"easier to ask for forgiveness than permission". So:

    try:
        self.menu_of_packages[level] = text[:-1]
        self.package[level] = ""
        self.print_package_warning[level] = True
    except IndexError:
        self.menu_of_packages.append(text[:-1])
        self.package.append("")
        self.print_package_warning.append(True)

Regards,
Yann E. MORIN.

>      def before(self):
>          self.state = ""
> @@ -87,9 +87,15 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>                      self.state += "-menu"
>  
>              level = self.get_level()
> +
> +            if level > len(self.package) - 1:
> +                self.menu_of_packages.append("")
> +                self.package.append("")
> +                self.print_package_warning.append(True)
> +
> +            self.menu_of_packages[level] = text[:-1]
>              self.package[level] = ""
>              self.print_package_warning[level] = True
> -            self.menu_of_packages[level] = text[:-1]
>  
>          elif text.startswith("endif") or text.startswith("endmenu"):
>              if self.state.endswith("comment"):
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
