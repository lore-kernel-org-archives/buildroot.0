From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 08 Mar 2014 19:08:16 +0100
Subject: [Buildroot] [PATCH v3 2/4] mesa3d: modularize and bump to
	version 10.0.3
References: <1394285816-7111-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP97E4F8E4DBB4C0482F0C9D98A0@phx.gbl> <20140308152101.38b8ac66@skate>
Message-ID: <gt2suaxvbl.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140308152101.38b8ac66 at skate: 

>> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
>> +MESA3D_CONF_OPT += --enable-gles1 --enable-gles2
>> +else
>> +MESA3D_CONF_OPT += --disable-gles1 --disable-gles2
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_MESA3D_OPENVG),y)
>> +MESA3D_CONF_OPT += --enable-openvg --enable-gallium-egl
>> +else
>> +MESA3D_CONF_OPT += --disable-openvg --disable-gallium-egl
>> +endif
> 
> In your Config.in, you have a dependency from EGL/OpenVG on udev, but
> it isn't reflected here. Which one is correct?

Hi,

OpenVG depends on EGL (--enable-egl):
"configure: error: cannot enable OpenVG without EGL"

EGL depends on gallium support (--enable-gallium-egl):
"configure: error: cannot enable OpenVG without egl_gallium"

The EGL drm module depends on gbm:
"configure: error: EGL platform drm needs gbm"

gbm depends on udev:
"error: gbm needs udev"

This dependency chain is present in Config.in, should this also be present 
in the mesa3d.mk-sections mentioned above? Is

ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
MESA3D_DEPENDENCIES += udev

not enough?

Regards, Bernd
