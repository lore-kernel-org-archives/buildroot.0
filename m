From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  9 May 2019 22:28:06 +0200
Subject: [Buildroot] [PATCH 0/2] Some more netsurf fixes
Message-ID: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On my machine, netsurf does not even build due to commit
6da049f8ae61b956d135526722ce58fc2f67626a. My PATCH 1/2 fixes that, but
it still remains fragile as CFLAGS/LDFLAGS are used for both building
target objects and host tools. For example, with my PATCH 1/2 applied,
if BR2_STATIC_LIBS is enabled, -static is passed in LDFLAGS, and
netsurf fails to build on my machine with "-lc not found" because it
passes -static when building host tools, and I don't have a static
glibc installed on my machine.

PATCH 2/2 disable static linking for netsurf, which was anyway failing
to build for months in the autobuilders.

To be honest, the netsurf build system is broken beyond repair, and is
a royal pain to work with. Since nobody has acted to fix those build
issues for the past months, if my patches are not sufficient (and as I
said, they *are* fragile), I will propose to simply remove the netsurf
package.

Best regards,

Thomas

Thomas Petazzoni (2):
  package/netsurf: change how CFLAGS/LDFLAGS are passed
  package/netsurf: do not allow on static linking configurations

 package/netsurf/Config.in  | 5 +++++
 package/netsurf/netsurf.mk | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.21.0
