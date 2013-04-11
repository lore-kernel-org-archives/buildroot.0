From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 11 Apr 2013 13:17:25 -0500
Subject: [Buildroot] [PATCH] fftwf: Add fftwf package for single
	precision fft
In-Reply-To: <20130411193330.37ecd3ac@skate>
References: <1365691684-30663-1-git-send-email-spenser@gillilanding.com>
 <20130411193330.37ecd3ac@skate>
Message-ID: <CAEBucnDk_wJBT26bt5o4wVLCsOMFyxuT3dma62jUxpUJUwBiFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem is that the FFTW program cannot build both the single and
double precision libraries at the same time.

so the following must be done.

./configure
make
make install
./configure --enable-single --enable-neon
make
make install

The first run through installs the fftw library and pkg-config file.
The second run through only installs the fftwf library (no pkg-config
file).

Because the pkg-config is only installed from the double precision
(1st install). The fftwf library must depend on the fftw library for
proper operation.

Let me know if any changes should be made.

Spenser

On Thu, Apr 11, 2013 at 12:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Spenser Gilliland,
>
> On Thu, 11 Apr 2013 09:48:03 -0500, Spenser Gilliland wrote:
>
>> +FFTWF_VERSION = 3.3.2
>> +FFTWF_SITE = http://www.fftw.org
>> +FFTWF_SOURCE = fftw-$(FFTWF_VERSION).tar.gz
>> +FFTWF_INSTALL_STAGING = YES
>
> package/fftw/ that already exists in Buildroot builds the exact same
> source code. Why do you think a different package is needed?
>
> Why don't you just add the:
>
> +ifeq ($(BR2_ARM_ENABLE_NEON),y)
> +FFTWF_CONF_OPT = --enable-single --enable-neon
> +FFTWF_CONF_ENV += \
> +       CFLAGS="$(TARGET_CFLAGS) -mfpu=neon -mfloat-abi=softfp"
> +else
> +FFTWF_CONF_OPT = --enable-single
> +endif
>
> block of code into package/fftw/fftw.mk ?
>
> In Buildroot, we generally have one package for each source tarball.
> But this package may provide different configuration options to adapt
> to the specificities of the platform, or to provide different kind of
> features.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
