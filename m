From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 31 May 2014 23:19:18 +0200
Subject: [Buildroot] [PATCH 04/11 RFC] support/scripts: do not display
 virtual packages in generated lists
In-Reply-To: <2f34830f1709a346a1b2a45415242a7e28dbfd0d.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <2f34830f1709a346a1b2a45415242a7e28dbfd0d.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKrXuRS5aH5tkwH197339geD1NDPmaSvHO-Gq-Yh--7=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> If a package has both a 'real' and a 'virtual' definition, consider it
> is a virtual package and do not display it in the generated package list.
>
> This is the case for jpeg and cryptodev, that are virtual packages, but
> also real (but empty) packages used to provide a prompt to enable/disable
> a choice to select an implementation. In this case, we do not want to
> list the virtul packages, but only its implementations.

s/virtul/virtual/
s/its implementations/their implementations/

>
> So, consider packages that are both real and virtual as virtual packages.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  support/scripts/gen-manual-lists.py | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> index 8dec089..10dbbd3 100644
> --- a/support/scripts/gen-manual-lists.py
> +++ b/support/scripts/gen-manual-lists.py
> @@ -278,13 +278,30 @@ class Buildroot:
>                      pkg_list.append(re.sub(r"(.*?)\.mk", r"\1", file_))
>              setattr(self, "_package_list", pkg_list)
>          for pkg in getattr(self, "_package_list"):
> -            if pattern.match(pkg):
> -                return True
> +            if type == 'real' or type == 'both':
> +                if pattern.match(pkg) and not self._exists_virt_symbol(pkg):
> +                    return True
>          return False
>
>      def _is_real_package(self, symbol):
>          return self._is_package(symbol, 'real')
>
> +    def _exists_virt_symbol(self, pkg_name):
> +        """ Return True if a symbol exists that defines the package as
> +        a virtual package, False otherwise
> +
> +        :param pkg_name:    The name of the package, for which to check if
> +                            a symbol exists defining it as a virtual package
> +
> +        """
> +        virt_pattern = "BR2_PACKAGE_HAS_" + pkg_name + "$"
> +        virt_pattern = re.sub("_", ".", virt_pattern)
> +        virt_pattern = re.compile(virt_pattern, re.IGNORECASE)
> +        for sym in self.config:
> +            if virt_pattern.match(sym.get_name()):
> +                return True
> +        return False
> +
>      def _get_pkg_name(self, symbol):
>          """ Return the package name of the specified symbol.
>
> --
> 1.8.3.2
>

With the typo fixed, you'll have my Acked-by.

Regards,

-- 
Samuel
