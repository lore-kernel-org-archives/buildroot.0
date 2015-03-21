From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2015 18:00:41 +0100
Subject: [Buildroot] [PATCH 1/5 v2] support/download: make hash file
 optional
In-Reply-To: <550B3991.8090509@mind.be>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
 <26bebad3dca4191b35ddb2dae535b15de9a883c2.1426597114.git.yann.morin.1998@free.fr>
 <550B3991.8090509@mind.be>
Message-ID: <20150321170041.GC4201@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-03-19 22:03 +0100, Arnout Vandecappelle spake thusly:
> On 17/03/15 13:59, Yann E. MORIN wrote:
> > Currently, specifying a hash file for our download wrapper is mandatory.
> > 
> > However, when we download a git, svn, bzr, hg or cvs tree, there's by
> > design no hash to check the download against.
> > 
> > Since we're going to have hash checking mandatory when a hash file
> > exists, this would break those downloads from a repository.
> > 
> > So, make specifying a hash file optional when calling our download
> > wrapper and bail out early from the check-hash script if no hash file is
> > specified.
> 
>  An alternative approach would be to allow an empty hash in the hash file, e.g.

Well, as I state below, we'll need that. But for git/hg/svn/bzr/cvs
clones/checkouts/... there is intrisically no reason to have a hash, by
design.

Yes, reproducibility. But that's soooo far away... :-/

However...

> # From git => no hash
> none xxx avrdude-eabe067c4527bc2eedc5db9288ef5cf1818ec720.tar.gz

At first, I was not too fond of this, but it turns out we'll have to
have it. Consider the following:

    ifeq ($(FOO_BAR),y)
    FOO_VERSION = long-git-hash
    FOO_SITE = $(call github,foo,bar,$(FOO_VERSION))
    else
    FOO_VERSION = 1.2.3
    FOO_SITE = http://foosoftware.org/download
    endif

Say we add a hash for version 1.2.3; currently, we do not add hashes
for archives downloaded from github, because they seem to be
non-reproducible. However, the github helper is not using git-clone, but
us really just a way to generate an http:// UEL we download with wget.

So, what happens now is that, since hashes are mandatory as long as the
.hash file exists, downloads from github for this foo package is broken.

This is the case for gcc, for example, since we get the arc gcc from
github, and the other versions from the GNU mirror.

So, we'll need a way to state that there is no hash for a file, but that
will have to be explicit.

I'll rework the series to take that in considreation. Thanks! :-)

Regards,
Yann E. MORIN.

>  This has the advantage that we don't have to revert this patch in the future
> when we _do_ make reproducible tarballs (which is not rocket science, the
> reproducible builds people in Debian and Fedora do it). Of course, we'll be
> stuck with a s*tload of hash files that have this empty hash...
> 
>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
