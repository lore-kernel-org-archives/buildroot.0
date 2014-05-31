From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 01:09:29 +0200
Subject: [Buildroot] [PATCH 06/11 RFC] support/scripts: introduce a
 symbol formatter to generate package lists
In-Reply-To: <CAHXCMMLMiBHwmpg66rt-Yrrj7H9A=HTtbsKwNuumofRti873FQ@mail.gmail.com>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <4079337f5fc8ff5984a1708a6b85548abdaecaeb.1401395407.git.yann.morin.1998@free.fr>
 <CAHXCMMLMiBHwmpg66rt-Yrrj7H9A=HTtbsKwNuumofRti873FQ@mail.gmail.com>
Message-ID: <20140531230929.GL3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-05-31 23:20 +0200, Samuel Martin spake thusly:
> On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]

Typoes fixed.

> > What the formatter should ouput depends on its arguments:
> >   - if none are passed, the layout is returned,
> >   - if no symbol is passed, but the header label is, it returns
> >     the header line,
> >   - otherwise, it returns the formatted line for a symbol.
> 
> The more I think about this, the more I feel it fragile (i.e. using 2
> variables for a tristate) :-/
> In the end, the header argument and the symbol one are just some data
> processed by the formatter.
> Maybe we should just replace the header and symbol kwargs by a data
> one, and add another argument telling what should return the
> formatter: either the layout, the header line or a symbol line.

OK, I see what you mean. Something like the following?

    format_symbol_prompt(self, what=None, symbol=None, header=None,
                         root=None, enable_choice=False, header=None,
                         get_label_func=lambda x: "?"):
        if what is None:
            throw an exception
        if what == "layout":
            return ("bla","bla")
        if what == "header":
            return formated_header(header)
        if what == "symbol":
            return formated_symbol(symbol)
        throw an exception

However, I don;t get what you mean by "a data argument". Do you mean a
kind of casting the arg whether we're asked to render a header or a
symbol? How does one casts in Python?

Oh wait, duck-typing, right?

[--SNIP--]
> > diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> > index 7144ca3..8311929 100644
> > --- a/support/scripts/gen-manual-lists.py
> > +++ b/support/scripts/gen-manual-lists.py
> > @@ -109,50 +109,33 @@ def get_symbol_parents(item, root=None, enable_choice=False):
> >
> >
> >  def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
> > -                          enable_choice=False, sorted=True, sub_menu=True,
> > +                          format_func=lambda x: "",
> 
> usually for default lambda function, I set: lambda x: x

But I do not want it to return anything, I want it to return a string.

Or do you expect that an exception would be thrown out in case an object
is used that is not a string later in the call chain? I don't like that
too much...

Alternatively, as Maxime said on IRC, I coiuld just set it to None, and
get an exception if it is no passed by the caller.

Except (aha!) setting it to a lambda makes it explicit it has to be a
function.

So, OK, I'll use your default lambda. At least, we'd get an exception if
someone forgets to pass the function.

> > @@ -180,22 +163,22 @@ class Buildroot:
> >              'filename': "package-list",
> >              'root_menu': "Target packages",
> >              'filter': "_is_real_package",
> > +            'format': '_format_symbol_prompt_location',
> 
> For dictionary, usually, single-quotes are used for the key and
> double-quotes for the value (when it's a string), though both single
> and double quote can be used in both cases (key and value).
> Here my point is more about consistency with the rest of the file.

Yep, fixed the three.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
