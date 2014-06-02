From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 3 Jun 2014 00:53:47 +0200
Subject: [Buildroot] [PATCH 09/11] support/scripts: introduce a symbol
 formatter to generate package lists
In-Reply-To: <e47f3b1d0a79f0ba4751fdcd9cc8230fbd9642b1.1401743146.git.yann.morin.1998@free.fr>
References: <cover.1401743146.git.yann.morin.1998@free.fr>
 <e47f3b1d0a79f0ba4751fdcd9cc8230fbd9642b1.1401743146.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+_bQC7Zb-=DCVeGXezQop4TCy=FgJBeFG-UwhnG1r+tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Jun 2, 2014 at 11:06 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, we can generate two different tables of packages:
>   - a single-column table with the symbols' prompts,
>   - a two-column table with the symbols' prompts and locations in the
>     menuconfig.
>
> For virtual packages, this is not enough, since we will have to display
> more columns, with different content:
>   - the virtual package name (but such symbols do not have a prompt)
>   - the symbol name
>   - the providers for the virtual package
>
> So, instead of having a single function that knows how to generate any
> table, introduce a formatter function that is passed as argument to,
> and called by format_asciidoc_table(). Such formatter functions are
> responsible for providing:
>   - the layout of the table (number of columns, column arrangement),
>   - the formatted header line,
>   - a formatted line for a symbol.
>
> What the formatter should ouput depends on its arguments:
>   - if none are passed, the layout is returned,
>   - if the header label is passed, it returns the formatted header line,
>   - otherwise, it returns the formatted line for a symbol.
>
> Two formatter functions are introduced in this changeset, to replace the
> current 'sub_menu' feature:
>   - _format_symbol_prompt() to display a one-column table with only the
>     symbols' prompts,
>   - _format_symbol_prompt_location() to display a two-column table with
>     the symbols' prompts and locations.
>
> This will help us to later introduce a new formatter to generate a table
> for virtual packages.
>
> [Thanks to Samuel for his pythonistic help!]
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes RFC -> v2:
>   - add explicit parameter to formatters to decide what to do, instead
>     of relying on argument being None or not  (Samuel)
>   - use traditional 'lambda x: x' instead of custom ones  (Samuel)
>   - fix typoes  (samuel)
> ---
>  support/scripts/gen-manual-lists.py | 83 ++++++++++++++++++++++++-------------
>  1 file changed, 54 insertions(+), 29 deletions(-)
>
> diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> index 0ad7d20..68a36a9 100644
> --- a/support/scripts/gen-manual-lists.py
> +++ b/support/scripts/gen-manual-lists.py
> @@ -109,50 +109,33 @@ def get_symbol_parents(item, root=None, enable_choice=False):
>
>
>  def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
> -                          enable_choice=False, sorted=True, sub_menu=True,
> +                          format_func=lambda x: x,
> +                          enable_choice=False, sorted=True,
>                            item_label=None):
>      """ Return the asciidoc formatted table of the items and their location.
>
>      :param root:           Root item of the item subset
>      :param get_label_func: Item's label getter function
>      :param filter_func:    Filter function to apply on the item subset
> +    :param format_func:    Function to format a symbol and the table header
>      :param enable_choice:  Enable choices to appear as part of the item's
>                             location
>      :param sorted:         Flag to alphabetically sort the table
> -    :param sub_menu:       Output the column with the sub-menu path
>
>      """
> -    def _format_entry(item, parents, sub_menu):
> -        """ Format an asciidoc table entry.
>
> -        """
> -        if sub_menu:
> -            return "| {0:<40} <| {1}\n".format(item, " -> ".join(parents))
> -        else:
> -            return "| {0:<40}\n".format(item)
>      lines = []
>      for item in get_symbol_subset(root, filter_func):
> -        loc = get_symbol_parents(item, root, enable_choice=enable_choice)
> -        lines.append(_format_entry(get_label_func(item), loc, sub_menu))
> +        lines.append(format_func(what="symbol", symbol=item, root=root,
> +                                 get_label_func=get_label_func,
> +                                 enable_choice=enable_choice))
>      if sorted:
>          lines.sort(key=lambda x: x.lower())
> -    if hasattr(root, "get_title"):
> -        loc_label = get_symbol_parents(root, None, enable_choice=enable_choice)
> -        loc_label += [root.get_title(), "..."]
> -    else:
> -        loc_label = ["Location"]
> -    if not item_label:
> -        item_label = "Items"
>      table = ":halign: center\n\n"
> -    if sub_menu:
> -        width = "100%"
> -        columns = "^1,4"
> -    else:
> -        width = "30%"
> -        columns = "^1"
> +    width, columns = format_func(what="layout")
>      table = "[width=\"{0}\",cols=\"{1}\",options=\"header\"]\n".format(width, columns)
>      table += "|===================================================\n"
> -    table += _format_entry(item_label, loc_label, sub_menu)
> +    table += format_func(what="header", header=item_label, root=root)
>      table += "\n" + "".join(lines) + "\n"
>      table += "|===================================================\n"
>      return table
> @@ -180,22 +163,22 @@ class Buildroot:
>              'filename': "package-list",
>              'root_menu': "Target packages",
>              'filter': "_is_real_package",
> +            'format': "_format_symbol_prompt_location",
>              'sorted': True,
> -            'sub_menu': True,
>          },
>          'host-packages': {
>              'filename': "host-package-list",
>              'root_menu': "Host utilities",
>              'filter': "_is_real_package",
> +            'format': "_format_symbol_prompt",
>              'sorted': True,
> -            'sub_menu': False,
>          },
>          'deprecated': {
>              'filename': "deprecated-list",
>              'root_menu': None,
>              'filter': "_is_deprecated",
> +            'format': "_format_symbol_prompt_location",
>              'sorted': False,
> -            'sub_menu': True,
>          },
>      }
>
> @@ -324,6 +307,47 @@ class Buildroot:
>              label += " *(deprecated)*"
>          return label
>
> +    def _format_symbol_prompt(self, what=None, symbol=None, root=None,
> +                                    enable_choice=False, header=None,
> +                                    get_label_func=lambda x: x):
> +        if what is None:
> +            raise Exception("Don't know what to format")
> +
> +        if what == "layout":
> +            return ( "30%", "^1" )
> +
> +        if what == "header":
> +            return "| {0:<40}\n".format(header)
> +
> +        if what == "symbol":
> +            return "| {0:<40}\n".format(get_label_func(symbol))
> +
> +        raise Exception("Don't know how to format '%s'" % str(what))
> +
> +    def _format_symbol_prompt_location(self, what=None, symbol=None, root=None,
> +                                             enable_choice=False, header=None,
> +                                             get_label_func=lambda x: x):
> +        if what is None:
> +            raise Exception("Don't know what to format")
> +
> +        if what == "layout":
> +            return ( "100%", "^1,4" )
> +
> +        if what == "header":
> +            if hasattr(root, "get_title"):
> +                loc_label = get_symbol_parents(root, None, enable_choice=enable_choice)
> +                loc_label += [root.get_title(), "..."]
> +            else:
> +                loc_label = ["Location"]
> +            return "| {0:<40} <| {1}\n".format(header, " -> ".join(loc_label))
> +
> +        if what == "symbol":
> +            parents = get_symbol_parents(symbol, root, enable_choice)
> +            return "| {0:<40} <| {1}\n".format(get_label_func(symbol),
> +                                               " -> ".join(parents))
> +
> +        raise Exception("Don't know how to format '%s'" % str(what))

