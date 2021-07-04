From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 3 Jul 2021 19:28:37 -0700
Subject: [Buildroot] python2, polkit, duktape, spidermonkey, and Buildroot
Message-ID: <CAFSsvmrPc6r1hAgj=gFQLM_1LCMG9h57afodCNTem0YpycnGWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Putting some feelers out here:

The Polkit package currently requires Spidermonkey which in turn
requires Python2.
There has been a pending patch for quite some time to enable ducktape
as an alternative javascript engine which can be found here:
https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/35

I hoped that the maintainers would be more responsive to such a patch
and hoped to wait for a new version of polkit with duktape as an
optional backend. However, there seems to be no urgency by the
maintainers of polkit.

This is now a problem.

Spidermonkey, apart from being huge, slow to compile, and a 20MB
shared library (stripped!), which polkit currently requires, relies on
Python2, which as we all know is EOL. Furthermore, python2 is
deprecated in Buildroot, and there is a wiki page on  elinux
(https://elinux.org/Buildroot:Python2Packages) with a list of packages
that still require python2.

There are two major packages that will require some heavy lifting:
- spidermonkey
- nodejs

I have a working build of NodeJS 14, but that's a whole other can of
worms for another email that nobody will want to discuss (hint:
another qemu-wrapper is needed!)

The question I am proposing is this:
Would the buildroot maintainers (and the heavy users I know which I
included on the list) be against a patch series that:
 - Updates polkit to 0.119
 - Changed the build system to meson (autotools can't detect C++17 and
meson works, so it's the path of least resistance.)
  - Add the ducktape patch from above with a slight refactor for the
new commits (Small changes)
  - Drop the spidermonkey package completely and of course, update the
packages that depend on polkit

It's a big ask, and normally I wouldn't want to incorporate a huge
1,000+ LOC patch into a package that's still pending a pull request.
However, with the maintainers lack of cooperation, and insistence that
ducktape acts *exactly* like MozJS, and several people already using
the ducktape patch with 0 issues (Xogium, gentoo users, my employer
Rivian *cough cough*), I am of the opinion that ducktape is more than
stable enough to work just fine.

Not only that, but as far as maintenance goes, polkit releases don't
seem to change a ton of code very often. It took me less than 5
minutes to refactor the ducktape patch and the
0001-make-netgroup-support-optional.patch patch.

Let me know your thoughts. If we decide that such a patch would be
accepted into upstream I will submit one to the mailing list!

Adam
