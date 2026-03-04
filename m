Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39797EDEC04
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 04:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B5F81568;
	Wed,  4 Mar 2026 04:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ksui3EXlRbUw; Wed,  4 Mar 2026 04:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A952B81569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772598167;
	bh=kz1vr30CR7CKCtGiuNiiDDJR37XddW9oqTZSdBplOpw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mYKo1lIwDLfPS5TwLDcYoSfvKW52AOF2J51/l4BpxM9shEg744jWv/sNYAwckQFF2
	 NCtFe6MdGIPFYIggdO1kI8BdjXzMpUaz0+IqSDvx11/RoWWFZuGqz5SCTEm3DVusQs
	 b+Vob5HWhpYrXrgm7g54/HKSSVBXhiXoQOZ4XxTLy3puCQ8O1UX4xIABAk543HT3Qo
	 3yi8FczKX/qJ0k54gW77/5Hyc1Ts0RUP8tF1C7DK1HVuyD0pOg/e0u4uglRxfR2thd
	 AJ6YXagz3tHhAcS2wAp7ujRBbg5CU3XpB/OSDr0Jo2amGvrbhDqNlw/uSf3/5NvTch
	 v3V/i/JDaSB5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A952B81569;
	Wed,  4 Mar 2026 04:22:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF2F1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 04:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7284034F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 04:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nX0TjOARnu8C for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 04:22:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A38240315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A38240315
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A38240315
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 04:22:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso2223702f8f.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 20:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772598162; x=1773202962;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0m9syHl7OwyrLSl8r4FBxmXxUiHCBZPltpyxCRHbz7o=;
 b=QFVqS0dYN4Ys+J+Zi3wcrNCzwltxtQYThXNp+tMlkGLBnP6BXIt/AKhr4R4W117A9B
 Oj+uCN4h23eLvGfONVzUhDXeXG2BRxwWRU2MBGA459sRZh2DOB62Bxm2sHGB0/rys8Xg
 X5ZiqP7aILUs2QinUwISNc6/eVAOSejx1YiYQ5KAAjqRdmbItrdzEmr9vKZsYna173Vz
 2jFCjCOdwcrvT/+SQz0ZrrWfN8Op67yhXfRA82M6yhXPSAT9GYbjAxln7m7lySi9lTbj
 +OSlQYkd9P9YZmf0/77Kp3QleLrFlCGnkvmFhZvwDz/fgeO6rmkXe8VR9PFyK7XP1yp7
 RRxQ==
X-Gm-Message-State: AOJu0Yxk3JPL85KGqVtbB5fAG0abvamwQr5i8WK9CjjxY6sMVuZPlHGy
 jSUnDD3OZCRE+nQFbyJVTBTH3/zDLXm/j9NLzpYGSNWsRUc81IJ9U2Cd/eNTMrWI
X-Gm-Gg: ATEYQzzHENkuXTP4PyUiEijdo7cbJQGQtqWFpTmZ7SGMZOW5gD7rShMCRZwjBzQX5eh
 sahbRsc8VT1k5CPz+vF4yf2Ad9qPAEtpRA8O5Pd0mhJ6I/B6dMYa5vBAzM8kHSAORUf68OSJWZS
 TZT48p/P+MiahOVbKVXaA0Z1j+ErQ0l5cOjoF2ch8cDV1k+Po2z1YOOBS1lmTA4tL4YErVs5CoN
 JuLXq4ccK7jDLiytDqfjaGpLKL0MPUlv8iwdJQOis1Mz2+AbaUCoC1VSzzYIsUtm0953j7HPiKc
 EbPXxKYaLS2D4+i5W3P1xwEfiiko2yMjBdrI9kym9DbBUMj11h26zKo0K9Cb9wW/wDvjdLM35Ir
 rFrU2fwZ3biCo9MHM41bvAfUlel7AF5BBQVL5gE282FPDqD8+/OWJ43Qb7YncVU1KjVbe66ljN9
 icEQKb1ETPkOwxfVWjEprsPe1aphfGeB+KCmwSqbgt
X-Received: by 2002:a05:6000:4007:b0:439:c202:99a1 with SMTP id
 ffacd0b85a97d-439c7ffe64amr1057223f8f.27.1772598162061; 
 Tue, 03 Mar 2026 20:22:42 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c2f8c0e7sm7015526f8f.29.2026.03.03.20.22.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 20:22:41 -0800 (PST)
