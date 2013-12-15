From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 20:54:39 +0100
Subject: [Buildroot] [PATCH] manual: add section about dealing
	efficiently with big image files
In-Reply-To: <1387133792-32363-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 15 Dec 2013 19:56:32 +0100")
References: <1387133792-32363-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k3f5vqio.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > As reported by Ryan, it is not well-known that most tools can deal
 > efficiently with big sparse files.

 > Add a section in the manual about this, with three tools as examples,
 > and a hint to the man pages for the others.

...

 > +* +tar+ accepts the +-S+ option to tell it to only store non-zero blocks
 > +  of sparse files:
 > +** +tar cf archive.tar -S [files...]+ will efficiently store sparse files
 > +   in a tarball
 > +** +tar xf archive.tar -S+ will efficiently store sparse files extracted
 > +   from a tarball
 > +
 > +* +cp+ accepts the +--sparse=WHEN+ option (+WHEN+ is one of +auto+,
 > +  +never+ or +always+):
 > +** +cp --sparse=always source.file dest.file+ will make +dest.file+ a
 > +   sparse file if +source.file+ has long runs of zeroes
 > +
 > +* +dd+ accepts the +sparse+ value in a +conv+ list (specifying the
 > +  block-size is recommended):

We should probably note that these things are only supported by (recent
versions of ) the big GNU versions of the tools, not the busybox variant
(which people are likely to be using).


 > +** +dd if=image.file of=/dev/device bs=131072 conv=sparse+ will only
 > +   write to +/dev/device+ the blocks of +image.file+ that are not made
 > +   only of zeroes

Is that safe advise when writing to devices? If the image file contains
128K of spaces in the used part of the filesystem (E.G. as part of a
file or in the block bitmap or wherever), then that data will not be
written and you will instead read back whatever was at that location in
the device before.

I think that you should be using bigger block sizes, tools that
understand the filesystem layout or resize afterwards (E.G. resize2fs)
instead.

-- 
Bye, Peter Korsgaard
