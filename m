From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 May 2018 19:37:58 +0200
Subject: [Buildroot] [PATCH] package/dash: fix parallel build issue
In-Reply-To: <20180529025302.ciikalsiya7yvowf@tarshish>
References: <20180528212019.31614-1-yann.morin.1998@free.fr>
 <20180529025302.ciikalsiya7yvowf@tarshish>
Message-ID: <20180529173758.GB8360@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-05-29 05:53 +0300, Baruch Siach spake thusly:
> On Mon, May 28, 2018 at 11:20:19PM +0200, Yann E. MORIN wrote:
> > Fixes:
> >     http://autobuild.buildroot.org/results/793/7934c815a3009af688c2f1183e67dfe542c9a009/
> >     http://autobuild.buildroot.org/results/fc4/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb/
> >     http://autobuild.buildroot.org/results/6bf/6bfdd44ea5d55a6ca3ef92254eab18c7c0416b7b/
> >     [...]
> > 
> > Reported-by: Baruch Siach <baruch@tkos.co.il>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Baruch Siach <baruch@tkos.co.il>
> > ---
[--SNIP--]
> > + src/Makefile.am | 3 ++-
> 
> This requires AUTORECONF, right?

Oh dang, another case where I git commit --amend but forgot to git add
first...

> We have a patch from Peter that touches the 
> Makefile.in version of the same file. If you add AUTORECONF you would also 
> have to to convert Peter's patch to Makefile.am, otherwise your patch 
> overwrites his changes. See my upstream submission from last week at
> 
>   https://www.spinics.net/lists/dash/msg01629.html

Yeah, but I am withdrawing entirely this patch of mione, because
upstream does not like it and said that we should not build dash in
parallel;

    https://www.mail-archive.com/dash at vger.kernel.org/msg01675.html

So I'll just spin another patch disabling parallel build for dash.

Regards,
Yann E. MORIN.

> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/Makefile.am b/src/Makefile.am
> > +index 46399c7..5bf5a52 100644
> > +--- a/src/Makefile.am
> > ++++ b/src/Makefile.am
> > +@@ -44,7 +44,8 @@ EXTRA_DIST = \
> > + 	mktokens mkbuiltins builtins.def.in mkinit.c \
> > + 	mknodes.c nodetypes nodes.c.pat mksyntax.c mksignames.c
> > + 
> > +-token.h token_vars.h: mktokens
> > ++token_vars.h: token.h
> > ++token.h: mktokens
> > + 	$(SHELL) $^
> > + 
> > + builtins.def: builtins.def.in $(top_builddir)/config.h
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
