From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Dec 2018 09:31:41 +0100
Subject: [Buildroot] [PATCH 0/2] core/sdk: fix relative symlinks in
 generated tarball (branch yem/sdk)
In-Reply-To: <CA+1k=2ZqHeLif6866SYX+hqRwatGiL1e-hZz-zdFuy_Ysfy+8g@mail.gmail.com>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
 <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
 <CA+1k=2ZqHeLif6866SYX+hqRwatGiL1e-hZz-zdFuy_Ysfy+8g@mail.gmail.com>
Message-ID: <20181222083141.GU24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joel, Andreas, All,

On 2018-12-21 17:13 -0700, Joel Carlson spake thusly:
> On Fri, Dec 21, 2018 at 2:46 AM Andreas Naumann <dev@andin.de> wrote:
> > However, the check for symlinks pointing out of host/ showed to two
> > issues originating in install steps of iptables and eudev. Both create
> > links that point to system pathes.
> >
> > I have locally made POST_STAGING_HOOKS to fix that but that's probably a
> > non acceptable hack.
> 
> Would be hard to tell without seeing the actual change. ;-)
> That being said, this is probably something that would need to be
> fixed in iptables and eudev (patches submitted upstream), and then
> those patches added to buildroot to fix the issue.
> 
> So far I've submitted a patch to iptables here:
> http://patchwork.ozlabs.org/patch/1017739/
> 
> And a patch to buildroot to pull in a version of that here:
> https://patchwork.ozlabs.org/patch/1017740/
> 
> I've also submitted a pull request for eudev (and while typing this
> email it was already merged):
> https://github.com/gentoo/eudev/pull/165

I did nt see Thomas' reply to the iptables patch before I replied to
your eudev one. It turns out we basically said exactly the same thing:
this is not the correct solution.

If you do what you propose, then you can see that at runtime, on the
_target_, the symlinks will be wrong, bnecause they would be prefixed
with the DESTDIR, which is clearly not appropriate.

A better solution, in that case, wuld be to make relative symlinks
instead, but that is a little bit trickier.  A simple way to do that is
to use 'ln -r -s FILE LINK' but the -r option is not old enough to be
widely available on all distors, especially entreprise-grade distros.

An other approach, would be that we whietelist certain PATHs from our
SDK. Afterall, there are things we do not care about in the SDK. For
example, most executables in staging/{,usr/}{,s}bin are not needed. We
only really need libs and headers, so we could just ignore anything
that is not in staging/{lib,usr/lib,usr/include}/

I.e. the heuristic would become:

  if it is a symlink:
      if is not below staging/:
          check and fix it
      else if it is below staging/{lib,usr/lib,usr/include}:
          check and fix it
      else
          ignore it

I can try to look into fixing that in my series. Is enabling eudev
and/or iptables enough to echibit the problem?

Regards,
Yann E. MORIN.

> I'll submit a patch for eudev in buildroot to pull in that change once
> I see feedback on the iptables one. For it to work for me I needed to
> set AUTORECONF=YES on eudev, but I don't really understand
> autotools/automake stuff very well and I don't know if that is the
> right way to be doing things.
> -Joel

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
