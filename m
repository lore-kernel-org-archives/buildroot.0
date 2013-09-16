From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Sep 2013 09:11:49 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <8738p5lud2.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 15 Sep 2013 22:09:45 +0200")
References: <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk>
Message-ID: <8738p5i6kq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Ralph" == Ralph Siemsen <ralphs@netwinder.org> writes:
 Ralph> The "patch" command returns an error code only if patches fail
 Ralph> to apply. Therefore the pipleline "cat <patchfile> | patch ..."
 Ralph> does not fail, even if <patchfile> is missing. Fix this by
 Ralph> adding an explicit check for patch file existence.

 Ralph> Based on feedback from buildroot mailing list, also change the
 Ralph> existing check for unsupported patch format into a fatal error.
 Ralph> ---

 Ralph> v1. original
 Ralph> v2. error on unsupported patch formats
 Ralph> v3. explicit exit calls

 Peter> Committed, thanks.

 Peter> You forgot to add your 'Signed-off-by' on the patch. I've added it for
 Peter> you, hopefully that is OK?

It unfortunately for the projects using tarballs containing patches,
E.G:

http://autobuild.buildroot.net/results/3d5/3d5f2c960ff2cc2003c9cc68d3a5a48009f5602f/build-end.log

The tarball contains:

debian/
debian/control
debian/postinst
debian/postinst.nfs
debian/source/
debian/source/options
debian/source/format
debian/shlibs
debian/prerm.nfs
debian/rules
debian/postrm
debian/shlibs.nfslock
debian/patches/
debian/patches/07-493462-dotlockfile.c.patch
debian/patches/series
debian/patches/04-505851-remove-debug-code.patch
debian/patches/02-COPYRIGHT.patch
debian/patches/06-493462-dotlockfile.1.patch
debian/patches/09-562937-make-ar-overwrittable.patch
debian/changelog

So a bunch of non-patch files. I guess our best option is to degrade the
"Unsupported format" check to a warning again?

-- 
Bye, Peter Korsgaard
