From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 18:02:03 +0100
Subject: [Buildroot] [PATCH 1/4] pkg-infra: always specify the local
 tarball name when calling DOWNLOAD
In-Reply-To: <546BAEF2.9050608@mind.be>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
 <08cd8e9b5df25b7cccee3d47f50f38dab19c6f02.1416068004.git.yann.morin.1998@free.fr>
 <546BAEF2.9050608@mind.be>
Message-ID: <20141123170203.GA11143@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-11-18 21:41 +0100, Arnout Vandecappelle spake thusly:
> On 15/11/14 17:19, Yann E. MORIN wrote:
> > This will be needed to be able to differentiate the upstream filename
> > from the local filename, which may differ in some cases.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  package/pkg-download.mk | 3 ++-
> >  package/pkg-generic.mk  | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index f3409bd..7e932e9 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -245,13 +245,14 @@ endef
> >  # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
> >  #
> >  # Argument 1 is the source location
> > +# Argument 2 is the local filename, without any path component
> >  #
> >  # E.G. use like this:
> >  # $(call DOWNLOAD,$(FOO_SITE))
> >  ################################################################################
> >  
> >  define DOWNLOAD
> > -    $(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
> > +    $(call DOWNLOAD_INNER,$(1),$(2))
> >  endef
> >  
> >  define DOWNLOAD_INNER
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 9643a30..543cb60 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -84,7 +84,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
> >          done ; \
> >      fi
> >  endif
> > -    $(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
> > +    $(if $($(PKG)_SOURCE),$(call
> > DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE),$($(PKG)_SOURCE)))
> >      $(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call
> > DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
> 
>  So, why didn't you replace this second instance of DOWNLOAD?

The idea was that we have a different local filename only for the
_SOURCE file, not for extra downloads or patches.

Of course, this patch is obviously flawed because then we missed the
local filename for those extra downloads or patches.

Thus, in the new series, I'll keep the ability to not specify the local
filename:

    define DOWNLOAD
        $(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
    endef

> And there are
> several others scattered around the code...

Yes, hence the reason to still default to the basename of $(1) if $(2)
is not specified.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
