From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 22:19:03 +0200
Subject: [Buildroot] [git commit] boost: force the target ABI for ARM
	architecture
Message-ID: <20140906202005.5001D9D5CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b3cf6bca5e8e30322061d492b44d51c6091de18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like was done in commit b37641c95be79fcb76cbc7042c4cf21a2c64d0f6
("boost: Force the target ABI for MIPS architecture") by Vicente for
the MIPS architecture, this commit also forces the ABI passed to Boost
build system to "aapcs" for the ARM architecture.

Since we now have three cases to handle, an intermediate variable
called BOOST_ABI is introduced.

Fixes:

  http://autobuild.buildroot.org/results/5ae/5aeb3a9f067faf6687051643bf49a0b619cb4c3b/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index ac67e3c..caaeec0 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -80,9 +80,17 @@ endif
 HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared \
 	runtime-link=shared
 
+ifeq ($(BR2_MIPS_OABI32),y)
+BOOST_ABI = o32
+else ifeq ($(BR2_arm),y)
+BOOST_ABI = aapcs
+else
+BOOST_ABI = sysv
+endif
+
 BOOST_OPT += toolset=gcc \
 	     threading=multi \
-	     abi=$(if $(BR2_MIPS_OABI32),o32,sysv) \
+	     abi=$(BOOST_ABI) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 	     link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
 	     runtime-link=$(if $(BR2_PREFER_STATIC_LIB),static,shared)
