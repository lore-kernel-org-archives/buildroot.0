Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FAFCCF9E3
	for <buildroot@archiver.kernel.org>; Tue, 11 Nov 2025 04:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DEF403A1;
	Tue, 11 Nov 2025 04:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lAYoZhMWVKu; Tue, 11 Nov 2025 04:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9307740387
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9307740387;
	Tue, 11 Nov 2025 04:21:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80DBBFA
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 04:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7354640742
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 04:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GGbYvVtWWmJ for <buildroot@buildroot.org>;
 Tue, 11 Nov 2025 04:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB46E4073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB46E4073A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB46E4073A
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 04:21:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso2998075e9.0
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 20:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762834895; x=1763439695;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n63Lv+aWg1ax0a54yPT5WKaElHAwDufhZG2XwNyn1v0=;
 b=nCZHpLifAQxKKxxGrXal0/Ro94mh364l9uM1JHvmrVHzQ4lFrWYTEqnjDGd5gJWme2
 2dbbY7fTZeOzxQ2r+p2+bf9XWDbuhtPz44Q1eBaDGAnRgXHh3M2eySTDX7629vQTIvCV
 GIEzpRgqjZUYJsdvOf4RiIzWAu6luo0Rl4Ta93JYlDxKwCqLEkr94nbh4Ko4w7pBfRKL
 rNQl1no55HNlbr5nLHr942XMlSlwVw6IHPh15LMkMmmyYzIp8HjRfg3Xf6p1eScmS9RY
 htGrrwyxlgiOwrOnUHFzR5vc1Nko7gvkLzJ5PYJB338rvIKqaSj8urV1yY4RxUnX8bBF
 h4eg==
X-Gm-Message-State: AOJu0Yx0UHWJZJL+4XwSldOZM3l0j3ADiu7rYrDnBbmwHv3PR15ixxQK
 ZldAiLuwgpCbUV6YMapKfxHBJ6WAcYwN5dTp1cuOj10jvZKeOw2/hqkmkjM+OA==
X-Gm-Gg: ASbGncsj9pIcvxo2LsM0OJ2tmDxwMrdTxT89KyHJrB3FGgLla0tjZEjAM3qF8o45/V4
 h/ucZn+hzvjFB4WlqA78h7K2NkF1oSpopLALj+8OApO/sFTDy4rFM94D/2TMnl+KP7l8c5cqYD+
 XYr14klPIegAKxV83k4ve3bCkJW0VJs3YXvTV3fdzD9RJdAq6PczyMg01lruLtDBrlMsXNhgE5j
 ih9dyehB33OcJT3VK3vYyFgVi6gHR6erOMnz9aCE92+8Cmix2REV5JQLCqAMSyxcFEXE95M+G4k
 WljFqNdmbv49PzTCkPn+Qa2UiDnhxTKVybvkagaLcbXsU/eWSfwxip+kd4ON3wC8fJZU9qS04MY
 Mutk+q/1K9ENEEbUmRy03DgUyNLXPHIb92JtCZ/eODjaVTp/29QzDLCWF+HsvwCYa4SzJ9eE5FO
 DWRR6xBmk+TeAQ7hjn1w==
X-Google-Smtp-Source: AGHT+IEm7E1m90+jdzJeWSNi2KqrBqAIRiQxR7KsopXGPzbZcregxHV2uCMBKSBKykE8ifpvms/Uqg==
X-Received: by 2002:a05:600c:820e:b0:45d:e775:d8b8 with SMTP id
 5b1f17b1804b1-47781418886mr14898245e9.1.1762834894371; 
 Mon, 10 Nov 2025 20:21:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47774d3557csm163115115e9.8.2025.11.10.20.21.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 20:21:34 -0800 (PST)
