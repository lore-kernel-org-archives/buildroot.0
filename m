From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 17:49:00 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
In-Reply-To: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
References: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
Message-ID: <20180818174900.0ee2b668@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 00:10:13 +0200, Fabrice Fontaine wrote:
> Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS variable and use
> it in BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> This new variable will be used to select boost atomic when lock-free
> atomic ints are not available
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  toolchain/Config.in | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Thanks a lot for this additional resarch. This time, I do agree with
your findings. I improved a bit the comments in toolchain/Config.in to
explain what was going on, feel free to have a look at the final
commits that I applied to master.

However, we still have an issue: when static linking, libboost_atomic.a
is produced even on platforms that do provide the "always lock-free
atomic ints".

Examples:

 - Cortex-M4

   http://autobuild.buildroot.net/results/212/212651b677cfb0763b34596d4f999103039d89bc/build-end.log

   $ ./host/bin/arm-linux-gcc -dM -E - < /dev/null | grep
   ATOMIC_BOOL_LOCK_FREE #define __GCC_ATOMIC_BOOL_LOCK_FREE 2

 - MIPS, statically linked

   http://autobuild.buildroot.net/results/6d3/6d3db8a67a1de75920624b3e13e8110e783ddbd9/build-end.log

   $ ./host/bin/mipsel-linux-gcc -dM -E - < /dev/null | grep
   ATOMIC_BOOL_LOCK_FREE #define __GCC_ATOMIC_BOOL_LOCK_FREE 2

Do you have any idea ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
