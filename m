From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Thu,  1 Sep 2016 20:34:54 +0200
Subject: [Buildroot] [PATCH v2] openal: Explicitly enable/disable NEON
	support
Message-ID: <1472754894-6903-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d7ccef77a355ccc23f26d012e8441af931469ae4
http://autobuild.buildroot.net/results/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/openal/openal.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 2916aa6..aac1121 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -50,4 +50,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
 endif
 
+# Explicitly enable/disable NEON support, see https://github.com/kcat/openal-soft/issues/54
+ifeq ($(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_VFPV4),y)
+OPENAL_CONF_OPTS += -DALSOFT_CPUEXT_NEON=ON
+else
+OPENAL_CONF_OPTS += -DALSOFT_CPUEXT_NEON=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.7.4