Raising an exception if 'what' is None, and raising an exception when
it  has an invalid value seems a bit overkill to me... ;-)

I would drop the None-check, and make the exception message more
helpful in invalid case:

  message = "Invalid argument 'what': '%s'\n" % str(what)
  message += "Allowed values are: 'layout', 'header' and 'symbol'"
  raise Exception(message)


> +
>      def print_list(self, list_type, enable_choice=True, enable_deprecated=True,
>                     dry_run=False, output=None):
>          """ Print the requested list. If not dry run, then the list is
> @@ -356,6 +380,7 @@ class Buildroot:
>              root_item = self.config
>          filter_ = getattr(self, list_config.get('filter'))
>          filter_func = lambda x: filter_(x)
> +        format_func = getattr(self, list_config.get('format'))
>          if not enable_deprecated and list_type != "deprecated":
>              filter_func = lambda x: filter_(x) and not self._is_deprecated(x)
>          mark_depr = list_type != "deprecated"
> @@ -364,9 +389,9 @@ class Buildroot:
>
>          table = format_asciidoc_table(root_item, get_label,
>                                        filter_func=filter_func,
> +                                      format_func=format_func,
>                                        enable_choice=enable_choice,
>                                        sorted=list_config.get('sorted'),
> -                                      sub_menu=list_config.get('sub_menu'),
>                                        item_label=item_label)
>
>          content = self.list_in.format(table=table)
> --
> 1.8.3.2
>

Regards,

-- 
Samuel
