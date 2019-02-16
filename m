From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 16 Feb 2019 22:19:02 +0100
Subject: [Buildroot] [PATCH] toolchain-external: restrict copying of
 dynamic loader to ld*.so.*
In-Reply-To: <20190215225301.4d66f516@windsurf.home>
References: <20190205211544.26547-1-patrickdepinguin@gmail.com>
 <20190215225301.4d66f516@windsurf.home>
Message-ID: <CAAXf6LV-=Onf7CYqL+MCYJasY4P-zmFfAK4qE0P-xVwhPkCJ2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

El vie., 15 feb. 2019 a las 22:53, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello,
>
> On Tue,  5 Feb 2019 22:15:44 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
> > ("toolchain-external: copy ld*.so* for all C libraries") changed (among
> > other things) the glob pattern to catch the dynamic loader from
> >     ld*.so.*
> > to
> >     ld*.so*
> >
> > thus now matching files like 'ld-2.20.so' in addition to files like
> > 'ld.so.1'.
>
> I'm curious what is the problem with matching ld-2.20.so, and how can
> this bring more files than needed ?
>
> (Note: I think the change is OK, I just want to understand how you
> noticed.)

In the common case, you have a structure like this:

-rwxr-xr-x 1 tdescham tdescham 834364 Feb 16 21:23 output/target/lib/ld-2.16.so
lrwxrwxrwx 1 tdescham tdescham     10 Feb 16 21:23
output/target/lib/ld.so.1 -> ld-2.16.so

So, a symlink 'ld.so.1' which points to another file. Applications
would have 'ld.so.1' (the link) encoded as program interpreter
(readelf -l <program>, see INTERP entry)

The patterns like 'ld*.so*' are passed as argument to
copy_toolchain_lib_root which is defined in toolchain/helpers.mk.
This macro copy_toolchain_lib_root will find all files/links matching
the pattern. If a match is a regular file, it is simply copied. If it
is a symbolic link, the link is copied and then the logic is
recursively repeated on the link destination. That destination could
either again be a link or a regular file. In the first case we recurse
again, in the latter we stop and continue with the next match of the
pattern.

The problem this patch is solving is when a toolchain does not have
this structure with a link and a real file, but rather two actual
files:

-rwxr-xr-x 1 tdescham tdescham 170892 Feb 16 21:55 output/target/lib/ld-2.20.so
-rwxr-xr-x 1 tdescham tdescham 170892 Feb 16 21:55 output/target/lib/ld.so.1

In this case the pattern 'ld*.so*' would find two regular file matches
and copy both.
On the other hand, the pattern 'ld*.so.*' would only find the
'ld.so.1' file and copy just that. This saves about 170K in rootfs
size.

Closer inspection reveals that this particular toolchain has more such
dedoubled symbolic links, e.g. the standard pattern of
'usr/lib/libfoo.so -> libfoo.so.1 -> libfoo.so.1.0.2' is not present,
and each of these three components are real files. In this particular
case the toolchain is from Freescale, but I don't know if it is
Freescale directly or another company providing toolchains on behalf
of Freescale (I'm not directly involved with this board).

In any case, it is now obvious that the toolchain itself is 'broken'.
Which could mean we shouldn't handle this special case in Buildroot.
Even if we fixed this problem of ld.so, there would still be
duplication in e.g. libstdc++.so.6 / libstdc++.so.6.0.20.
And for my case specifically, we are no longer using this toolchain so
I don't really need it anymore.

On the other hand, I don't know if there are legitimate toolchains
where this pattern occurs.
Moreover, the more restrictive pattern 'ld*.so.*' is all we really
need, so applying this patch also does not hurt.

So, I leave it up to you :-)
If we choose to apply, I can extend the commit message with some of
the info above.

Best regards,
Thomas
