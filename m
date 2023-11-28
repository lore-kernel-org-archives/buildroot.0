Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365DBC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 03:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B3681B14;
	Tue, 28 Nov 2023 03:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B3681B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgEumH2jYRn5; Tue, 28 Nov 2023 03:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 944A481B17;
	Tue, 28 Nov 2023 03:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944A481B17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94D331BF5AD
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 03:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A8EA414A1
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 03:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A8EA414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUE3mAZTXeLP for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 03:46:50 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32A07410E6
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 03:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32A07410E6
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3b86f3cdca0so1136070b6e.3
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 19:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701143209; x=1701748009;
 h=subject:from:content-language:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pGk42a+If1PjeyxZT55/oKL12VS0T6IVPlHH+QtTB20=;
 b=Q37+w3z7I8mJAcglit1BHm5WK4ue2ylscRghS7dEa0ETeMeSW7zEI8n7Cd1MmV0+0/
 dV98rsh0Afb2nANS/XojqHhZ1axw0hJtv+pJ1aglHfVEkSlIuGeTWTzsE/hMJL+mVyqY
 lyMddSTPOFDgRAxzGfmvTsg2CkYtQl/GS+k6B2ldF1LArZujTBAkQsiTKwrKLYNaMQa7
 1x/XNw2BlAOtAXCNOw5YE0JUh8EAKyuV8BYhOE01JPFAp2IePJJEwHqxB/798e2SVB/Q
 DbxV+0h0We3Wy3L8kIGwhmayI1XOMex2RrL++DYlpd550XET9XeijXPA+ocS0mGfo090
 qiPQ==
X-Gm-Message-State: AOJu0YyDEsd0KljkZA5h/bsZbD2TfEXO3dxj4tlRwtOMR9cTgV4HLSmI
 G69RAPk15zZ52EtsJeS2iAb9Ml09geQ=
X-Google-Smtp-Source: AGHT+IGR3LVcvtln51wqPkYpqsD8eDcjQ4rkA2eOfGCYmIuf1MxMOJNx64YfcQNzs4PR08jYJ3LraA==
X-Received: by 2002:a05:6808:f94:b0:3ae:144f:f99b with SMTP id
 o20-20020a0568080f9400b003ae144ff99bmr17577503oiw.4.1701143208726; 
 Mon, 27 Nov 2023 19:46:48 -0800 (PST)
Received: from [192.168.2.238] ([71.198.210.168])
 by smtp.gmail.com with ESMTPSA id
 x23-20020aa793b7000000b006cb638ba1aasm7813953pff.49.2023.11.27.19.46.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 19:46:48 -0800 (PST)
Message-ID: <e9d5821b-46f9-4a8c-bcc6-2d8410b6c071@gmail.com>
Date: Mon, 27 Nov 2023 19:46:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
From: hg <gpfw.hgiang@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701143209; x=1701748009; darn=buildroot.org;
 h=subject:from:content-language:to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pGk42a+If1PjeyxZT55/oKL12VS0T6IVPlHH+QtTB20=;
 b=B0CaIIwWX4xSzjm92cU6Kd1D8xbeh38ehYzzox872kTqOHnNgt2UYNse+93DHtW72+
 gTpOtvYjq9nf56f3UAEYoPwHWZOPfOla6Clh9uw2W5J7SJdyoBhjzWMV2Gbv2Y/4oSmn
 hUv/BDx+J0lxoobHM/1qZ02pFJf5+C1lUjrYkTCHFAphsL+MM3nN5L9i9a/w59wX6Iax
 v3vXEPexh41d7kXXR1kVOqnEJ8W2PRwvXe3imsvI9kj0kdado6SdqSot5BUJdheH9aOR
 0xkVF6Qc7+DbUcr+8JzWn8cZ5aIPBL5We9JS7m6Dk5jbL7aSLaqkHEyjZCDu1QraWz3M
 QmDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B0CaIIwW
Subject: [Buildroot] buildroot 2023.08 on STM32F429 Disco
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3994426091832441301=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============3994426091832441301==
Content-Type: multipart/alternative;
 boundary="------------Gx0HBidjSBZEhV8W5eADiTVx"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------Gx0HBidjSBZEhV8W5eADiTVx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I've tried buildroot 2023.08 on STM32F429 Disco board recently and faced 
