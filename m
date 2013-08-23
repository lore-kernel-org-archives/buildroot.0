From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Aug 2013 16:53:54 -0300
Subject: [Buildroot] [PATCH] eglibc: defaults to SSP
In-Reply-To: <20130823210931.4f2323fc@skate>
References: <1374935524-5259-1-git-send-email-gustavo@zacarias.com.ar>
 <20130823210931.4f2323fc@skate>
Message-ID: <5217BDD2.1020806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/23/2013 04:09 PM, Thomas Petazzoni wrote:

>>  config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
>>  	bool "Enable stack protection support"
>> +	depends on !BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>>  	help
>>  	  Enable stack smashing protection support using GCCs
>>  	  -fstack-protector-all option.
> 
> I'm jumping on this as I was looking in a bit more details at the SSP
> support. It seems that GCC itself has a libssp library, and some
> external toolchains (such as the Linaro one) has a libssp.so that is
> apparently provided by GCC, while usually the SSP symbols
> (__stack_chk_fail and al.) are provided by the C library.
> 
> Currently BR2_TOOLCHAIN_BUILDROOT_USE_SSP is a toolchain option of the
> Buildroot internal backend. But what if I want to use SSP support with
> an external toolchain? You made this symbol depend
> on !BR2_TOOLCHAIN_BUILDROOT_EGLIBC, but BR2_TOOLCHAIN_BUILDROOT_USE_SSP
> is also used to add the -fstack-protector-all to the CFLAGS when
> compiling all packages, which is also useful when eglibc is used, no?
> 
> Thanks for your insights,

Hi.
This patch was never applied since it's wrong (hence i ditched it from
patchwork).
We need to build with -fstack-protector-all even for eglibc.
Eglibc (at least the version we ship for internal toolchain) defaults to
support/build stack protection support on so the option is valid.
We don't have glibc support (yet - pending on your patches) but AFAIK
for modern-ish versions of glibc that's also the case.
For external toolchains, well, there's varying support i take it
depeding on toolchain component versions.
libssp wouldn't normally be necessary for modern toolchains except for
MAYBE compatibility reasons which i don't think we should care about
(old blobby apps linked against libssp) or if the toolchain has old
components so libssp shouldn't necessarily be copied, at least not as a
default.
Doing the nasty trick with sourcery 2013.05 ARM (qemu_arm_versatile)
with BR2_TARGET_OPTIMIZATION="-fstack-protector-all" works fine for
example without the need for tweaks.
Regards.
