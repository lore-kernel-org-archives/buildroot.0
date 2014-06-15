From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 15 Jun 2014 23:28:49 +0200
Subject: [Buildroot] [PATCH 04/20 RFC] support/gen-manual-lists.py:
 rework generating the virtual package list
In-Reply-To: <20140615210617.GE3568@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
 <0f4e35d86197b6262e55421a724267d92f642c96.1402699915.git.yann.morin.1998@free.fr>
 <CAHXCMM+yNGSNEpSwz6BxkCyKo9Kwi3ERyoYGnuNZ9c=KDgNh7g@mail.gmail.com>
 <20140615210617.GE3568@free.fr>
Message-ID: <CAHXCMMJ5igRRTi6QgR5dZJVK7P-hR+g0rSQKLvxNSke=QqFjVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 15, 2014 at 11:06 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2014-06-15 22:18 +0200, Samuel Martin spake thusly:
>> On Sat, Jun 14, 2014 at 1:02 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [--SNIP a lot of typoes--]
>
> OK, will fix all of those.
>
>> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > ---
>> >  support/scripts/gen-manual-lists.py | 88 +++++++++++++++++++++++++++++++------
>> >  1 file changed, 74 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
>> > index 95c10dc..837cd66 100644
>> > --- a/support/scripts/gen-manual-lists.py
>> > +++ b/support/scripts/gen-manual-lists.py
> [--SNIP yet another bunch of typoes--]
>
> OK, will fix.
>
>> > +                if parent_pkg is not None:
>> > +                    providers_syms_w_opts.append( (parent_pkg,sym) )
>> space after ','
>
> I was wondering what was the coding rule when an argument is a tuple.
> Usually, we do not have a space after anopening brace, or before a
> closing brace. But it looks strange when the (only) arg is a tuple.
>
> Should I write:
>     .append( (parent_pkg, sym) )
> or:
>     .append((parent_pkg, sym))
> ?

Usually there is no space between the function's brackets and the
tuple's ones, though I'm ok with space since it may improve
readability.

>
>> > +            # Finally, complete with the list of providers without option
>> > +            for p in providers_syms:
>> > +                if p in seen:
>> > +                    continue
>> > +                _p = re.sub(r"^BR2_PACKAGE_(.*)", r"\1", p.get_name()).lower()
>> > +                providers_str.append(_p)
>> hum... here, you _p is the low-case symbol name (without the
>> BR2_PACKAGE_ prefix), not exactly the package name (e.g. for
>> rpi-userland, you get "rpi_userland",= instead of "rpi-userland"). Or
>> am I missing something?
>
> Doh. That's right... Good catch. I'll (try to) fix that.
>
>> > +
>> > +            return providers_str
>> > +
>> > +        # This functions return a list of all symbols that have a prompt,
>> > +        # and that 'select' the given symbol
>> > +        def _get_selecting_symbols_with_prompt(symbol):
>> It's a bit weird to have the definition of this function after you use
>> it  (in the previous on), but python allows this ;-)
>
> Well, do we want all functions to be defined before (code-wise) we call
> them, or do we prefer to have the important functions come first?

Well, your call ;-)

>
> I usually tend to the latter. But I'll move the functions.
>
> Thank you for the reviews! :-)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Samuel
