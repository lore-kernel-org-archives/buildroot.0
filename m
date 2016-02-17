From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Feb 2016 01:17:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: patch ping to link
 against libm
In-Reply-To: <20160216212804.7a56f3a7@free-electrons.com>
References: <1455541206-18200-1-git-send-email-martin@barkynet.com>
 <20160215231703.2052c7e0@free-electrons.com>
 <20160216190329.GO14809@waldemar-brodkorb.de>
 <20160216212804.7a56f3a7@free-electrons.com>
Message-ID: <56C3BC1E.1060002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-02-16 21:28, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 16 Feb 2016 20:03:29 +0100, Waldemar Brodkorb wrote:
> 
>> The root of the problem is rather simple. When you use math library
>> functions you are required to link libm explicitely. I think for
>> historical reasons. For musl this is no issue as everything is
>> included in libc.so. In uClibc world you have the choice and could simply
>> build a system without any math library. 
>> GNU libc seems to have weak aliases for finitef even in libc.so:
>> nm output/build/glibc-2.22/build/libc.so|grep finitef                                                                                                      
>> 0002ba9c W finitef
>> 0002ba9c T __finitef
>> 0002ba9c t __GI___finitef
>>
>> So linking with GNU libc does not fail for iputils even without -lm.
>>
>> Not sure, I cannot find every libm function, but some. tgamma or
>> exp10 is not referenced in libc.so.
>>
>> May be Mike can explain the Glibc behaviour?
>>
>> The finite macros where added here:
>> http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/include/math.h?id=21902b578e96fd6b85b9bcda8a0e929fc844ec51
>> So 1.0.10 is the first release containing this BSD specific
>> functions in a usable way.
>>
>> I think BR2_*DEBUG* option is not related to this error.
> 
> OK, but how do you explain that:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_IPUTILS=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Builds just fine (and uses uClibc 1.0.9) ?

 I think the difference is in gcc versions. It looks like gcc 4.7 in that
external toolchain uses a built-in inline version of __finite(), while gcc 4.9
just calls the external function. I don't think it has anything to do with the
uClibc version (though I didn't try all combinations). But for sure, it fails
with gcc 4.9 and uClibc 1.0.10 while it succeeds with the same config and gcc 4.7.

 I don't think BR2_ENABLE_DEBUG has anything to do with it, but I didn't test that.

 Anyway, it seems obvious to me that if you use finite(), then you should link
with -lm. There's bound to be some combination of libc and compiler that
requires -lm.

 So, maybe add 'and gcc 4.9' to the commit message, but even without it:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
