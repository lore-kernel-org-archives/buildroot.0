From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Jul 2012 22:37:04 +0200
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <20120703214807.17a08790@skate>
References: <20120627000701.506f534e@skate>
 <359dafd382a8aa5ccaaa5ebbde9b38ff@zacarias.com.ar>
 <20120627145340.34895a74@skate> <4FEEF013.9000500@mind.be>
 <20120703214807.17a08790@skate>
Message-ID: <4FF357F0.3050306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/12 21:48, Thomas Petazzoni wrote:
> Le Sat, 30 Jun 2012 14:24:51 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
>>    However, given that this will only appear in BR-2012.08 at the earliest,
>> and that the native RPC is on the way out anyway, maybe we can keep it
>> even simpler and remove the BR2_TOOLCHAIN_HAS_NATIVE_RPC option
>> completely.  Just replace all 'depends on BR2_INET_RPC' with
>> 'select BR2_PACKAGE_LIBTIRPC'.  The only users who are aversely affected
>> by that are people using a pre-2.14 glibc toolchain, because now they'll
>> get 100K of redundant library.  But I guess glibc users don't care much
>> about a mere 100K of rootfs size.
>
> Replacing "depends on BR2_INET_RPC" by "select BR2_PACKAGE_LIBTIRPC"
> means that uClibc users will be forced to use libtirpc, while they
> probably wanted to keep using the internal uClibc RPC code. I don't
> think it's a good idea to do this.

  My bad, I didn't know uClibc had native RPC code.

  Then I would go for option (2) from your original mail.  Or the following
variation:

config BR2_RPC
	bool
	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

config BR2_TOOLCHAIN_HAS_NATIVE_RPC
	bool

config BR2_PACKAGE_FOO
	select BR2_RPC

  We probably also want an rpc target for the .mk files:

FOO_DEPENDENCIES += rpc

# (in some toolchain .mk file)
.PHONY: rpc

# (in libtirpc .mk file)
ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
rpc: libtirpc
endif

  Actually, I'm not 100% sure if this scheme is a good idea because it adds
the phony rpc target to TARGETS.


  Oh and I would also not exclude libtirpc if the toolchain has native RPC,
unless there really is a conflict.  I can imagine that it makes sense to
want the extra features of libtirpc even with a 2.13 glibc.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
