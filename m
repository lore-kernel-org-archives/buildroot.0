From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2015 23:20:01 +0200
Subject: [Buildroot] [PATCH 5/6 v3] toolchain/external: ignore missing
 hash for custom downloaded toolchain
In-Reply-To: <5522F4AF.7000409@mind.be>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <2e8ef15e2d2d729ffe1bb5f77aabeb525554c407.1428322317.git.yann.morin.1998@free.fr>
 <5522F4AF.7000409@mind.be>
Message-ID: <20150406212001.GI4369@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-06 23:03 +0200, Arnout Vandecappelle spake thusly:
> On 06/04/15 14:13, Yann E. MORIN wrote:
> > We will *always* be missing a hash file for custom external toolchains
> > that are downloaded.
> > 
> > So, just ignore that failure.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > 
> > ---
> > Changes v1 -> v2:
> >   - fix typoes in title
> > ---
> >  toolchain/toolchain-external/toolchain-external.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> > index c0429bb..3659511 100644
> > --- a/toolchain/toolchain-external/toolchain-external.mk
> > +++ b/toolchain/toolchain-external/toolchain-external.mk
> > @@ -400,6 +400,8 @@ else
> >  # Custom toolchain
> >  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
> >  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
> > +# Magic value to tell the download helper to avoid failling on missing hash
> > +export BR_MISSING_HASH_OK := $(call ignore-missing-hash-magic,$(TOOLCHAIN_EXTERNAL_SOURCE))
> 
>  Urgh - this disables the hash check for all packages, not just the toolchain.

No, that disable the check only for that one file, because we're not
chcking whether it is set, but whether it is set to the correct value
(i.e. the sha1 of the filename).

> So NACK for exporting it.

OK, this is indeed fishy.

>  But I see that it's not so simple to get it into the environment of the
> download step...
> 
> 
>  Perhaps instead we should add a global variable with the files that should not
> be hash-checked:
> 
> NOHASH_FILES += $(TOOLCHAIN_EXTERNAL_SOURCE)
> 
> and in pkg-download.mk
> 
> hasharg = $(if $(filter-out $(TOOLCHAIN_EXTERNAL_SOURCE),$(1)),

You probably meant s/TOOLCHAIN_EXTERNAL_SOURCE/NOHASH_FILES/ ?

> 	-H $(PKGDIR)/$($(PKG)_RAWNAME).hash)
> 
> define DOWNLOAD_WGET
>         $(EXTRA_ENV) $(DL_WRAPPER) -b wget \
>                 -o $(DL_DIR)/$(2) \
>                 $(call hasharg,$(2)) \
>                 $(QUIET) \
>                 -- \
>                 '$(call qstrip,$(1))'
> endef
> 
> (all completely untested, obviously :-)

Well, that sounds a bit better than my proposal.

Still, I prefer:

  - we offload the check in the dl-wrapper so we can do the check in a
    single place, rather than re-add extra code in each download macros
    (the dl-wrapper was added because the Makefile macros were too
    complex to handle);

  - we pass obscur values (like a sha1), rather than the filenames, to
    make it even less easy to use.

I'll respin a series taking into account your comments. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