Message-ID: <69a7b391.5d0a0220.3c3270.4c61@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 04 Mar 2026 04:22:41 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772598162; x=1773202962; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0m9syHl7OwyrLSl8r4FBxmXxUiHCBZPltpyxCRHbz7o=;
 b=AVTgWLqFGzF1lMC3pdqa+Ydci78sJ+6nvYBX4ZjAZAeF9wbM2YGD/Rd8qcwkJa9Bu4
 zmQD0mpggjWq8gwU0niIQy7RnYBxmUEq7H0X/qO4So0+wZysrqCH24VAIaQCurHW8Qxj
 7/PM7IYGO3AoI9XUOVSDEAjEgdZTAIzx3zO+2QREjrBRB8VxnxasEvJgyu9YI5nbwmvy
 L9dmEII5p2LMqoK09b4Xj22EjmbVCFOj97Y3O2u7g/YZOZj+9PvpzQQG002bgh6xShGA
 YozpoBjI6uBwYVmxKXJjRWUoTCT2T5iYX7Mpg3p+qw5uzLNFTwJVpoobtVZcOYXVdGhf
 9RUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AVTgWLqF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-03
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

Autobuild statistics for 2026-03-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2025.11.x  |  2  |  2  |  0  |  4  |
    master   | 32  | 59  |  3  | 94  |
     next    |  6  |  1  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
libftdi1-v1.5-62-g5e67403c4... | 3 
     libphidget-2.1.9.20190409 | 3 
                 linux-headers | 3 
             dahdi-linux-3.3.0 | 2 
host-am335x-pru-package-5f3... | 2 
                 libzlib-1.3.2 | 2 
                     mdadm-4.3 | 2 
                 systemd-258.4 | 2 
          usb_modeswitch-2.6.2 | 2 
           alsa-utils-1.2.15.2 | 1 
             batman-adv-2025.4 | 1 
                   bird-2.15.1 | 1 
firmware-utils-c42a3bc53da8... | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
                     grep-3.12 | 1 
                haveged-1.9.19 | 1 
         host-gcc-final-13.4.0 | 1 
              host-guile-3.0.9 | 1 
                host-mpc-1.3.1 | 1 
            igh-ethercat-1.6.8 | 1 
                  kexec-2.0.32 | 1 
              libopenssl-3.6.1 | 1 
     linux-5.10.246-cip66-rt29 | 1 
          lua-lunix-20220331-1 | 1 
mali-driver-5c13ca89d83dec3... | 1 
                     mtd-2.2.1 | 1 
                 nettle-3.10.2 | 1 
                 octave-10.3.0 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
             open62541-v1.3.15 | 1 
                opencv4-4.13.0 | 1 
                   openrc-0.56 | 1 
               openscap-1.3.12 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
            optee-client-4.9.0 | 1 
             parsec-tool-0.7.0 | 1 
          qt6declarative-6.9.1 | 1 
                     shim-16.1 | 1 
             stress-ng-0.20.00 | 1 
                   swipl-9.2.9 | 1 
uclibc-ng-test-132c6134d691... | 1 
  wireguard-tools-1.0.20250521 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/9461697f3110a420077a5099a67d52436286dd5b |     
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/5adda122170a31151af019031a4182851f142ff0 |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8eef727d44a6870aadd42c5d43d936c77573ce01 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/66e044fcd708f9122b68d6348267bb734dc44416 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f0fc47c789208ae9f85bb8a32a7d5c261f05ce4b | ORPH
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/29b334ac46b5d2e9cb029d4f5f1d2fa9950884d5 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/180cd34587dff43f5fbcf9a2369dbb1ecd7e660a |     
    m68k     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/446ca68c1a1290eb5a6cee4d058f206ec7c09944 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/bf4eeaf586c833eb203e8e96188a08a55482942d | ORPH
loongarch64  |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/ef38715a7b967844fa59aeda1aeab53f9bc3e8d9 |     
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/be51b053bdaa33fc45ac98c33735490d688c29a0 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b2750e0b77126ba5dc7720c2155042eff21f083c |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4eca76fc6923aab805e139a665702f9e2cf600ad |     
  powerpc    |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/958acbde23e1ee0a8e26bfa5d6432330d9a143f6 |     
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/75da4151b88d84ea08da19a3b4b92bbf93758c75 |     
   s390x     |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/4a287380ef1c9b88475f7c20526610526d34d24d | ORPH
 microblaze  |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/922432a33d01539b914107bf40a7cc0f4735f37f |     
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/ab8d0ef9d117b2ef8afc37ba435d28ffb97f7366 |     
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/7d3c4830eeb32bc9ed59e3b132bd303559ca8abe |     
  aarch64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/aa9bec4542fc00e591fc3804fdda1bd16ec68bb8 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/efecdb4724ce702e27b529e46bdd3f6e0583ac14 |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/2060569b91859f54829cea6750c86d8df29aa6bd | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/bf437bd0d9e93fd53097ba5522ce05c32947b6af |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/60be8ea80d36c6150cd013c0d307cb0ed7f407b0 |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4a4783e3d7eef071aa2ef128e8440483ef896930 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/403162907b5e310fcd6505306fe5fa4dda7ac94d | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/1e75ad5be2ab34714b9ae6cc263f8479d4d3d5e2 | ORPH
   s390x     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/70ccf62f18faad67614da39b752bb6f268557c7c | ORPH
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/92069f699c448c2fe0e33507cd0a588f7ba28423 |     
  riscv64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/03e5da2ee9439b6c85fdcd13eb8f30c877000a60 |     
    mips     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/1669014d44521b1d6f0696f633dd71ab90dc7ed8 |     
   mips64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/6fc91f1bee946cc624f9ee696c5be5839bf6c108 |     
    arm      | mali-driver-5c13ca89d83dec3... | NOK | https://autobuild.buildroot.org/results/fa0c3acfcfc94b0600842ace6d8b09ba2c6c593f |     
