From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Oct 2015 22:22:02 +0200
Subject: [Buildroot] [PATCH 01/21 v2] core: do not accept multiple
 definitions of a package
In-Reply-To: <CAHXCMMLaPsMp+Xkp0pefeh8uNC4jSG8CxVP-OwErpunv+Uzxqg@mail.gmail.com>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <1996959fcee1f7bf71e9e8539fa2471fce6b1308.1445545973.git.yann.morin.1998@free.fr>
 <CAHXCMMLaPsMp+Xkp0pefeh8uNC4jSG8CxVP-OwErpunv+Uzxqg@mail.gmail.com>
Message-ID: <20151023202202.GB3674@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-10-23 21:39 +0200, Samuel Martin spake thusly:
> On Thu, Oct 22, 2015 at 10:33 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
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
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> 
[--SNIP--]
> > @@ -351,6 +359,7 @@ define inner-generic-package
> >  $(2)_TYPE                       =  $(4)
> >  $(2)_NAME                      =  $(1)
> >  $(2)_RAWNAME                   =  $$(patsubst host-%,%,$(1))
> > +$(2)_PKGDIR                    =  $(pkgdir)
> 
> This change can also provide clean/unique way of handling packages'
> files coming within Buildroot and br2-external trees. :-)
> (I'm not a big fan of the package/foo/foo.conf vs.
> $(BR2_EXTERNAL)/package/bar/bar.conf thing, depending whether foo is
> in the Builldroot tree, and bar in the br2-external one).

See what I already replied to Arnout! ;-)

I don;t like it either, and I'd like we switch to using that variable
instead.

Still, that's pretty much of a change, and Arnout is right: such a bulk
change is not needed right now; we can switch over time, as packages are
updated/fixed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
