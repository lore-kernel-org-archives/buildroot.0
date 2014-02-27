From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 27 Feb 2014 08:39:53 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: use -fPIC
In-Reply-To: <CAHXCMMKzoEVgu-DNRb4G=ZTQBG8n=WAtO-phSuWJA3+KAkQ0MA@mail.gmail.com>
References: <1392545101-26953-1-git-send-email-francois.perrad@gadz.org>
 <CAHXCMMJC6k66QKHMmW8gHLvxJic2cAy2Xv52P2X41daS+Z18aQ@mail.gmail.com>
 <CAB0FRssgk2v7opwOtx0NQJAV0dRpfah-Evw63V9r+gV4d_gmfQ@mail.gmail.com>
 <CAHXCMMKzoEVgu-DNRb4G=ZTQBG8n=WAtO-phSuWJA3+KAkQ0MA@mail.gmail.com>
Message-ID: <CAB0FRsv-fkZ7FEvyW54WhDEMx7+KzJ607fddMYnhLKa6AYQRVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-16 18:57 GMT+01:00 Samuel Martin <s.martin49@gmail.com>:
> Hi Francois,
>
> On Sun, Feb 16, 2014 at 5:29 PM, Fran?ois Perrad
> <francois.perrad@gadz.org> wrote:
>> 2014-02-16 11:51 GMT+01:00 Samuel Martin <s.martin49@gmail.com>:
>>> Hi Francois,
>>>
>>> On Sun, Feb 16, 2014 at 11:05 AM, Francois Perrad <fperrad@gmail.com> wrote:
>>>> fix build for lua-ev
>>>> http://autobuild.buildroot.org/results/730/7303fffa6075d02289b6fdb12a1debdf0dd7d6f1//build-end.log
> [...]
>>>
>>> Usually, PIC properties is set at the cmake target level, but this
>>> property is driven by the global variable
>>> CMAKE_POSITION_INDEPENDENT_CODE (see:
>>> http://www.cmake.org/cmake/help/v2.8.12/cmake.html#prop_tgt:POSITION_INDEPENDENT_CODE)
>>>
>>> I would prefer using this variable, it should not break anything if
>>> some projects set this property otherwise.
>>>
>>
>> You are right, my patch is too invasive.
>>
>> BUILD_SHARED_LIBS is correctly set in pkg-cmake.mk by :
>>      -DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON)
>>
>> And the CMakeLists.txt of lua-ev contains :
>>      ADD_LIBRARY(cmod_ev MODULE lua_ev.c)
>>
>> The CMake documentation (see
>> http://www.cmake.org/cmake/help/v2.8.12/cmake.html#command:add_library)
>>  said :
>>       "For SHARED and MODULE libraries the POSITION_INDEPENDENT_CODE
>> target property is set to TRUE automatically."
>>
>> So, I don't know what to do.
>
> Looking carefully at the culprit build config you point above, it
> appears BR2_PREFER_STATIC_LIB is not set, so in that case it makes
> sense (to me) to set CMAKE_POSITION_INDEPENDENT_CODE.
>
> Because when static libraries are built in such a configuration, they
> can be used to built shared ones, so it's better if the *.a has been
> built with -fPIC.
>
> So, I tend to think that we could add to the configure options of the
> cmake infra:
>   -DCMAKE_POSITION_INDEPENDENT_CODE=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON)
>
> but this needs more investigations and tests.
>

The issue is solved by
http://git.buildroot.net/buildroot/commit/?id=40089283e91fc6daae1aff0346f6821bd2bcab80

Fran?ois

>
> Regards,
>
> --
> Samuel
