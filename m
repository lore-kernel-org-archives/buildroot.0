From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 18:06:40 +0100
Subject: [Buildroot] [PATCH 3/4] pkg-infra: differentiate remote tarball
 name from local filename
In-Reply-To: <546BB223.9020600@mind.be>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
 <9c560fb0f335f99d5350617f0368ae591e46e837.1416068005.git.yann.morin.1998@free.fr>
 <546BB223.9020600@mind.be>
Message-ID: <20141123170640.GB11143@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-11-18 21:54 +0100, Arnout Vandecappelle spake thusly:
> On 15/11/14 17:19, Yann E. MORIN wrote:
> > Some upstreams may use a naming scheme that does not fit well in how
> > Buildroot wants to handle filenames.
> >
> > For example, GitHub used to have a scheme like:
> >     https://github.com/USER/REPO/archive/VERSION.tar.gz
> >
> > which means we would have a local file named VERSION.tar.gz, when we
> > want to have PKG-VERSION.tar.gz
> >
> > Other forges are also known to have similar schemes. Google Code, for
> > example, may also use similarly named files.
> >
> > Introduce a new variable, FOO_UPSTREAM_SOURCE, which the package may set
> > in that case. If not set, it defaults to FOO_SOURCE.
> 
>  Instead of this, I was thinking of the reverse approach: define FOO_LOCAL_SOURCE.

OK, will change.

> It could possibly even be calculated automatically in pkg-generic.mk. E.g.
> 
> $(2)_LOCAL_SOURCE = \
>     $$(if $$(findstring $(3),$$($(2)_SOURCE)),
>         $$($(2)_SOURCE),
>         $(3)-$$($(2)_SOURCE))
> 
> (and something similar for adding the version, so it should probably be factored
> into a function).

Well, why not just simply revert what I did with _UPSTREAM_SOURCE:

    ifndef $(2)_LOCAL_SOURCE
      $(2)_LOCAL_SOURCE = $$($(2)_SOURCE)
    endif

That's much more readable and simple than the above, given that
$(2)_SOURCE is already auto-computed by tje pkg-generic infra.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
