From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:59:39 +0100
Subject: [Buildroot] [git commit] package/freerdp: do not use Neon
	extensions when not available
Message-ID: <20141227185950.3C27880442@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=530693787b3fcea9603775982d36cfc85667885c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeRDP mis-detects the CPU, and may enable Neon extensions when it
should not. Not all ARM processors have Neon extensions.

Heck, what's more, none non-ARM processor has Neon extensions!
The regexp to detect the CPU is borked:  'arm*'  will also match 'arc'
as well as 'arm'.

Do not let FreeRDP try to decide if it can use Neon extensions, we have
a Kconfig option for that, that we can use to force FreeRDP to use it or
not.

Should fix:
    http://autobuild.buildroot.org/results/d4a/d4a61e686cf11d993d02ece0c4e2835a926603c2/
    http://autobuild.buildroot.org/results/234/2349d40ef8d658ab1cd7332eb1b42a75afcd423f/
   ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index d2e51f8..c9396b5 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -63,4 +63,10 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+FREERDP_CONF_OPTS += -DWITH_NEON=ON
+else
+FREERDP_CONF_OPTS += -DWITH_NEON=OFF
+endif
+
 $(eval $(cmake-package))
