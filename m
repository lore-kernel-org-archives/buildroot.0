From: David Picard <dplamp@gmx.com>
Date: Wed, 30 Jan 2019 11:21:16 +0100
Subject: [Buildroot] flags to build Qt5 for AMD Geode LX arch ?
In-Reply-To: <56c9f95c-00bf-609b-6b07-5598499aaa20@gmx.com>
References: <bb5b237e-ba8d-6857-f475-1960a6375112@gmx.com>
 <20190129183348.GL7130@scaer> <56c9f95c-00bf-609b-6b07-5598499aaa20@gmx.com>
Message-ID: <33183700-a3d6-6917-911e-9b4e3827c8c5@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

With this search :
$ cd build
$ grep "\-msse2" $(find ./ -name "Makefile*")

I can see that only Qt5 uses the SSE2 instruction set that my CPU 
doesn't support.

Can anyone help me remove this flag ? Should I patch the qt5* packages 
somehow ?

Thanks.

Le 30/01/2019 ? 08:46, David Picard a ?crit?:
> Hello,
>
> I'm sorry, my message was not clear, it seems. To put it in a nutshell 
> : as soon as a program is linked to Qt5, it crashes with a SIGILL. 
> Everything else works : X11, framebuffer, network, and my own programs 
> (provided they are not linked to Qt5).
>
> More interesting :
> I found by DuckDucking that the faulty instruction may be part of the 
> SSE2 instruction set. My CPU doesn't support this.
> build/qt5base-5.11.2/src/corelib/Makefile has "-msse2" in CFLAGS and 
> CXXFLAGS.
>
> Could you help me get rid of this flag ? I'm connected on the IRC 
> channel today as "dplamp".
>
> I did select all the Geode stuff :
> - Builroot config : BR2_x86_geode=y, 
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE=y
> - Kernel config : CONFIG_MGEODE_LX=y, CONFIG_FB_GEODE=y, 
> CONFIG_FB_GEODE_LX=y
>
>
> Le 29/01/2019 ? 19:33, Yann E. MORIN a ?crit?:
>> David, All,
>>
>> On 2019-01-29 19:28 +0100, David Picard spake thusly:
>>> I can build Qt5 successfully. I tested my custom application in 
>>> QEMU, with
>>> the same disk.img that I use on the read target (AMD Geode LX).
>>>
>>> But on the target, whenever I link one of my programs with Qt5, it
>>> terminates straight away with a SIGILL (illegal instruction). 
>>> Including a
>>> simple printf("Hello world") that doesn't include nor call in Qt5.
>> [--SNIP--]
>>> I thought I could pass e.g. -march=geode when I build Qt. But I 
>>> don't know
>>> how to do it. I noticed a arch.conf file in the build directory but 
>>> it gest
>>> overwritten when I make qt5base-reconfigure...
>> Well, if even a program that is not linked to Qt failes, you won;t solve
>> that by only "fixing" it in Qt...
>>
>> In that cas, since your processor is a geode, you have to confiugyure
>> Buildroot to generate code for that processor, i.e.: BR2_x86_geode=y
>>
>> Regards,
>> Yann E. MORIN.
>>
>
