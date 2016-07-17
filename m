From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Sun, 17 Jul 2016 11:05:57 +0900
Subject: [Buildroot] [PATCH v2] qt5base: don't enable KMS if it doesn't
 have udev
In-Reply-To: <20160708205319.13b5a01e@free-electrons.com>
References: <20160708000736.2329-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160708011732.3949-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160708205319.13b5a01e@free-electrons.com>
Message-ID: <2c5128be-77d4-2776-8b47-12fb0ec94e68@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 2016-07-09 03:53, Thomas Petazzoni wrote:
> Thanks for this new iteration. When you send a patch that fixes an
> autobuilder failure, please include something like this in the commit
> log:
>
> Fixes:
>
>     http://autobuild.buildroot.org/results/....
>
> (which should point to the autobuilder failure being fixed by this
> patch).

I see. I'll keep in mind.

> However, I have some comments below.
>
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index bf541b0..60b4e94 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -30,8 +30,11 @@ QT5BASE_CONFIGURE_OPTS += \
>>
>>  # Uses libgbm from mesa3d
>>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>> -QT5BASE_CONFIGURE_OPTS += -kms -gbm
>> +QT5BASE_CONFIGURE_OPTS += -gbm
>>  QT5BASE_DEPENDENCIES += mesa3d
>> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>> +QT5BASE_CONFIGURE_OPTS += -kms
>> +endif
>
> Does it really make sense to enable GBM without KMS? The only place
> where I see GBM actually being used in Qt's configure script is:
>
> if [ "$CFG_EGLFS" = "yes" ] && [ "$CFG_KMS" = "yes" ] && [ "$CFG_GBM" = "yes" ]; then
>     QT_CONFIG="$QT_CONFIG eglfs_gbm"
>     CFG_EGLFS_GBM="yes"
>
> Which seems to indicate that *both* KMS and GBM are needed in order to
> enable the eglfs_gbm module. Can you check this? If that's the case,
> then a better patch would be:
>
> ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)$(BR2_PACKAGE_HAS_UDEV),yy)
> QT5BASE_CONFIGURE_OPTS += -kms -gbm
> else
> ...
> endif

It has another configuration.

if [ "$CFG_GBM" = "yes" ]; then
      QT_CONFIG="$QT_CONFIG gbm"
fi

I have no idea what it means. It doesn't mean anything as far as I see. 
But considering it has the configuration, Qt may have some intension to 
do something with it. I think gbm should be set even if kms is not set.

Regards,
Akihiko Odaki
