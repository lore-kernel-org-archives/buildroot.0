From: Will Newton <will.newton@gmail.com>
Date: Mon, 16 Apr 2012 15:40:30 +0100
Subject: [Buildroot] Problem with apply-patches.sh
Message-ID: <CAFbHwiQUUsb2XPY_+nw--m1KTutFY_zXVYHaFNAfac_ftg78fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I noticed that in some cases apply-patches.sh will misbehave if you
have a file matching the glob '*.patch' in the top-level directory.
For example the patching of binutils fails in this case. The problem
is at the line:

    support/scripts/apply-patches.sh $(@D)
$($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH)
|| exit 1;

in package/Makefile.package.in. The glob gets expanded prematurely (to
e.g. myfile.patch) and then the expanded glob is passed to
apply-patches.sh which will fail to find any patches matching the
glob. I've had a go at trying to stop this happening but with no
success so far. Can anyone think of any creative ways to suppress this
expansion?

Thanks,
