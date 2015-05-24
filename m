From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 May 2015 23:36:19 +0200
Subject: [Buildroot] [git commit] package/ipmiutil: disable parallel build
Message-ID: <20150524214953.A8F1A818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da4b584f86e0a068547eb3222cf6cb4ffde3e557
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ipmiutil has a race when generating the object files and the executable,
because it uses very odd (to say the least) constructs in its
Makefile.am, leading to improper dependency-tracking.

Since impmiutil is pretty small, and because it is just mindbloggingly
complex to fix its Makefile.am, just disable parallel build.

Fixes:
    http://autobuild.buildroot.org/results/661/661373306d0440aaea67e394fbbfc47fd4481589/
    http://autobuild.buildroot.org/results/a6c/a6c5f9d8e0e0bad27b8ca1fa217bfda4216f2cd8/
    http://autobuild.buildroot.org/results/f0b/f0bbbd54349b5239872d6de185e16c1d90b3f779/
    http://autobuild.buildroot.org/results/20c/20c09695481c3d1030852330c1d1f1f9489f1f41/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/ipmiutil.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 011c0b6..736e430 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -11,6 +11,8 @@ IPMIUTIL_LICENSE_FILES = COPYING
 # We're patching configure.ac
 IPMIUTIL_AUTORECONF = YES
 
+IPMIUTIL_MAKE = $(MAKE1)
+
 # forgets to link against libcrypto dependencies breaking static link
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 # tests against distro libcrypto so it might get a false positive when
