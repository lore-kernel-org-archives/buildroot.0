From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 08 May 2014 10:57:05 +0200
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <CAHkwnC_2Nhx5dUOb4AjR670dasOaDpJDEW3F526sO3LA83bgQA@mail.gmail.com>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
 <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
 <20140507174421.04e3c2f2@free-electrons.com>
 <CAHkwnC-nxOwx6wj3hQaPbG4Q5nzQMbyK-xhuKsPd6F5_afSrhQ@mail.gmail.com>
 <536A6F53.1020408@lucaceresoli.net>
 <CAHkwnC98U2CNXV0KD8Uh1QEisSZvbmTwTiY3t7bp=guYjhMqFg@mail.gmail.com>
 <CAHXCMMLXcYKfuedgtRwqT-auXF-VCJJsd9a5GriOegZK_2jzzw@mail.gmail.com>
 <CAHkwnC_2Nhx5dUOb4AjR670dasOaDpJDEW3F526sO3LA83bgQA@mail.gmail.com>
Message-ID: <536B46E1.2000107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Fabio Porcedda wrote:
> On Wed, May 7, 2014 at 9:06 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Fabio, Luca, all,
>>
>> On Wed, May 7, 2014 at 7:46 PM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
>>> On Wed, May 7, 2014 at 7:37 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>>>> Hi Fabio,
>>>>
>>>>
>>>> Fabio Porcedda wrote:
>>>>>
>>>>> On Wed, May 7, 2014 at 5:44 PM, Thomas Petazzoni
>>>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>>>>
>>>>>> Dear Fabio Porcedda,
>>>>>>
>>>>>> On Wed, 7 May 2014 17:32:38 +0200, Fabio Porcedda wrote:
>>>>>>
>>>>>>> Are you sure that In your system there isn't installed the ncurses
>>>>>>> development package?
>>>>>>>
>>>>>>> On my ubuntu distribution if i uninstall the libncurses5-dev package i
>>>>>>> got:
>>>>>>>
>>>>>>> make defconfig && make allyespackageconfig
>>>>>>>
>>>>>>> make host-cmake
>>>>>>
>>>>>>
>>>>>> Well, right. On my system, libncurses-dev is definitely installed, but
>>>>>> I was thinking that on the autobuilders chroot it is not. But in fact
>>>>>> it is, for a simple reason: libncurses-dev is needed for 'make
>>>>>> menuconfig'.
>>>>
>>>>
>>>> Still I find it strange that it fails. If libncurses-dev is not
>>>> found, CMake just disables building ccmake. Maybe you had configured
>>>> host-cmake with libncurses-dev installed, then (re)built it without
>>>> libncurses?
>>
>> That's weird!
>> I just gave a try in a debian chroot with libncurses5 installed but
>> not libncurses5-dev (so, there is the *.so files but no ncurses'
>> headers) and cmake build script correctly detect that something is
>> missing to build ccmake. Thus it disables ccmake build, and the build
>> successfully ends.
>
> You are right! Usually cmake builds fine even without the
> libncurses5-dev package installed, but it fails when buildroot have
> already built the host-ncurses package, try it:
>
> make clean host-ncurses host-cmake
>
> I found that because I'm building the allyespackageconfig.
>
> I'm not sure to understand why it's happening.
> Maybe cmake doesn't search headers in output/host/usr/include?
>
>> The configure/build log would help to understand what happened.
>
> This is the log of make host-cmake:
> https://gist.github.com/anonymous/123770e4ed5a12820066

Maybe CMake looks in output/host/ to check for ncurses availability, but
then uses the system path (/usr) when building. This is not visible
from your log, you may want to use verbose mode to have CMake print the
build command line.

-- 
Luca
