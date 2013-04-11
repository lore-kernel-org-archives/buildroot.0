From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Apr 2013 19:33:30 +0200
Subject: [Buildroot] [PATCH] fftwf: Add fftwf package for single
 precision fft
In-Reply-To: <1365691684-30663-1-git-send-email-spenser@gillilanding.com>
References: <1365691684-30663-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130411193330.37ecd3ac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 11 Apr 2013 09:48:03 -0500, Spenser Gilliland wrote:

> +FFTWF_VERSION = 3.3.2
> +FFTWF_SITE = http://www.fftw.org
> +FFTWF_SOURCE = fftw-$(FFTWF_VERSION).tar.gz
> +FFTWF_INSTALL_STAGING = YES

package/fftw/ that already exists in Buildroot builds the exact same
source code. Why do you think a different package is needed?

Why don't you just add the:

+ifeq ($(BR2_ARM_ENABLE_NEON),y)
+FFTWF_CONF_OPT = --enable-single --enable-neon
+FFTWF_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) -mfpu=neon -mfloat-abi=softfp"
+else
+FFTWF_CONF_OPT = --enable-single
+endif

block of code into package/fftw/fftw.mk ?

In Buildroot, we generally have one package for each source tarball.
But this package may provide different configuration options to adapt
to the specificities of the platform, or to provide different kind of
features.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