Message-ID: <6912b9ce.050a0220.ae269.9287@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 11 Nov 2025 04:21:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762834895; x=1763439695; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=n63Lv+aWg1ax0a54yPT5WKaElHAwDufhZG2XwNyn1v0=;
 b=EcxH9qZhmyFqiXU50vfwFGh8z5UfCSAISkuclCNa3Y7hEI6z7o4KOzfH3e2P0nx2kW
 SUvqO/UE5B3HqBFIRH/0aQapv0GSV7T41e3d61PVJu56ihYCh0jpe//QhPQNoQww7Ert
 XGpFC53ljVMO2xecFMZGtUiXv/754gwo4mV6Tyro7331DWJHwJE7WcYHvZJsfhxuXbPw
 R+8B16cnbJsjUpDQO3o7/HAvb9Hckud/bQOCPH+XbgA0A+c/33z5OfScwbsKHatOmvom
 R506is0YJSFPvkiuPMTn7Am6/WeZ0t0kuY87t/OQ7gKxVJ7+TzDiG2bMhTAnaNQTPVkq
 EaBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EcxH9qZh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2025-11-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 11  |  0  | 16  |
  2025.05.x  |  3  |  6  |  0  |  9  |
  2025.08.x  |  0  |  2  |  0  |  2  |
    master   | 30  | 79  |  1  | 110 |

Classification of failures by reason for master
-----------------------------------------------

                openocd-0.12.0 | 6 
             dahdi-linux-3.3.0 | 4 
  gobject-introspection-1.84.0 | 4 
           host-openocd-0.12.0 | 4 
                   libcap-2.77 | 4 
     libphidget-2.1.9.20190409 | 4 
                   cvs-1.12.13 | 3 
                  libsvg-0.1.4 | 3 
                    mpir-3.0.0 | 3 
                      fio-3.41 | 2 
            igd2-for-linux-2.2 | 2 
              libopenssl-3.6.0 | 2 
                  linux-6.17.7 | 2 
                python3-3.13.9 | 2 
               asterisk-22.3.0 | 1 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                  bitcoin-30.0 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
               dvbsnoop-1.4.50 | 1 
        edk2-edk2-stable202505 | 1 
                enscript-1.6.6 | 1 
                espflash-4.0.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
           googlefontdirectory | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
          host-tipidee-0.0.5.1 | 1 
                  iozone-3.508 | 1 
                libselinux-3.9 | 1 
                  libsepol-3.9 | 1 
              libzenoh-c-1.2.1 | 1 
                memtest86-7.20 | 1 
                netdata-1.37.1 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
                pipewire-1.2.8 | 1 
           python-zlmdb-23.1.1 | 1 
                     rauc-1.14 | 1 
                  sdl2-2.32.10 | 1 
                     tmux-3.5a | 1 
           uboot-tools-2025.10 | 1 
             util-linux-2.41.1 | 1 
               valgrind-3.25.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/660d89e1264510f73f1486f9807dbefcbe73850c |     
   arceb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/338d72a7ec9401e050c6c381136dee82b1bcd521 | ORPH
    arc      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c48cc23b6e30cddb90dff93a25ede0a04912a270 | ORPH
   mips64    |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/829c0f0df7a279a1ecaf7b7c65c8bd87064e528e |     
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/dedcd486d63456a4411a1dde5f9aa89ed27f7bcc | ORPH
   s390x     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5d0f43b1d4c9a810b0ac328bb2cfd591055c5c5b | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4b53543feb0e3b094e5cafc1fb91bf80c01bd350 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9886dc273e15bbb5a02bb00af66d996b4860e5c5 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ffaa01eaa26bd78b9481adc35a214b21f1a6a929 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/195406f213613740cf585f0b72feef42ae115db7 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ef18c7e52a0093f58c1d933ec5405e07e96d0421 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/480910c3ed43ef93b00de816f5f23dca5ea13dc6 | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8aa705001a0f6870f1e64c7cfae26a6c12ddc6a5 | ORPH
powerpc64le  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/acda2506c478598ca532e65145b3d5e7f241ed50 | ORPH
    m68k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/92f6b1b68331b441f03af02c8dd3a03310164b86 | ORPH
