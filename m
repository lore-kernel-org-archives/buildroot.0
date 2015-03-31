From: =?UTF-8?B?U8OpYmFzdGllbiBSb3llbg==?= <sebastien.royen@armadeus.com>
Date: Tue, 31 Mar 2015 11:32:36 +0200
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
In-Reply-To: <CAGm1_ktgWebiGtX0_+PdHtqeqnZkqYy=BK6ciFg0FReGGryB6Q@mail.gmail.com>
References: <5515E2AC.3010100@armadeus.com>
 <20150329144607.0e60928f@free-electrons.com> <55184DA0.1050901@armadeus.com>
 <20150329224013.0d330434@free-electrons.com>
 <CAGm1_ktFjO8KyQTOTDnKo1bLbhjwBpyw7Li=T6sLAf=Vab71=w@mail.gmail.com>
 <20150330134929.09fc5de7@free-electrons.com>
 <CAGm1_kv-5-ikeo+KLzPNHR2rEGm5zFO6PLJP0EiHdagfs+GDjA@mail.gmail.com>
 <CAGm1_kvd3kKs5mp2QUNf3K=x1EzAghNC=Gqb6x+kFRqY7pMW8g@mail.gmail.com>
 <CAGm1_ktgWebiGtX0_+PdHtqeqnZkqYy=BK6ciFg0FReGGryB6Q@mail.gmail.com>
Message-ID: <551A69B4.9030709@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 31/03/2015 11:05, Yegor Yefremov a ?crit :
> On Mon, Mar 30, 2015 at 4:05 PM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> On Mon, Mar 30, 2015 at 3:37 PM, Yegor Yefremov
>> <yegorslists@googlemail.com> wrote:
>>> On Mon, Mar 30, 2015 at 1:49 PM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>> Dear Yegor Yefremov,
>>>>
>>>> On Mon, 30 Mar 2015 13:05:09 +0200, Yegor Yefremov wrote:
>>>>
>>>>> Can confirm, that I'm having the same issue with my German openSUSE
>>>>> 12.1 machine. Exporting LANGUAGE=en_US helped. haven't tried LC_ALL
>>>>> yet. Python 2.7.9.
>>>> Ok.
>>>>
>>>>> The whole stuff got screwed only lately. I've been using python-dpkt,
>>>>> that requires PYTHON_ZLIB for ages and had no problems on this
>>>>> machine.
>>>> Seems weird. Do we have an idea what broke things ? Can you try 2015.02,
>>>> 2014.11 and see if the issue also happens (or not) ?
>>> Hm. Strange. 2014.11 seem to have the same issue. Can it be the change
>>> from Python 2.7.8 to 2.7.9?
>>>
>>> # cat /etc/os-release
>>> NAME=Buildroot
>>> VERSION=2014.11
>>> ID=buildroot
>>> VERSION_ID=2014.11
>>> PRETTY_NAME="Buildroot 2014.11"
>>>
>>> I'm also working with en englich Xubuntu VM. I can imagine, that I
>>> haven't made updates/cleaning on my suse machine. Most upstream work
>>> was made with Xubuntu.
>> Python 3.4.2 seems to have this issue too.
> Tried to build image via Sourcery CodeBench ARM 2014.05. Python 2.7.9
> shows no problems. But when I'm doing the same with BR's toolchain,
> zlib module won't be found at runtime.
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_CCACHE=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_BINUTILS_VERSION_2_25=y
> BR2_GCC_VERSION_4_9_X=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_ZLIB=y
>
Hi,

Problem is on parsing output of : gcc -E -v - </dev/null 1>/dev/null
Maybe it would be better to fix setup.py in order to be generic.
Output with en_US is like :
...
#include <...> search starts here:
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/include
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/include-fixed
 /my_path/bsp/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/../../../../arm-buildroot-linux-gnueabihf/include
 /my_path/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
End of search list.
...

Output with de is like :
...
#include <...> - Suche beginnt hier:
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/include
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/include-fixed
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/../../../../arm-buildroot-linux-gnueabihf/include
 /my_path/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
Ende der Suchliste.
...

Output with fr version is :
la recherche pour #include <...> d?bute ici:
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/include
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/include-fixed
 /my_path/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabihf/4.8.4/../../../../arm-buildroot-linux-gnueabihf/include
 /my_path/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
Fin de la liste de recherche.
...

Or maybe we should keep only C language in toolchain build ? ( something
to do with BR2_ENABLE_LOCALE_WHITELIST ? )

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150331/1efe615f/attachment.html>
