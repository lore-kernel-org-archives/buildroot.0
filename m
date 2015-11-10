From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 23:36:51 +0100
Subject: [Buildroot] [git commit] liquid-dsp: fix powerpc/altivec build
	failures
Message-ID: <20151110232250.1344B81EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d435d8510db69ed2f9108abaa52479bce127b72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liquid-dsp/liquid-dsp.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
