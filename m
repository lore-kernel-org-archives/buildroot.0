From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun, 22 May 2016 22:24:02 +0200
Subject: [Buildroot] [PATCH 1/1] Fix config.mak.uname to allow
	cross-compilation
Message-ID: <1463948643-21344-1-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is part of a patchset for BuildRoot (https://buildroot.org/)
needed to correctly cross-compile GIT.

Git compilation relies on "uname" program to determine several system
charcteristics, but that does not work well in a cross-compilation
environment because "uname" will run on host, while we are interested
in information concerning target.

The file "config.mak.uname" unconditionally assigns variables using
":=", this prevents changing their value from the command line.
This minimal patch changes the flavor of the variable and assigns it
only if not already assigned, opening the road to spcify target-consistent
values on the command line (which is done in the other patches for
BuildRoot, but are not relevant here).

We are sending this patch upstream because we feel this might be
useful in other cross-compilation contexts.

Note this patch also changes variable "flavor" thus incurring in a
computational overhead; Makefile perusal doesn't seem to indicate
this as a problem, but it is possible to overcome this problem,
if deemed relevant, by using the construct:

  ifeq ($(origin uname_X), undefined)
    uname_X := $(shell sh -c 'uname -x 2>/dev/null || echo not')
  endif

If required I will submit another patch to this effect.

Regards
Mauro
