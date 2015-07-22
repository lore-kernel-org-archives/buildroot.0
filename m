From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Jul 2015 19:53:05 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722162715.GC6432@waldemar-brodkorb.de>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com> <55AF6B19.7010702@openwide.fr>
 <20150722162715.GC6432@waldemar-brodkorb.de>
Message-ID: <55AFD881.6050702@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 22/07/2015 18:27, Waldemar Brodkorb a ?crit :
> Hi Romain,
> Romain Naour wrote,
> 
>>>>       x86_64 |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
>>>
>>> Another uClibc static linking problem. Waldemar?
>>>
>>
>> Waldemar, I think you can skip this issue since I'm working on the efl bump to
>> the latest release and I had to disable the efl package for uClibc-ng.
>>
>> I had a link issue:
>> lib/eina/.libs/libeina.so: undefined reference to `mkstemps'
>> It turn out that mkstemps and mkostemps are not available in uClibc-ng.
> 
> Do you have a patch to test your bump and the issue with buildroot?

You can try with efl-1.14.2-v3 branch from my github repo:

https://github.com/RomainNaour/buildroot/tree/efl-1.14.2-v3

With this config:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="i686-buildroot-linux-uclibc"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_EFL=y
BR2_PACKAGE_EFL_JPEG=y
BR2_PACKAGE_XORG7=y

EFL libeina library use mkstemps from here:
https://git.enlightenment.org/core/efl.git/tree/src/lib/eina/eina_file_common.c?h=efl-1.14#n941

It seems that they really use the subfix at some place in the code.

> May be efl developers could be convinced to use something more standard like?
> mkstemps() seems very glibc specific.

Indeed, man pages says that mkstemps() is unstandardized.

Thanks for your help!

Best regards,
Romain

> 
> best regards
>  Waldemar
> 
