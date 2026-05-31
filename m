Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32C3CD6E4A
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 03:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 579FD429CB;
	Sun, 31 May 2026 03:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIa-zHL7HQ6u; Sun, 31 May 2026 03:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7139F429BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780197798;
	bh=TPTXemzkK7QptvNQYGAxRuFjSTw1OU4jMeFJNCQU+w4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qszUmUPBdtWIEuaVgB7Ew7MNTkmibea7MZ7a4b0oDX7bnnRefhZi58Wv/5JtZXOd2
	 hyfMxY7+tX4m9Y5AeHhY8beejFbh83q3O1PclLvdAfJLYDoj9/Qo2GC75/vKeQUEdU
	 Jrgv6euoq/KAMWWFi1v55WxsUYrGe9khNnL6b/n9pbmOTvjrRKaNeiVtm4Ci3bzXwh
	 5fx2mKQXEekdgIjVy50+SrrMAsafRut21pvr6LUoNQS8P3g8dk9gBNy9Q3G297id03
	 dVNvgTLJlfFLNXl46bYs7ixrzcsNB1ygywu8u87lhINTQ7KEdP+F5o4tbCefKzgc3V
	 00Is3lSdBLRkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7139F429BB;
	Sun, 31 May 2026 03:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A63C2389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 03:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C49608F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 03:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1EV0vnGSOnp for <buildroot@buildroot.org>;
 Sun, 31 May 2026 03:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA27E605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA27E605D5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA27E605D5
 for <buildroot@buildroot.org>; Sun, 31 May 2026 03:23:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so969039f8f.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780197794; x=1780802594;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lu6zgsIuGjIboTpVAPx7H+jgNP2R/rzdyifRt0ka9rQ=;
 b=aj8OPFbwBdY9/hfeszYo71otORtG0+P1+GUqj4bpsZzrXLJJJ+p7n1kvsaaoMA5D5f
 mvqF/Dq9wCHSzczPBp8g/Jw7t4Z/fTgm9/Xqz19hNJdu8nfnqpr96OZviO/1C0mNaz81
 qqEpaGBLFdHm99EzsiGSOl5TeVPoGBVJPAxByanz+P+gQ2VSIM9y2CHf37z+ItdNNWVG
 AW/mVEUuwqOzh7SoQWQxQflFZK1462huWZiSrvJ+x9PxJdr9akDDZTXlD/Lu86caaVDC
 Ks9W2L5s6PI0WY4UhQB71ROnV1AhOIJcZpXEkUkZCAELzgoyPfa+zi2Xj0bBgDZpUrLa
 s4sA==
X-Gm-Message-State: AOJu0Yzy7dvYj6A/3tm831NEnVXEYqgJyJSFlFj0jIjZnCfRjd6T0oPQ
 2IUwxV93lsQ2Oh2NX5DMT2HYwn68NiMP/GdUSAB8TDulZt3VKZTp+TMROkWJXnDW
X-Gm-Gg: Acq92OE3QvXRaW8+LxdYm/+iXeEwUPUjanyLk1HBCCgO36564yhmW71FmmXJBxN6QK6
 nMNbO+eKx5rmqbTFZWjsd42k2MnxneAjW8bPDcofEDOI3CozgDmXvAOdaAzIm7JDKXb4czvKG8e
 PwCTFhG/64/KoX4vE+7AAO31zWOw6V22jbEtS6AUAY5l9p1jXJCrs7eTpqwcmdwp8Vm+JsjOwQS
 W+Ay64sTsEHfXWfYTreagr+HeYzEsdm1raYmMKLPHePhwWOpLJqEX/DaqkoudA/X6BWg/6I++xq
 mpsjrNqTpdgsZKjizk6NvG0JpEitdUKTkXPtkWqoD3RfRbKp6ThYdb6iIlVTnYnUgFOrv8VTiMJ
 tUJY/V0v94Om20d/8aw8TZLhxTbxNShSBBuqNjE9ncdOV13JCmknkc+ht9FLAYGIjss5FQ9Wmau
 0UDZWiIMpyBk7JK1EVYIpixhy5iRrzzXRWs9Wk
X-Received: by 2002:adf:fd85:0:b0:45e:daa9:f34c with SMTP id
 ffacd0b85a97d-45ef1391a74mr10707267f8f.26.1780197793360; 
 Sat, 30 May 2026 20:23:13 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354bb7asm14652299f8f.20.2026.05.30.20.23.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 20:23:12 -0700 (PDT)
