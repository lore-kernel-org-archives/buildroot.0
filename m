From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 19:16:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/freerdp: do not use Neon extensions
	when not available
In-Reply-To: <cover.1419704115.git.yann.morin.1998@free.fr>
References: <cover.1419704115.git.yann.morin.1998@free.fr>
Message-ID: <dc7aed907743824f29e6000e45e01388ae8cf0dd.1419704115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Note: fixing the regexp would be nice, and can be sent upstream, but now
we force use or not of Neon, we can do without further patching FreeRDP.
---
 package/freerdp/freerdp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
1.9.1
