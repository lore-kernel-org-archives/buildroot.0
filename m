From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 13:02:02 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/log4cplus: link
 with libatomic when needed
Message-ID: <20190222120327.1917D860B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f549b245816e66061c8a390dd19cb7cdccee192c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/16e360cb91afff7655f459a3d1fb906ca48f8464

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2fee08208b28aa53268721b675172052d26f335)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cplus/log4cplus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 22efde2fd6..0bc4fc9aa6 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -11,4 +11,8 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LOG4CPLUS_CONF_ENV += LIBS='-latomic'
+endif
+
 $(eval $(autotools-package))
