From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Aug 2015 13:55:50 +0200
Subject: [Buildroot] [PATCH] package/canfestival: don't build in parallel
In-Reply-To: <20150825121736.0d3982d4@free-electrons.com>
References: <1440279290-18408-1-git-send-email-yann.morin.1998@free.fr>
 <20150825121736.0d3982d4@free-electrons.com>
Message-ID: <20150825115550.GA3794@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-25 12:17 +0200, Thomas Petazzoni spake thusly:
> On Sat, 22 Aug 2015 23:34:50 +0200, Yann E. MORIN wrote:
> > The Makefiles for canfestival are not correctly written, which leads to
> > multiple warnings such as:
> > 
> >     make[4]: warning: jobserver unavailable: using -j1. Add `+' to parent make rule.
> > 
> > Since canfestival is relatively small, it builds in less than 6s here
> > when not in parallell, while a parallel build takes 5s.
> > 
> > Just disable parallel build to avoid future surprises.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Do you actually understand why make is displaying those warning
> messages in the first place?

Yes, and it's a bit tricky.

canfestival indeed uses $(MAKE) everywhere. However, it is using it in a
variable, like so:

    define build_cmds
        $(MAKE) foo
        $(MAKE) bar
    endef

    all:
        $(build_cmds)

Since $(MAKE) is not directly in the rule body, it looses its magic
behaviour. This is explicited said so in the make manual:

    This special feature is only enabled if the MAKE variable appears
    directly in the recipe: it does not apply if the MAKE variable is
    referenced through expansion of another variable.

Ergo.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
