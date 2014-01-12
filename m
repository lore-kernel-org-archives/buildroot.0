From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 23:57:07 +0100
Subject: [Buildroot] [PATCH v3 1/2] ffmpeg: bump to version 1.2.4
In-Reply-To: <BLU0-SMTP2638CE0203ADFD44E6B8961D9CB0@phx.gbl> (Bernd Kuhls's
 message of "Thu, 2 Jan 2014 18:59:44 +0100")
References: <BLU0-SMTP2638CE0203ADFD44E6B8961D9CB0@phx.gbl>
Message-ID: <878uuk3j24.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Compile tested the following packages which depend on ffmpeg:
 > freerdp
 > mpd
 > gstreamer

 > For minidlna please see the separate patch for version bump to 1.1.1

 > Some compile options were taken from OpenELEC:
 > https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/multimedia/ffmpeg/build

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

Committed with minor tweaks (see below), thanks.
 
 >  # Explicitly disable everything that doesn't match for ARM
 > @@ -161,8 +257,6 @@ FFMPEG_CONF_OPT += --disable-armv6 --disable-armv6t2
 >  endif
 >  ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
 >  FFMPEG_CONF_OPT += --enable-armvfp
 > -else
 > -FFMPEG_CONF_OPT += --disable-armvfp

The vfp option seems to have been renamed to just enable/disable-vfp.

 >  endif
 >  ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 >  FFMPEG_CONF_OPT += --enable-neon
 > @@ -191,8 +285,8 @@ define FFMPEG_CONFIGURE_CMDS
 >  		--sysroot=$(STAGING_DIR) \
 >  		--host-cc="$(HOSTCC)" \
 >  		--arch=$(BR2_ARCH) \
 > -		--target-os=linux \
 > -		--extra-cflags=-fPIC \
 > +		--target-os="linux" \
 > +		--cpu=$(BR2_GCC_TARGET_TUNE) \

Not all ARCHs provide BR2_GCC_TARGET_TUNE, so we should only pass --cpu=
if they do.

 >  		$(SHARED_STATIC_LIBS_OPTS) \
 >  		$(FFMPEG_CONF_OPT) \
 >  	)

I also had to explicitly pass --enable-pic to get a shared version to
link on ARM.

-- 
Bye, Peter Korsgaard
