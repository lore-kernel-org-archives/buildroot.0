From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 16:50:58 +0200
Subject: [Buildroot] [PATCH v3] package/glibc: switch to using the
	maintenance branch
In-Reply-To: <09ca8e63-52ac-d904-39ec-361e3737a9ef@gmail.com>
References: <20171028120055.1818-1-romain.naour@gmail.com>
 <20171028132444.GD3280@scaer>
 <09ca8e63-52ac-d904-39ec-361e3737a9ef@gmail.com>
Message-ID: <20171028145058.GH3280@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-10-28 16:03 +0200, Romain Naour spake thusly:
> Le 28/10/2017 ? 15:24, Yann E. MORIN a ?crit?:
> > Romain, All,
> > 
> > On 2017-10-28 14:00 +0200, Romain Naour spake thusly:
> >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> glibc upstream has ruled against doing regular point-releases, but they
> >> do have a lot of interesting and important fixes for regressions and
> >> security.
> > [--SNIP--]
> >> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> >> index 0b8b440..d71137b 100644
> >> --- a/package/glibc/glibc.mk
> >> +++ b/package/glibc/glibc.mk
> >> @@ -9,9 +9,16 @@ GLIBC_VERSION =  arc-2017.09-eng010
> >>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
> >>  GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
> >>  else
> >> -GLIBC_VERSION = 2.26
> >> -GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
> >> -GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
> >> +# Generate version string using:
> >> +#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> >> +GLIBC_VERSION = glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e
> >> +# Upstream doesn't officially provide an https download link.
> >> +# There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> >> +# sometimes the connection time out. So use a git mirror using https.
> >> +# Before bumping the version, first verify that the sha1 really
> >> +# exists on the git mirror tree.
> > 
> > No, I really meant "exists in the official git tree".
> > 
> > The idea is that we use the gthub mirror, but it is not official. So
> > nothing guarantees us that it only contains legit commits.
> 
> bminor seems really used as mirror of the official repo, so no new commit appear
> from here.

Yet, it really is advertised as an "Unofficial mirror of sourceware
glibc repository." As such, we can't trust it at all, whatever the
current situation is.

> > So, we want to get the version from the *official* git tree, and only do
> > the download from the mirror.
> 
> Right obviously, but remember that the github mirror is sync each day from the
> upstream repo. So if you use a sha1 from the upstream repo (ex: stable branch
> HEAD), you have to make sure that the same commit is also present in the git mirror.
> 
> I guess we should extend the comment for both cases.

What about:

    # When updating the version, check it on the official repository;
    # *NEVER* decide on a version string by looking at the mirror.
    # Then check that the mirror has been synced already (happens once
    # a day.)

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> > 
> >> +GLIBC_SITE = https://github.com/bminor/glibc.git
> >> +GLIBC_SITE_METHOD = git
> >>  endif
> >>  
> >>  GLIBC_SRC_SUBDIR = .
> >> -- 
> >> 2.9.5
> >>
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
