From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 14:24:51 +0200
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <20120627145340.34895a74@skate>
References: <20120627000701.506f534e@skate>
 <359dafd382a8aa5ccaaa5ebbde9b38ff@zacarias.com.ar>
 <20120627145340.34895a74@skate>
Message-ID: <4FEEF013.9000500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/27/12 14:53, Thomas Petazzoni wrote:
> Hello,
>
> Le Wed, 27 Jun 2012 08:00:40 -0300,
> Gustavo Zacarias<gustavo@zacarias.com.ar>  a ?crit :
>
[snip]
>>>   *) Should we make the dependency from packages on libtirpc a
>>>      "select", like all other library dependencies, or a "depends on", to
>>>      mimic what we currently do for RPC support (packages "depends on
>>>      BR2_INET_RPC", and they show a comment if BR2_INET_RPC isn't
>>>      available) ?
>>
>> Probably keep it as a "depends on", in some cases you'll already have
>> the toolchain providing RPC.
>> Maybe even block libtirpc if the origin toolchain has RPC support? Or
>> can they be used at the same time? (Not that anyone would want too i
>> think...)
>
> Yes, as I was mentionning in my initial e-mail, I was thinking of
> having something like:
>
> config BR2_RPC_AVAILABLE
> 	bool
>
> config BR2_TOOLCHAIN_HAS_NATIVE_RPC
> 	select BR2_RPC_AVAILABLE
> 	bool
>
>
> Toolchains having native RPC support (i.e uClibc with RPC support, or
> glibc<  2.14) would select BR2_TOOLCHAIN_HAS_NATIVE_RPC Then, the
> libtirpc package would:
>
> config BR2_PACKAGE_LIBTIRPC
> 	bool "libtirpc"
> 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> 	select BR2_RPC_AVAILABLE
> 	select

  This seems overly complex to me.

>
> But now, the question is for packages that need RPC support. We have
> two choices. First, like today, the user has to manually enable RPC
> support in the toolchain *OR* manually enable libtirpc.
>
> config BR2_PACKAGE_FOO
> 	depends on BR2_RPC_AVAILABLE
>
> comment "foo needs RPC support, either in toolchain or through libtirpc"
> 	depends on !BR2_RPC_AVAILABLE
>
> Or, we can automatically select libtirpc if needed:
>
> config BR2_PACKAGE_FOO
> 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>
> and no comment is needed, because if the toolchain has no RPC support,
> it would automatically be handled by libtirpc.

  This one is much simpler: just one additional symbol, and it's all
hidden from the user except in the case of an unknown external
toolchain or a crosstool-NG toolchain.


  However, given that this will only appear in BR-2012.08 at the earliest,
and that the native RPC is on the way out anyway, maybe we can keep it
even simpler and remove the BR2_TOOLCHAIN_HAS_NATIVE_RPC option
completely.  Just replace all 'depends on BR2_INET_RPC' with
'select BR2_PACKAGE_LIBTIRPC'.  The only users who are aversely affected
by that are people using a pre-2.14 glibc toolchain, because now they'll
get 100K of redundant library.  But I guess glibc users don't care much
about a mere 100K of rootfs size.

  Of course, this would require testing that all the RPC users actually
work with tirpc.  Or is it sufficient that we build-test it and assume
upstream will take care of making it work?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
