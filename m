Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,HTML_OBFUSCATE_05_10,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MIME_HTML_MOSTLY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B57C4338F
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 13:21:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C238610D0
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 13:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C238610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3615D80D7D;
	Wed, 25 Aug 2021 13:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CR9YAl720GHI; Wed, 25 Aug 2021 13:21:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D5880D9E;
	Wed, 25 Aug 2021 13:21:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4EC1BF2FA
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81C1340389
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 13:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nx9PPt81GQhz for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 13:21:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBAA64010C
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:21:40 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id z18so47876210ybg.8
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TD+fAH8jLAiRsT/50GxBCXcdg2/SCUlT/ougwSSBxZw=;
 b=c466LiSCMdu6Ar2BT491cktnJJ1AEmF39dR53R7V00fjtRtr/LGxRQKnsAViP8C74W
 EjOH+bADpya5CHZoOZkUJVwLPw6pZlkEZZtMvDmEDg3JysdbMqAFwbxQ1IiN1VjqG7OK
 jTJZ26Sviyq4XBGWyyFU4hH6hY1NvWUN9XP2zxsSKLsdZ8b8xizbrHf53EjdWiVQC7sc
 gtZtXIKI76pA1QaTdgy8ulj7duWQeN9dhyzvYum1DncCokWhx3gVls1rlMJhELRoj9hA
 eKyIyGqrXNlqzZNObkcZjFV3cLVOxElSZvYEv4fZ8rEDKmhlDiyWN2YxDDN5gy24SVNZ
 e+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TD+fAH8jLAiRsT/50GxBCXcdg2/SCUlT/ougwSSBxZw=;
 b=N8xks6WPu+j2o0eMTQKlOz6DPTXhPvL48IxiJ/M+dOyYdcrwupxHqxyCxR9dHoLUhH
 uOr99SZWH5iJGI6HNIe5SrbVoYp0MQofjk/8AK5YEMRPKEx6mb9yftXC9R9MajsjoYCo
 0MT4lENdu5IjV+4DTUipQKuS5fXwzgggQVJSiFN3+ywzJDb6TK6/SWKb+6AkYIfQRJP5
 KbdCGkMsV2cVCebS9I5vC82NsUMUC6SMq+xasDKE8HKBTjNpepeeCX2u0Lwd9fbsH9L6
 uf18gGveTICMmnPblfOA5sDcwraxzrPT49dJbGSRiPJIMbvsxokrig4/A+31DBfflOjX
 mOMQ==
X-Gm-Message-State: AOAM533DMCw+4lCQKyPOLib2YjpQLhEK6eRdxQNk/DoCwJQ5FhrhNoJ/
 87xMsWeDRvhOPVPdGPUc3/ufaXHfc7peKmTHqA4=
X-Google-Smtp-Source: ABdhPJzUQJ87zMlRPp7zSrGpDCATv1OIku+DrUaoxfSZrB2laZer7Rl5VZv9qCVgVq9PdEJ0vx9NUg530NB41NCvEGU=
X-Received: by 2002:a25:31d7:: with SMTP id
 x206mr58387301ybx.297.1629897699505; 
 Wed, 25 Aug 2021 06:21:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:118c:b029:fc:d439:63b1 with HTTP; Wed, 25 Aug 2021
 06:21:38 -0700 (PDT)
In-Reply-To: <e02f16fd-9f2f-8400-7036-a7223b56816e@foss.st.com>
References: <20210824100311.287591-1-eugentoo@gmail.com>
 <e02f16fd-9f2f-8400-7036-a7223b56816e@foss.st.com>
From: Yauheni Saldatsenka <eugentoo@gmail.com>
Date: Wed, 25 Aug 2021 16:21:38 +0300
Message-ID: <CADj5-Aw2srpBYRiFHPgvXyFsHQEO1t25B+Jfsa8M7gGGkHRuDQ@mail.gmail.com>
To: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Subject: Re: [Buildroot] [PATCH 1/2] [PATCH 1/1]
 configs/stm32f469_disco_xip_defconfig: alternative defconfig for XIP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0232891085716447045=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0232891085716447045==
Content-Type: multipart/alternative; boundary="00000000000066387405ca622106"

--00000000000066387405ca622106
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!
Okay, no problem.

=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 25 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=
=B0 2021 =D0=B3. =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=
=B5=D0=BB=D1=8C Christophe Priouzeau <
christophe.priouzeau@foss.st.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB:

