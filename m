From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 29 Jan 2016 00:35:26 +0100
Subject: [Buildroot] glibc and --enable-kernel
In-Reply-To: <20160128093618.42baf311@free-electrons.com>
References: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
 <20160127092119.7cf8953d@free-electrons.com>
 <20160128025537.GB5589@tungsten.ozlabs.ibm.com>
 <20160128093618.42baf311@free-electrons.com>
Message-ID: <56AAA5BE.2050306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-01-16 09:36, Thomas Petazzoni wrote:
> Sam,
> 
> On Thu, 28 Jan 2016 13:55:37 +1100, Sam Bobroff wrote:
[snip]
>> Ok that is certainly easier and works for me, so I'll post a patch :-)
>>
>> I'm curious tho: when I hacked up some test code I used
>> BR2_DEFAULT_KERNEL_HEADERS (which seems to have the same value) but I must
>> confess I don't understand the implications of choosing between
>> BR2_DEFAULT_KERNEL_HEADERS or BR2_TOOLCHAIN_HEADERS_AT_LEAST. Could you explain
>> the difference so I don't have to read so much Make code? ;-)
> 
> There would be no real difference between the two for your use case.
> 
> BR2_DEFAULT_KERNEL_HEADERS is a string that contains the version number
> of the Linux kernel sources chosen in the linux-headers package. It
> would contain things like 3.2.76, 4.3.4, etc. or a user-specified
> kernel version. It would have worked all fine for your case.
> 
> BR2_TOOLCHAIN_HEADERS_AT_LEAST is a string that exists for both the
> internal and external toolchains, and which indicates the "series" of
> the kernel headers (i.e just 3.2, 3.4, 4.0, etc.).
> 
> The only reason that may encourage you to use
> BR2_TOOLCHAIN_HEADERS_AT_LEAST instead of BR2_DEFAULT_KERNEL_HEADERS is
> an upcoming patch from Yann E. Morin (already submitted but not merged
> yet), which allows to tell Buildroot to use the kernel version
> specified in the "Kernel" menu as the version for the kernel headers.
> In this case, I believe BR2_DEFAULT_KERNEL_HEADERS will not be correct,
> while BR2_TOOLCHAIN_HEADERS_AT_LEAST will be.

 A minor issue with _AT_LEAST, however, is that it will probably go through
deprecation eventually. Right now we have "2.6" as the lowest _AT_LEAST - how
will glibc deal with that? I can imagine at some point we'll deprecate 3,1, 3.2,
and 3.3, so if you're using 3.3 headers the _AT_LEAST will become 3.0. Right
now, we already have that for 2.6.3x, which will fall back to 2.6.0 (I guess -
should be checked if glibc doesn't barf on 2.6 without .0).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
