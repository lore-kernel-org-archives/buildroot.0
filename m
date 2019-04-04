From: Stuart Summers <stuart.summers@intel.com>
Date: Thu,  4 Apr 2019 12:24:12 -0700
Subject: [Buildroot] [PATCH 0/1] [RFC] fix kernel build failure for 5.1.0-rc3
Message-ID: <20190404192413.10205-1-stuart.summers@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is my first time posting here, and I'm looking for feedback.
Our team is attempting to build with a kernel revision above 5.1.0-rc3.
I noticed in this build, the integration with buildroot is failing.
I was able to pinpoint this down to a patch to the kernel which now
uses pkg-config to find the libelf package to support non-default
paths for libelf.

I was trying to quickly patch buildroot to work around this rather
than changing the kernel itself. I noticed that pkgconf in buildroot 
creates a symbolic link in the target from pkgconf to pkg-config,
but not in the host directory. I have a patch which adds this link
to the host directory as well, but I quickly noticed this seems to
open a can of worms with packages, at least the ones we have enabled
in our configuration (graphics focused), down the toolchain now
failing dependencies in configuration and build, after attempting
to work through a few of the configuration dependency issues.

I wanted to reach out to the community for feedback on the approach
I have here, and what might be the best path forward on this. I would
prefer not to do a complete overhaul of the buildroot packages which
depend on a host-based pkg-config, as I don't have a way to properly
test these changes.

Thoughts?

Here's the commit in the kernel:
commit 056d28d135bca0b1d0908990338e00e9dadaf057
Author: Rolf Eike Beer <eb@emlix.com>
Date:   Tue Mar 26 12:48:39 2019 -0500

    objtool: Query pkg-config for libelf location
    
    If it is not in the default location, compilation fails at several points.
    
    Signed-off-by: Rolf Eike Beer <eb@emlix.com>
    Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Cc: stable at vger.kernel.org
    Link: https://lkml.kernel.org/r/91a25e992566a7968fedc89ec80e7f4c83ad0548.1553622500.git.jpoimboe at redhat.com

Thanks in advance!

Stuart Summers (1):
  package/pkgconf: add host link to pkg-config

 linux/Config.in            | 8 ++++++++
 linux/linux.mk             | 4 ++++
 package/pkgconf/pkgconf.mk | 8 +++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.20.1
