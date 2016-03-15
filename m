From: Alexander Dahl <post@lespocky.de>
Date: Tue, 15 Mar 2016 14:56:59 +0100
Subject: [Buildroot] refresh patch series of a package
Message-ID: <dc4e098c9171e359102d277f132176d1@idefix.lespocky.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

a lot of packages have one or more patches to be applied after unpacking
the tarball and before moving on to the next steps of the build process.
The part of the manual covering this seems to be section 18 [1] and if I
read it correctly, patches in the format of git-format-patch are
preferred in style and numbering. Refreshing a patch series can be
necessary on package version bumps for example. However in contrast to
OpenWRT [2] and ptxdist [3] there seems to be no tool support or
documented way how to refresh such a patch stack in buildroot. (Or did I
miss it?)

So first question: am I right the patches are currently not applied
applied with git or quilt or any other tool, but with plain 'patch'?

For a maintainer of a package one way to maintain such a patch series
would be to have a custom branch on top of upstream version control, and
on a new release rebase the custom branch, export those patches with
`git format-patch` and manually copy them over to buildroot package
folder. If not already doing it like this, one would have to import the
old patches from buildroot package first.

What ptxdist does to simplify this (stricly speaking "can do", it's
optional) is basically the following: unpack tarball as usual, create a
new (temporary) git repo from the unpacked sources, apply additional
patches with git. Now you have a new git repo with the tarball content
as initial version and one git commit/changeset per patch. You can now
edit the sources, do interactive git rebase, do more or less usual git
based development on top of the original tarball and eventually export
all the stuff again as patches in the format you want (git patches, the
same format we use here for changes on buildroot itself) and put it
directly back to the BSP. Personally I find this a convenient way to
maintain patch series.

OpenWRT has some kind of HowTo and works with quilt. Although I didn't
look deep into it, it seems at least recommended practice over there.

I'm not (yet?) familiar with buildroot internals. Would an easier and
unified way to maintain patch series be a feature people would like to
have? So would it be worth the time developing a solution for this? Or
would it be too difficult to integrate?

Greets
Alex

P.S.: please keep Christoph in Cc, he's not on the list.

[1] https://buildroot.org/downloads/manual/manual.html#patch-policy
[2] https://wiki.openwrt.org/doc/devel/patches
[3] http://www.pengutronix.de/software/ptxdist/ (currently not
documented how to recreate patch series, I could tell you ;-) )

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
