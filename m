From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 6 Nov 2015 03:49:47 +0100
Subject: [Buildroot] [PATCH] package/openvmtools: does not build with
 uClibc
In-Reply-To: <20151102213335.4aca2400@free-electrons.com>
References: <1446309491-24752-1-git-send-email-yann.morin.1998@free.fr>
 <20151102213335.4aca2400@free-electrons.com>
Message-ID: <20151106024946.GJ21428@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Yann,
> 
> On Sat, 31 Oct 2015 17:38:11 +0100, Yann E. MORIN wrote:
> > On glibc 2.4+, openvmtools uses euidaccess(), which is not implemented
> > on uClibc.
> > 
> > But since uClibc fakes being a glibc-3.10, openvmtools believes it can
> 
> s/3.10/2.10/.
> 
> > use euidaccess(), and thus we get a linking error.
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/results/779/779bed269982f0b2e04baecae2e720d602319552/
> >     http://autobuild.buildroot.org/results/860/8609823e35115f07b0f16f0a1831201aa1cf9e3c/
> >     http://autobuild.buildroot.org/results/f57/f572573c5f7f9206e0a8309b535a7c633a2d6b16/
> >     ...
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > ---
> > Note; an alternate solution would be to patch openvmtools to not use
> > euidaccess with uClibc as well. But I'm warry of patching. After all, a
> > package that deals with virtual machines is not really size-sensitive,
> > so it is not completely stupid to disable it with uClibc, and require
> > either glibc or musl...
> 
> I've applied the patch after fixing 2.10 typo, thanks!
> 
> However, it is interesting to see the type of build issues that we've
> discovered since uClibc pretends to be glibc 2.10.
> 
> But oh well, those packages simply get what they merit: instead of
> doing proper configure.ac checks, they do some stupid version-based
> checking. Which is doomed to fail at some point.

I think I will add euidaccess() to the next uClibc-ng release.
The musl implementation for example is pretty small, just a wrapper around
faccessat().

best regards
 Waldemar
