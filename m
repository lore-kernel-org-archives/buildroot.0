From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue, 15 Jul 2014 10:26:06 +0200
Subject: [Buildroot] [PATCH 1/2] qt5declarative: Reduce dependencies to
 GLes2 only
In-Reply-To: <20140420111843.340cb627@skate>
References: <533A8F6C.1010606@gmail.com>
 <1396368972-8690-1-git-send-email-jezz@sysmic.org>
 <1396368972-8690-2-git-send-email-jezz@sysmic.org>
 <20140420111843.340cb627@skate>
Message-ID: <53C4E59E.4030103@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fatih,

I'm mainlining some pending patches for the Google Summer of Code, and
for this one I'm not really able to say if it is correct or not. It
seems coherent for me but I'm not a Qt5 expert.

As Thomas said, since you are our Qt5 expert have you some comments on
this patch?

Thanks!

Hadrien

On Sun, 20 Apr 2014 11:18:43 +0200, Thomas Petazzoni wrote:
> Fatih,
> 
> Since you are our Qt5 expert, could you comment on this patch, and give
> your Reviewed-by, Tested-by and/or Acked-by?
> 
> Thanks!
> 
> Thomas
> 
> On Tue,  1 Apr 2014 18:16:11 +0200, J?r?me Pouiller wrote:
>> From: J?r?me Pouiller <j.pouiller@sysmic.fr>
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>> ---
>>  package/qt5/qt5base/qt5base.mk       | 12 +++++++++---
>>  package/qt5/qt5declarative/Config.in |  1 -
>>  2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index 618251e..b99733a 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -96,9 +96,15 @@ else
>>  QT5BASE_CONFIGURE_OPTS += -no-xcb
>>  endif
>>  
>> -ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
>> -QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
>> +ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL)$(BR2_PACKAGE_HAS_OPENGL_ES),yy)
>> +QT5BASE_CONFIGURE_OPTS += -opengl es2
>>  QT5BASE_DEPENDENCIES   += libgles libegl
>> +else
>> +QT5BASE_CONFIGURE_OPTS += -no-opengl
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
>> +QT5BASE_CONFIGURE_OPTS += -eglfs
>>  ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
>>  QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
>>  	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
>> @@ -108,7 +114,7 @@ QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
>>  	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
>>  endif
>>  else
>> -QT5BASE_CONFIGURE_OPTS += -no-opengl -no-eglfs
>> +QT5BASE_CONFIGURE_OPTS += -no-eglfs
>>  endif
>>  
>>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
>> diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
>> index c5753b1..7f25999 100644
>> --- a/package/qt5/qt5declarative/Config.in
>> +++ b/package/qt5/qt5declarative/Config.in
>> @@ -3,7 +3,6 @@ config BR2_PACKAGE_QT5DECLARATIVE
>>  	select BR2_PACKAGE_QT5XMLPATTERNS
>>  	select BR2_PACKAGE_QT5BASE
>>  	select BR2_PACKAGE_QT5BASE_GUI
>> -	select BR2_PACKAGE_QT5BASE_EGLFS
>>  	depends on BR2_PACKAGE_HAS_OPENGL_EGL
>>  	depends on BR2_PACKAGE_HAS_OPENGL_ES
>>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> 
> 
> 
