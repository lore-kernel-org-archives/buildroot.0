From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 17 Jan 2016 20:06:49 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <569BE649.6070808@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 17/01/2016 00:11, Thomas Petazzoni a ?crit :
> Hello,
> 
> Gustavo, Vicente, J?rg, Frank, Bernd, Maxime, Carsten, Davide, Jeremy,
> VIcente, Gilles, Gary, Romain, Matt, Waldemar, Fran?ois, Alexey, Joris,
> Volkov: there are some specific build failures for which your help
> would be appreciated. See below. Thanks in advance for your help!
> 
> On Sat, 16 Jan 2016 08:30:21 +0100 (CET), Thomas Petazzoni wrote:
> 
>>          arm |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/61e121c25fc07083bcccedfcb4f938d18f5c5456/
> 
> Musl build issue:
> 
> iprlib.h:49:27: fatal error: bits/sockaddr.h: No such file or directory
>  #include <bits/sockaddr.h>
> 
> Romain, you bumped this package recently, can you have a look ?
> 

I would suggest to remove bits/sockaddr.h since it's specific to glibc and add
limits.h to define PATH_MAX or disable for musl. At least iprutils build with
these fixes.

Note that iprutils switched to autotools buildsystem recently (since 2.4.6), so
if we bump to the latest version we can remove the two patches :
0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
0003-Fix-static-build-by-passing-the-libraries-i.patch

> 
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ae9eca750d27f80cf8b0743f41cdfcc50ea476f1/
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/dca1ba4a15cd9326a43e99d78bd13021bc87d9a2/
> 
> Romain, I don't remember what was the conclusion about this issue. I
> remember we discussed it at some point.
> 
It's an issue with gcc <= 5.2 see:
http://lists.busybox.net/pipermail/buildroot/2015-December/146308.html

I think we should rebuild the prebuild nios2 toolchain with gcc 5.3 and the
upcoming binutils 2.26.

> 
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/199b8ed788e4ca3eca03b95710a3bb644d81d187/
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/546f94ee09fcff27ea2d7c6cebb0b48aec1881f8/
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bb90227b6a18bde0cef45f82620de560d48866e7/
> 
> Compiler problem. I don't remember if I reported it.
> 
Qt-GUI issue with Binutils 2.25.1 (CS NIOSII 2015.11 and prebuild one).

http://patchwork.ozlabs.org/patch/561414/

> 
>>       xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/f913556517654f833bf17f141597ba41570b02b7/
>>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/865ce538e3dc3ce8005a39b5400fc3f019d7a411/
>>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0581889edfb7bf5ca0f23e3111ac6eeffbee3376/
>>     mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/1abb03babacacf13db33ae9fe89b5d52925b58b1/
> 
> 2 different dependency problems.
> 

There is also a similar issue with xlib_libfontenc:
http://patchwork.ozlabs.org/patch/564098/

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
