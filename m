From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Sep 2013 00:47:42 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639AC9248@ex-mb1.corp.adtran.com>
References: <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <20130912220757.GD3362@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639AC9248@ex-mb1.corp.adtran.com>
Message-ID: <20130912224742.GG3362@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy, All,

On 2013-09-12 22:28 +0000, ANDY KENNEDY spake thusly:
> > Yann E. MORIN wrote:
> > IANAL, this is not legal advice, talk to your lawyer.
> > 
> > Here are however my toughts on this:
> > 
> >  1- all the Config.in and package.mk files, plus the external.mk file,
> >     and all other files sourced or otherwise included by a file from
> >     Buildroot (and thus use Buildroot's infrastructure) could be
> >     considered a derived work of Buildroot, and thus must be licensed
> >     with a compatible license,
> >  2- the defconfigs could be considered as what the GPL identifies as the
> >     "scripts used to control compilation and installation of the
> >     executable", since without the .config file, an end-user can not
> >     reproduce the executable(s),
> >  3- everything else might be considered not a derived work of Buildroot,
> >     and might not be required to be licensed with a license compatible
> >     with Buildroot's license.
> > 
> > Explanations:
> > 
> > 1- It's not because it is to be licensed under a license compatible with
> >    the Buildroot  license that it *has* to be distributed. Just that if
> >    it *is* distributed, the licensing terms on that should be compatible
> >    with Buildroot's licensing terms.
> > 
> > 2- That's because Buildroot will most probably build a GPL/LGPL program
> >    that will end up in the ytarget that this applies, because of the
> >    license of those programs, not because of Buildroot's license. Even
> >    if Buildroot was under a different license, this would still apply as
> >    long as a GPL/LGPL program ends up in the target.
> > 
> > 3- By "everything else", I mean: a package (in Buildroot's terminology:
> >    the Config.in and associated .mk file) that directly embbeds the source
> >    files (.c and .h and ...) for this package (like the host-mkpasswd).
> >    These source files can not be considered a derived work of Buildroot,
> >    so Buildroot's license does not apply to those.
> > 
> > So, I think the make legal-stuff should descend into BR2_EXTERNAL, as if
> > it was an integral part of Buildroot.
> > 
> > BR2_EXTERNAL is here *just* to separate parts of the recipes from the
> > upstream ones, as a mean to clearly separate local changes from the
> > upstream reference.
> > 
> > But again: IANAL, this is not legal advice, talk to your legal counsel.
> 
> 
> Since tone is difficult to understand through e-mail, please understand
> that I'm not attempting to start a flame war, nor am I throwing stones. . .
> just brainstorming (or in my case, perhaps a light shower).

No problem, there are no feelings in my words (OK, just a very little bit!).

> You speak of BuildRoot as a third party.  BuildRoot is not really a third
> party but is first person from my point of view.

No, Buildroot is *not* a third party.

Consider this situation:
  Buildroot community
    -> makes Buildroot available under GPLv2

  Company FooCorp
    -> uses Buildroot
    -> creates BR2_EXTERNAL
    -> distributes BR2_EXTERNAL

  You or Me
    -> gets BR2_EXTERNAL from FooCorp

The third party I referred to (in my other mail) would be "You or Me"
here.

>  Although I have not added
> NEAR as much as other people, I still contend that I am partial owner in
> BuildRoot.  To that end, I have a voice in the decision making over any
> external (or internal for that matter) infrastructure and/or tie-in.

Yes, but since Buildroot pre-existed under the GPLv2 prior to your
changes, and your changes were made explicitly to work with Buildroot
(by being modifications to Buildroot), then those changes are GPLv2.

[--SNIP--]
What I'm arguing is that the content of BR2_EXTERNAL that _interacts
with Buildroot's internal infrastructure_ *are* a derived work of
Buildroot.

Let's take a (very simplistic) example:

    BR2_EXTERNAL/
        package/
            pkg-1/
                Config.in           *
                pkg-1.mk            *
                pkg-1-main.c        -
                pkg-1.h             -

* : a derived work of Buildroot
- : not a derived work of Buildroot

Config.in and pkg-1.mk are clearly (in my opinion) a derived work of
Buildroot, since they are written with the very intent to be interacting
with Buildroot's internal infrastructure.

But pkg-1-main.c and pkg-1.h (which are the C sources of pkg-1) are *not*
a derived work of Buildroot, and thus can well be under whatever license.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
