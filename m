From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 00:44:07 +0200
Subject: [Buildroot] [PATCH 10/11 RFC] support/scripts: generate a list
 of virtual packages
In-Reply-To: <CAHXCMM+gNM8XqdRYZtFVBXoYyYhK3_0fnk6zdz1zO50gaRih8A@mail.gmail.com>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <9b38d186ea4f2dcf6572add7998fda0fd68cd06a.1401395407.git.yann.morin.1998@free.fr>
 <CAHXCMM+gNM8XqdRYZtFVBXoYyYhK3_0fnk6zdz1zO50gaRih8A@mail.gmail.com>
Message-ID: <20140531224407.GI3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-05-31 23:25 +0200, Samuel Martin spake thusly:
> On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP commit log--]

Typoes fixed.

> > diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> > index 8311929..7a4f403 100644
> > --- a/support/scripts/gen-manual-lists.py
> > +++ b/support/scripts/gen-manual-lists.py
> > @@ -173,6 +173,13 @@ class Buildroot:
> >              'format': '_format_symbol_prompt',
> >              'sorted': True,
> >          },
> > +        'virtual-packages': {
> > +            'filename': "virtual-package-list",
> > +            'root_menu': "Target packages",
> > +            'filter': "_is_virtual_package",
> > +            'format': '_format_symbol_virtual',
> 
> For dictionnary, usually, single-quotes are used for the key and
> double-quotes for the value (when it's a string), though both single
> and double quote can be used in both cases (key and value).
> Here my point is more about consistency with the rest of the file.

Fixed.

[--SNIP--]
> > @@ -264,11 +273,17 @@ class Buildroot:
> >              if type == 'real' or type == 'both':
> >                  if pattern.match(pkg) and not self._exists_virt_symbol(pkg):
> >                      return True
> > +            if type == 'virtual' or type == 'both':
> > +                if pattern.match('has_' + pkg):
> > +                    return True
> 
> Side note: is 'both' type really needed?
> AFAICS, _is_package is never called with type="both".

Already removed from the previous patch.

> > @@ -336,6 +351,71 @@ class Buildroot:
> >          return "| {0:<40} <| {1}\n".format(get_label_func(symbol),
> >                                             " -> ".join(parents))
> >
> > +    def _format_symbol_virtual(self, symbol=None, root=None,
> > +                                             enable_choice=False, header=None,
> > +                                             get_label_func=lambda x: "?"):
> > +        def _symbol_is_legacy(symbol):
> > +            selects = symbol.get_selected_symbols()
> > +            if not selects:
> > +                return False
> > +            for s in selects:
> > +                if s.get_name() == "BR2_LEGACY":
> > +                    return True
> > +            return False
> 
> Could be written/reduced like this:
> 
> def _symbol_is_legacy(symbol):
>     selects = [ s.get_name() for s in symbol.get_selected_symbols() ]
>     if not selects:
>         return False
>     if "BR2_LEGACY" in selects:
>         return True
>     return False
> 
> or even:
> 
> def _symbol_is_legacy(symbol):
>     selects = [ s.get_name() for s in symbol.get_selected_symbols() ]
>     return ("BR2_LEGACY" in selects)

OK, I took your second proposal.

> > +
> > +        def _get_parent_package(br, sym):
> > +            if br._is_real_package(sym):
> > +                return None
> > +            # Trim the symbol name from its last component (separated with
> > +            # underscores), until we either find a symbol which is a real
> > +            # package, or until we have no cpmponent (i.e. just 'BR2')
> 
> s/cpmponent/component/

Fixed.

> > +            name = sym.get_name()
> > +            while name != "BR2":
> > +                name = re.sub(r"_[^_]+$", r"", name)
> 
> Could also be done like this:
> name = name.rsplit("_", 1)[0]

Done.

> > +                s = br.config.get_symbol(name)
> > +                if s is None:
> > +                    continue
> > +                if br._is_real_package(s):
> > +                    return s
> > +            return None
> > +
> > +        def _get_providers(br, config, symbol):
> > +            providers = list()
> > +            for sym in self.config:
> > +                if not sym.is_symbol():
> > +                    continue
> > +                selects = sym.get_selected_symbols()
> > +                if not selects:
> > +                    continue
> > +                for s in selects:
> > +                    if s == symbol:
> > +                        if _symbol_is_legacy(sym):
> > +                            continue
> > +                        if sym.prompts:
> > +                            l = self._get_symbol_label(sym,False)
> > +                            parent_pkg = _get_parent_package(br, sym)
> > +                            if parent_pkg is not None:
> > +                                l = self._get_symbol_label(parent_pkg, False) \
> > +                                  + " (w/ " + l + ")"
> > +                            providers.append(l)
> > +                        else:
> > +                            providers.extend(_get_providers(br,config,sym))
> > +            return providers
> 
> In these 2 above sub-functions, you can replace br by self, so drop
> the br argument

Does not work:
    TypeError: _get_providers() takes exactly 2 arguments (3 given)

Do I need to call it from self?
    providers.extend(self._get_providers(config,sym))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
