From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 21:52:51 +0100
Subject: [Buildroot] [PATCH 09/19] support: add parser in python for
 packages-file-list files
In-Reply-To: <CAAXf6LUGXZdktzOyxFK6FKNhALWXj6U44M9JM18d3mxBVej+Mw@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <e7e1c2fbfe91efe150ea94270b60f477d131fa09.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LUTE+HoEqZPAvSLgo4MEUjAX8TJPWV3Nku5+CRbS+Ookg@mail.gmail.com>
 <20190108162932.GJ19623@scaer>
 <CAAXf6LUGXZdktzOyxFK6FKNhALWXj6U44M9JM18d3mxBVej+Mw@mail.gmail.com>
Message-ID: <20190108205251.GF4022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2019-01-08 18:30 +0100, Thomas De Schampheleire spake thusly:
> El mar., 8 ene. 2019 a las 17:29, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
[--SNIP--]
> > Actually, a call to the function will return a list of dictionarries,
> > one for each file in the list. They are yielded, so returned one by one
> > to iterate over easily, but many dictionaries are returned.
> > So:   s/a /an iterator to a list of /
> > (I believe this to be an iterator, right?)
> I think it should be 'generator' in Python-terms.

Generator that is, then. Thanks.

[--SNIP--]
> > > > +    fname = os.path.join(builddir, "build", "packages-file-list.txt")
> > > > +    for record in parse_pkg_file_list(fname):
> > > > +        # remove the initial './' in each file path
> > > > +        fpath = record['file'].strip()[2:]
> > > The stripping here and the rstrip in check-uniq-files could perhaps
> > > all be moved to parse_pkg_file_list.
[--SNIP--]
> Note that I only wanted to refer to the strip() call which only strips
> whitespace.

Right, but then here it is useless to strip() the string, because there
is no leading spaces in file names (they are anchored with a leadin ./
anyway!), and any trailing spaces would *be* part of the filename.

But I just kpet the code as-is and just made the parser part common.
What caller do with the fields is their concerns! ;-)

> But, if you are concerned about special filenames, including those
> with spaces, then we should not do any stripping on them.

I'm not sure why size-stat needed to strip and slice to begin with...

Maybe it was because it was using f.readlines() and used strip() to get
rid of the trailing '\n' ?

Or maybe the other Thomas has a better reminiscence of why he did that
more than three years ago? ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