> Hi,
> For Flash.sh and README.txt, can you make a version specific to XIP like:
> flash_xip.sh and README_xip.txt.
>
> Regards
> Christophe
> On 8/24/21 12:03 PM, Yauheni Saldatsenka wrote:
>
>> Update STM32F469-disco configuration files to operate with new kernel.
>>
>> Result of make tinyconfig was taken as a starting point to fit kernel
>> into flash memory.
>> Current setup kernel + rootfs fits in 1.6MB on-chip flash memory
>>
>> Fixes:
>>      - Move kernel to new flash bank due to growth of dtb size
>>      - Fix kernel start address in bootloader
>>      - Remove outdated path which doesn't affect normal operation mode
>>
>> Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
>> ---
>>   .../stm32f469-disco/flash.sh                  |  47 +++-
>>   .../stm32f469-disco/linux/defconfig           | 120 +++++++++
>>   .../stm32f469-disco/linux/stm32f469-disco.dts | 240 ++++++++++++++++++
>>   .../0002-kernel-start-address.patch           |  21 ++
>>   .../patches/afboot-stm32/0003-no-mpu.patch    |  22 ++
>>   configs/stm32f469_disco_xip_defconfig         |  24 ++
>>   6 files changed, 465 insertions(+), 9 deletions(-)
>>   create mode 100644 board/stmicroelectronics/stm32
>> f469-disco/linux/defconfig
>>   create mode 100644 board/stmicroelectronics/stm32
>> f469-disco/linux/stm32f469-disco.dts
>>   create mode 100644 board/stmicroelectronics/stm32
>> f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
>>   create mode 100644 board/stmicroelectronics/stm32
>> f469-disco/patches/afboot-stm32/0003-no-mpu.patch
>>   create mode 100644 configs/stm32f469_disco_xip_defconfig
>>
>> diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh
>> b/board/stmicroelectronics/stm32f469-disco/flash.sh
>> index 984d2b2599..176e1c9d2c 100755
>> --- a/board/stmicroelectronics/stm32f469-disco/flash.sh
>> +++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
>> @@ -1,18 +1,47 @@
>>   #!/bin/bash
>>     OUTPUT_DIR=3D$1
>> +BUILD_TYPE=3D$2
>>   -if ! test -d "${OUTPUT_DIR}" ; then
>> +if ! test -d "${OUTPUT_DIR}"
>> +then
>>       echo "ERROR: no output directory specified."
>>       echo "Usage: $0 OUTPUT_DIR"
>>       exit 1
>>   fi
>>   -${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
>> -  -c "init" \
>> -  -c "reset init" \
>> -  -c "flash probe 0" \
>> -  -c "flash info 0" \
>> -  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin
>> 0x08000000" \
>> -  -c "reset run" \
>> -  -c "shutdown"
>> +if  [[ -z "${BUILD_TYPE}" ]]
>> +then
>> +    echo "ERROR: no build type specified, please select 'xip' or
>> 'uboot'."
>> +    echo "Usage: $0 OUTPUT_DIR $1 BUILD_TYPE"
>> +    exit 1
>> +fi
>> +
>> +case "${BUILD_TYPE}" in
>> +       "xip")
>> +               ${OUTPUT_DIR}/host/bin/openocd -f
>> board/stm32f469discovery.cfg \
>> +                                        -c "init" \
>> +                                        -c "reset init" \
>> +                                        -c "flash probe 0" \
>> +                                        -c "flash info 0" \
>> +                                        -c "flash write_image erase
>> ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
>> +                                        -c "flash write_image erase
>> ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
>> +                                        -c "flash write_image erase
>> ${OUTPUT_DIR}/images/xipImage 0x08010000" \
>> +                                        -c "reset run" \
>> +                                        -c "shutdown"
>> +               ;;
>> +       "uboot")
>> +               FLASH_COMMAND=3D
>> +               ${OUTPUT_DIR}/host/bin/openocd -f
>> board/stm32f469discovery.cfg \
>> +                                        -c "init" \
>> +                                        -c "reset init" \
>> +                                        -c "flash probe 0" \
>> +                                        -c "flash info 0" \
>> +                                        -c "flash write_image erase
>> ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
>> +                                        -c "reset run" \
>> +                                        -c "shutdown"
>> +           ;;
>> +       *)
>> +               echo "Wrong build type. Please select from: xip, uboot"
>> +               ;;
>> +esac
>> diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> new file mode 100644
>> index 0000000000..2d0ce59b31
>> --- /dev/null
>> +++ b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> @@ -0,0 +1,120 @@
>> +# CONFIG_LOCALVERSION_AUTO is not set
>> +CONFIG_KERNEL_XZ=3Dy
>> +CONFIG_NO_HZ_IDLE=3Dy
>> +CONFIG_HIGH_RES_TIMERS=3Dy
>> +CONFIG_PREEMPT=3Dy
>> +CONFIG_LOG_BUF_SHIFT=3D12
>> +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D10
>> +CONFIG_BLK_DEV_INITRD=3Dy
>> +CONFIG_INITRAMFS_SOURCE=3D"${BR_BINARIES_DIR}/rootfs.cpio"
>> +# CONFIG_RD_GZIP is not set
>> +# CONFIG_RD_BZIP2 is not set
>> +# CONFIG_RD_LZMA is not set
>> +# CONFIG_RD_XZ is not set
>> +# CONFIG_RD_LZO is not set
>> +# CONFIG_RD_LZ4 is not set
>> +# CONFIG_RD_ZSTD is not set
>> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>> +# CONFIG_MULTIUSER is not set
>> +# CONFIG_SYSFS_SYSCALL is not set
>> +# CONFIG_FHANDLE is not set
>> +# CONFIG_POSIX_TIMERS is not set
>> +# CONFIG_BUG is not set
>> +# CONFIG_BASE_FULL is not set
>> +# CONFIG_FUTEX is not set
>> +# CONFIG_EPOLL is not set
>> +# CONFIG_SIGNALFD is not set
>> +# CONFIG_TIMERFD is not set
>> +# CONFIG_EVENTFD is not set
>> +# CONFIG_AIO is not set
>> +# CONFIG_IO_URING is not set
>> +# CONFIG_ADVISE_SYSCALLS is not set
>> +# CONFIG_MEMBARRIER is not set
>> +# CONFIG_KALLSYMS is not set
>> +CONFIG_KCMP=3Dy
>> +# CONFIG_RSEQ is not set
>> +CONFIG_EMBEDDED=3Dy
>> +# CONFIG_VM_EVENT_COUNTERS is not set
>> +# CONFIG_COMPAT_BRK is not set
>> +CONFIG_SLOB=3Dy
>> +# CONFIG_SLAB_MERGE_DEFAULT is not set
>> +# CONFIG_MMU is not set
>> +CONFIG_ARCH_STM32=3Dy
>> +# CONFIG_MACH_STM32F429 is not set
>> +# CONFIG_MACH_STM32F746 is not set
>> +# CONFIG_MACH_STM32F769 is not set
>> +# CONFIG_MACH_STM32H743 is not set
>> +CONFIG_CPU_V7M_NUM_IRQ=3D240
>> +# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
>> +CONFIG_SET_MEM_PARAM=3Dy
>> +CONFIG_DRAM_BASE=3D0xc0000000
>> +CONFIG_DRAM_SIZE=3D0x01000000
>> +CONFIG_HZ_1000=3Dy
>> +# CONFIG_ATAGS is not set
>> +CONFIG_XIP_KERNEL=3Dy
>> +CONFIG_XIP_PHYS_ADDR=3D0x08010000
>> +CONFIG_XIP_DEFLATED_DATA=3Dy
>> +# CONFIG_SUSPEND is not set
>> +# CONFIG_STACKPROTECTOR is not set
>> +# CONFIG_COMPAT_32BIT_TIME is not set
>> +# CONFIG_GCC_PLUGINS is not set
>> +# CONFIG_BLOCK is not set
>> +CONFIG_BINFMT_FLAT=3Dy
>> +CONFIG_BINFMT_SHARED_FLAT=3Dy
>> +# CONFIG_COREDUMP is not set
>> +CONFIG_DEVTMPFS=3Dy
>> +CONFIG_DEVTMPFS_MOUNT=3Dy
>> +# CONFIG_STANDALONE is not set
>> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
>> +# CONFIG_FW_LOADER is not set
>> +# CONFIG_ALLOW_DEV_COREDUMP is not set
>> +CONFIG_EEPROM_93CX6=3Dy
>> +# CONFIG_INPUT is not set
>> +# CONFIG_VT is not set
>> +# CONFIG_UNIX98_PTYS is not set
>> +# CONFIG_LEGACY_PTYS is not set
>> +# CONFIG_LDISC_AUTOLOAD is not set
>> +CONFIG_SERIAL_STM32=3Dy
>> +CONFIG_SERIAL_STM32_CONSOLE=3Dy
>> +# CONFIG_DEVMEM is not set
>> +# CONFIG_HWMON is not set
>> +CONFIG_WATCHDOG=3Dy
>> +CONFIG_MFD_STM32_TIMERS=3Dy
>> +# CONFIG_USB_SUPPORT is not set
>> +CONFIG_NEW_LEDS=3Dy
>> +CONFIG_LEDS_CLASS=3Dy
>> +CONFIG_LEDS_GPIO=3Dy
>> +CONFIG_LEDS_TRIGGERS=3Dy
>> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
>> +CONFIG_RTC_CLASS=3Dy
>> +CONFIG_RTC_DRV_STM32=3Dy
>> +CONFIG_DMADEVICES=3Dy
>> +CONFIG_STM32_DMA=3Dy
>> +CONFIG_STM32_DMAMUX=3Dy
>> +CONFIG_STM32_MDMA=3Dy
>> +CONFIG_SYNC_FILE=3Dy
>> +# CONFIG_VIRTIO_MENU is not set
>> +# CONFIG_VHOST_MENU is not set
>> +CONFIG_IIO=3Dy
>> +CONFIG_IIO_BUFFER=3Dy
>> +CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>> +CONFIG_IIO_STM32_TIMER_TRIGGER=3Dy
>> +# CONFIG_FILE_LOCKING is not set
>> +# CONFIG_DNOTIFY is not set
>> +# CONFIG_INOTIFY_USER is not set
>> +# CONFIG_PROC_SYSCTL is not set
>> +CONFIG_CONFIGFS_FS=3Dy
>> +# CONFIG_MISC_FILESYSTEMS is not set
>> +CONFIG_NLS=3Dy
>> +CONFIG_PRINTK_TIME=3Dy
>> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D15
>> +CONFIG_CONSOLE_LOGLEVEL_QUIET=3D15
>> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D7
>> +# CONFIG_SYMBOLIC_ERRNAME is not set
>> +CONFIG_DEBUG_INFO=3Dy
>> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> +CONFIG_DEBUG_FS=3Dy
>> +# CONFIG_DEBUG_MISC is not set
>> +# CONFIG_SCHED_DEBUG is not set
>> +# CONFIG_RCU_TRACE is not set
>> +# CONFIG_RUNTIME_TESTING_MENU is not set
>> diff --git a/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-di=
sco.dts
>> b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> new file mode 100644
>> index 0000000000..83fe71bbc6
>> --- /dev/null
>> +++ b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> @@ -0,0 +1,240 @@
>> +/*
>> + * Copyright 2016 - Lee Jones <lee.jones@linaro.org>
>> + *
>> + * This file is dual-licensed: you can use it either under the terms
>> + * of the GPL or the X11 license, at your option. Note that this dual
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License as
>> + *     published by the Free Software Foundation; either vers
>> <https://www.google.com/maps/search/n;+either+vers?entry=3Dgmail&source=
=3Dg>ion
>> 2 of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *     GNU General Public License for more details.
>> + *
>> + *     You should have received a copy of the GNU General Public
>> + *     License along with this file; if not, write to the Free
>> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
>> + *     MA 02110-1301 USA
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentation
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom the
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall be
>> + *     included in all copies or substantial portions of the Software.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +#include "stm32f469.dtsi"
>> +#include "stm32f469-pinctrl.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +
>> +/ {
>> +       model =3D "STMicroelectronics STM32F469i-DISCO board";
>> +       compatible =3D "st,stm32f469i-disco", "st,stm32f469";
>> +
>> +       chosen {
>> +               bootargs =3D "root=3D/dev/ram fbcon=3Dmap:0";
>> +               stdout-path =3D "serial0:115200n8";
>> +       };
>> +
>> +       memory@c0000000 {
>> +               device_type =3D "memory";
>> +               reg =3D <0xc0000000 0x1000000>;
>> +       };
>> +
>> +       aliases {
>> +               serial0 =3D &usart3;
>> +       };
>> +
>> +       mmc_vcard: mmc_vcard {
>> +               compatible =3D "regulator-fixed";
>> +               regulator-name =3D "mmc_vcard";
>> +               regulator-min-microvolt =3D <3300000>;
>> +               regulator-max-microvolt =3D <3300000>;
>> +       };
>> +
>> +       vdd_dsi: vdd-dsi {
>> +               compatible =3D "regulator-fixed";
>> +               regulator-name =3D "vdd_dsi";
>> +               regulator-min-microvolt =3D <3300000>;
>> +               regulator-max-microvolt =3D <3300000>;
>> +       };
>> +
>> +       soc {
>> +               dma-ranges =3D <0xc0000000 0xc0000000 0x10000000>;
>> +       };
>> +
>> +       leds {
>> +               compatible =3D "gpio-leds";
>> +               led-green {
>> +                       gpios =3D <&gpiog 6 GPIO_ACTIVE_LOW>;
>> +                       linux,default-trigger =3D "heartbeat";
>> +               };
>> +               led-orange {
>> +                       gpios =3D <&gpiod 4 GPIO_ACTIVE_LOW>;
>> +               };
>> +               led-red {
>> +                       gpios =3D <&gpiod 5 GPIO_ACTIVE_LOW>;
>> +               };
>> +               led-blue {
>> +                       gpios =3D <&gpiok 3 GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +
>> +       gpio_keys {
>> +               compatible =3D "gpio-keys";
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +               autorepeat;
>> +               button@0 {
>> +                       label =3D "User";
>> +                       linux,code =3D <KEY_WAKEUP>;
>> +                       gpios =3D <&gpioa 0 GPIO_ACTIVE_HIGH>;
>> +               };
>> +       };
>> +
>> +       /* This turns on vbus for otg for host mode (dwc2) */
>> +       vcc5v_otg: vcc5v-otg-regulator {
>> +               compatible =3D "regulator-fixed";
>> +               enable-active-high;
>> +               gpio =3D <&gpiob 2 GPIO_ACTIVE_HIGH>;
>> +               regulator-name =3D "vcc5_host1";
>> +               regulator-always-on;
>> +       };
>> +};
>> +
>> +&rcc {
>> +       compatible =3D "st,stm32f469-rcc", "st,stm32f42xx-rcc",
>> "st,stm32-rcc";
>> +};
>> +
>> +&clk_hse {
>> +       clock-frequency =3D <8000000>;
>> +};
>> +
>> +&dsi {
>> +       #address-cells =3D <1>;
>> +       #size-cells =3D <0>;
>> +       status =3D "okay";
>> +
>> +       ports {
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +
>> +               port@0 {
>> +                       reg =3D <0>;
>> +                       dsi_in: endpoint {
>> +                               remote-endpoint =3D <&ltdc_out_dsi>;
>> +                       };
>> +               };
>> +
>> +               port@1 {
>> +                       reg =3D <1>;
>> +                       dsi_out: endpoint {
>> +                               remote-endpoint =3D <&dsi_panel_in>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       panel-dsi@0 {
>> +               compatible =3D "orisetech,otm8009a";
>> +               reg =3D <0>; /* dsi virtual channel (0..3) */
>> +               reset-gpios =3D <&gpioh 7 GPIO_ACTIVE_LOW>;
>> +               power-supply =3D <&vdd_dsi>;
>> +               status =3D "okay";
>> +
>> +               port {
>> +                       dsi_panel_in: endpoint {
>> +                               remote-endpoint =3D <&dsi_out>;
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&ltdc {
>> +       status =3D "okay";
>> +
>> +       port {
>> +               ltdc_out_dsi: endpoint@0 {
>> +                       remote-endpoint =3D <&dsi_in>;
>> +               };
>> +       };
>> +};
>> +
>> +&rtc {
>> +       status =3D "okay";
>> +};
>> +
>> +&timers1 {
>> +       status =3D "okay";
>> +
>> +       pwm {
>> +               pinctrl-0 =3D <&pwm1_pins>;
>> +               pinctrl-names =3D "default";
>> +               status =3D "okay";
>> +       };
>> +
>> +       timer@0 {
>> +               status =3D "okay";
>> +       };
>> +};
>> +
>> +&timers3 {
>> +       status =3D "okay";
>> +
>> +       pwm {
>> +               pinctrl-0 =3D <&pwm3_pins>;
>> +               pinctrl-names =3D "default";
>> +               status =3D "okay";
>> +       };
>> +
>> +       timer@2 {
>> +               status =3D "okay";
>> +       };
>> +};
>> +
>> +&sdio {
>> +       status =3D "okay";
>> +       vmmc-supply =3D <&mmc_vcard>;
>> +       cd-gpios =3D <&gpiog 2 GPIO_ACTIVE_LOW>;
>> +       broken-cd;
>> +       pinctrl-names =3D "default", "opendrain";
>> +       pinctrl-0 =3D <&sdio_pins>;
>> +       pinctrl-1 =3D <&sdio_pins_od>;
>> +       bus-width =3D <4>;
>> +};
>> +
>> +&usart3 {
>> +       pinctrl-0 =3D <&usart3_pins_a>;
>> +       pinctrl-names =3D "default";
>> +       status =3D "okay";
>> +};
>> +
>> +&usbotg_fs {
>> +       dr_mode =3D "host";
>> +       pinctrl-0 =3D <&usbotg_fs_pins_a>;
>> +       pinctrl-names =3D "default";
>> +       status =3D "okay";
>> +};
>> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-
>> stm32/0002-kernel-start-address.patch b/board/stmicroelectronics/stm
>> 32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
>> new file mode 100644
>> index 0000000000..614effa85b
>> --- /dev/null
>> +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-
>> stm32/0002-kernel-start-address.patch
>> @@ -0,0 +1,21 @@
>> +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
>> +index 2da1f4b65f..96e4dff65e 100644
>> +--- a/stm32f469i-disco.c
>> ++++ b/stm32f469i-disco.c
>> +@@ -6,6 +6,7 @@
>> + #include "gpio.h"
>> + #include "mpu.h"
>> +
>> ++#define KERNEL_ADDR     0x08010000
>> + #define CONFIG_HSE_HZ 8000000
>> + #define CONFIG_PLL_M  8
>> + #define CONFIG_PLL_N  360
>> +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
>> +
>> + void start_kernel(void)
>> + {
>> +-      void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =
=3D
>> (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
>> ++      void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =
=3D
>> (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
>> +
>> +       kernel(0, ~0UL, 0x08004000);
>> + }
>> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm=
32/0003-no-mpu.patch
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-
>> stm32/0003-no-mpu.patch
>> new file mode 100644
>> index 0000000000..bc66d2d0ef
>> --- /dev/null
>> +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-
>> stm32/0003-no-mpu.patch
>> @@ -0,0 +1,22 @@
>> +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
>> +index d4d0909831..03f823f288 100644
>> +--- a/stm32f469i-disco.c
>> ++++ b/stm32f469i-disco.c
>> +@@ -127,7 +127,7 @@ int main(void)
>> +
>> +       int i;
>> +
>> +-      mpu_config(0x0);
>> ++      mpu_config(0xc0000000);
>> +
>> +       if (*FLASH_CR & FLASH_CR_LOCK) {
>> +               *FLASH_KEYR =3D 0x45670123;
>> +@@ -229,7 +229,7 @@ int main(void)
>> +       usart_setup(usart_base, 45000000);
>> +       usart_putch(usart_base, '.');
>> +
>> +-      *SYSCFG_MEMRMP =3D 0x4;
>> ++      /* *SYSCFG_MEMRMP =3D 0x4; */
>> +
>> +       start_kernel();
>> +
>> diff --git a/configs/stm32f469_disco_xip_defconfig
>> b/configs/stm32f469_disco_xip_defconfig
>> new file mode 100644
>> index 0000000000..81bdb0d6d6
>> --- /dev/null
>> +++ b/configs/stm32f469_disco_xip_defconfig
>> @@ -0,0 +1,24 @@
>> +BR2_arm=3Dy
>> +BR2_cortex_m4=3Dy
>> +BR2_GLOBAL_PATCH_DIR=3D"board/stmicroelectronics/stm32f469-disco/patche=
s"
>> +BR2_KERNEL_HEADERS_5_13=3Dy
>> +# BR2_UCLIBC_INSTALL_UTILS is not set
>> +BR2_GCC_VERSION_11_X=3Dy
>> +BR2_GCC_ENABLE_LTO=3Dy
>> +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/stmicroelectronics/comm
>> on/stm32f4xx/stm32-post-build.sh"
>> +BR2_LINUX_KERNEL=3Dy
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/stmicroelectroni
>> cs/stm32f469-disco/linux/defconfig"
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy
>> +BR2_LINUX_KERNEL_XZ=3Dy
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=3D"xipImage"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"stm32f469-disco"
>> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/stmicroelectronics/
>> stm32f469-disco/linux/stm32f469-disco.dts"
>> +BR2_PACKAGE_BUSYBOX_CONFIG=3D"package/busybox/busybox-minimal.config"
>> +BR2_PACKAGE_ZLIB=3Dy
>> +BR2_TARGET_ROOTFS_INITRAMFS=3Dy
>> +# BR2_TARGET_ROOTFS_TAR is not set
>> +BR2_TARGET_AFBOOT_STM32=3Dy
>> +BR2_PACKAGE_HOST_OPENOCD=3Dy
>> +BR2_PACKAGE_HOST_UTIL_LINUX=3Dy
>>
>>
>
> --
> Best regards / Cordialement,
>
> Christophe Priouzeau | Tel: +33 244027320
> STMicroelectronics
> ST online: www.st.com<http://www.st.com/>
>

--00000000000066387405ca622106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!<div>Okay, no problem.</div><div><br>=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 25 =
=D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2021 =D0=B3. =D0=BF=D0=BE=D0=BB=
=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Christophe Priouzeau=
 &lt;<a href=3D"mailto:christophe.priouzeau@foss.st.com">christophe.priouze=
au@foss.st.com</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi,<br>
For Flash.sh and README.txt, can you make a version specific to XIP like: f=
lash_xip.sh and README_xip.txt.<br>
<br>
Regards<br>
Christophe<br>
On 8/24/21 12:03 PM, Yauheni Saldatsenka wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Update STM32F469-disco configuration files to operate with new kernel.<br>
<br>
Result of make tinyconfig was taken as a starting point to fit kernel<br>
into flash memory.<br>
Current setup kernel + rootfs fits in 1.6MB on-chip flash memory<br>
<br>
Fixes:<br>
=C2=A0 =C2=A0 =C2=A0- Move kernel to new flash bank due to growth of dtb si=
ze<br>
=C2=A0 =C2=A0 =C2=A0- Fix kernel start address in bootloader<br>
=C2=A0 =C2=A0 =C2=A0- Remove outdated path which doesn&#39;t affect normal =
operation mode<br>
<br>
Signed-off-by: Yauheni Saldatsenka &lt;<a href=3D"mailto:eugentoo@gmail.com=
" target=3D"_blank">eugentoo@gmail.com</a>&gt;<br>
---<br>
=C2=A0 .../stm32f469-disco/flash.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 47 +++-<br>
=C2=A0 .../stm32f469-disco/linux/defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 120 +++++++++<br>
=C2=A0 .../stm32f469-disco/linux/stm3<wbr>2f469-disco.dts | 240 +++++++++++=
+++++++<br>
=C2=A0 .../0002-kernel-start-address.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 21 ++<br>
=C2=A0 .../patches/afboot-stm32/0003-<wbr>no-mpu.patch=C2=A0 =C2=A0 |=C2=A0=
 22 ++<br>
=C2=A0 configs/stm32f469_disco_xip_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 24 ++<br>
=C2=A0 6 files changed, 465 insertions(+), 9 deletions(-)<br>
=C2=A0 create mode 100644 board/stmicroelectronics/stm32<wbr>f469-disco/lin=
ux/defconfig<br>
=C2=A0 create mode 100644 board/stmicroelectronics/stm32<wbr>f469-disco/lin=
ux/stm32f469-<wbr>disco.dts<br>
=C2=A0 create mode 100644 board/stmicroelectronics/stm32<wbr>f469-disco/pat=
ches/afboot-<wbr>stm32/0002-kernel-start-<wbr>address.patch<br>
=C2=A0 create mode 100644 board/stmicroelectronics/stm32<wbr>f469-disco/pat=
ches/afboot-<wbr>stm32/0003-no-mpu.patch<br>
=C2=A0 create mode 100644 configs/stm32f469_disco_xip_de<wbr>fconfig<br>
<br>
diff --git a/board/stmicroelectronics/stm<wbr>32f469-disco/flash.sh b/board=
/stmicroelectronics/stm<wbr>32f469-disco/flash.sh<br>
index 984d2b2599..176e1c9d2c 100755<br>
--- a/board/stmicroelectronics/stm<wbr>32f469-disco/flash.sh<br>
+++ b/board/stmicroelectronics/stm<wbr>32f469-disco/flash.sh<br>
@@ -1,18 +1,47 @@<br>
=C2=A0 #!/bin/bash<br>
=C2=A0 =C2=A0 OUTPUT_DIR=3D$1<br>
+BUILD_TYPE=3D$2<br>
=C2=A0 -if ! test -d &quot;${OUTPUT_DIR}&quot; ; then<br>
+if ! test -d &quot;${OUTPUT_DIR}&quot;<br>
+then<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: no output directory specified.&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;Usage: $0 OUTPUT_DIR&quot;<br>
=C2=A0 =C2=A0 =C2=A0 exit 1<br>
=C2=A0 fi<br>
=C2=A0 -${OUTPUT_DIR}/host/bin/openoc<wbr>d -f board/stm32f469discovery.cfg=
 \<br>
-=C2=A0 -c &quot;init&quot; \<br>
-=C2=A0 -c &quot;reset init&quot; \<br>
-=C2=A0 -c &quot;flash probe 0&quot; \<br>
-=C2=A0 -c &quot;flash info 0&quot; \<br>
-=C2=A0 -c &quot;flash write_image erase ${OUTPUT_DIR}/images/<a href=3D"ht=
tp://u-boot.bi">u-boot.bi</a><wbr>n 0x08000000&quot; \<br>
-=C2=A0 -c &quot;reset run&quot; \<br>
-=C2=A0 -c &quot;shutdown&quot;<br>
+if=C2=A0 [[ -z &quot;${BUILD_TYPE}&quot; ]]<br>
+then<br>
+=C2=A0 =C2=A0 echo &quot;ERROR: no build type specified, please select &#3=
9;xip&#39; or &#39;uboot&#39;.&quot;<br>
+=C2=A0 =C2=A0 echo &quot;Usage: $0 OUTPUT_DIR $1 BUILD_TYPE&quot;<br>
+=C2=A0 =C2=A0 exit 1<br>
+fi<br>
+<br>
+case &quot;${BUILD_TYPE}&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xip&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${OUTPUT_DIR}/host/=
bin/<wbr>openocd -f board/stm32f469discovery.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;init&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;reset init&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash probe 0&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash info 0&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash write_image erase ${OUTPUT_DIR}/images/stm32f469<wbr>i-disco.bin 0x0=
8000000&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash write_image erase ${OUTPUT_DIR}/images/stm32f469<wbr>-disco.dtb 0x08=
004000&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000&quot; \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;reset run&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;shutdown&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;uboot&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLASH_COMMAND=3D<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${OUTPUT_DIR}/host/=
bin/<wbr>openocd -f board/stm32f469discovery.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;init&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;reset init&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash probe 0&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash info 0&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;flash write_image erase ${OUTPUT_DIR}/images/<a href=3D"http://u-boot.bi">=
u-boot.bi</a><wbr>n 0x08000000&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;reset run&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot=
;shutdown&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Wrong bu=
ild type. Please select from: xip, uboot&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+esac<br>
diff --git a/board/stmicroelectronics/stm<wbr>32f469-disco/linux/defconfig =
b/board/stmicroelectronics/stm<wbr>32f469-disco/linux/defconfig<br>
new file mode 100644<br>
index 0000000000..2d0ce59b31<br>
--- /dev/null<br>
+++ b/board/stmicroelectronics/stm<wbr>32f469-disco/linux/defconfig<br>
@@ -0,0 +1,120 @@<br>
+# CONFIG_LOCALVERSION_AUTO is not set<br>
+CONFIG_KERNEL_XZ=3Dy<br>
+CONFIG_NO_HZ_IDLE=3Dy<br>
+CONFIG_HIGH_RES_TIMERS=3Dy<br>
+CONFIG_PREEMPT=3Dy<br>
+CONFIG_LOG_BUF_SHIFT=3D12<br>
+CONFIG_PRINTK_SAFE_LOG_BUF_SH<wbr>IFT=3D10<br>
+CONFIG_BLK_DEV_INITRD=3Dy<br>
+CONFIG_INITRAMFS_SOURCE=3D&quot;${BR<wbr>_BINARIES_DIR}/rootfs.cpio&quot;<=
br>
+# CONFIG_RD_GZIP is not set<br>
+# CONFIG_RD_BZIP2 is not set<br>
+# CONFIG_RD_LZMA is not set<br>
+# CONFIG_RD_XZ is not set<br>
+# CONFIG_RD_LZO is not set<br>
+# CONFIG_RD_LZ4 is not set<br>
+# CONFIG_RD_ZSTD is not set<br>
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy<br>
+# CONFIG_MULTIUSER is not set<br>
+# CONFIG_SYSFS_SYSCALL is not set<br>
+# CONFIG_FHANDLE is not set<br>
+# CONFIG_POSIX_TIMERS is not set<br>
+# CONFIG_BUG is not set<br>
+# CONFIG_BASE_FULL is not set<br>
+# CONFIG_FUTEX is not set<br>
+# CONFIG_EPOLL is not set<br>
+# CONFIG_SIGNALFD is not set<br>
+# CONFIG_TIMERFD is not set<br>
+# CONFIG_EVENTFD is not set<br>
+# CONFIG_AIO is not set<br>
+# CONFIG_IO_URING is not set<br>
+# CONFIG_ADVISE_SYSCALLS is not set<br>
+# CONFIG_MEMBARRIER is not set<br>
+# CONFIG_KALLSYMS is not set<br>
+CONFIG_KCMP=3Dy<br>
+# CONFIG_RSEQ is not set<br>
+CONFIG_EMBEDDED=3Dy<br>
+# CONFIG_VM_EVENT_COUNTERS is not set<br>
+# CONFIG_COMPAT_BRK is not set<br>
+CONFIG_SLOB=3Dy<br>
+# CONFIG_SLAB_MERGE_DEFAULT is not set<br>
+# CONFIG_MMU is not set<br>
+CONFIG_ARCH_STM32=3Dy<br>
+# CONFIG_MACH_STM32F429 is not set<br>
+# CONFIG_MACH_STM32F746 is not set<br>
+# CONFIG_MACH_STM32F769 is not set<br>
+# CONFIG_MACH_STM32H743 is not set<br>
+CONFIG_CPU_V7M_NUM_IRQ=3D240<br>
+# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set<br>
+CONFIG_SET_MEM_PARAM=3Dy<br>
+CONFIG_DRAM_BASE=3D0xc0000000<br>
+CONFIG_DRAM_SIZE=3D0x01000000<br>
+CONFIG_HZ_1000=3Dy<br>
+# CONFIG_ATAGS is not set<br>
+CONFIG_XIP_KERNEL=3Dy<br>
+CONFIG_XIP_PHYS_ADDR=3D0x080100<wbr>00<br>
+CONFIG_XIP_DEFLATED_DATA=3Dy<br>
+# CONFIG_SUSPEND is not set<br>
+# CONFIG_STACKPROTECTOR is not set<br>
+# CONFIG_COMPAT_32BIT_TIME is not set<br>
+# CONFIG_GCC_PLUGINS is not set<br>
+# CONFIG_BLOCK is not set<br>
+CONFIG_BINFMT_FLAT=3Dy<br>
+CONFIG_BINFMT_SHARED_FLAT=3Dy<br>
+# CONFIG_COREDUMP is not set<br>
+CONFIG_DEVTMPFS=3Dy<br>
+CONFIG_DEVTMPFS_MOUNT=3Dy<br>
+# CONFIG_STANDALONE is not set<br>
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set<br>
+# CONFIG_FW_LOADER is not set<br>
+# CONFIG_ALLOW_DEV_COREDUMP is not set<br>
+CONFIG_EEPROM_93CX6=3Dy<br>
+# CONFIG_INPUT is not set<br>
+# CONFIG_VT is not set<br>
+# CONFIG_UNIX98_PTYS is not set<br>
+# CONFIG_LEGACY_PTYS is not set<br>
+# CONFIG_LDISC_AUTOLOAD is not set<br>
+CONFIG_SERIAL_STM32=3Dy<br>
+CONFIG_SERIAL_STM32_CONSOLE=3Dy<br>
+# CONFIG_DEVMEM is not set<br>
+# CONFIG_HWMON is not set<br>
+CONFIG_WATCHDOG=3Dy<br>
+CONFIG_MFD_STM32_TIMERS=3Dy<br>
+# CONFIG_USB_SUPPORT is not set<br>
+CONFIG_NEW_LEDS=3Dy<br>
+CONFIG_LEDS_CLASS=3Dy<br>
+CONFIG_LEDS_GPIO=3Dy<br>
+CONFIG_LEDS_TRIGGERS=3Dy<br>
+CONFIG_LEDS_TRIGGER_HEARTBEAT<wbr>=3Dy<br>
+CONFIG_RTC_CLASS=3Dy<br>
+CONFIG_RTC_DRV_STM32=3Dy<br>
+CONFIG_DMADEVICES=3Dy<br>
+CONFIG_STM32_DMA=3Dy<br>
+CONFIG_STM32_DMAMUX=3Dy<br>
+CONFIG_STM32_MDMA=3Dy<br>
+CONFIG_SYNC_FILE=3Dy<br>
+# CONFIG_VIRTIO_MENU is not set<br>
+# CONFIG_VHOST_MENU is not set<br>
+CONFIG_IIO=3Dy<br>
+CONFIG_IIO_BUFFER=3Dy<br>
+CONFIG_IIO_TRIGGERED_BUFFER=3Dy<br>
+CONFIG_IIO_STM32_TIMER_TRIGGE<wbr>R=3Dy<br>
+# CONFIG_FILE_LOCKING is not set<br>
+# CONFIG_DNOTIFY is not set<br>
+# CONFIG_INOTIFY_USER is not set<br>
+# CONFIG_PROC_SYSCTL is not set<br>
+CONFIG_CONFIGFS_FS=3Dy<br>
+# CONFIG_MISC_FILESYSTEMS is not set<br>
+CONFIG_NLS=3Dy<br>
+CONFIG_PRINTK_TIME=3Dy<br>
+CONFIG_CONSOLE_LOGLEVEL_DEFAU<wbr>LT=3D15<br>
+CONFIG_CONSOLE_LOGLEVEL_QUIET<wbr>=3D15<br>
+CONFIG_MESSAGE_LOGLEVEL_DEFAU<wbr>LT=3D7<br>
+# CONFIG_SYMBOLIC_ERRNAME is not set<br>
+CONFIG_DEBUG_INFO=3Dy<br>
+# CONFIG_SECTION_MISMATCH_WARN_O<wbr>NLY is not set<br>
+CONFIG_DEBUG_FS=3Dy<br>
+# CONFIG_DEBUG_MISC is not set<br>
+# CONFIG_SCHED_DEBUG is not set<br>
+# CONFIG_RCU_TRACE is not set<br>
+# CONFIG_RUNTIME_TESTING_MENU is not set<br>
diff --git a/board/stmicroelectronics/stm<wbr>32f469-disco/linux/stm32f469-=
<wbr>disco.dts b/board/stmicroelectronics/stm<wbr>32f469-disco/linux/stm32f=
469-<wbr>disco.dts<br>
new file mode 100644<br>
index 0000000000..83fe71bbc6<br>
--- /dev/null<br>
+++ b/board/stmicroelectronics/stm<wbr>32f469-disco/linux/stm32f469-<wbr>di=
sco.dts<br>
@@ -0,0 +1,240 @@<br>
+/*<br>
+ * Copyright 2016 - Lee Jones &lt;<a href=3D"mailto:lee.jones@linaro.org" =
target=3D"_blank">lee.jones@linaro.org</a>&gt;<br>
+ *<br>
+ * This file is dual-licensed: you can use it either under the terms<br>
+ * of the GPL or the X11 license, at your option. Note that this dual<br>
+ * licensing only applies to this file, and not this project as a<br>
+ * whole.<br>
+ *<br>
+ *=C2=A0 a) This file is free software; you can redistribute it and/or<br>
+ *=C2=A0 =C2=A0 =C2=A0modify it under the terms of the GNU General Public =
License as<br>
+ *=C2=A0 =C2=A0 =C2=A0published by the Free Software Foundatio<a href=3D"h=
ttps://www.google.com/maps/search/n;+either+vers?entry=3Dgmail&amp;source=
=3Dg">n; either vers</a>ion 2 of the<br>
+ *=C2=A0 =C2=A0 =C2=A0License, or (at your option) any later version.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0This file is distributed in the hope that it will be=
 useful,<br>
+ *=C2=A0 =C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied w=
arranty of<br>
+ *=C2=A0 =C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=
=C2=A0 See the<br>
+ *=C2=A0 =C2=A0 =C2=A0GNU General Public License for more details.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0You should have received a copy of the GNU General P=
ublic<br>
+ *=C2=A0 =C2=A0 =C2=A0License along with this file; if not, write to the F=
ree<br>
+ *=C2=A0 =C2=A0 =C2=A0Software Foundation, Inc., 51 Franklin St, Fifth Flo=
or, Boston,<br>
+ *=C2=A0 =C2=A0 =C2=A0MA 02110-1301 USA<br>
+ *<br>
+ * Or, alternatively,<br>
+ *<br>
+ *=C2=A0 b) Permission is hereby granted, free of charge, to any person<br=
>
+ *=C2=A0 =C2=A0 =C2=A0obtaining a copy of this software and associated doc=
umentation<br>
+ *=C2=A0 =C2=A0 =C2=A0files (the &quot;Software&quot;), to deal in the Sof=
tware without<br>
+ *=C2=A0 =C2=A0 =C2=A0restriction, including without limitation the rights=
 to use,<br>
+ *=C2=A0 =C2=A0 =C2=A0copy, modify, merge, publish, distribute, sublicense=
, and/or<br>
+ *=C2=A0 =C2=A0 =C2=A0sell copies of the Software, and to permit persons t=
o whom the<br>
+ *=C2=A0 =C2=A0 =C2=A0Software is furnished to do so, subject to the follo=
wing<br>
+ *=C2=A0 =C2=A0 =C2=A0conditions:<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0The above copyright notice and this permission notic=
e shall be<br>
+ *=C2=A0 =C2=A0 =C2=A0included in all copies or substantial portions of th=
e Software.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT =
WARRANTY OF ANY KIND,<br>
+ *=C2=A0 =C2=A0 =C2=A0EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE=
 WARRANTIES<br>
+ *=C2=A0 =C2=A0 =C2=A0OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE=
 AND<br>
+ *=C2=A0 =C2=A0 =C2=A0NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR CO=
PYRIGHT<br>
+ *=C2=A0 =C2=A0 =C2=A0HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LI=
ABILITY,<br>
+ *=C2=A0 =C2=A0 =C2=A0WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,=
 ARISING<br>
+ *=C2=A0 =C2=A0 =C2=A0FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR T=
HE USE OR<br>
+ *=C2=A0 =C2=A0 =C2=A0OTHER DEALINGS IN THE SOFTWARE.<br>
+ */<br>
+<br>
+/dts-v1/;<br>
+#include &quot;stm32f469.dtsi&quot;<br>
+#include &quot;stm32f469-pinctrl.dtsi&quot;<br>
+#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
+#include &lt;dt-bindings/input/input.h&gt;<br>
+<br>
+/ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;STMicroelectronics STM32F469i-D=
ISCO board&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,stm32f469i-disco&quot;,=
 &quot;st,stm32f469&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootargs =3D &quot;=
root=3D/dev/ram fbcon=3Dmap:0&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &qu=
ot;serial0:115200n8&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memory@c0000000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D &qu=
ot;memory&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xc0000=
000 0x1000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &amp;us=
art3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmc_vcard: mmc_vcard {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;regulator-fixed&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D =
&quot;mmc_vcard&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-micro=
volt =3D &lt;3300000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-micro=
volt =3D &lt;3300000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vdd_dsi: vdd-dsi {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;regulator-fixed&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D =
&quot;vdd_dsi&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-micro=
volt =3D &lt;3300000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-micro=
volt =3D &lt;3300000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges =3D &lt;=
0xc0000000 0xc0000000 0x10000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0leds {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;gpio-leds&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led-green {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpios =3D &lt;&amp;gpiog 6 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linux,default-trigger =3D &quot;heartbeat&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led-orange {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpios =3D &lt;&amp;gpiod 4 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led-red {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpios =3D &lt;&amp;gpiod 5 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led-blue {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpios =3D &lt;&amp;gpiok 3 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpio_keys {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;gpio-keys&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D =
&lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt=
;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autorepeat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0button@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0label =3D &quot;User&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linux,code =3D &lt;KEY_WAKEUP&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpios =3D &lt;&amp;gpioa 0 GPIO_ACTIVE_HIGH&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This turns on vbus for otg for host mode (dw=
c2) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vcc5v_otg: vcc5v-otg-regulator {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;regulator-fixed&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable-active-high;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio =3D &lt;&amp;g=
piob 2 GPIO_ACTIVE_HIGH&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D =
&quot;vcc5_host1&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;rcc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,stm32f469-rcc&quot;, &q=
uot;st,stm32f42xx-rcc&quot;, &quot;st,stm32-rcc&quot;;<br>
+};<br>
+<br>
+&amp;clk_hse {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D &lt;8000000&gt;;<br>
+};<br>
+<br>
+&amp;dsi {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ports {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D =
&lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt=
;0&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dsi_in: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote-endpoint =3D &lt;&amp;ltdc_out=
_dsi&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dsi_out: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote-endpoint =3D &lt;&amp;dsi_pane=
l_in&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0panel-dsi@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;orisetech,otm8009a&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;; =
/* dsi virtual channel (0..3) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset-gpios =3D &lt=
;&amp;gpioh 7 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0power-supply =3D &l=
t;&amp;vdd_dsi&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dsi_panel_in: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote-endpoint =3D &lt;&amp;dsi_out&=
gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;ltdc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0port {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ltdc_out_dsi: endpo=
int@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0remote-endpoint =3D &lt;&amp;dsi_in&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;rtc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;timers1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pwm {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&=
amp;pwm1_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &=
quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timer@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;timers3 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pwm {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&=
amp;pwm3_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &=
quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timer@2 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;sdio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vmmc-supply =3D &lt;&amp;mmc_vcard&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd-gpios =3D &lt;&amp;gpiog 2 GPIO_ACTIVE_LOW&g=
t;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0broken-cd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;, &quot;op=
endrain&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;sdio_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-1 =3D &lt;&amp;sdio_pins_od&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
+};<br>
+<br>
+&amp;usart3 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;usart3_pins_a&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;usbotg_fs {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dr_mode =3D &quot;host&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;usbotg_fs_pins_a&gt;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
diff --git a/board/stmicroelectronics/stm<wbr>32f469-disco/patches/afboot-<=
wbr>stm32/0002-kernel-start-<wbr>address.patch b/board/stmicroelectronics/s=
tm<wbr>32f469-disco/patches/afboot-<wbr>stm32/0002-kernel-start-<wbr>addres=
s.patch<br>
new file mode 100644<br>
index 0000000000..614effa85b<br>
--- /dev/null<br>
+++ b/board/stmicroelectronics/stm<wbr>32f469-disco/patches/afboot-<wbr>stm=
32/0002-kernel-start-<wbr>address.patch<br>
@@ -0,0 +1,21 @@<br>
+diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c<br>
+index 2da1f4b65f..96e4dff65e 100644<br>
+--- a/stm32f469i-disco.c<br>
++++ b/stm32f469i-disco.c<br>
+@@ -6,6 +6,7 @@<br>
+ #include &quot;gpio.h&quot;<br>
+ #include &quot;mpu.h&quot;<br>
+<br>
++#define KERNEL_ADDR=C2=A0 =C2=A0 =C2=A00x08010000<br>
+ #define CONFIG_HSE_HZ 8000000<br>
+ #define CONFIG_PLL_M=C2=A0 8<br>
+ #define CONFIG_PLL_N=C2=A0 360<br>
+@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)<br>
+<br>
+ void start_kernel(void)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 void (*kernel)(uint32_t reserved, uint32_t mach, uin=
t32_t dt) =3D (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);<br>
++=C2=A0 =C2=A0 =C2=A0 void (*kernel)(uint32_t reserved, uint32_t mach, uin=
t32_t dt) =3D (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel(0, ~0UL, 0x08004000);<br>
+ }<br>
diff --git a/board/stmicroelectronics/stm<wbr>32f469-disco/patches/afboot-<=
wbr>stm32/0003-no-mpu.patch b/board/stmicroelectronics/stm<wbr>32f469-disco=
/patches/afboot-<wbr>stm32/0003-no-mpu.patch<br>
new file mode 100644<br>
index 0000000000..bc66d2d0ef<br>
--- /dev/null<br>
+++ b/board/stmicroelectronics/stm<wbr>32f469-disco/patches/afboot-<wbr>stm=
32/0003-no-mpu.patch<br>
@@ -0,0 +1,22 @@<br>
+diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c<br>
+index d4d0909831..03f823f288 100644<br>
+--- a/stm32f469i-disco.c<br>
++++ b/stm32f469i-disco.c<br>
+@@ -127,7 +127,7 @@ int main(void)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 mpu_config(0x0);<br>
++=C2=A0 =C2=A0 =C2=A0 mpu_config(0xc0000000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*FLASH_CR &amp; FLASH_CR_LOCK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*FLASH_KEYR =3D 0x4=
5670123;<br>
+@@ -229,7 +229,7 @@ int main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usart_setup(usart_base, 45000000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usart_putch(usart_base, &#39;.&#39;);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 *SYSCFG_MEMRMP =3D 0x4;<br>
++=C2=A0 =C2=A0 =C2=A0 /* *SYSCFG_MEMRMP =3D 0x4; */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start_kernel();<br>
+<br>
diff --git a/configs/stm32f469_disco_xip_<wbr>defconfig b/configs/stm32f469=
_disco_xip_<wbr>defconfig<br>
new file mode 100644<br>
index 0000000000..81bdb0d6d6<br>
--- /dev/null<br>
+++ b/configs/stm32f469_disco_xip_<wbr>defconfig<br>
@@ -0,0 +1,24 @@<br>
+BR2_arm=3Dy<br>
+BR2_cortex_m4=3Dy<br>
+BR2_GLOBAL_PATCH_DIR=3D&quot;board/s<wbr>tmicroelectronics/stm32f469-di<wb=
r>sco/patches&quot;<br>
+BR2_KERNEL_HEADERS_5_13=3Dy<br>
+# BR2_UCLIBC_INSTALL_UTILS is not set<br>
+BR2_GCC_VERSION_11_X=3Dy<br>
+BR2_GCC_ENABLE_LTO=3Dy<br>
+BR2_ROOTFS_POST_BUILD_SCRIPT=3D<wbr>&quot;board/stmicroelectronics/comm<wb=
r>on/stm32f4xx/stm32-post-build.<wbr>sh&quot;<br>
+BR2_LINUX_KERNEL=3Dy<br>
+BR2_LINUX_KERNEL_USE_CUSTOM_C<wbr>ONFIG=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_CONFI<wbr>G_FILE=3D&quot;board/stmicroelectroni<wb=
r>cs/stm32f469-disco/linux/<wbr>defconfig&quot;<br>
+BR2_LINUX_KERNEL_IMAGE_TARGET<wbr>_CUSTOM=3Dy<br>
+BR2_LINUX_KERNEL_XZ=3Dy<br>
+BR2_LINUX_KERNEL_IMAGE_TARGET<wbr>_NAME=3D&quot;xipImage&quot;<br>
+BR2_LINUX_KERNEL_DTS_SUPPORT=3D<wbr>y<br>
+BR2_LINUX_KERNEL_INTREE_DTS_N<wbr>AME=3D&quot;stm32f469-disco&quot;<br>
+BR2_LINUX_KERNEL_CUSTOM_DTS_P<wbr>ATH=3D&quot;board/stmicroelectronics/<wb=
r>stm32f469-disco/linux/<wbr>stm32f469-disco.dts&quot;<br>
+BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;p<wbr>ackage/busybox/busybox-minimal<wb=
r>.config&quot;<br>
+BR2_PACKAGE_ZLIB=3Dy<br>
+BR2_TARGET_ROOTFS_INITRAMFS=3Dy<br>
+# BR2_TARGET_ROOTFS_TAR is not set<br>
+BR2_TARGET_AFBOOT_STM32=3Dy<br>
+BR2_PACKAGE_HOST_OPENOCD=3Dy<br>
+BR2_PACKAGE_HOST_UTIL_LINUX=3Dy<br>
<br>
</blockquote>
<br>
<br>
-- <br>
Best regards / Cordialement,<br>
<br>
Christophe Priouzeau | Tel: +33 244027320<br>
STMicroelectronics<br>
ST online: <a href=3D"http://www.st.com" target=3D"_blank">www.st.com</a>&l=
t;<a href=3D"http://www.st.com/" target=3D"_blank">http://www.st.com/</a>&g=
t;<br>
</blockquote></div>

--00000000000066387405ca622106--

--===============0232891085716447045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0232891085716447045==--
