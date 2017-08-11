From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 23:00:13 +0200
Subject: [Buildroot] [PATCH] toolchain-wrapper: do not use deprecated
 -mfused-madd
In-Reply-To: <20170811173246.GL28021@waldemar-brodkorb.de>
References: <20170811052847.GA32348@waldemar-brodkorb.de>
 <20170811080858.336ba4d3@windsurf>
 <20170811173246.GL28021@waldemar-brodkorb.de>
Message-ID: <77f2751e-5b1d-d961-3f71-82e6696d9ccb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 19:32, Waldemar Brodkorb wrote:
> Hi,
> Thomas Petazzoni wrote,
> 
>> Hello,
>>
>> On Fri, 11 Aug 2017 07:28:48 +0200, Waldemar Brodkorb wrote:
>>> GCC deprecated -mfused-madd, -ffp-contract=off should
>>> be used for Xburst workaround.
>>> uClibc compilations will fail, because a gcc warning
>>> is emitted while checking for TLS support in the compiler.
>>
>> In which gcc version was -ffp-contract=off added ? Can we use that
>> unconditionally, or is it only available in recent gcc versions ?
> 
> It was added in commit b9be572eda05cd23bbabd6409387d2c7ac782715.
> 
> Not sure how to find when it was added in a release.

$ git describe --contains b9be572eda05cd23bbabd6409387d2c7ac782715
gcc-4_6_0-release~2941

 So we should use something like:

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_6),y)
TOOLCHAIN_WRAPPER_ARGS += -DBR_FP_CONTRACT_OFF
else
TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
endif

 But actually, I'd much prefer this stuff to just be coded in
TOOLCHAIN_WRAPPER_OPTS. But that's a much bigger patch (series) so not for master.

 Regards,
 Arnout


> 4.6.4 seems to have it:
> https://gcc.gnu.org/onlinedocs/gcc-4.6.4/gcc/Optimize-Options.html#index-ffp_002dcontract-691
> 
> I don't find it in earlier release docs.
> 
> best regards
>  Waldemar
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