Message-ID: <6a1ba9a0.28f24b6f.376561.cdc9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 31 May 2026 03:23:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780197794; x=1780802594; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lu6zgsIuGjIboTpVAPx7H+jgNP2R/rzdyifRt0ka9rQ=;
 b=SHAor90A59kgMsWN9i23LdfstcDkDI7MMZcD5hDR3m83T0c36RHu6zzN3jKgBbYt6N
 SAnYzUW44c+LBgttsKdyDbdJs3G6nOfyuiKika+znTnx7NYP21JfHF/gO11miRbrATrp
 uZ8S2ytm2NVEvLgO5bClTXLYf1qP/+7vD2FNFW7TisE75e+Eq2hIwCdIG9oVKjRdIzBT
 wVM+hY52g/+UpMHW9yEhJUGJq9jZEkv6FFIYjfoQubmjTkV8TCE0aShq7hZpyPABx6Io
 llvN1viQHY0HPwlgA+kjAAzHqTbdFCyvhhmp3xu5CYXkhhaKwzThTVAubJ3bQNcbnTQN
 kaWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SHAor90A
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-30
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

Autobuild statistics for 2026-05-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 25  |  0  | 39  |
  2026.02.x  |  4  | 15  |  0  | 19  |
    master   | 62  | 76  |  0  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                  linux-7.0.10 | 4 
                   i2pd-2.59.0 | 3 
     linux-5.10.254-cip72-rt32 | 3 
                 gnupg2-2.5.20 | 2 
      passt-2025_06_11.0293c6f | 2 
                   ptpd2-2.3.1 | 2 
            python-numpy-2.4.0 | 2 
                s6-dns-2.4.0.0 | 2 
                    sbctl-0.18 | 2 
               tcf-agent-1.8.0 | 2 
            18xx-ti-utils-R8.8 | 1 
             batman-adv-2025.4 | 1 
                  broot-1.56.2 | 1 
              containerd-2.0.7 | 1 
                   cunit-2.1-3 | 1 
                   dante-1.4.4 | 1 
                  delve-1.22.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
docker-credential-acr-env-0... | 1 
              e2fsprogs-1.47.4 | 1 
              erlang-26.2.5.15 | 1 
                    ficl-3.065 | 1 
                    gawk-5.4.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.84.0 | 1 
      host-uboot-tools-2026.04 | 1 
                     kbd-2.9.0 | 1 
                  libbpf-1.6.2 | 1 
libfutils-c326ce0cc2a735438... | 1 
         libhdhomerun-20210624 | 1 
              libopenssl-3.6.2 | 1 
           libsoundtouch-2.4.1 | 1 
                 libzlib-1.3.2 | 1 
               llama-cpp-b8117 | 1 
           lttng-libust-2.14.0 | 1 
              luabitop-1.0.2-1 | 1 
            makedumpfile-1.7.8 | 1 
               nushell-0.108.0 | 1 
                 octave-11.1.0 | 1 
                    olsr-0.9.8 | 1 
                openssh-10.3p1 | 1 
             parsec-tool-0.7.0 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.2 | 1 
               procps-ng-4.0.6 | 1 
                 rtl_433-25.02 | 1 
                   s6-2.13.1.0 | 1 
         s6-networking-2.7.0.4 | 1 
                  sdl2-2.32.10 | 1 
              skalibs-2.14.3.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                  stunnel-5.78 | 1 
           uboot-tools-2026.04 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
                 weston-15.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/84699a923485f70610388d81a05593667d751b07 |     
  powerpc    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/cf24fa9fe2f2746f981eed71617ea2ab0a32d502 |     
    i586     |          broot-1.56.2          | NOK | https://autobuild.buildroot.org/results/aac17abf12d95c4099cd448943836c48dde57fef |     
    arm      |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/5c533d422dc8efd55b46258a67af3e870f212c69 |     
    i686     |          cunit-2.1-3           | NOK | https://autobuild.buildroot.org/results/17c55733ed79a5e0cdf26fd67f995fac97c8b6ec | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/880320aca75795aa8fa16b458c2cd9c046430187 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/3e99c447853254d4540baf04f63deb0bdcb452d0 |     
  aarch64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/a725dc0f683f91d75b74ab8c562f6da36d298616 | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/6cc4e115881a9651a40765b1dfddf40bc9b2cd39 | ORPH
 aarch64_be  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/6498409464c202ba3ac65eeaaa26c5abb968f177 | ORPH
    i486     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/f1b6d088ab87b8985b917427c978a70b82f4c5c0 |     
    m68k     |           ficl-3.065           | NOK | https://autobuild.buildroot.org/results/c1a2cbd94f79ffd690cc46d4138a50f026fc0313 |     
  aarch64    |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/5adaaf8daf17b39058383795e1c3f0de8532b92f | ORPH
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e3eddeca7fa77b32b8e9532b59458962852bbbd7 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/fb2e6047a7f3b7e3ada5a1391cdcf99461b139f5 | ORPH
   mips64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/3bfb61acc3364c7fb5614070422e4e997c867862 |     
