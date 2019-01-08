From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 17:37:52 +0100
Subject: [Buildroot] [PATCH 10/19] support: rewrite check-bin-arch in
 python
In-Reply-To: <CAAXf6LWfY8QkcveMUUgBKjBa+2TnRDoG-nHUXo7eiSZ=R7cfyQ@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <638ba4cafb8ab013365ae54a393b49f459bc6e74.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LWfY8QkcveMUUgBKjBa+2TnRDoG-nHUXo7eiSZ=R7cfyQ@mail.gmail.com>
Message-ID: <20190108163752.GK19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-01-08 15:56 +0100, Thomas De Schampheleire spake thusly:
> El lun., 7 ene. 2019 a las 23:05, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
[--SNIP--]
> > Rewrite that script in python.
[--SNIP--]
> > +def main():
> > +    parser = argparse.ArgumentParser()
> > +    parser.add_argument('--package', '-p', metavar='PACKAGE', required=True)
> > +    parser.add_argument('--pkg-list', '-l', metavar='PKG_LIST', required=True)
> > +    parser.add_argument('--readelf', '-r', metavar='READELF', required=True)
> > +    parser.add_argument('--arch', '-a', metavar='ARCH', required=True)
> > +    parser.add_argument('--ignore', '-i', metavar='PATH', action='append')
> I think the above 'metavar' options are not necessary, as they are the
> default value.

I'll check and drop if they indeed are not.

> > +    args = parser.parse_args()
> > +
> > +    if args.ignore is not None:
> > +        # Ensure we do have single '/' as separators, and that we have a
> > +        # leading and a trailing one, then append to the global list.
> > +        for pattern in args.ignore:
> > +            IGNORES.add(re.sub('/+', '/', '/{0}/'.format(pattern)))
> Note that the global list itself does not have trailing slashes. This
> seems inconsistent to me.

It is inconsistent, but I kept the existing behaviour intact as much as
possible, so the python script is a drop-in replacement for the shjell
script, with the same semantics.

> > +    ignores_re = set()
> > +    for i in IGNORES:
> > +        ignores_re.add(re.compile(i))
> > +
> > +    arch_re = re.compile('^  Machine: +(.+)')
> > +
> > +    target_dir = os.environ['TARGET_DIR']
> > +
> > +    exit_code = 0
> > +    for record in parse_pkg_file_list(args.pkg_list):
> > +        if record['pkg'] != args.package:
> > +            continue
> > +
> > +        fpath = record['file']
> > +
> > +        ignored = False
> > +        for i in ignores_re:
> > +            if i.match(fpath):
> > +                ignored = True
> > +                break
> > +        if ignored:
> > +            continue
> 
> We can never get into this if, right?, because there is already a
> break whenever ignored is set to True.

Yes we can, because the break only applied to the inner-most loop, which
is the one that iterates over the ignores regexps.

> Note that I think that performance will be better with a list
> comprehension instead of explicit for's. Something like (untested):
> 
> valid_records = [ record for record in parse_pkg_file_list(args.pkg_list)
>             if record['pkg'] == args.package
>             and not any(ignore_re.match(record['file']) for ignore_re
> in ignores_re) ]

Sorry, but this is totally illegible to me.

> for record in valid_records:
>     ...
> 
> 
> You can normally swap the [ ] for ( ) to reduce memory consumption
> (generator iso list comprehension, yielding one entry at a time).
> 
> You can argue about readability, but for me this is not less readable
> than the expanded version.

Well, for me your version is totally unredable, sorry... :-/

The one I wrote at least clearly describes what it is doing:

  - for each record in the list:

    - check if the package is the one we're looking at, if not continue to
      next record

    - for each regecp to ignore, check if the filename matches it, and
      if one is matched, memorizre the fact and break the loop (fast-path).

    - if the file is to be ignored, continue to the next record

and so on...

The size argument is moot IMO, because we do not have thousands of
regexps to ignore, and the parse_pkg_file_list() already yields its
results.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