following issues:

- Can't enter anything into console to login

- LCD doesn't display (this could be the that the kernel crashes 
already, so I wouldn't worry too much about this atm)

Further debugging suggest Stack corrupted (I enabled Stack Protection):

    x080de188 in __loop_delay () (gdb) bt #0  0x080de188 in __loop_delay
    () #1  0x080f042c in panic () #2  0x080f244a in __stack_chk_fail ()
    #3  0x0813f1ca in __inflate_kernel_data () #4  0x0813cbf0 in
    __mmap_switched ()

Anyone can suggest a fix for this issue? This is XIP image and the chip 
has very limited memory.

This is the console log before it hangs (I only upgraded kernel to 
6.1.63, the rest was default from Buildroot 2023.08)

    [    0.000000] Booting Linux on physical CPU 0x0 [    0.000000]
    Linux version 6.1.63
    (arm-buildroot-uclinux-uclibcgnueabi-gcc.br_real (Buildroot
    2023.08-1-g5292a466fb) 12.3.0, GNU ld (GNU Binutils) 2.40) #2
    PREEMPT Mon Nov 27 00:23:16 PST 2023 [    0.000000] CPU: ARMv7-M
    [410fc241] revision 1 (ARMv7M), cr=00000000 [    0.000000] CPU:
    unknown data cache, unknown instruction cache [    0.000000] OF:
    fdt: Machine model: STMicroelectronics STM32F429i-DISCO board [   
    0.000000] Zone ranges: [    0.000000]   Normal   [mem
    0x0000000090000000-0x00000000907fffff] [    0.000000] Movable zone
    start for each node [    0.000000] Early memory node ranges [   
    0.000000]   node   0: [mem 0x0000000090000000-0x00000000907fffff]
    [    0.000000] Initmem setup node 0 [mem
    0x0000000090000000-0x00000000907fffff] [    0.000000] pcpu-alloc: s0
    r0 d32768 u32768 alloc=1*32768 [    0.000000] pcpu-alloc: [0] 0 [   
    0.000000] Built 1 zonelists, mobility grouping off.  Total pages:
    2032 [    0.000000] Kernel command line: root=/dev/ram [   
    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096
    bytes, linear) [    0.000000] Inode-cache hash table entries: 1024
    (order: 0, 4096 bytes, linear) [    0.000000] mem auto-init:
    stack:all(zero), heap alloc:off, heap free:off [    0.000000]
    Memory: 7876K/8192K available (1002K kernel code, 69K rwdata, 216K
    rodata, 74K init, 45K bss, 316K reserved, 0K cma-reserved) [   
    0.000000] rcu: Preemptible hierarchical RCU implementation. [   
    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is
    100 jiffies. [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated
    irqs: 16 [    0.000000] /soc/interrupt-controller@40013c00: bank0
    [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
    contention. [    0.000000] clocksource: arm_system_timer: mask:
    0xffffff max_cycles: 0xffffff, max_idle_ns: 355517175 ns [   
    0.000000] ARM System timer initialized as clocksource [    0.000011]
    sched_clock: 32 bits at 84MHz, resolution 11ns, wraps every
    25565281274ns [    0.000155] timers@40000c00: STM32 sched_clock
    registered [    0.000263] Switching to timer-based delay loop,
    resolution 11ns [    0.000341] timers@40000c00: STM32 delay timer
    registered [    0.000446] clocksource: timers@40000c00: mask:
    0xffffffff max_cycles: 0xffffffff, max_idle_ns: 22753100554 ns [   
    0.000649] /soc/timers@40000c00: STM32 clockevent driver initialized
    (32 bits) [    0.003076] Calibrating delay loop (skipped), value
    calculated using timer frequency.. 168.00 BogoMIPS (lpj=84000) [   
    0.003248] pid_max: default: 4096 minimum: 301 [    0.003688]
    Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
    [    0.003980] Mountpoint-cache hash table entries: 1024 (order: 0,
    4096 bytes, linear) [    0.019413] rcu: Hierarchical SRCU
    implementation. [    0.019468] rcu:     Max phase no-delay instances
    is 400. [    0.024442] devtmpfs: initialized [    0.257147]
    clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
    max_idle_ns: 1911260446275000 ns [    0.257625] pinctrl core:
    initialized pinctrl subsystem [    0.441498] stm32f429-pinctrl
    soc:pinctrl@40020000: GPIOA bank added [    0.444993]
    stm32f429-pinctrl soc:pinctrl@40020000: GPIOB bank added [   
    0.453497] stm32f429-pinctrl soc:pinctrl@40020000: GPIOC bank added
    [    0.461149] stm32f429-pinctrl soc:pinctrl@40020000: GPIOD bank
    added [    0.464614] stm32f429-pinctrl soc:pinctrl@40020000: GPIOE
    bank added [    0.473104] stm32f429-pinctrl soc:pinctrl@40020000:
    GPIOF bank added [    0.476777] stm32f429-pinctrl
    soc:pinctrl@40020000: GPIOG bank added [    0.484763]
    stm32f429-pinctrl soc:pinctrl@40020000: GPIOH bank added [   
    0.490909] stm32f429-pinctrl soc:pinctrl@40020000: GPIOI bank added
    [    0.494343] stm32f429-pinctrl soc:pinctrl@40020000: GPIOJ bank
    added [    0.503230] stm32f429-pinctrl soc:pinctrl@40020000: GPIOK
    bank added [    0.503503] stm32f429-pinctrl soc:pinctrl@40020000:
    Pinctrl STM32 initialized [    0.678526] stm32-dma
    40026000.dma-controller: STM32 DMA driver registered [    0.711907]
    stm32-dma 40026400.dma-controller: STM32 DMA driver registered [   
    0.728203] clocksource: Switched to clocksource timers@40000c00 [   
    0.780779] workingset: timestamp_bits=30 max_order=11 bucket_order=0
    [    1.157699] STM32 USART driver initialized [    1.174322]
    40011000.serial: ttySTM0 at MMIO 0x40011000 (irq = 47, base_baud =
    5250000) is a stm32-usart [    1.694863] printk: console [ttySTM0]
    enabled [    1.730462] stm32_rtc 40002800.rtc: registered as rtc0
    [    1.736328] stm32_rtc 40002800.rtc: setting system clock to
    2000-01-01T03:02:48 UTC (946695768) [    1.747677] stm32_rtc
    40002800.rtc: Date/Time must be initialized [    2.075660] Freeing
    unused kernel image (initmem) memory: 24K [    2.081881] This
    architecture does not have kernel memory protection. [    2.088952]
    Run /init as init process [    2.092970]   with arguments: [   
    2.096321]     /init [    2.098791]   with environment: [   
    2.102341]     HOME=/ [    2.105028]     TERM=linux seedrng: can't
    determine pool size, assuming 256 bits: No such file or directory
    Saving 256 bits of non-creditable seed for next boot Welcome to
    Buildroot (none) login:


--------------Gx0HBidjSBZEhV8W5eADiTVx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>I've tried buildroot 2023.08 on STM32F429 Disco board recently 
      and faced following issues:</p>
    <p>- Can't enter anything into console to login</p>
    <p>- LCD doesn't display (this could be the that the kernel crashes
      already, so I wouldn't worry too much about this atm)</p>
    <p>Further debugging suggest Stack corrupted (I enabled Stack
      Protection):</p>
    <blockquote>
      <pre><font size="4" face="monospace">x080de188 in __loop_delay ()
(gdb) bt
#0  0x080de188 in __loop_delay ()
#1  0x080f042c in panic ()
#2  0x080f244a in __stack_chk_fail ()
#3  0x0813f1ca in __inflate_kernel_data ()
#4  0x0813cbf0 in __mmap_switched ()</font>
</pre>
    </blockquote>
    <p>Anyone can suggest a fix for this issue? This is XIP image and
      the chip has very limited memory.<br>
    </p>
    <p>This is the console log before it hangs (I only upgraded kernel
      to 6.1.63, the rest was default from Buildroot 2023.08)<br>
    </p>
    <blockquote>
      <pre><font size="4">[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.1.63 (arm-buildroot-uclinux-uclibcgnueabi-gcc.br_real (Buildroot 2023.08-1-g5292a466fb) 12.3.0, GNU ld (GNU Binutils) 2.40) #2 PREEMPT Mon Nov 27 00:23:16 PST 2023
[    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F429i-DISCO board
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2032
[    0.000000] Kernel command line: root=/dev/ram
[    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] Memory: 7876K/8192K available (1002K kernel code, 69K rwdata, 216K rodata, 74K init, 45K bss, 316K reserved, 0K cma-reserved)
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] /soc/interrupt-controller@40013c00: bank0
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] clocksource: arm_system_timer: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 355517175 ns
[    0.000000] ARM System timer initialized as clocksource
[    0.000011] sched_clock: 32 bits at 84MHz, resolution 11ns, wraps every 25565281274ns
[    0.000155] timers@40000c00: STM32 sched_clock registered
[    0.000263] Switching to timer-based delay loop, resolution 11ns
[    0.000341] timers@40000c00: STM32 delay timer registered
[    0.000446] clocksource: timers@40000c00: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 22753100554 ns
[    0.000649] /soc/timers@40000c00: STM32 clockevent driver initialized (32 bits)
[    0.003076] Calibrating delay loop (skipped), value calculated using timer frequency.. 168.00 BogoMIPS (lpj=84000)
[    0.003248] pid_max: default: 4096 minimum: 301
[    0.003688] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.003980] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.019413] rcu: Hierarchical SRCU implementation.
[    0.019468] rcu:     Max phase no-delay instances is 400.
[    0.024442] devtmpfs: initialized
[    0.257147] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.257625] pinctrl core: initialized pinctrl subsystem
[    0.441498] stm32f429-pinctrl soc:pinctrl@40020000: GPIOA bank added
[    0.444993] stm32f429-pinctrl soc:pinctrl@40020000: GPIOB bank added
[    0.453497] stm32f429-pinctrl soc:pinctrl@40020000: GPIOC bank added
[    0.461149] stm32f429-pinctrl soc:pinctrl@40020000: GPIOD bank added
[    0.464614] stm32f429-pinctrl soc:pinctrl@40020000: GPIOE bank added
[    0.473104] stm32f429-pinctrl soc:pinctrl@40020000: GPIOF bank added
[    0.476777] stm32f429-pinctrl soc:pinctrl@40020000: GPIOG bank added
[    0.484763] stm32f429-pinctrl soc:pinctrl@40020000: GPIOH bank added
[    0.490909] stm32f429-pinctrl soc:pinctrl@40020000: GPIOI bank added
[    0.494343] stm32f429-pinctrl soc:pinctrl@40020000: GPIOJ bank added
[    0.503230] stm32f429-pinctrl soc:pinctrl@40020000: GPIOK bank added
[    0.503503] stm32f429-pinctrl soc:pinctrl@40020000: Pinctrl STM32 initialized
[    0.678526] stm32-dma 40026000.dma-controller: STM32 DMA driver registered
[    0.711907] stm32-dma 40026400.dma-controller: STM32 DMA driver registered
[    0.728203] clocksource: Switched to clocksource timers@40000c00
[    0.780779] workingset: timestamp_bits=30 max_order=11 bucket_order=0
[    1.157699] STM32 USART driver initialized
[    1.174322] 40011000.serial: ttySTM0 at MMIO 0x40011000 (irq = 47, base_baud = 5250000) is a stm32-usart
[    1.694863] printk: console [ttySTM0] enabled
[    1.730462] stm32_rtc 40002800.rtc: registered as rtc0
[    1.736328] stm32_rtc 40002800.rtc: setting system clock to 2000-01-01T03:02:48 UTC (946695768)
[    1.747677] stm32_rtc 40002800.rtc: Date/Time must be initialized
[    2.075660] Freeing unused kernel image (initmem) memory: 24K
[    2.081881] This architecture does not have kernel memory protection.
[    2.088952] Run /init as init process
[    2.092970]   with arguments:
[    2.096321]     /init
[    2.098791]   with environment:
[    2.102341]     HOME=/
[    2.105028]     TERM=linux
seedrng: can't determine pool size, assuming 256 bits: No such file or directory
Saving 256 bits of non-creditable seed for next boot


Welcome to Buildroot

(none) login: 


</font></pre>
    </blockquote>
    <br>
    <blockquote>
      <pre>
</pre>
    </blockquote>
  </body>
</html>

--------------Gx0HBidjSBZEhV8W5eADiTVx--

--===============3994426091832441301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3994426091832441301==--
