From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 4 Sep 2018 11:11:01 -0400
Subject: [Buildroot] [PATCH 0/3] qt5webkit: fix build issue using system
 leveldb
In-Reply-To: <92bebe0f-479a-a17d-219c-834fadf318f3@mind.be>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
 <20180831231930.58f7ca3e@windsurf>
 <20180902202144.jmhaz6nz2gtk3n52@archlinux>
 <92bebe0f-479a-a17d-219c-834fadf318f3@mind.be>
Message-ID: <20180904151101.2vz46vm7q33scp4c@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Sep 04, 2018 at 12:53:17AM +0200, Arnout Vandecappelle wrote:
> (...)
> 
> > Note: Also, since leveldb has moved to cmake, this symbol is now a part
> > of libleveldb.so and there is not more libmemenv.a [2] :/
> 
>  So, wouldn't a bump of leveldb which moves to cmake solve the issue entirely?
> 

First of all, the version is not yet out (1.21).

I think, the bump will partially solve that issue (not tested, but I can
give it a try).

With the bump, QtWebKit would compile it as a third-party (fair but not
wanted) and would link against libleveldb.so which will be provided by
buildroot (1.21 with the missing symbol). In that situation, the
third-party is compiled but not used and the build will succeed.

If the configure flag WEBKIT_CONFIG+=use_system_leveldb is added,
QtWebKit would not compile leveldb as a third-party (wanted) but it
would try to link against libraries liblevel.db (okay) *AND* libmemenv.a
from buildroot's staging. But the last one will not exist and the
compilation would fail.

Even with the bump, (and if the configure flag is added) QtWebKit needs
to be patched to remove the -lmemenv from the compilation line; because
the libmemenv will disappear.

A good fix consists in to force QtWebKit to use its third-party library
(giving the full path?) so it will not link against the copy from
buildroot's staging.

> >> (...) 
> >>
> >> All in all, I'm just worried by the installation of what looks like
> >> some internal library/headers of leveldb. Could you comment on this ?
> >>
> > 
> > We can consider memenv as an option of leveldb which installs the memenv
> > development files (static library and header).
> 
>  Since it's only a static library and a header, it only gets installed to
> staging, not target, so there is no reason to make it optional.
>

Okay, I will drop the option and respin a new version.

>  Regards,
>  Arnout
> 
> 
> [snip]
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

Regards,
Ga?l
