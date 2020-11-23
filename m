From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Nov 2020 14:39:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware: Forward
 stack protection configuration
In-Reply-To: <5e463f0b-0609-f861-334e-7e534a1e7dc8@theobroma-systems.com>
References: <20201122143731.3374802-1-christoph.muellner@theobroma-systems.com>
 <20201122143731.3374802-2-christoph.muellner@theobroma-systems.com>
 <87wnydwbcj.fsf@tarshish>
 <5e463f0b-0609-f861-334e-7e534a1e7dc8@theobroma-systems.com>
Message-ID: <87tutgw8kg.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christoph,

On Mon, Nov 23 2020, Christoph M?llner wrote:
> On 11/22/20 6:27 PM, Baruch Siach wrote:
>> On Sun, Nov 22 2020, Christoph M?llner wrote:
>>> TF-A supports stack smashing protection (-fstack-protector-*).
>>> However it currenlty fails to build when built with BR2_SSP_*
>>> enabled, because stack protection needs to be enabled for the
>>> TF-A build process itself as well to generate the required
>>> symbols (e.g. __stack_chk_guard).
>> 
>> So you are saying that the toolchain wrapper actually breaks ATF build
>> when SSP is enabled. Is that correct? If so, this patch is not (only)
>> about enabling the SSP feature for ATF, but about fixing the ATF
>> build. Can you add the build failure error message to the commit log?
>
> I double checked that.
> When SSP is enabled and the build system does not provide
> the ENABLE_STACK_PROTECTOR flags, then the TF-A build process
> used to break at link time.
>
> This behavior was changed a year ago from from "linking breaks"
> to "silently disable the feature":
>   https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=7af195e29a4213eefac0661d84e1c9c20476e166
>
> So now we end up with a TF-A without stack protection
> in case we enable BR2_SSP_*.
>
> So Buildroot expects that stack protection is enabled when
> "-fstack-protector*" is enabled, but TF-A requires additional
> flags.
>
> FWIW, the link errors with older TF-A (I tested with v2.2) builds are:
>
>> [...]
>> params_setup.c:(.text.params_early_setup+0xc): undefined reference to `__stack_chk_guard'
>> /home/cm/build-debug/host/bin/aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x14): undefined reference to `__stack_chk_guard'
>> /home/cm/build-debug/host/bin/aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x104): undefined reference to `__stack_chk_guard'
>> /home/cm/build-debug/host/bin/aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x118): undefined reference to `__stack_chk_fail'
>> /home/cm/build-debug/host/bin/aarch64-none-linux-gnu-ld: ./build/px30/release/bl31/pmu.o: in function `rockchip_soc_sys_pwr_dm_suspend':
>> pmu.c:(.text.rockchip_soc_sys_pwr_dm_suspend+0xc): undefined reference to `__stack_chk_guard'
>> [...]
>
>> Also, the subject line should say something like "fix build with SSP
>> enabled".
>> 
>> This patch should be applied to the master branch, and backported to
>> stable branches, I believe.
>
> I am not sure about this.
> Is an enabled, but silently disabled, hardening feature considered as bug?
> If so, the we should reach out to the TF-A devs and ask for a different
> build policy here (i.e prefer hardening over build success).

I agree that a silently disabled feature is not a bug. But a build
failure is a bug.

arm-trusted-firmware.mk is meant to support older ATF version as well,
just like uboot.mk, and linux.mk. We have configurations under configs/
that set custom, vendor provided, ATF versions. In many (most?) cases
these versions predate ATF commit 7af195e29a4. So build breaks for them
once you enable SSP.

So I still think that the commit log should mention the fix to build
breakage of older ATF versions.

baruch

>>> So in case we see that BR2_SSP_* is enabled, let's enable
>>> the corresponding build flag for TF-A as documented in
>>> the TF-A user guide.
>>>
>>> Tested on a Rockchip PX30 based system.
>>>
>>> Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
>>> ---
>>>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>>> index a3553e36cf..0597cecf71 100644
>>> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>>> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>>> @@ -100,6 +100,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>>>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>>>  endif
>>>  
>>> +ifeq ($(BR2_SSP_REGULAR),y)
>>> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
>>> +else ifeq ($(BR2_SSP_STRONG),y)
>>> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
>>> +else ifeq ($(BR2_SSP_ALL),y)
>>> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
>>> +endif
>>> +
>>>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>>>  
>>>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
