From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2015 17:33:36 +0100
Subject: [Buildroot] [PATCH 10/84 RFC] package/angularjs: simplify
 modules selection
In-Reply-To: <56846879.90902@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <ff46e42197b59eabccfd4c74e92c671e0e9f9e1e.1451076704.git.yann.morin.1998@free.fr>
 <56846879.90902@mind.be>
Message-ID: <20151231163336.GA3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-31 00:27 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:24, Yann E. MORIN wrote:
> > Remove the superfluous config option, and make all modules default to
> > 'y', which provides exactly the same functionality.
> > 
> > simplify (and slightly beautofy) the handling of modules in the .mk:
> > since the modules' symbols are always meaningful now, we can get rid of
> > the else-clause, and always build the list of modules using the Kconfig
> > options.
> > 
> > Re-order the list alphabetically (message <-> message-format).
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/angularjs/Config.in    | 35 +++++++++++++++++++++--------------
> >  package/angularjs/angularjs.mk | 24 +++++++++++++++---------
> >  2 files changed, 36 insertions(+), 23 deletions(-)
> > 
> > diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
> > index 206b3d8..ee1dbbf 100644
> > --- a/package/angularjs/Config.in
> > +++ b/package/angularjs/Config.in
> > @@ -7,16 +7,17 @@ menuconfig BR2_PACKAGE_ANGULARJS
> >  
> >  if BR2_PACKAGE_ANGULARJS
> >  
> > -config BR2_ANGULARJS_MODULES
> > -	bool "angularjs modules"
> > -	help
> > -	  Select which modules to install. If disabled, all modules
> > -	  will be installed.
> > +# All the modules default to 'y' to keep backward-compatibility
> 
>  I don't think this comment is needed, because it will no longer be true in the
> future.
> 
> > +# Keep this list in sync and in the same (alphabetical) order as # the
> > +# one in angularjs.mk. However, always keep 'angular' first in the list.
> 
>  I don't think this comment is needed either. We don't have something like that
> at the top of package/Config.in for instance. And it's not that things stop to
> work if it's not alphabetical.
> 
> >  
> > -if BR2_ANGULARJS_MODULES
> > +config BR2_ANGULARJS_MODULE_ANGULAR
> > +	bool
> > +	default y
> 
>  I don't like this part either, see below.
> 
> [snip]
> 
> > diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
> > index 60dbdb6..20a129d 100644
> > --- a/package/angularjs/angularjs.mk
> > +++ b/package/angularjs/angularjs.mk
> > @@ -17,18 +17,24 @@ define ANGULARJS_EXTRACT_CMDS
> >  	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
> >  endef
> >  
> > -ANGULARJS_FILES = angular
> 
>  I prefered it like this, with the angular bit always there and the rest added
> by Kconfig options. Simpler than adding a dummy Kconfig option for angular itself.

I was not 100% sure either, so I'll revert it.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
