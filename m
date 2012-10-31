From: Alexander Khryukin <alexander@mezon.ru>
Date: Wed, 31 Oct 2012 16:19:09 +0400
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <201210311313.45723.yann.morin.1998@free.fr>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
 <20121031114118.GF30343@sapphire.tkos.co.il>
 <1351684586.28325.2.camel@localhost>
 <201210311313.45723.yann.morin.1998@free.fr>
Message-ID: <1351685949.28325.4.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? ??., 31/10/2012 ? 13:13 +0100, Yann E. MORIN ?????:
> Alexander, All,
> 
> On Wednesday 31 October 2012 12:56:26 Alexander Khryukin wrote:
> > ? ??., 31/10/2012 ? 13:41 +0200, Baruch Siach ?????:
> > > Hi Alexander,
> > > 
> > > On Wed, Oct 31, 2012 at 02:32:08PM +0300, Alexander Khryukin wrote:
> > > > I'm trying to build busybox with glibc
> > > > and faced with error
> > > > 
> > > > util-linux/mount.c:140:22: fatal error: rpc/rpc.h: No such file or directory
> > > 
> > > glibc version newer than 2.13 omits built time support for RPC. See 
> > > http://sourceware.org/ml/crossgcc/2011-09/msg00005.html.
> > > 
> > > > Does anybody have any solution?
> > > 
> > > This is a toolchain level problem. Either downgrade to a toolchain with 2.13 
> > > glibc, or use a toolchain with tirpc.
> > > 
> > > baruch
> 
> > Hi, thanks for answer.
> > I compiled toolchain via crosstool-ng
> > 
> > 
> > [me at kvm-host crosstool-ng-linaro]$ find . -name rpc.h
> > ./.build/src/gcc-linaro-4.7-2012.09/fixincludes/tests/base/rpc/rpc.h
> > ./.build/src/glibc-2.14.1/sunrpc/rpc/rpc.h
> > ./.build/src/glibc-2.14.1/include/rpc/rpc.h
> > 
> > Seems to be rpc.h headers exist in glibc dir
> > but buildroot not understand it.
> 
> As Baruch said, it's because glibc-2.14 (and above) do *not* *install* the
> rpc headers. What you point at is the *source* tree of glibc (and gcc, but
> that's irrelevant). When you *run* the toolchain, those are *not* the
> locations searched for; the headers are looked for in the *sysroot* of the
> toolchain, which you can find as a second-level sub-directory in the prefix
> you installed the toolchain in.
> 
> So, Baruch is right: either downgrade your toolchain to use glibc-2.13,
> or try to use TIRPC. As TIRPC is not yet, AFAIK, at par with glibc's
> implementation, the only sane option so far *is* to downgrade your glibc.
> 
> You can of course also search the archives of the buildroot mailing list,
> there are a lot of such reports, and each time the same explanations were
> re-hashed again and again.
> 
> Also, search the Internet (eg. with google and these keywords: glibc rpc
> not available, there are literally *tons* of answers; also, search on
> LWN.net, they've had quite a few very good articles on the sunject).
> 
> And no, switching to using eglibc instead will not fix it. Neither will
> updating to a newer version (although I think glibc-2.16 did restore this,
> but it's not available from ct-ng, by lack of interest it seems, as nobody
> did feel necessary to post any patch to add latest glibc in ct-ng).
> 
> ;-)
> 
> Regards,
> Yann E. MORIN.


Hm, i'm prepared little patch for glibc package
that updates glibc to 2.16.0 in buildroot
but rpc.h still not included.
