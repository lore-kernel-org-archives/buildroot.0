From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:38:09 +0200
Subject: [Buildroot] [git commit] package/systat: fix linking with -lintl
Message-ID: <20150818093849.8FA587FCCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab2a9598fe550f6ac03f0268e40b21d368666d03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking, libraries should be listed in the reverse-dependency order,
that is the library/ies with no dependency last, preceded by libraries
that depend on them.

And most importantly, libraries should be listed *after* the local
objects, .o files.

Currently, sysstat uses CFLAGS to shoehorn the -lintl linker flags,
which is incorrect, as the CFLAGS are passed before the object files.

However, sysstat has a LFLAGS variable that, presumably, is to be used
to pass linker flags. This is where we want to shoehorn -lintl.

Fixes:
    http://autobuild.buildroot.org/results/8cc/8cc547074de23b9482ad110234ef7458a44e174a/
    http://autobuild.buildroot.org/results/360/360f7b8252dc9f6bb47841b1d7207a121f90048c/
    http://autobuild.buildroot.org/results/04c/04cfc76a09e089985549a4320f34f6669d21cab5/
    http://autobuild.buildroot.org/results/818/818c08decf4a6190a9ed39915eae4cd3d2779880/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysstat/sysstat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index b28c029..7568a4b 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,7 +14,7 @@ SYSSTAT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext
-SYSSTAT_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -lintl"
+SYSSTAT_MAKE_OPTS += LFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
 
 # The isag tool is a post processing script that depends on tcl/tk