loongarch64  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/3c47b99412c0042967d36a03d2d5bb236759008e |     
    i686     |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/bbed79697c7e7d5f5e5d133564c92eeecd637df9 |     
   mipsel    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/fd76e5f34051fba6e6523e75058e89a36f4fe4e6 | ORPH
    i686     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/e694e3e12b2098db95dbdcbdd07cba5f5fecb0fe |     
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/d0003e2cfdb7913ccbe35d87657f158baff6ffb3 |     
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/2c85e5a053edf36e6cc3e6c66f377d5610ba1b26 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ec58ade67f4f5d374fc4f97f38a59174e2017898 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/35d503a9ca89ab6fd751ca34484ba95cdfb29fca |     
   mips64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/8a6a95504ab0585ffac37605a56bc6ca7ea2ed86 |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/11b61023b0b8f3724eb97f8e35ae3120361fa90f | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6069d7d63743ba2fe6b09f52d147226a1fce67d6 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/be98f6931bf7a9fa2f05d72d43d8a601edb7676f | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7721564b8f3912a00d3e36d75e84bf430f06f3b3 | ORPH
powerpc64le  |      googlefontdirectory       | TIM | https://autobuild.buildroot.org/results/011683e696a462fa92cfe7a76a1494dcf1b33ba3 |     
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d4628e6e99057fa1422cf597731ec9790a2cfee4 | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5a20f22d44a5cd0b1295188907222a8cb07df3f0 | ORPH
    i686     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/b4ba4ae9630eafd8986c379ac0fc4d3aa0c4821d | ORPH
    arm      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d70a973eb8404070ffea2346abe2a1333fec205f | ORPH
    or1k     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/2d711f879c538d8722f1dbc5e746de0e32bbfce8 | ORPH
 aarch64_be  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/c866fe17ec6807312e4b5f62e57f98bdc4526ff9 | ORPH
 powerpc64   |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/8dfca9bdf3a29e99dd022527cf006d4c5b1c4b87 |     
  riscv32    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1c7491c09f43095e5a46368ae3922c0ba8df2a94 |     
   sh4aeb    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/399142dd409cbd68abba1c0ba9b5da2d25b32fd5 |     
   xtensa    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9632ea6bdf6667ead56a285afbf59ec838b696f9 |     
  powerpc    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/afc77778c3d4aeb500a313af08746616b2d681b8 |     
    i686     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/d77920aa5cb2a8c4a9850226b99eb422f9d51aa7 |     
  powerpc    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/7572a0dab0ca599340816b6cc4eab341a5f678f8 |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/4296908dcfb0d05896b59481fb620156861d5214 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/e59fb8aaee1524eb67ee3a5493c507a7150e898b | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/4a5bc5e5d5b68d52e1172402206cf76b3e64a330 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/91d65d3fe8425353359577d7b5c5cbb2a32c24ed |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6af9a93bb6a7812725a464258bd64321271a7f1f |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/48df2707771c44b03a19bdeb23a390253f48c8d8 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2ffa055ff693e6d5e48469758ff07bdf091805c7 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/089e75f7cf8f2a5e5014b400e464e34b2489227e |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/500e2a4618be1028a1a7ec37b2493c84987e11d4 |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/16dba1cc591e747d3d44e40eaf2a57c0b6862f0e |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b538e3b6c91ac5dc0041f9f7d1e44987f5d39861 |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/133ddb7f0b6c3200bbf81ffe1249a6badf6ca61f |     
   x86_64    |        libzenoh-c-1.2.1        | NOK | https://autobuild.buildroot.org/results/18f33d2e7735399f251f5f1ff7893e50d1764b31 |     
  mips64el   |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/f825401912ad1c843d7133aa157980467a2c32ef | ORPH
