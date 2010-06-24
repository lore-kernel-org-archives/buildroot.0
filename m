From: Mitch Davis <mjd+buildroot@afork.com>
Date: Thu, 24 Jun 2010 12:21:28 +1000
Subject: [Buildroot] Host libraries - status
Message-ID: <AANLkTil-7ims-WsQ2LeTvjmHhVCOUDtkWHpZjr9vT67U@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yesterday I got bitten by the "mkfontscale" shared library problem
which was discussed in this thread:

  http://lists.busybox.net/pipermail/buildroot/2010-June/035581.html

I also don't think futzing with the rpath is the right solution.  (The
Debian people discuss it here):

  http://wiki.debian.org/RpathIssue

One idea is to have a make var that says how to set the environment
when calling host binaries that we've compiled, something along the
lines of $(HOST_MAKE_ENV).  For each package which calls a host exe
we've compiled, we can overload the calling of that executable with
that var, which would set LD_LIBRARY_PATH just for running that exe.

Here's another idea: We already set PATH to pick up our compiled host
binaries.  And if those binaries expect shared libs in a certain
place, then shouldn't we also set LD_LIBRARY_PATH at the same time as
PATH?  And if not, why not?  Otherwise how are those exes ever
supposed to run?

This would solve the mkfontscale problem, and I don't think this
approach would stop fakeroot from working.  Not sure about the icu
stuff.

Anyway, there may be poor people out there who, like me, are trying to
get 2010.05 working.  I've attached a patch, that while it's not
ideal, it at least Works For Me[tm], and so it may be useful for
others.  One problem with this solution is that people who need more
fonts than me would need to alter more .mk files, whereas setting
LD_LIBRARY_PATH at the same time as PATH wouldn't require this.

Mitch.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-mkfontscale-so-locn.diff
Type: application/octet-stream
Size: 3201 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100624/c473bc2e/attachment-0001.obj>
