From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 11:44:36 +0200
Subject: [Buildroot] [PATCH 5/8] core/show-info: report whether a
 package is overriden
In-Reply-To: <20200411103602.75d8b9f2@windsurf.home>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <524b53bb81ecd33c55b242d239bee93f57c6c98b.1586592741.git.yann.morin.1998@free.fr>
 <20200411103602.75d8b9f2@windsurf.home>
Message-ID: <20200411094436.GK29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-11 10:36 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 Apr 2020 10:12:30 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > When a package is overridden, the download, extract, and patch
> > stampfiles are replaced by a single rsync stampfile.
> > 
> > People (and scripts) who want to report on the current status of the
> > build, will want to know what stamp file to look at.
> > 
> > Expose in show-info whether the package is overridden or not.
> > 
> > We do not expose the override location, because this is a purely-local
> > information, and show info should never contain such local information
> > (the output of show-info can be shared). Besides, that information is
> > already known by the user, as they passed it to Buildroot via local.mk
> > to begin with.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Vadim Kochan <vadim4j@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: eeppeliteloop at gmail.com
> > ---
> >  package/pkg-utils.mk | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index 66504d0be2..98e3ede3d1 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -100,6 +100,7 @@ define _json-info-pkg
> >  		"virtual": false$(comma)
> >  		$(call _json-info-pkg-details,$(1)) \
> >  	)
> > +	"overriden": $(if $($(1)_OVERRIDE_SRCDIR),true,false),
> 
> I don't have a good suggestion, but I'm not sure "overriden" is the
> most appropriate term. Indeed, the download/extract/patch steps are
> also replaced by a rsync step for packages that use _SITE_METHOD =
> local, and such packages are not "overriden".

It is very unfortunate that we conflate the two conditions.

We can't even reconstruct the override by looking at whether
_SITE_METHOD == local, because even local packages may be overriden...

So, is it worth that I try and untangle the tow notions? Given the
feedback on the rest of this eries, I don;t want to invest too much time
if there is no chance of it getting in...

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