loongarch64  |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/5256f964ff26d89c299b9ef01828b7f12f4348df | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/d15d13a53c31691778cf04dd0c14912c96a9a51c |     
    i586     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a8cac1ba0e89533e603ab6fbfd9fcc4063cb990e |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/531420eb51f8d1aa757808eb5c56b35c0fcf094e |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0730a3e0e217eccb06cf89ed6717c6abd609611c |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9bc7e84071a39a3894eb6651b6eb19b2b066d902 |     
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/3039c8fb9a0a9985bbd7ea1b41fb3f70c421ba80 | ORPH
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/0c48715a9a732b033b3bf2682b851146688e7cc6 | ORPH
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/cba6427721ab15fd181a38dab5915c07a23b83a6 | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b9ada6230ea44a6ca718abd036d11331a1ba8d68 | ORPH
   mipsel    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d1c4f8a2c21048f012aea2af56f3809ea3ca7f8c | ORPH
    or1k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/e926d7ce1fb396fdaa0d8f64327daa8bd6c9f5e0 | ORPH
   armeb     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/3924dadad74be17f0d44c0ae05354813dfc3bf76 | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/acec13d20a07e617059824dff8c0ab624e16c060 | ORPH
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/ef75766f558a19fed01d43c1855705439f250014 |     
   sh4aeb    |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/ade020afb7c18662f9962fddd9c1b8fe5d90104f |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/24dad374cc02ce1bf2c0995dcc03818d01e54686 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/80bd882a08b135ade308dc90839ae52384b42e00 |     
   mipsel    |           rauc-1.14            | NOK | https://autobuild.buildroot.org/results/9a3cb7a07afa4bb5d7d1c18ed601b4c95ff45cca |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/6f963bd11ab11532174becd5651dd74e8bac38ce |     
  powerpc    |           tmux-3.5a            | NOK | https://autobuild.buildroot.org/results/7e1ff31cbc248d6dd5e172dd22fed5a9432d4a2c | ORPH
   armeb     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/58b229b4a3b495f9b8440774a42b85aa6de0acbc | ORPH
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5f5b1be2e34ff72b03507a171adf2cb3ef52a9a7 | ORPH
  powerpc    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/6abbeebaed7785b4c5658dcf3eb9a5e1001302c6 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 logsurfer-1.8 | 1 
                speechd-0.11.5 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/431977535709511d102e33b32867a7c977e862d3 |     
    i686     |         speechd-0.11.5         | NOK | https://autobuild.buildroot.org/results/5ce54da45026744d9ebb65c4960bd1d7bdf9d985 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 3 
               bctoolbox-4.4.8 | 1 
                 libgee-0.20.6 | 1 
                 libssh-0.11.3 | 1 
              luabitop-1.0.2-1 | 1 
     s6-portable-utils-2.3.0.3 | 1 
                    sslh-2.0.1 | 1 
                       unknown | 1 
                   wmctrl-1.07 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4982eb3fd3b81e773bc3e48570988b69852788af | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4ff6047e0c1c7debbca05327ebedc334cde06393 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/05b88037f10b0eb7f0f0299aadfdeb1f4c19ed92 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/26ce1945ddc3d59ff4322ca034de111df4c62f30 | ORPH
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/ec06f884f9c757d79a61276f943ec3118d91d0aa |     
  powerpc    |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/ddf014ec893a0ff58d4cf3db62114ebe08019545 | ORPH
   x86_64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/5ac8a270d9868da6caacab006f6f960225eb4990 |     
   mips64    |   s6-portable-utils-2.3.0.3    | NOK | https://autobuild.buildroot.org/results/f3d7d40fc7861ef3695303d391c0e665227f851f |     
    arm      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/398b78efea6eb9b08f13c72f07222ed7866a429b | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/af3f44d0796bd9a7a4566ff3d1b0f0b154682009 |     
  sparc64    |          wmctrl-1.07           | NOK | https://autobuild.buildroot.org/results/e83db28f8d43efdeb8c76db8d6378ace25c710d7 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

host-binutils-arc-2023.09-r... | 1 
                  iozone-3.506 | 1 
                jemalloc-5.3.0 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.14.11 | 1 
             parsec-tool-0.7.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d3df82de23226e012789380187e44f29fdc7e920 |     
  sparc64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/27a3b04e11eeb1f11ab1f18c92f7cb837c9d4644 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/fbdf77421835c7d0d2bc89ee68c39163b253d325 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3e7d5419d104f60a338916427cd993928c54d034 | ORPH
   sh4aeb    |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/6af404f2da03fdc89015d51996bebbeec97e0e01 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/43d9b9c72f63cf8c20cb88dc0c8a256a4952e3b4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
