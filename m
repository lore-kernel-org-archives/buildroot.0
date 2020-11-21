From: =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@theobroma-systems.com>
Date: Sat, 21 Nov 2020 18:28:16 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: Forward
 stack protection configuration
In-Reply-To: <87eekmy7as.fsf@tarshish>
References: <20201120212912.2993985-1-christoph.muellner@theobroma-systems.com>
 <87eekmy7as.fsf@tarshish>
Message-ID: <d2e4f4d0-c3b1-71de-dbfd-b80ba5235ca2@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/21/20 5:59 PM, Baruch Siach wrote:
> Hi Christoph,
> 
> On Fri, Nov 20 2020, Christoph M?llner wrote:
>> TF-A supports stack smashing protection (-fstack-protector-*).
>> Since we already forward the required compiler flag, let's
>> also tell TF-A that we actually want the required symbols
>> (e.g. __stack_chk_guard) to be available.
>>
>> Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
>> ---
>>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> index a3553e36cf..f5be39100e 100644
>> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> @@ -100,6 +100,18 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>>  endif
>>  
>> +ifeq ($(BR2_SSP_REGULAR),y)
>> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
>> +endif
>> +
>> +ifeq ($(BR2_SSP_STRONG),y)
>> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
>> +endif
>> +
>> +ifeq ($(BR2_SSP_ALL),y)
>> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
>> +endif
> 
> It looks like the toolchain wrapper does that already. See
> toolchain/toolchain-wrapper.mk. Are you sure this is needed?

Hi Baruch,

I don't see this functionality there.

Note, that you need two things for getting the stack protector working:

1) Toolchain to emit additional code requiring external symbols
2) Runtime that provides the required external symbols

The toolchain wrapper correctly addresses 1) by providing "-fstack-protector*" flags
and your libc will then provide the required symbols for 2).
However, TF-A does not link against libc and requires these build flags
(ENABLE_STACK_PROTECTOR=x) in order to emit the required symbols.

BR
Christoph
