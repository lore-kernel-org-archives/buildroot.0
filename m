From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Oct 2017 01:09:15 +0200
Subject: [Buildroot] [PATCH 10/13] pkg-generic: introduce _SAME_SOURCE_AS
In-Reply-To: <6f239aca-e146-2a07-57fc-b94787c7bb54@mind.be>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-11-maxime.hadjinlian@gmail.com>
 <6f239aca-e146-2a07-57fc-b94787c7bb54@mind.be>
Message-ID: <20171023230915.GA3156@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Maxime, All,

On 2017-10-23 21:55 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 04-07-17 18:22, Maxime Hadjinlian wrote:
> > This per package variable can be used to specify that a package shares
> > the same sources as another package.
> > 
> > The use case here is for example, you have linux-headers and linux, you
> > don't want to download twice the kernel (because of the introduction of
> > the subdirs in DL_DIR).
> > 
> > So you want to specify in linux-headers, this variable, so it will use
> > the linux's source.
> 
>  That patch at least should be part of this series. We *really* don't want to
> download linux twice.
> 
>  However, Yann is reviving the package out-of-tree build series, which IIRC will
> already do something similar but then reusing the source directory rather than
> the source tarball. Therefore, this patch may no longer be needed. Well, on
> condition that that series gets applied :-)

Yes I'm on it, but this is probably an at-least multi-week effort, if
not months, so don't hold your breath.

Besides, my work (based on Thomas' previous work) will not account for
packages that share the same source tree (and thus the same download)
except when they are a target and host variants.

I.e. linux and linux-headers are two different packages, so my series
will not try to address this use case, at least not for now.

So I think that this patch is still needed. The worst that may happen is
that it today serves to share the download, and that tomorrow it may
change to nmean also sharing the same source directory. Hence, naming
this variable _SAME_SOURCE_AS is future-proof! ;-)

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > ---
> >  package/pkg-generic.mk | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 7364551471..a8e0686068 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -434,7 +434,9 @@ endif
> >  
> >  $(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
> >  $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> > -$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
> > +$(2)_DL_DIR 	=  $$(if $$($(2)_SAME_SOURCE_AS), \
> > +	$$(DL_DIR)/$$($$(call UPPERCASE,$$($(2)_SAME_SOURCE_AS))_RAWNAME), \
> > +	$$(DL_DIR)/$$($(2)_RAWNAME))
> >  $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
> >  
> >  ifndef $(2)_SUBDIR
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
