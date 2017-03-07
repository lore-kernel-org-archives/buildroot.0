From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Mar 2017 09:45:09 +0100
Subject: [Buildroot] Download tag as archive from gitlab
In-Reply-To: <cccc2430-04c1-c447-a2a3-027cc0fba60a@mind.be>
References: <CA+TH9Vmhs+bLmoo5UvD5VWAPahsDnseJ-eeEcBQJrwDHDKUQrQ@mail.gmail.com>
 <20170307071107.GA3676@free.fr>
 <cccc2430-04c1-c447-a2a3-027cc0fba60a@mind.be>
Message-ID: <20170307084509.GB3676@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-03-07 09:36 +0100, Arnout Vandecappelle spake thusly:
> On 07-03-17 08:11, Yann E. MORIN wrote:
> > Angelo, All,
> > 
> > On 2017-03-07 00:28 +0100, Angelo Compagnucci spake thusly:
> >> I'm hitting some bumps trying to download a tag from gitlab as an
> >> archive, the url format is like this:
> >>
> >> https://gitlab.com/gitlab-org/gitlab-ce/repository/archive.tar.bz2?ref=v6.9.2
> >>
> >> I can succesfully download the file, but then it's named
> >> "archive.tar.bz2?ref=v6.9.2" but it cannot be extracted cause it lacks
> >> an extensions and buildroot cannot choose the right helper to
> >> decompress it.
> >>
> >> How such an url can be downloaded in buildroot?
> > 
> > The only solution is to download it with a git clone:
> 
>  The only solution you can think of :-)
> 
>  You can use the following hack:
> 
> FOO_VERSION = v6.9.2
> FOO_SITE = https://.../archive.tar.bz2?ref=$(FOO_VERSION)&filename=
> FOO_SOURCE = foo-$(FOO_VERSION).tar.bz2

Yeah, I know that trick. I think you even mentioned it not so long ago
for that very same issue.

Although this is a neat trick, it still is a trick, it's not obvious,
it's not documented, it's ugly. ;-)

So I think we should refrain from accepting such tricks.

If upstream does not have a sane archive download solution, then I
prefer that we do a git clone instead; it's much obvious what is going
on. Yes, this usually means bigger/slower downloads, but then people
should go complain to the culprit (here, gitlab).

Or we add a gitlab helper. Meh... No. ;-)

Regards,
Yann E. MORIN.

>  This will lead to a wget of
> https://.../archive.tar.bz2?ref=v6.9.2&filename=/foo-v6.9.2.tar.bz2
> to the file foo-v6.9.2.tar.bz2.
> 
>  It works because in a GET request, any unknown variables are typically ignored.
> Last time I tried gitlab did ignore them.
> 
>  Of course you can use anything you like for FOO_SOURCE, but it's convenient to
> use the canonical name.
> 
>  Regards,
>  Arnout
> 
> 
> > 
> >     FOO_VERSION = TAG_OR_SHA1
> >     FOO_SITE = https://gitlab.com/gitlab-org/gitlab-ce
> >     FOO_SITE_METHOD = git
> > 
> > Regards,
> > Yann E. MORIN.
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
