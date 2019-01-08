From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 18:22:47 +0100
Subject: [Buildroot] [PATCH 10/19] support: rewrite check-bin-arch in
 python
In-Reply-To: <20190108163752.GK19623@scaer>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <638ba4cafb8ab013365ae54a393b49f459bc6e74.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LWfY8QkcveMUUgBKjBa+2TnRDoG-nHUXo7eiSZ=R7cfyQ@mail.gmail.com>
 <20190108163752.GK19623@scaer>
Message-ID: <CAAXf6LXRLz7OO3-O7vByjodXF3DBO7DhAEqjaZdJ6jv-DuUAfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 8 ene. 2019 a las 17:37, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> On 2019-01-08 15:56 +0100, Thomas De Schampheleire spake thusly:
> > El lun., 7 ene. 2019 a las 23:05, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> [--SNIP--]
> > > Rewrite that script in python.
> [--SNIP--]
> > > +def main():
> > > +    parser = argparse.ArgumentParser()
> > > +    parser.add_argument('--package', '-p', metavar='PACKAGE', required=True)
> > > +    parser.add_argument('--pkg-list', '-l', metavar='PKG_LIST', required=True)
> > > +    parser.add_argument('--readelf', '-r', metavar='READELF', required=True)
> > > +    parser.add_argument('--arch', '-a', metavar='ARCH', required=True)
> > > +    parser.add_argument('--ignore', '-i', metavar='PATH', action='append')
> > I think the above 'metavar' options are not necessary, as they are the
> > default value.
>
> I'll check and drop if they indeed are not.
>
> > > +    args = parser.parse_args()
> > > +
> > > +    if args.ignore is not None:
> > > +        # Ensure we do have single '/' as separators, and that we have a
> > > +        # leading and a trailing one, then append to the global list.
> > > +        for pattern in args.ignore:
> > > +            IGNORES.add(re.sub('/+', '/', '/{0}/'.format(pattern)))
> > Note that the global list itself does not have trailing slashes. This
> > seems inconsistent to me.
>
> It is inconsistent, but I kept the existing behaviour intact as much as
> possible, so the python script is a drop-in replacement for the shjell
> script, with the same semantics.
>
> > > +    ignores_re = set()
> > > +    for i in IGNORES:
> > > +        ignores_re.add(re.compile(i))
> > > +
> > > +    arch_re = re.compile('^  Machine: +(.+)')
> > > +
> > > +    target_dir = os.environ['TARGET_DIR']
> > > +
> > > +    exit_code = 0
> > > +    for record in parse_pkg_file_list(args.pkg_list):
> > > +        if record['pkg'] != args.package:
> > > +            continue
> > > +
> > > +        fpath = record['file']
> > > +
> > > +        ignored = False
> > > +        for i in ignores_re:
> > > +            if i.match(fpath):
> > > +                ignored = True
> > > +                break
> > > +        if ignored:
> > > +            continue
> >
> > We can never get into this if, right?, because there is already a
> > break whenever ignored is set to True.
>
> Yes we can, because the break only applied to the inner-most loop, which
> is the one that iterates over the ignores regexps.

Ok, I see.

>
> > Note that I think that performance will be better with a list
> > comprehension instead of explicit for's. Something like (untested):
> >
> > valid_records = [ record for record in parse_pkg_file_list(args.pkg_list)
> >             if record['pkg'] == args.package
> >             and not any(ignore_re.match(record['file']) for ignore_re
> > in ignores_re) ]
>
> Sorry, but this is totally illegible to me.

:-D

Ok, I won't argue about the fact itself.
Just, as a reference, small decomposition:

list = [ f(x) for x in otherlist ]

is a 'list comprehension' and is a performant way to generate a list
without requiring a for loop.
f(x) can be any action on x, e.g. x.strip() or more complex
expressions involving x.

The 'for x in otherlist' can be restricted further with 'if' clauses.
In the code I gave above, the base list is the return value of
'parse_pkg_file_list(..)' and it is filtered by two clauses.
The first one:
    record['pkg'] == args.package
only preserves entries in the base list that match the package we are
interested in.
This is the equivalent of:
       if record['pkg'] != args.package:
           continue

and the second clause:
    not any(ignore_re.match(record['file']) for ignore_re in ignores_re)

Here, any(x) is a function that takes an iterable (x) and returns True
if any of the items in 'x' evaluate to True.
Similar to any(x) there is also all(x) which only returns True if
_all_ items in x evaluate to True.

The value passed to 'any' is '(ignore_re.match(record['file']) for
ignore_re in ignores_re)'
which itself is a type of list comprehension, except that it actually
is a generator comprehension. 'generator' is what you called an
'iterator' in another patch: a thing that 'yields' values one by one.
The difference does not really matter for this discussion, so the base
format is still:

f(x) for x in some_iterable

Here f(x) is ignore_re.match(..) and x is 'ignore_re' itself.

So the following code:
    valid_records = [ record for record in parse_pkg_file_list(args.pkg_list)
                      if record['pkg'] == args.package
                      and not any(ignore_re.match(record['file']) for
ignore_re in ignores_re) ]

naturally reads as:

valid_records  is the list of records returned by parse_pkg_file_list
for which the 'pkg' field is the one we want, and not any of our
ignore expression matches the 'file' field of the record.

I hope it makes things a bit more clear :)

/Thomas
