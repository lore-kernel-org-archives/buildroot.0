From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 13 Aug 2014 13:00:27 +0100
Subject: [Buildroot] Some Perl modules fail to cross-compile
In-Reply-To: <20140813063010.CD21010118A@stock.ovh.net>
References: <20140813063010.CD21010118A@stock.ovh.net>
Message-ID: <53EB535B.60301@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The affected modules are:

  perl-gd
  perl-net-ssleay
  perl-xml-libxml

The build system of these modules have a "use Config;" in the 
Makefile.PL. Given that we are cross-compiling, the Perl program used to 
run that Makefile.PL is the host's Perl program (because we can't run 
MIPS Perl in our x86_64 machine, for instance), so the %Config read only 
variable provided by the Config module contains all the information that 
the Configure program had during the Perl build time (in our case, the 
host's Perl). Then, the build system fills the OPTIMIZE variable (only 
if it's empty) with some flags taken from that %Config variable, so some 
things like "-mtune=generic" or "-m64" can end into the OPTIMIZE 
variable and cause a compilation failure for target architectures which 
don't support those flags.

I have reported this bug upstream. Please read the comments:
   https://rt.cpan.org/Public/Bug/Display.html?id=97834

My proposal to fix these three packages is to append the OPTIMIZE 
variable to the configure options and set it to 
-mtune=$(BR2_GCC_TARGET_ARCH) to avoid the OPTIMIZE variable get filled 
with incompatible flags.

I have the patches ready and they work, so, if you think this is a valid 
solution, just tell it to me and I will send the patches ASAP.

Thanks.
-- 
Vincent
