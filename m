From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Dec 2013 23:25:21 +0100
Subject: [Buildroot] [PATCH] manual: add section about dealing
 efficiently with big image files
In-Reply-To: <87k3f5vqio.fsf@dell.be.48ers.dk>
References: <1387133792-32363-1-git-send-email-yann.morin.1998@free.fr>
 <87k3f5vqio.fsf@dell.be.48ers.dk>
Message-ID: <20131215222521.GB3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-12-15 20:54 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > As reported by Ryan, it is not well-known that most tools can deal
>  > efficiently with big sparse files.
> 
>  > Add a section in the manual about this, with three tools as examples,
>  > and a hint to the man pages for the others.
> 
> ...
> 
>  > +* +tar+ accepts the +-S+ option to tell it to only store non-zero blocks
>  > +  of sparse files:
>  > +** +tar cf archive.tar -S [files...]+ will efficiently store sparse files
>  > +   in a tarball
>  > +** +tar xf archive.tar -S+ will efficiently store sparse files extracted
>  > +   from a tarball
>  > +
>  > +* +cp+ accepts the +--sparse=WHEN+ option (+WHEN+ is one of +auto+,
>  > +  +never+ or +always+):
>  > +** +cp --sparse=always source.file dest.file+ will make +dest.file+ a
>  > +   sparse file if +source.file+ has long runs of zeroes
>  > +
>  > +* +dd+ accepts the +sparse+ value in a +conv+ list (specifying the
>  > +  block-size is recommended):
> 
> We should probably note that these things are only supported by (recent
> versions of ) the big GNU versions of the tools, not the busybox variant
> (which people are likely to be using).

As said on IRC: this is about handling those files at build time, not
on the target.

>  > +** +dd if=image.file of=/dev/device bs=131072 conv=sparse+ will only
>  > +   write to +/dev/device+ the blocks of +image.file+ that are not made
>  > +   only of zeroes
> 
> Is that safe advise when writing to devices? If the image file contains
> 128K of spaces in the used part of the filesystem (E.G. as part of a
> file or in the block bitmap or wherever), then that data will not be
> written and you will instead read back whatever was at that location in
> the device before.

Yes, that's true. But those are just example on how to handle big sparse
files, an in no way the recommended way of flashing a device.

I'll remove it before re-submitting. After all, we hint to the man pages
of other tools, so it's thoroughly documented. And if anyone if foolish
enough to try that, then we can say 'we never wrote that!' :-)

> I think that you should be using bigger block sizes, tools that
> understand the filesystem layout or resize afterwards (E.G. resize2fs)
> instead.

Not sure I follow you on that one. What if the user enters a large
number of blocks for his ext2 filesystem? Those will be empty
(zero-filled), but the image file will not be made sparse. So there is
no 'fs resize' or such in the process.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
