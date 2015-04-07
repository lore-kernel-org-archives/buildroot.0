From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2015 23:51:47 +0200
Subject: [Buildroot] [PATCH 5/6 v3] toolchain/external: ignore missing
 hash for custom downloaded toolchain
In-Reply-To: <552315BA.3010605@mind.be>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <2e8ef15e2d2d729ffe1bb5f77aabeb525554c407.1428322317.git.yann.morin.1998@free.fr>
 <5522F4AF.7000409@mind.be> <20150406212001.GI4369@free.fr>
 <552315BA.3010605@mind.be>
Message-ID: <20150407215147.GU4216@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-07 01:24 +0200, Arnout Vandecappelle spake thusly:
> On 06/04/15 23:20, Yann E. MORIN wrote:
> > On 2015-04-06 23:03 +0200, Arnout Vandecappelle spake thusly:
> >> On 06/04/15 14:13, Yann E. MORIN wrote:
[--SNIP--]
> >>> +# Magic value to tell the download helper to avoid failling on missing hash
> >>> +export BR_MISSING_HASH_OK := $(call ignore-missing-hash-magic,$(TOOLCHAIN_EXTERNAL_SOURCE))
> >>  Urgh - this disables the hash check for all packages, not just the toolchain.
> > 
> > No, that disable the check only for that one file, because we're not
> > chcking whether it is set, but whether it is set to the correct value
> > (i.e. the sha1 of the filename).
> 
>  Ah of course, that's probably why you introduced that.
> 
>  But it does mean that only a single file can ever be bypassed...

Right.

[--SNIP--]
> >> hasharg = $(if $(filter-out $(TOOLCHAIN_EXTERNAL_SOURCE),$(1)),
> > You probably meant s/TOOLCHAIN_EXTERNAL_SOURCE/NOHASH_FILES/ ?
>  Untested and all :-)

Hehe! :-)

> >> 	-H $(PKGDIR)/$($(PKG)_RAWNAME).hash)
> >>
> >> define DOWNLOAD_WGET
> >>         $(EXTRA_ENV) $(DL_WRAPPER) -b wget \
> >>                 -o $(DL_DIR)/$(2) \
> >>                 $(call hasharg,$(2)) \
> >>                 $(QUIET) \
> >>                 -- \
> >>                 '$(call qstrip,$(1))'
> >> endef
> >>
> >> (all completely untested, obviously :-)
> > 
> > Well, that sounds a bit better than my proposal.
> > 
> > Still, I prefer:
> > 
> >   - we offload the check in the dl-wrapper so we can do the check in a
> >     single place, rather than re-add extra code in each download macros
> >     (the dl-wrapper was added because the Makefile macros were too
> >     complex to handle);
>  Ack that, though I don't immediately see a way to do that.

Don;t worry, I'll find a way... ;-]

> >   - we pass obscur values (like a sha1), rather than the filenames, to
> >     make it even less easy to use.
> 
>  I really don't see the point of that... If it's not documented, you have to
> look at the source code to find out which variable to set. And when you look at
> the source code, you immediately see how this obscure value is calculated so it
> makes no real difference.

OK, makes sense.

I will rework the series accordingly. Thanks for the suggestions!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
