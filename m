From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:17:24 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/liquid-dsp: add
 missing dependency on fftw
Message-ID: <20181216211326.F1B37864B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc36e5a3496ab115c28b429ab78be5b8264c3db1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

When one of BR2_PACKAGE_FFTW_PRECISION_* is enabled, liquid-dsp links
against fftw3f, fftw3 or fftw3l, but forgets to add the fftw package
in its dependencies. It works fine in practice because "fftw" is
before "liquid-dsp" in the alphabetic ordering, but building with
"make liquid-dsp" or with per-package directory causes a build
failure.

Fix that by adding the missing dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2517fa73edcb48d05fae7795ea75591e004a0177)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liquid-dsp/liquid-dsp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index e3114a2d15..db67893844 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -32,6 +32,7 @@ endif
 # use FFTW instead of built-in FFT
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3f
+LIQUID_DSP_DEPENDENCIES += fftw
 endif
 
 # disable altivec, it has build issues
@@ -41,10 +42,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3
+LIQUID_DSP_DEPENDENCIES += fftw
 endif
 
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3l
+LIQUID_DSP_DEPENDENCIES += fftw
 endif
 
 LIQUID_DSP_CONF_OPTS += \
