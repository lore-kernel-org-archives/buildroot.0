From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:38:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: needs sync_4
In-Reply-To: <20170525093119.15205-1-bernd.kuhls@t-online.de>
References: <20170525093119.15205-1-bernd.kuhls@t-online.de>
Message-ID: <20170529233843.07d8985d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 11:31:19 +0200, Bernd Kuhls wrote:

>  	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

This is not correct, because ffmpeg has fallback code on pthreads
based atomics, so for example SPARC does not have
BR2_TOOLCHAIN_HAS_SYNC_4, but ffmpeg builds fine.

The issue is only with m68k_cf, where ffmpeg thinks it has atomic
intrinsics while it has not.

Since we really don't care about ffmpeg on m68k_cf, I've simply
excluded this architecture, as I proposed on another patch proposed by
Waldemar to fix the same issue:
https://patchwork.ozlabs.org/patch/756664/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
