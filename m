From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Nov 2017 17:40:13 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
Message-ID: <20171112174013.25d90333@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I found a bug in the RPATH fixing logic. On ARC, some of the binutils
programs (ar and ranlib at least) are linked with libfl.so.2, which
is provided by Buildroot in $(HOST_DIR)/lib.

However, after "make sdk" has been called, ar and ranlib don't have any
RPATH encoded. I debugged this and here is what happens:

First, fix-rpath fixes the RPATH of $(HOST_DIR)/bin/<tuple>-ar:

/opt/br-arcle-hs38-full-2017.11-rc1/bin/patchelf --debug --make-rpath-relative /opt/br-arcle-hs38-full-2017.11-rc1 --relative-to-file /opt/br-arcle-hs38-full-2017.11-rc1/bin/arc-buildroot-linux-uclibc-ar
patching ELF file `/opt/br-arcle-hs38-full-2017.11-rc1/bin/arc-buildroot-linux-uclibc-ar'
Kernel page size is 4096 bytes
keeping relative path of /opt/br-arcle-hs38-full-2017.11-rc1/lib
new rpath is `$ORIGIN/../lib'

Here, everything is fine, the rpath is $ORIGIN/../lib.

However, fix-rpath moves on and fixes $(HOST_DIR)/<tuple>/bin/ar:

/opt/br-arcle-hs38-full-2017.11-rc1/bin/patchelf --debug --make-rpath-relative /opt/br-arcle-hs38-full-2017.11-rc1 --relative-to-file /opt/br-arcle-hs38-full-2017.11-rc1/arc-buildroot-linux-uclibc/bin/ar
patching ELF file `/opt/br-arcle-hs38-full-2017.11-rc1/arc-buildroot-linux-uclibc/bin/ar'
Kernel page size is 4096 bytes
removing directory '$ORIGIN/../lib' from RPATH because it does not contain needed libs
new rpath is `'

The gotcha is that $(HOST_DIR)/<tuple>/bin/ar and
$(HOST_DIR)/bin/<tuple>-ar are the same files: they are hard links!

So, when $(HOST_DIR)/bin/<tuple>-ar is fixed, everything is fine
because the library we depend on is indeed located
in /opt/br-arcle-hs38-full-2017.11-rc1/lib/, which is the hardcoded
RPATH. It gets fixed to $ORIGIN/../lib, as should be the case.

However, when we get to $(HOST_DIR)/<tuple>/bin/ar, libfl.so.2 is not
found in $ORIGIN/../lib (because it should be $ORIGIN/../../lib), and
patchelf decides to remove the rpath entirely.

So, we have two things that are a bit weird here:

 - Why are the binutils linked to libfl ? This happens only on the ARC
   architecture, where we use a special version of binutils that gets
   autoreconf'ed.

 - The absolute rpath in $(HOST_DIR)/<tuple>/bin/ar is wrong in the
   first place, but I'm not sure how to fix this.

Wolfgang, Arnout, do you have any idea?

You can reproduce this by building an ARC toolchain, and look at the
(absence of) rpath on bin/<tuple>-ar.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
