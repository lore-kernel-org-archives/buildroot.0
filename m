From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 19:48:10 +0000
Subject: [Buildroot] [PATCH v6 0/3] Adding support for graphite to buildroot
	gcc toolchain
Message-ID: <BLU436-SMTP138158505B82776645355FCA8320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset add support for the graphite optimisation to the buildroot toolchain.
Graphite has been around for quite some time and is almost standard is some distributions

The patchset consists of two new packages and a new flag in the supported gcc toolchains.
I have omitted support for 4.5 as this might not work with the more recent version of 
cloog and isl, and if memory serves me correctly there was a transition from cloog-ppl
to cloog around that time. 

The impact is minimal as the flag is ordinarily disabled. 

Also, for some reason using the with-isl flag doesn't work as the gcc configure script
doesn't actually find isl. That is to say no option worked until I used the same trick
that gentoo use. See line 1160 of 
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/eclass/toolchain.eclass?view=markup
for how they do it. I think that this was needed because there are many versions of isl 
bundled here, one in cloog and one in gcc. I never managed to get it to work using a 
with-isl option. 

To test gcc should support at the very least -floop-parallelize-all -ftree-parallelize-loops
and -ftree-loop-linear.

Cheers

Thomo


Steve Thomas (3):
  isl: new package
  cloog: new package
  Add an BR2_GCC_ENABLE_GRAPHITE flag for the buildroot toolchain

 package/cloog/cloog.mk     | 16 ++++++++++++++++
 package/gcc/Config.in.host | 16 ++++++++++++++++
 package/gcc/gcc.mk         |  9 +++++++++
 package/isl/isl.mk         | 14 ++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/cloog/cloog.mk
 create mode 100644 package/isl/isl.mk

-- 
1.9.3
