From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2012 16:36:15 +0200
Subject: [Buildroot] [PATCH 20/20] external-toolchain: add Sourcery
	CodeBench ARM 2012.03
In-Reply-To: <20120822155122.2cf57b60@skate>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <CAHkwnC8sEW3NSwCKpfMwbGWbJgVQ_zKKga5kRduutvFUnPKNqg@mail.gmail.com>
 <20120822155122.2cf57b60@skate>
Message-ID: <201208221636.16437.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabio, All,

On Wednesday 22 August 2012 15:51:22 Thomas Petazzoni wrote:
> Le Wed, 22 Aug 2012 10:46:49 +0200,
> Fabio Porcedda <fabio.porcedda@gmail.com> a ?crit :
> 
> > I've discovered only today that this toolchain has already the rpc library...
> > so the test fail because the rpc/rpc.h header it's present.
> > 
> > getting-started.pdf:
> > A.1.1. Changes in Sourcery CodeBench Lite 2012.03-57
> > ...
> > RPC library functions. GLIBC has been changed so that programs may
> > again be built to use its
> > RPC library functions. The ability to build programs using these
> > functions had previously been dis-
> > abled.
> 
> Argh, so they brought back RPC support into glibc... sigh.

Yes, since the change in maintainership, they've reinstated RPC support:
    http://sourceware.org/git/?p=glibc.git;a=commit;h=021db4be6f1f4189f66feee066a495d49e92b93e

In fact, RPC was not gone. The RPC libraries were still built and
installed, so programs already built would still run, but the headers
were not installed, so no new package could be compiled.

That's just the headers insallation that was reinstated.

> > IMHO there are two solutions:
> > a) update this patch to enable the BR2_TOOLCHAIN_HAS_NATIVE_RPC
> > b) apply as is directly on the next branch and change accordingly the commit:
> > commit 80f89c34315be739c52935f1b0606dc5531e6eb3
> > Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Date:   Sat Aug 11 18:50:42 2012 +0200
> > 
> >     toolchain-external: improve glibc support to test availability of RPC
> > 
> > Let me know which one solution you prefer.
> 
> I'm a bit hesitant here. If newer glibc toolchains re-include the RPC
> support, is it worth supporting libtirpc and do all the changes I had
> proposed? Or should we just give up and say we only support
> glibc toolchains that include RPC support? Maybe not nice, since
> libtirpc brings quite a few features compared to in-toolchain RPC
> support.
> 
> Comments from others?

In glibc, RPC is now considered obsolete, and still planned for removal,
albeit no time-line exists AFAIK.

So, although glibc now again installs RPC headers, I think working on
the libtirpc replacement is still the way to go. It's just that it's less
critical for now.

Also, there is currently no provision in crosstool-NG to build glibc/eglibc
with --enable-obsolete-rpc (although that should be easy to add; will do
shortly).

In the end, I don not think that your work on libtirpc is still valuable,
because at the very least, it offers some insights on the road to go, and
even provides a good overview of the issues at hand, and how to possibly
solve those.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
