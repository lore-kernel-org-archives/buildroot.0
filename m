From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Apr 2016 22:43:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/openjpeg: bump to version 2.1
In-Reply-To: <CAHXCMMJVXtfZjy153Q82+VyrnOF3nT5ZdAMNsK2zxgdQX3X+3g@mail.gmail.com>
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461597623-14629-2-git-send-email-angelo.compagnucci@gmail.com>
 <20160425212827.07703ac2@free-electrons.com>
 <CA+TH9Vkf-=t2iS7ep1J3ejZ+LREVprQ+AN6wNn39MDAYVV58uw@mail.gmail.com>
 <CAHXCMMJVXtfZjy153Q82+VyrnOF3nT5ZdAMNsK2zxgdQX3X+3g@mail.gmail.com>
Message-ID: <CA+TH9VnoURBMTiDRPcbj-uEQ9bK7qXXgjmkTvxgyZO7yBUn+3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin

2016-04-25 22:18 GMT+02:00 Samuel Martin <s.martin49@gmail.com>:
> On Mon, Apr 25, 2016 at 10:05 PM, Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
>> Dear Thomas Petazzoni,
>>
>> 2016-04-25 21:28 GMT+02:00 Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com>:
>>> Hello,
>>>
>>> On Mon, 25 Apr 2016 17:20:22 +0200, Angelo Compagnucci wrote:
>>>
>>>> -ifeq ($(BR2_PACKAGE_LIBPNG),y)
>>>> -OPENJPEG_DEPENDENCIES += libpng
>>>> -OPENJPEG_CONF_OPTS += --enable-png
>>>> -else
>>>> -OPENJPEG_CONF_OPTS += --disable-png
>>>> -endif
>>>> -
>>>> -ifeq ($(BR2_PACKAGE_TIFF),y)
>>>> -OPENJPEG_DEPENDENCIES += tiff
>>>> -OPENJPEG_CONF_OPTS += --enable-tiff
>>>> -else
>>>> -OPENJPEG_CONF_OPTS += --disable-tiff
>>>> -endif
>>>> -
>>>> -ifeq ($(BR2_PACKAGE_LCMS2),y)
>>>> -OPENJPEG_DEPENDENCIES += lcms2
>>>> -OPENJPEG_CONF_OPTS += --enable-lcms2
>>>> -else
>>>> -OPENJPEG_CONF_OPTS += --disable-lcms2
>>>> -endif
>>>
>>> What about those optional dependencies? They are no longer used?
>>
>> They are no longer present as cmake options, they are handled internally.
> hmm, not that simple.
> These thirdparty are still bundle with openjpeg, the parsing of the
> thirdparty dir. is sensible to BUILD_CODEC [1] (which is ON by default
> [2]) plus some magics [3,4] involving BUILD_THIRDPARTY.
> So to prevent building the bundled 3rd parties, you should explicitly
> add the dependencies and disable these flags.
>
> [1] https://github.com/uclouvain/openjpeg/blob/master/CMakeLists.txt#L268
> [2] https://github.com/uclouvain/openjpeg/blob/master/CMakeLists.txt#L254
> [3] https://github.com/uclouvain/openjpeg/blob/master/CMakeLists.txt#L269

I reviewed the logic a little bit more and I can confirm that keeping
the default is sensible:

[1] if (BUILD_CODEC OR BUILD_MJ2)
[2] option(BUILD_THIRDPARTY "Build the thirdparty executables if it is
needed" OFF)
[3] ELSE (BUILD_THIRDPARTY)
[4] IF(ZLIB_FOUND)
    SET(Z_LIBNAME ${ZLIB_LIBRARIES} PARENT_SCOPE)
    SET(Z_INCLUDE_DIRNAME ${ZLIB_INCLUDE_DIRS} PARENT_SCOPE)
    message(STATUS "Your system seems to have a Z lib available, we
will use it to generate PNG lib")
    ELSE (ZLIB_FOUND) # not found
    message(STATUS "Z lib not found, activate BUILD_THIRDPARTY if you
want build it (necessary to build libPNG)")

So at the end if BUILD_CODEC is ON (default) system libraries will
only be used if found.
Is not this the intended behaviuor?


[1] https://github.com/uclouvain/openjpeg/blob/master/CMakeLists.txt#L268
[2] https://github.com/uclouvain/openjpeg/blob/master/CMakeLists.txt#L271
[3] https://github.com/uclouvain/openjpeg/blob/master/thirdparty/CMakeLists.txt#L12
[4] https://github.com/uclouvain/openjpeg/blob/master/thirdparty/CMakeLists.txt#L15


Sincerely, Angelo

>
>
> Regards,
>
> --
> Samuel



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
