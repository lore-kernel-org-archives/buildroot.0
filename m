From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 17:27:16 +0200
Subject: [Buildroot] [git commit] package/iputils: fix build with thread
 support disabled
Message-ID: <20190802152443.ABF218B8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74cbe7cbbfb87dd7a1b1fb8a6fa2bce8a6404ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/10652b7bf6a606f0dd802916006c44abf3e5e059
http://autobuild.buildroot.net/results/9656af1aafbd2624fb75bf5fc1dfa13b6175c10b
http://autobuild.buildroot.net/results/2e170e149b293d40978e158d55dc0102315b9d86

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/iputils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index cbcce89684..4a06581790 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -49,6 +49,11 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
+# ninfod requires <pthread.h>
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+endif
+
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 IPUTILS_CONF_OPTS += -DUSE_GETTEXT=true
 else