powerpc64le  |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/d9f6c19173af30cd5465f4aa24d7629d3926ebc6 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/94339fdc2bae66846d3562f4121d673479e60e79 | ORPH
loongarch64  |    host-uboot-tools-2026.04    | NOK | https://autobuild.buildroot.org/results/6878128ee600abdbef826be279602a088db0188d | ORPH
  aarch64    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/6ed6075d62068b882a4805ea119c5c64f0e9181c |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/06ea26c1892ea0f78ccc717de05dac29d4af860c |     
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/dfb4180ba19cc859895f8dddcdf4264719445ae2 |     
  mips64el   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d36b6cbaea6225fa560c0cf623c00c70a7a4c005 | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/9a60f488cc98d0057b94647a74d14a6a8f184944 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/46ad2290c4f03f99697a4050bba6a70caf20549b |     
    arm      |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/30cc91ded920cb84af174c80f6831b5004752c19 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/d59faefdcf7e3628f94943c9f1b6de3885d882f4 | ORPH
   mipsel    |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/ba3c31f2db36299fd6911db176f96674f6386749 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/9edc730f7a7688bf361494ea6fd6ff9aec7d2bdb | ORPH
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/067960a5bddae83c4af7dac042edf0d62fb02aa9 | ORPH
   armeb     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/275c7d1dd1223e32c5aabd93c5346a7b1a6b94b3 | ORPH
    hppa     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/de3d111abd68c856b0b3faae95bbce57d8941bcb | ORPH
    i686     |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/6c4b8c9036de5628bd669b3734cafc580985acd4 | ORPH
    i686     |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/0a77d40f5067a0deabd5400248e308ef97af4dff | ORPH
    i686     |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/79b2e7b5b9df7402fd35b68a5b664756a6ea0aff | ORPH
   x86_64    |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/5fc007250059a90551e713c621fe71f3698645a0 | ORPH
    i686     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/f0f9cdf5f8059c5fbb90380a609dd66c93d52a05 |     
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/995706d47081a8f381f7d685f28c24304fd810e7 |     
    i586     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/366e714a0a245370df5d4561fae47b4c8fa167e8 |     
    i686     |       makedumpfile-1.7.8       | NOK | https://autobuild.buildroot.org/results/a4090b87ee428c0484c261d286367b04f10fb71e |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/8b660e656a734b5386571115bef1f3895abb9b1c | ORPH
powerpc64le  |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/b6917e3b45f9aed5b2a851d11b9294aa9fb1b1d2 |     
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/46987289479d7004f31a7c2b18bff300a84ac7d2 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/ae29e57713a1cf7111b141a5632e06729c75d667 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/cd0e52c788798fd3802f94160d4ff02818f66f35 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f66b01ef80020174b7e91477849ed0756897139b | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3628a4c6c13d233861f163134c2dd58a0a162830 | ORPH
 aarch64_be  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/112d70bd97c26b9e769dab9bbb0bdb7f33551d18 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8efd5cd581175d97ceb6962e4153762300ee9fb5 |     
  mips64el   |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/df157b17b34a2ade0c03b0fcc89e11b0f00415cd | ORPH
powerpc64le  |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/9efbc2f6a53e6739481c3371b8b9705897e20950 | ORPH
powerpc64le  |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/c4644e45ce0b532a943d5a8c6c37b30cfecc8007 | ORPH
    i686     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/069b05eb6806f109e4b3c12c0d625a9ba855ffe1 |     
 aarch64_be  |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/d82371bed91d63f93fb747b182b0623d7c8c5863 |     
 powerpc64   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/cbb3b1b177e071c140d236f8a628af993d15f4ed |     
 aarch64_be  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/a8d0b7f2b5cd88ce24a87028235c900c9858df82 |     
