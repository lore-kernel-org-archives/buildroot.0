From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:27:06 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: backport upstream patch for sync_8
 in !glibc
In-Reply-To: <20161121234340.30463-1-arnout@mind.be>
References: <20161121234340.30463-1-arnout@mind.be>
Message-ID: <20161126152706.0f1366d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 00:43:39 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> gcc 4.7 introduced the sync_8 builtin functions for ARM. For ARM < v7,
> this requires calling into the kernel. However, the failure path of
> that call reports an error with the __write() function, which is a
> glibc internal function. Therefore, it fails to link with uClibc or
> musl. This was fixed in gcc 5.2.0, by replacing the __write() with
> a plain write().
> 
> For sync_8 itself we have solved this with the conditions on
> BR2_TOOLCHAIN_ARM_HAS_SYNC_8. However, the same function is also used
> for the implementation of atomics.
> 
> For the internal toolchain, we can fix this by backporting the patch
> to 4.9.4 and 4.8.5.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1db64b4830f499621e44523e0ef68191505e2ce9
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...et-68059-libgcc-should-not-use-__write-fo.patch | 43 ++++++++++++++++++++++
>  ...et-68059-libgcc-should-not-use-__write-fo.patch | 43 ++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 package/gcc/4.8.5/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
>  create mode 100644 package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
