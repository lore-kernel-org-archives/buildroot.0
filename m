From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 21:46:38 +0100
Subject: [Buildroot] [PATCH 10/19] support: rewrite check-bin-arch in
 python
In-Reply-To: <20190108203349.GE4022@scaer>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <638ba4cafb8ab013365ae54a393b49f459bc6e74.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LWfY8QkcveMUUgBKjBa+2TnRDoG-nHUXo7eiSZ=R7cfyQ@mail.gmail.com>
 <20190108163752.GK19623@scaer>
 <CAAXf6LXRLz7OO3-O7vByjodXF3DBO7DhAEqjaZdJ6jv-DuUAfQ@mail.gmail.com>
 <20190108203349.GE4022@scaer>
Message-ID: <CAAXf6LVB+OK8AoA_eWwG0oTz+iOYrGDJzWNGrkhc9RXrBFv=Lg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 8 ene. 2019 a las 21:33, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas DS, All,
>
> On 2019-01-08 18:22 +0100, Thomas De Schampheleire spake thusly:
> > El mar., 8 ene. 2019 a las 17:37, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> [--SNIP--]
> > > > Note that I think that performance will be better with a list
> > > > comprehension instead of explicit for's. Something like (untested):
> > > >
> > > > valid_records = [ record for record in parse_pkg_file_list(args.pkg_list)
> > > >             if record['pkg'] == args.package
> > > >             and not any(ignore_re.match(record['file']) for ignore_re
> > > > in ignores_re) ]
> > >
> > > Sorry, but this is totally illegible to me.
> >
> > :-D
> >
> > Ok, I won't argue about the fact itself.
> > Just, as a reference, small decomposition:
> >
> > list = [ f(x) for x in otherlist ]
> >
> > is a 'list comprehension' and is a performant way to generate a list
> > without requiring a for loop.
> > f(x) can be any action on x, e.g. x.strip() or more complex
> > expressions involving x.
>
> Yeah, I know what it is [0], and I can actually decipher the code above
> with quite a bit of mental processing. But that is it: it's deciphering,
> not reading.
>
> [0] I even use them: https://patchwork.ozlabs.org/patch/1021622/
>
> [--SNIP--]
> > Here, any(x) is a function that takes an iterable (x) and returns True
> > if any of the items in 'x' evaluate to True.
>
> Ah, I did not know about any() (although I did infer its behaviour from
> its name!) Thanks! :-)
>
> > Similar to any(x) there is also all(x) which only returns True if
> > _all_ items in x evaluate to True.
>
> And is there none() ? ;-) I guess it's "not all()"...

none() does not exist but if you intend what I understand by its name
then it is:
'not any()'

>
> > The value passed to 'any' is '(ignore_re.match(record['file']) for
> > ignore_re in ignores_re)'
> > which itself is a type of list comprehension, except that it actually
> > is a generator comprehension. 'generator' is what you called an
> > 'iterator' in another patch: a thing that 'yields' values one by one.
>
> Yep, generator, not iterator.
>
> [--SNIP--]
> > I hope it makes things a bit more clear :)
>
> As I said, I can actually decipher it (well, once the indentation if
> fixed anyway! ;-) ), but still it is less readable for me...
>
> And since I would have hard a time justifying it, or would have a hard
> time maintaining it in the future, I prefer writing (and thus keeping)
> code that I can work with later.
>
> If others find the comprehensions easier to comprehend (pun), then fine,
> but I would be much less at ease with that.

By all means, keep your original code.

At least by talking about it, we have learnt each other's views and
shared some knowledge :-)

Best regards,
Thomas
