From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 18 May 2014 13:58:24 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
Message-ID: <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140517205500.GL3459 at free.fr: 

>> -comment "xbmc requires an OpenGL ES and EGL backend"
>> -     depends on BR2_arm || BR2_i386 || BR2_x86_64
>> -     depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
>> +comment "xbmc needs an OpenGL backend"
>> +     depends on (!BR2_arm && (BR2_i386 || BR2_x86_64)) && \
>> +          !BR2_PACKAGE_HAS_LIBGL && !(BR2_PACKAGE_HAS_LIBEGL &&
>> BR2_PACKAGE_HAS_LIBGLES) +
>> +comment "xbmc needs EGL & GLES support"
> 
> Please keep the original comment. Besides, this change makes the two
> comments incoherent:
> 
>     comment "xbmc needs an OpenGL backend"
>     comment "xbmc needs EGL & GLES support"

as I already stated ARM depends on EGL/GLES so my plan was to display

comment "xbmc needs EGL & GLES support"

on ARM, so users know what to enable, and

comment "xbmc needs an OpenGL backend"

on BR2_i386 || BR2_x86_64 only, here EGL/GLES or GL are accepted by xbmc.

> Could you join dependencies so they fit on one or two lines, instead of
> one pre line?
> 
> Ditto the configure options.

Done.

>> +XBMC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(shell
>> $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \ +    
>> CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags
>> egl)" 
> 
> He! This XBMC_CONF_ENV did not pre-exist, and did not seem to be needed.

For Gotham it fixes a build error, this section will be a preparatory patch 
in v9.

Regards, Bernd
