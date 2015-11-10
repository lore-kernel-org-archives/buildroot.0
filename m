From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Nov 2015 11:10:05 -0300
Subject: [Buildroot] [PATCH] liquid-dsp: fix powerpc/altivec build failures
Message-ID: <1447164605-14899-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a powerpc target is detected the build system tries to force
altivec support but that's wrong:

Not every powerpc processor has altivec instruction support.

It's using the removed/deprecated -faltivec compiler directive when it
should be using -maltivec instead.

Even if the above conditions are corrected the altivec codepath fails
to build properly.

So just disable altivec in general using the standard
--enable-simdoverride configure option. Fixes:

http://autobuild.buildroot.net/results/e1b/e1b6cf76a7a4ae754a928d211e779e9381198f48/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liquid-dsp/liquid-dsp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 8bb8d54..e7bb686 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -34,6 +34,11 @@ ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3f
 endif
 
+# disable altivec, it has build issues
+ifeq ($(BR2_powerpc)$(BR2_powerpc64),y)
+LIQUID_DSP_CONF_OPTS += --enable-simdoverride
+endif
+
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3
 endif
-- 
2.4.10
