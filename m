From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jul 2019 11:56:40 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
In-Reply-To: <20190723144459.5bfcc0fd@windsurf>
References: <20190723123355.22313-1-vadim4j@gmail.com>
 <20190723144459.5bfcc0fd@windsurf>
Message-ID: <20190728095640.GC21875@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-07-23 14:44 +0200, Thomas Petazzoni spake thusly:
> On Tue, 23 Jul 2019 15:33:55 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > provide info if the package will be installed to staging/target
> > destinations. Might be useful for analyzing the packages which
> > installed only for target/staging.
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >  package/pkg-utils.mk | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index b7280e930f..81222565bf 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -94,6 +94,14 @@ endef
> >  define _json-info-pkg-details
> >  	"version": "$($(1)_DL_VERSION)",
> >  	"licenses": "$($(1)_LICENSE)",
> > +	$(if $($(1)_INSTALL_TARGET), \
> > +		"install_target": true$(comma),
> > +		"install_target": false$(comma)
> > +	)
> > +	$(if $($(1)_INSTALL_STAGING), \
> > +		"install_staging": true$(comma),
> > +		"install_staging": false$(comma)
> > +	)
> 
> I would prefer install-target and install-staging for the JSON property
> names, I prefer - over _.

I do too, but Thomas DS. suggested we use _ and that's what we have in
"reverse_depenencies".

> Also, maybe you can write it like this:
> 
> 	"install-target": $(if $($(1)_INSTALL_TARGET),true,false),
> 	"install-staging": $(if $($(1)_INSTALL_STAGING),true,false),

+1

> Note: I haven't thought about whether those properties are actually
> useful or not to have in the JSON output. I mainly react to the
> implementation details.

I think it is interesting to have.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
