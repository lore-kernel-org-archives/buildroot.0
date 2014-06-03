From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Jun 2014 08:10:40 +0200
Subject: [Buildroot] [PATCH 09/11] support/scripts: introduce a symbol
 formatter to generate package lists
In-Reply-To: <CAHXCMM+_bQC7Zb-=DCVeGXezQop4TCy=FgJBeFG-UwhnG1r+tw@mail.gmail.com>
References: <cover.1401743146.git.yann.morin.1998@free.fr>
 <e47f3b1d0a79f0ba4751fdcd9cc8230fbd9642b1.1401743146.git.yann.morin.1998@free.fr>
 <CAHXCMM+_bQC7Zb-=DCVeGXezQop4TCy=FgJBeFG-UwhnG1r+tw@mail.gmail.com>
Message-ID: <20140603061040.GA8994@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-06-03 00:53 +0200, Samuel Martin spake thusly:
> On Mon, Jun 2, 2014 at 11:06 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > @@ -324,6 +307,47 @@ class Buildroot:
> >              label += " *(deprecated)*"
> >          return label
> >
> > +    def _format_symbol_prompt(self, what=None, symbol=None, root=None,
> > +                                    enable_choice=False, header=None,
> > +                                    get_label_func=lambda x: x):
> > +        if what is None:
> > +            raise Exception("Don't know what to format")
> > +
> > +        if what == "layout":
> > +            return ( "30%", "^1" )
> > +
> > +        if what == "header":
> > +            return "| {0:<40}\n".format(header)
> > +
> > +        if what == "symbol":
> > +            return "| {0:<40}\n".format(get_label_func(symbol))
> > +
> > +        raise Exception("Don't know how to format '%s'" % str(what))
> > +
> > +    def _format_symbol_prompt_location(self, what=None, symbol=None, root=None,
> > +                                             enable_choice=False, header=None,
> > +                                             get_label_func=lambda x: x):
> > +        if what is None:
> > +            raise Exception("Don't know what to format")
> > +
> > +        if what == "layout":
> > +            return ( "100%", "^1,4" )
> > +
> > +        if what == "header":
> > +            if hasattr(root, "get_title"):
> > +                loc_label = get_symbol_parents(root, None, enable_choice=enable_choice)
> > +                loc_label += [root.get_title(), "..."]
> > +            else:
> > +                loc_label = ["Location"]
> > +            return "| {0:<40} <| {1}\n".format(header, " -> ".join(loc_label))
> > +
> > +        if what == "symbol":
> > +            parents = get_symbol_parents(symbol, root, enable_choice)
> > +            return "| {0:<40} <| {1}\n".format(get_label_func(symbol),
> > +                                               " -> ".join(parents))
> > +
> > +        raise Exception("Don't know how to format '%s'" % str(what))
> 
> Raising an exception if 'what' is None, and raising an exception when
> it  has an invalid value seems a bit overkill to me... ;-)
> 
> I would drop the None-check, and make the exception message more
> helpful in invalid case:
> 
>   message = "Invalid argument 'what': '%s'\n" % str(what)
>   message += "Allowed values are: 'layout', 'header' and 'symbol'"
>   raise Exception(message)

But then, what happens if 'what' is in fact None, and we compare it to a
string? Does Python automagically convert None to an empty string
(whatever that might be in Python)?

OK, I'll give it a shot...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
