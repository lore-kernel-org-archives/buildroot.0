From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Wed, 18 Sep 2013 13:13:57 +0200
Subject: [Buildroot] [PATCH v1] Fix EGL support in qt5base
In-Reply-To: <20130917203313.0da278a9@skate>
References: <CA+csPL67CJSJHgfhgnJJfBcw+LUszPWT3VwFCEFw5n3Oy4jN1Q@mail.gmail.com>
 <1379411589-8935-1-git-send-email-jezz@sysmic.org>
 <20130917203313.0da278a9@skate>
Message-ID: <208f618f05b351b3ef2eddf624978189@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-09-17 20:33, Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
>
> On Tue, 17 Sep 2013 11:53:09 +0200, J?r?me Pouiller wrote:
>> For many EGL libraries, Qt5 need special instructions to compile 
>> correctly.
>> This patch implement a more generic way to customize Qt5 
>> compilation.
>>
>> In add, it fix support for Rasberry Pi and Vivante GPUs.
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>
> I'm sorry, but this really looks ugly.
I agree :-)

In fact, I mainly  wrote this patch as a work around for  one of my 
imx6
compilations. I sent it only because Espen seemed to have same issue.

> and doesn't seem needed at all.
> We already have a working solution for this problem (which we already
> had for the RPi, and we solved in a much nicer way I believe) :
>
>  (1) The OpenGL implementation should install proper pkg-config files
>      to allow Qt5 to get the right compilation flags/libraries. See 
> the
>      "gpu-viv-bin-mx6q: add pkgconfig files for EGL and OpenGLESv2"
>      patch that Fatih has sent today.
100% agree

>  (2) We already have a mechanism in qt5.mk to customize the EGL
>      platform hook implementation. It just need to be extended to 
> cover
>      the i.MX6 case. I.e, next to:
>
> ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
>         $(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
> endif
>
>      one should add:
>
> ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
> QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
> 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
> endif
My idea  was QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES may not  be 
sufficient
to  support all  future cases  and we  may have  a more  generic way  
to
customize qmake.conf. But I am agree, this case is not yet arrived.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
