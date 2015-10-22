From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 23:09:22 +0200
Subject: [Buildroot] [PATCH 01/21 v2] core: do not accept multiple
 definitions of a package
In-Reply-To: <56294EC5.8070909@mind.be>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <1996959fcee1f7bf71e9e8539fa2471fce6b1308.1445545973.git.yann.morin.1998@free.fr>
 <56294EC5.8070909@mind.be>
Message-ID: <20151022210922.GB3797@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-10-22 23:01 +0200, Arnout Vandecappelle spake thusly:
> On 22-10-15 22:33, Yann E. MORIN wrote:
> > One of the selling points for br2-external is to provide a mean to add
> > new packages. However, it is not supported that a package be defined by
> > Buildroot and then redefined in a br2-external tree.
> > 
> > This situation may occur without the user noticing or even willing to
> > redefine the package, for example:
> >   - br2-external is first created against a version of Buildroot
> >   - a package (missing in Buildroot) is added to that br2-external tree
> >   - upstream Buildroot adds this package
> >   - user updates to the new Buildroot
> > 
> > In this case, the result in undefined, and we can't make any guarantee
> > on the result (working or not).
> > 
> > Add a sanity check so that a package redefinition gets caught.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks! :-)

>  For you multi-br2-external haters: please commit independently of be multi-
> feature :-)

Yes, this is independent.

It's in this series because it was prompted by my work on multi-br2-external,
but I could very well have submitted it separately.
 
[--SNIP--]
> > @@ -351,6 +359,7 @@ define inner-generic-package
> >  $(2)_TYPE                       =  $(4)
> >  $(2)_NAME			=  $(1)
> >  $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
> > +$(2)_PKGDIR			=  $(pkgdir)
> 
>  Now we have this variable, it would be nice to replace all occurences of
> $(PKGDIR) with $($(PKG)_PKGDIR) and remove the (IMHO ugly)
> 
> $$($(2)_TARGET_PATCH):                   PKGDIR=$(pkgdir)
> 
> (obviously in a follow-up patch, which I might produce myself if I feel like it).

I already started doing so, jsut to see to what extent that would have
an impact, but it is not ready at all.

I also wanted to replace every occurences of hard-coded paths like:
    package/foo/my-file

with:
    $(FOO_PKGDIR)/my-file

but this is an insane amount of work. I'll cary it if/when this patch is
applied.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