loongarch64  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/9c8d83e024ce53753acfd4006e1bfd90c887d6c5 |     
 aarch64_be  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/a6cdfb84a963557f3e42b8418e0b3a0f91deb96f |     
 powerpc64   |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/27687442bd051e0179524063975bacddd27c00be |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/30e657356ff573ee0c1d9062edf7a3cbd8f48547 | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/6830db71dcaf74b976ea3595d77b452812473bbf | ORPH
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/553fe0b0d91b1a13c0b1dca17b9cc172f0efd109 |     
  powerpc    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0d635d96a061b2901ba5fc8e20e4e971095e0d63 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/5bfe72ad976a9e06e5e85f0d03272138aca725c6 |     
    arc      |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/ce895de0177526b9f1a202e25f4846df58b7228c |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9c6da44109e29a541d3b1500f94b243f19c23f99 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/aa537506a8eb841fbb05609652ed1533de29d61e |     
 powerpc64   |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/b973141a2abf549a773c6a5b6aeb99b46af8d555 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/52bb30e7fb9b67faa14f461423127832d7a4cf94 | ORPH
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/3b97008b9f4448b6f18ebc508984b4d14535e7f8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/695b576f8b883f0c6c7f0463308179309d2911f1 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/6f303bf66c6fb5027fdcd4507288fc388aff1966 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/9170862bd41fd1b963fd33091a19aaac42d4541e |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/058d6c3a2aa4151432a0db2bdf9f8ec23763c5a6 |     
    arc      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/2aa3f13c82c3fb388f7b853fcaec401750b95739 | ORPH
  sparc64    |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/bfe7176bde76fb869c12d54b138bab485e09f6e2 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   exim-4.99.2 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             batman-adv-2025.4 | 1 
              erlang-26.2.5.15 | 1 
                  ffmpeg-6.1.5 | 1 
                host-cpio-2.15 | 1 
            host-go-src-1.26.3 | 1 
      libabseil-cpp-20260107.1 | 1 
                 linux-6.19.14 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
            resiprocate-1.13.2 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/f12031481eb570d985f660c8aa429f10e55d1bb7 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/da3dad828aa3d615666dfc9aa4292a4906ab2371 |     
   sparc     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/a5002e24f303880ec4b753d026733e84e2590827 |     
    i686     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/737b7c39e425268f0c35fa658f22db28eddd595d |     
 powerpc64   |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/7dc630027e88ddd872338f4f9503af9f0fb2e43e |     
  mips64el   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/14997a11cb7a7334d8005259cd7d441738498d7c | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/e655653040767def4dfdcf3654784a504a56ac68 |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c4cb1ed9d98e3fa562331395de86ee46601d79bd |     
    i686     |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/3da5c7774c5c3f09108824488e6025025c101951 | ORPH
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/2610345d1a6ecf230caa45c1c00fab83a9548a4d |     
    arc      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/63446f4a35e27cd0b1aa3cbd951a272791f8fdaa |     
    i686     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/a13426cadda7c9685cbf682f61de74702506b67a | ORPH
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f91e4d616a33763cf486bac2c4525b6d99dc165e |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3f1d93bb3f86f2464993bb4162b24897e1deb215 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b4c81408c8aef3aec7f328b373278c3c47f0e490 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 3 
package/linux-headers/linux... | 2 
            18xx-ti-utils-R8.8 | 1 
                  brotli-1.1.0 | 1 
                   exim-4.99.2 | 1 
             fluent-bit-3.2.10 | 1 
                freerdp-2.11.8 | 1 
                 gerbera-2.4.1 | 1 
  gobject-introspection-1.82.0 | 1 
           host-doxygen-1.8.18 | 1 
               host-ola-0.10.9 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                      lft-3.91 | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
                   perl-5.40.4 | 1 
                systemd-256.17 | 1 
              tailscale-1.78.1 | 1 
              udpcast-20230924 | 1 
ulog-0389d243352255f6182326... | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/c58ad1271075d3548e04b2321aad62311b70d31c |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/dd30a8e18f093d8514d87c56f05a15a6d2f6bdfd |     
    i686     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/435c8bb746cb4ce7167391ed3ad4165ef82d0d5a |     
    i686     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/e04c5dae5440ffc266a3c53d59087235acb0c6fa |     
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/7b15bc100483cb915c3d12332401a1d8a744cf03 | ORPH
powerpc64le  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/9b1ca8d011e54f8aa9fd870f710cc836e6b557cd |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3a89df147b55e90beac61df9da006a63df35f667 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6c3e54495f511963f19eb17ac68a5fa8102a7569 | ORPH
powerpc64le  |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/5a3dccf76776b5356dc0a84a65cbfcca4d8a7bdf |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/023b466f34e5972c20107257746bc9f789f31f47 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9b3873885f0d00a1a8e32da77d62790c61fc540c |     
   mips64    |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/68f8269e24d8c98fe1bf4598e7ce5cfd644be5c1 | ORPH
 microblaze  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/8286b6bce77cebebfa74533f6f03de0dc5648ed8 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/9fc9fa6191db941c00885e04c7cbfa4c4c032744 |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ff8883da61ed7ba7208b9e8bcabf07a31d44ff99 |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/89e0749d006450f5aa9b440782b414afff7046d1 |     
  aarch64    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/9dea866dd27108751826dba8507616d34fe8ae1c |     
    i686     |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/770577965b185358cdf520ce397b9f0b0fbf3028 |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/4895db0b645b7810e56dc2fff72380ef20b1cc94 |     
microblazeel |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/0cf78b081a2f6c7dfd6bacf24161cd3ee48a3bd2 | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/88dffeac698c5babad478a3d774ca0685ca038bd |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/902e8dfd426c5ff3184eb02d3db40172f0f86721 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c42b9b97b34590692762c26831e302a81c674d6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/93da740f3cfa41ea7a0dbca9fb8cff960e21c8ba |     
    i686     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/1d6be41ff7b2e019075c2a4826fc87d9148ff793 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
