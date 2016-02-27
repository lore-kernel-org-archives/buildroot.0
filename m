From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 23:05:24 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
References: <20160222073022.D29851025E8@stock.ovh.net>
 <20160222150539.0301105e@free-electrons.com>
Message-ID: <46j9qcxf4f.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 22 Feb 2016 15:05:39 +0100 schrieb Thomas Petazzoni:

>>          arm |             kodi-15.2-Isengard | NOK |
>>          http://autobuild.buildroot.net/
results/43939f65e4516adddc4385c6e0a2193abcab0446/
> 
> Usage of 64-bits on ARM with uClibc, doesn't work because gcc uses the
> __write() internal glibc symbol. We need to isolate the Kodi features
> that uses this 64 bits atomic operation (if possible) and make it depend
> on BR2_TOOLCHAIN_ARM_HAS_SYNC_8. See also
> https://git.busybox.net/buildroot/tree/toolchain/toolchain-
common.in#n339
> for a discussion of this problem.
> 
> Bernd ?

Hi Thomas,

tbh I do not think that I fully understood the atomics stuff[1], but I 
could reproduce the build error ;) Kodi checks unconditionally for
	__sync_add_and_fetch
	__sync_sub_and_fetch
	__sync_val_compare_and_swap
in configure.ac, the only file using the resulting defines is xbmc/
threads/Atomics.cpp which is used in several parts of Kodi, I do not 
think all of these features are optional.
The build error also occurs with Kodi 16.0-Jarvis, btw, and should be 
fixes by this patch: http://patchwork.ozlabs.org/patch/589456/

Regards, Bernd

[1] https://git.busybox.net/buildroot/commit/toolchain/toolchain-
common.in?id=6856e417da4f3aa77e2a814db2a89429af072f7d
