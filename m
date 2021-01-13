From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Jan 2021 09:04:31 +0100
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <CAOMZO5CQ8-rHcZyKPmmSGCo+MSSEKRcbMJMDiFHp5VQDahG+Ug@mail.gmail.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
 <636366db-0dd3-4a30-7097-d09423d91aa8@gmail.com>
 <CAOMZO5CQ8-rHcZyKPmmSGCo+MSSEKRcbMJMDiFHp5VQDahG+Ug@mail.gmail.com>
Message-ID: <66568a2a-8730-9d9a-07b4-168bd8eea60b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

Le 13/01/2021 ? 01:27, Fabio Estevam a ?crit?:
> Hi Romain,
> 
> On Tue, Jan 12, 2021 at 7:50 PM Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Not related to this patch, but why those firmware are installed to
>> $(TARGET_DIR)/lib/firmware/imx ?
>>
>> Because without any change I get:
>>
>> coda 2040000.vpu: Direct firmware load for vpu/vpu_fw_imx6q.bin failed with error -2
>> coda 2040000.vpu: Falling back to sysfs fallback for: vpu/vpu_fw_imx6q.bin
>> coda 2040000.vpu: Direct firmware load for v4l-coda960-imx6q.bin failed with
>> error -2
>> coda 2040000.vpu: Falling back to sysfs fallback for: v4l-coda960-imx6q.bin
>> coda 2040000.vpu: firmware request failed
>>
>> It seems that vpu directory is expected to be in "firmware" directory:
>> $(TARGET_DIR)/lib/firmware/vpu
>>
>> see:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af7779f3cbc1f6720d15f00abc797493710d1ab
>>
>> At least we have to create a simlink:
>> /lib/firmware/imx/vpu -> /lib/firmware/vpu
>>
>> or set fw_path_para in the kernel cmdline:
>> firmware_class.path=/lib/firmware/imx/
> 
> I notice the same here on a imx53.
> 
> Then I tried to change the VPU path like this:
> 
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -116,9 +116,9 @@ endif
>  FIRMWARE_IMX_VPU_FW_NAME = $(call
> qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
>  ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
>  define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
> -       mkdir -p $(TARGET_DIR)/lib/firmware/imx/vpu
> +       mkdir -p $(TARGET_DIR)/lib/firmware/vpu
>         cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin \
> -               $(TARGET_DIR)/lib/firmware/imx/vpu/
> +               $(TARGET_DIR)/lib/firmware/vpu/
>  endef
>  endif
> 
> ,but the VPU firmware is still not found:
> 
> [    9.237801] coda 63ff4000.vpu: IRQ bit not found
> [    9.291801] coda 63ff4000.vpu: Direct firmware load for
> vpu_fw_imx53.bin failed with error -2
> [    9.300646] coda 63ff4000.vpu: Falling back to sysfs fallback for:
> vpu_fw_imx53.bin

There are several path supported (see the link above):

 	[CODA_IMX53] = {
 		.firmware     = {
 			"vpu_fw_imx53.bin",
			"vpu/vpu_fw_imx53.bin",
 			"v4l-coda7541-imx53.bin"
 		},

So with your change, the first try fail using "/lib/firmware/vpu_fw_imx53.bin".
But "/lib/firmware/vpu/vpu_fw_imx53.bin" succeed.

"firmware request failed" message should never appear in your dmesg log.

I believe there is a confusion between firmware (such vpu firmware) and imx sdma
firmware that require to be installed to "/lib/firmware/imx" directory.

See:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm/boot/dts/imx6qdl.dtsi?id=8af7779f3cbc1f6720d15f00abc797493710d1ab#n883

Best regards,
Romain


> done
> Saving random seed: [    9.997216] random: dd: uninitialized urandom
> read (512 bytes read)
> OK
> Starting network: OK
> 
> Welcome to Buildroot
> buildroot login: root
> # ls /lib/firmware/vpu/vpu_fw_imx53.bin
> /lib/firmware/vpu/vpu_fw_imx53.bin
> #
> 
> Any ideas?
> 
> Thanks,
> 
> Fabio Estevam
> 
