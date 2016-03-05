From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 05 Mar 2016 21:10:07 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-27
In-Reply-To: <56D385A7.9050804@mind.be>
References: <20160228073020.78AB7101EC4@stock.ovh.net>
 <1456651515.13955.2.camel@embedded.rocks> <87y4a5p3w5.fsf@dell.be.48ers.dk>
 <1456658221.13955.7.camel@embedded.rocks> <56D30D11.3030907@mind.be>
 <1456674270.13955.11.camel@embedded.rocks> <56D385A7.9050804@mind.be>
Message-ID: <1457208607.1867.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2016-02-29 at 00:41 +0100, Arnout Vandecappelle wrote:
> On 02/28/16 16:44, J?rg Krause wrote:
> > 
> > On So, 2016-02-28 at 16:06 +0100, Arnout Vandecappelle wrote:
> > > 
> > > On 02/28/16 12:17, J?rg Krause wrote:
> > > > 
> > > > 
> > > > On So, 2016-02-28 at 10:42 +0100, Peter Korsgaard wrote:
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks>
> > > > > > > > > > writes:
> > > > > ?> On So, 2016-02-28 at 08:30 +0100, Thomas Petazzoni wrote:
> > > > > ?>>??
> > > > > ?>>??????powerpc |????????????????????czmq-v3.0.2 | NOK |
> > > > > ?>> http://autobuild.buildroot.net/results/2061238affb685db99
> > > > > 8100a56c6571538d089a5b/
> > > > > 
> > > > > ?> /home/test/autobuild/instance-3/output/host/usr/powerpc-
> > > > > buildroot-linux-
> > > > > uclibc/sysroot/usr/lib/libstdc++.a(compatibility-ldbl.o): In
> > > > > function `std::tr1::hash<long double>::operator()(long
> > > > > double) const':
> > > > > ?> compatibility-ldbl.cc:(.text._ZNKSt3tr14hashIeEclEe+0x3c): 
> > > > > undefined reference to `frexpl'
> > > > > 
> > > > > ?> I cannot reproduce it on my 64-bit host.
> [snip]
> > 
> > That's why I sent a patch with LIBS=-lm.
> ?The problem turns out to be more complicated... It's actually a
> problem with
> libstdc++. Dependeing on the arch, some functions will be in
> compatibility-ldbl.o. If you use any of these functions, that file
> will be
> linked in. And when that file is linked in, all the _other_
> functions, which you
> actually don't use, are also linked in. And one of these functions is
> the
> template function hash<long double>::operator(), which uses frexpl.
> 
> ?So, requiring czmq to link with -lm is a bit weird, given that
> neither itself,
> nor any of its dependencies really need it...
> 
> ?So ideally it should be fixed in libstdc++ itself. But I have no
> idea how to do
> that...

Building czmq with the latest git HEAD does not throw this error
anymore.

Although, for the current version 3.0.2 disabling the optional binaries
zmakecert and zgossip also helps to build libczmq.la cleanly without
the need to link libmath in. I've sent a patch to disable building both
binaries by default [1].

[1]?http://patchwork.ozlabs.org/patch/592453/

Best regards
J?rg Krause
