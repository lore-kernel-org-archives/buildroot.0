From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 31 May 2014 23:25:22 +0200
Subject: [Buildroot] [PATCH 10/11 RFC] support/scripts: generate a list
	of virtual packages
In-Reply-To: <9b38d186ea4f2dcf6572add7998fda0fd68cd06a.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <9b38d186ea4f2dcf6572add7998fda0fd68cd06a.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+gNM8XqdRYZtFVBXoYyYhK3_0fnk6zdz1zO50gaRih8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Generate an asciidoc table that can be included in the manual, that
> lists the existing virtual packages, the corresponding symbol, and
> their providers (and sub-options thereof).
>
> The core of this change is the addition of a new formatter for virtual
> packages. This formatter is a bit tricky, as it has to catter for a
> bumch of corner cases:

s/bumch/bunch/

>   - provider is not a package, but sub-options of a package
>   - such a sub-option may be itself 'select'-ed by one or more
>     other sub-option

s/sub-option/sub-options/

>   - legacy packages should not be considered as a provider
>
> Those cases are real:
>   - sub-options of mesa3d provide EGL or GLES
>   - selected sub-options of mesa3d provide GL
>   - udev is a legacy package, but it provides udev
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  support/scripts/gen-manual-lists.py | 84 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> index 8311929..7a4f403 100644
> --- a/support/scripts/gen-manual-lists.py
> +++ b/support/scripts/gen-manual-lists.py
> @@ -173,6 +173,13 @@ class Buildroot:
>              'format': '_format_symbol_prompt',
>              'sorted': True,
>          },
> +        'virtual-packages': {
> +            'filename': "virtual-package-list",
> +            'root_menu': "Target packages",
> +            'filter': "_is_virtual_package",
> +            'format': '_format_symbol_virtual',

For dictionnary, usually, single-quotes are used for the key and
double-quotes for the value (when it's a string), though both single
and double quote can be used in both cases (key and value).
Here my point is more about consistency with the rest of the file.

> +            'sorted': True,
> +        },
>          'deprecated': {
>              'filename': "deprecated-list",
>              'root_menu': None,
> @@ -230,6 +237,8 @@ class Buildroot:
>              return False
>          if type == 'real' and not symbol.prompts:
>              return False
> +        if type == 'virtual' and symbol.prompts:
> +            return False
>          if not self.re_pkg_prefix.match(symbol.get_name()):
>              return False
>          pkg_name = self._get_pkg_name(symbol)
> @@ -264,11 +273,17 @@ class Buildroot:
>              if type == 'real' or type == 'both':
>                  if pattern.match(pkg) and not self._exists_virt_symbol(pkg):
>                      return True
> +            if type == 'virtual' or type == 'both':
> +                if pattern.match('has_' + pkg):
> +                    return True

Side note: is 'both' type really needed?
AFAICS, _is_package is never called with type="both".

>          return False
>
>      def _is_real_package(self, symbol):
>          return self._is_package(symbol, 'real')
>
> +    def _is_virtual_package(self, symbol):
> +        return self._is_package(symbol, 'virtual')
> +
>      def _exists_virt_symbol(self, pkg_name):
>          """ Return True if a symbol exists that defines the package as
>          a virtual package, False otherwise
> @@ -336,6 +351,71 @@ class Buildroot:
>          return "| {0:<40} <| {1}\n".format(get_label_func(symbol),
>                                             " -> ".join(parents))
>
> +    def _format_symbol_virtual(self, symbol=None, root=None,
> +                                             enable_choice=False, header=None,
> +                                             get_label_func=lambda x: "?"):
> +        def _symbol_is_legacy(symbol):
> +            selects = symbol.get_selected_symbols()
> +            if not selects:
> +                return False
> +            for s in selects:
> +                if s.get_name() == "BR2_LEGACY":
> +                    return True
> +            return False

Could be written/reduced like this:

def _symbol_is_legacy(symbol):
    selects = [ s.get_name() for s in symbol.get_selected_symbols() ]
    if not selects:
        return False
    if "BR2_LEGACY" in selects:
        return True
    return False

or even:

def _symbol_is_legacy(symbol):
    selects = [ s.get_name() for s in symbol.get_selected_symbols() ]
    return ("BR2_LEGACY" in selects)

> +
> +        def _get_parent_package(br, sym):
> +            if br._is_real_package(sym):
> +                return None
> +            # Trim the symbol name from its last component (separated with
> +            # underscores), until we either find a symbol which is a real
> +            # package, or until we have no cpmponent (i.e. just 'BR2')

s/cpmponent/component/

> +            name = sym.get_name()
> +            while name != "BR2":
> +                name = re.sub(r"_[^_]+$", r"", name)

Could also be done like this:
name = name.rsplit("_", 1)[0]

> +                s = br.config.get_symbol(name)
> +                if s is None:
> +                    continue
> +                if br._is_real_package(s):
> +                    return s
> +            return None
> +
> +        def _get_providers(br, config, symbol):
> +            providers = list()
> +            for sym in self.config:
> +                if not sym.is_symbol():
> +                    continue
> +                selects = sym.get_selected_symbols()
> +                if not selects:
> +                    continue
> +                for s in selects:
> +                    if s == symbol:
> +                        if _symbol_is_legacy(sym):
> +                            continue
> +                        if sym.prompts:
> +                            l = self._get_symbol_label(sym,False)
> +                            parent_pkg = _get_parent_package(br, sym)
> +                            if parent_pkg is not None:
> +                                l = self._get_symbol_label(parent_pkg, False) \
> +                                  + " (w/ " + l + ")"
> +                            providers.append(l)
> +                        else:
> +                            providers.extend(_get_providers(br,config,sym))
> +            return providers

In these 2 above sub-functions, you can replace br by self, so drop
the br argument

> +
> +        if symbol is None and header is None:
> +            return ( "100%", "^1,4,4" )
> +
> +        if header is not None:
> +            return "| {0:<20} <| {1:<32} <| Providers\n".format("Virtual packages", "Symbols")
> +
> +        pkg = re.sub(r"^BR2_PACKAGE_HAS_(.+)$", r"\1", symbol.get_name())
> +        providers = _get_providers(self, self.config, symbol)
> +
> +        return "| {0:<20} <| {1:<32} <| {2}\n".format(pkg.lower(),
> +                                                      '+' + symbol.get_name() + '+',
> +                                                      ", ".join(providers))
> +
> +
>      def print_list(self, list_type, enable_choice=True, enable_deprecated=True,
>                     dry_run=False, output=None):
>          """ Print the requested list. If not dry run, then the list is
> @@ -404,7 +484,7 @@ class Buildroot:
>
>
>  if __name__ == '__main__':
> -    list_types = ['target-packages', 'host-packages', 'deprecated']
> +    list_types = ['target-packages', 'host-packages', 'virtual-packages', 'deprecated']
>      parser = ArgumentParser()
>      parser.add_argument("list_type", nargs="?", choices=list_types,
>                          help="""\
> @@ -415,6 +495,8 @@ Generate the given list (generate all lists if unspecified)""")
>                          help="Output target package file")
>      parser.add_argument("--output-host", dest="output_host",
>                          help="Output host package file")
> +    parser.add_argument("--output-virtual", dest="output_virtual",
> +                        help="Output virtual package file")
>      parser.add_argument("--output-deprecated", dest="output_deprecated",
>                          help="Output deprecated file")
>      args = parser.parse_args()
> --
> 1.8.3.2
>

Regards,

-- 
Samuel
