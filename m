From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 11 Aug 2015 11:04:19 +0200
Subject: [Buildroot] [PATCH] package/dawgdic: needs gcc >= 4.7
In-Reply-To: <20150808171428.68f11d28@free-electrons.com>
References: <1439026543-25909-1-git-send-email-romain.naour@openwide.fr>
 <55C617D0.3050800@green-communications.fr>
 <20150808171428.68f11d28@free-electrons.com>
Message-ID: <55C9BA93.4090608@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/08/2015 17:14, Thomas Petazzoni wrote:
> Dear Nicolas Cavallari,
> 
> On Sat, 08 Aug 2015 16:53:04 +0200, Nicolas Cavallari wrote:
>> However, there is another problem: If an external toolchain is built 
>> using GCC and uclibc without any additional patches, then you will not 
>> have them, because of a too-broad feature check in libstdc++ that checks 
>> if the C library has complete support for C99[2].
>>
>> This problem is still unresolved even with the latest GCC. buildroot 
>> patches GCC to fix this, but if an external toolchain does not ...
> 
> We simply can't support all possible uClibc external toolchains. If you
> come with an external toolchain that has a uClibc configuration
> completely different than the one in Buildroot, then you will get tons
> of failures. This is what happened with the pre-built ARC toolchain
> from Synopsys, and we ended up disabling it because it was breaking too
> many of the Buildroot assumptions on the uClibc configuration.
> 
> But indeed, due to this gcc shortcoming, none of the uClibc external
> toolchains that are not built with Buildroot can be used. Do we really
> want to fix this problem?

I was just pointing out the problem. A possible solution in this case
is to add a patch replacing std::strtoll with strtoll().

> Or maybe this means that the idea of using the gcc version was not a
> good idea, and we should really have feature-based Config.in options,
> like TOOLCHAIN_HAS_STD_STRTOLL.

None of the two solution will fully solves the problem. C++11 support
in GCC 4.6-4.9 is immature.  There are too many unimplemented or buggy
features and regressions to track them with feature-based Config.in
options or even GCC major version ranges, because fixes (and
regressions) are also introduced in minor releases.

The only sane thing to do would be for me to start fighting with the
gcc test suite again and (assuming i succeed,) submit those patches,
then wait for the old gcc versions to phase out.
