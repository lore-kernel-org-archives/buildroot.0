From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 15:16:53 +0100
Subject: [Buildroot] [PATCH v4 1/1] boot/arm-trusted-firmware: Forward
 stack protection configuration
In-Reply-To: <d3c81268-c26b-873d-931a-6d6182312fc3@mind.be> (Arnout
 Vandecappelle's message of "Tue, 15 Dec 2020 21:26:36 +0100")
References: <20201123131506.834183-1-christoph.muellner@theobroma-systems.com>
 <d3c81268-c26b-873d-931a-6d6182312fc3@mind.be>
Message-ID: <87h7ofnt0q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 23/11/2020 14:15, Christoph M?llner wrote:
 >> TF-A supports stack smashing protection (-fstack-protector-*).
 >> However, that feature is currenlty silently disabled because
 >> ENABLE_STACK_PROTECTOR is not set during build time.
 >> 
 >> As documented in the TF-A user guide, the flag ENABLE_STACK_PROTECTOR
 >> is required to enable stack protection support. When enabled the symbols
 >> for the stack protector (e.g. __stack_chk_guard) are built.
 >> This needs to be done because TF-A does not link against an external
 >> library that provides that symbols (e.g. libc).
 >> 
 >> So in case we see that BR2_SSP_* is enabled, let's enable the corresponding
 >> ENABLE_STACK_PROTECTOR build flag for TF-A as documented in the TF-A user guide.
 >> 
 >> This patch also fixes a the following linker errors with older TF-A versions
 >> if BR2_SSP_* is enabled (i.e. -fstack-protector-* is used as compiler flag)
 >> and ENABLE_STACK_PROTECTOR is not set, which are caused by the missing
 >> stack protector symbols:
 >> 
 >> [...]
 >> params_setup.c:(.text.params_early_setup+0xc): undefined reference to `__stack_chk_guard'
 >> aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x14): undefined reference to `__stack_chk_guard'
 >> aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x104): undefined reference to `__stack_chk_guard'
 >> aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x118): undefined reference to `__stack_chk_fail'
 >> aarch64-none-linux-gnu-ld: ./build/px30/release/bl31/pmu.o: in function `rockchip_soc_sys_pwr_dm_suspend':
 >> pmu.c:(.text.rockchip_soc_sys_pwr_dm_suspend+0xc): undefined reference to `__stack_chk_guard'
 >> [...]
 >> 
 >> TF-A releases after Nov 2019, that include 7af195e29a4, will circumvent
 >> these issue by explicitliy and silently disabling the stack protector
 >> by appending '-fno-stack-protector' to the compiler flags in case
 >> ENABLE_STACK_PROTECTOR is not set.
 >> 
 >> Tested on a Rockchip PX30 based system (TF-A v2.2 and upstream/master).
 >> 
 >> Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>

 >  Applied to master, thanks.

 >  Thank you for the excellent commit message and the research leading up to this v4!

Indeed, thanks.

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
