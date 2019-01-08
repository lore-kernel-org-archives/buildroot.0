From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 18:30:08 +0100
Subject: [Buildroot] [PATCH 09/19] support: add parser in python for
 packages-file-list files
In-Reply-To: <20190108162932.GJ19623@scaer>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <e7e1c2fbfe91efe150ea94270b60f477d131fa09.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LUTE+HoEqZPAvSLgo4MEUjAX8TJPWV3Nku5+CRbS+Ookg@mail.gmail.com>
 <20190108162932.GJ19623@scaer>
Message-ID: <CAAXf6LUGXZdktzOyxFK6FKNhALWXj6U44M9JM18d3mxBVej+Mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 8 ene. 2019 a las 17:29, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas DS, All,
>
> On 2019-01-08 14:35 +0100, Thomas De Schampheleire spake thusly:
> > El lun., 7 ene. 2019 a las 23:06, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> [--SNIP--]
> > > Furthermore, that format is not easily extensible.
> > >
> > > So, introduce a parser, in python, that abstracts the format of these
> > > files, and returns a dictionaries. Using dictionaries makes it easy for
> > returns a dictionary.
>
> Actually, a call to the function will return a list of dictionarries,
> one for each file in the list. They are yielded, so returned one by one
> to iterate over easily, but many dictionaries are returned.
>
> So:   s/a /an iterator to a list of /
>
> (I believe this to be an iterator, right?)

I think it should be 'generator' in Python-terms.

>
> > > +def parse_pkg_file_list(path):
> > > +    with open(path, 'rb') as f:
> >
> > Why exactly do you open as binary?
>
> Because it contains filenames, and filenames are a sequence of bytes,
> not encioded in any way. Filenames can contain 0xbd (? in iso8859-15)
> or it may contain 0x6f65 which is U+0153 encoded in UTF-8. It may even
> contain both. It is not a hypotetical situation, as already encountered
> it more than once.
>
> There is no way we can know the encoding of a filename, so we treat them
> for what they are: sequence of bytes.
>
> > IIRC this will cause the need for decoding the strings on Python 3,
> > which you don't seem to do. This was also the reason why the orginal
> > check-uniq-files needed 'b' markers in front of some strings like
> > b','.
>
> Exactly, and hence the reason that check-uniq-files will try to decide
> those strings.
>
> There might be a gap in the transition, though, as size-stat may need to
> represent those strings when generating the graphs, or generating the
> CVS files... Damned...
>
> > > +        for rec in f.readlines():
> > > +            l = rec.split(',0')
> >
> > This looks wrong to me, there is no text ',0' in the input.
> > I think you meant rec.split(',', 1), no, like in the original code?
>
> Yeah, I borked a rebase at some point...
>
> > > +            d = {
> > > +                  'file': l[0],
> > > +                  'pkg':  l[1],
> >
> > This seems also wrong, 0 and 1 are swapped.
>
> Yeah, I borked a rebase at some point.
>
> > Example input is:
> >
> > busybox,./usr/bin/eject
> > busybox,./usr/bin/basename
> > busybox,./usr/bin/hexedit
> > busybox,./usr/bin/readlink
> > busybox,./usr/bin/cmp
> >
> > so I would expect 'pkg' to be l[0] and 'file' to be l[1].
> >
> > Note that 'l' could perhaps become a more meaningful variable name. I
> > also think that one of the python rules is that variable names should
> > be minimum 3 characters.
>
> So, flake8 does whine about 'l' but not about 'd'. And I borked a rebase
> at some point, where I renamed 'l' and it ended up in a later commit.
>
> I'll fix that here.
>
> > > -    with open(args.packages_file_list[0], 'rb') as pkg_file_list:
> > > -        for line in pkg_file_list.readlines():
> > > -            pkg, _, file = line.rstrip(b'\n').partition(b',')
> > Note that the rstrip of newlines is no longer present in parse_pkg_file_list.
>
> Good catch. I'll fix.
>
> > > +    fname = os.path.join(builddir, "build", "packages-file-list.txt")
> > > +    for record in parse_pkg_file_list(fname):
> > > +        # remove the initial './' in each file path
> > > +        fpath = record['file'].strip()[2:]
> >
> > The stripping here and the rstrip in check-uniq-files could perhaps
> > all be moved to parse_pkg_file_list.
>
> So, I am not sure about this one. I'm not even sure why we don't keep
> the '/' either. After all, they are target files, so they should be
> representable as they appear on the target, i.e. with a leading '/'
>
> In any case, I wanted the introduction of the parser to be a drop-in
> replacement for the existing ad-hoc parsers, as much as possible.
>
> The seamantic of stripping the leading './' can be commonalised (or
> fixed, or dropped) in a later patch, when this series is already big
> enough as it is, and already touching (pun!) touchy (re-pun!) topics.

Note that I only wanted to refer to the strip() call which only strips
whitespace.
The removal of './' is done with '[2:]' which is called 'slicing'.

But, if you are concerned about special filenames, including those
with spaces, then we should not do any stripping on them.

Best regards,
Thomas