microblazeel |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/acb89843adef385713f7a1dee186db1f89da7c44 | ORPH
    mips     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/d03f75649bede0504fb5bb893d1043c85ff72cb0 | ORPH
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/edc76232bba415fd2d65a84521d13cbb3c223bd5 |     
    i686     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/7620ec564ff91a26dc8b6cb8d09273684bdd7c5b | ORPH
powerpc64le  |         octave-10.3.0          | NOK | https://autobuild.buildroot.org/results/1f170f1041d3710eaa598e17bc8389e2a027461e |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/6a2d60449aeb52b2dacfe967846d6350b9f9bcf2 |     
    hppa     |       open62541-v1.3.15        | NOK | https://autobuild.buildroot.org/results/c60e9268e1704a295d1332f8db0cb87588b0b799 | ORPH
  sparc64    |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/38f9ef15068ad1f30c2072a0ddf1efd5e5428459 |     
   x86_64    |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/6c6615cbc5a56e5f5f5384f6190713e0dcce7719 |     
   mips64    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/2d9475b7cd2d413c99d6233ebb213bc932f1e398 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/446ab0be9378007f551b52308deede6b02074a2e | ORPH
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/18d39bdedb80320689b9dbf134107a98b5b2dbc7 | ORPH
powerpc64le  |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/5cdf0c9467eb846a36e1752f2285b795a404225d |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/1f2ae1a8794f95e09368e0d1394d9ab964726aad |     
powerpc64le  |      qt6declarative-6.9.1      | NOK | https://autobuild.buildroot.org/results/c14bb4ea8bbfd26bb1cf6b6135027641096cd7f7 |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/0593849eb8aa8985084a131ce2c3e9193bab25c7 |     
   s390x     |       stress-ng-0.20.00        | NOK | https://autobuild.buildroot.org/results/530dd772829b4f7ed9f6ff6246afafe15fc29a06 |     
    arm      |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/a4a3aa2f1242cfe6f655d8fb1cbd3273eea8a6d2 |     
 powerpc64   |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/a7275a0202d576ce679d3d97a64704e3afa57063 |     
powerpc64le  |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/8926697bb413db96fc9799ceb52cf1ecc39b5660 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/d848ffd2fff2ac6574161e17fcb6ff844d625fc8 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/8b6ca4f36e85c3e26708568999c58d262ba044ae |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/80dc75c58dabdbc184c040494bae90203949bb79 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/83cbd4096a61a2a03bfc5a477c9950cf1488cf1c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/4b088ce49cf1717793056c9254242275c6d18918 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/23f4dc263d513d6606df696cee1f64553082545b |     
    arc      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/ef86220583b4209745b554d9ccb75aa79cbbcf6c | ORPH
   sparc     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/5dada4063eb4bc338dd9be9e3bf845a1bdfae260 | ORPH
 microblaze  |  wireguard-tools-1.0.20250521  | NOK | https://autobuild.buildroot.org/results/6da439ffba459ce45ab44871499fff1feac207f1 |     


Classification of failures by reason for next
---------------------------------------------

glibc-2.42-51-gcbf39c26b258... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/d2efb523226c60ecaab468b0ba0e95c97fea13a3 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   dante-1.4.4 | 1 
                 libssh-0.11.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/81342a39f8501e7195760a0f9a412412e66ddc6e | ORPH
    i586     |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/7968cdc16f0baf34eb6de3605a1124dc4a159b67 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           ghostscript-10.06.0 | 1 
           host-go-src-1.23.12 | 1 
     linux-5.10.246-cip66-rt29 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/50f7a765b771c58b881c45d821ed777242ff5627 |     
   s390x     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/898542477ef9f1f6a985d34115c55d4d926879c4 |     
  mips64el   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/33436f4dde69a8b3d9a8e29bc00c40e00fbdcc94 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
