Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D5CC5474C
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 03:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA2BB844C2;
	Sat, 31 Aug 2024 03:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-8N0Q-Tip5n; Sat, 31 Aug 2024 03:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9D62844C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D62844C4;
	Sat, 31 Aug 2024 03:17:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB171BF425
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 03:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E956844C2
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 03:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUvZOkvpPgZL for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 03:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA802844D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA802844D5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA802844D5
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 03:17:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86cc0d10aaso273411166b.2
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 20:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725074253; x=1725679053;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+j7bXy2gDomyIdU+JK1MpJmhnL6/bxpitBg3OJx9ME=;
 b=YCrUnNz9U1KAsxJw5ZVJoOl8D3BO+HYowuaHu8EFQYCO3RshR/OXdSiSo0I1WjHlm8
 ZLRb7IK/PYflnGAfJoeY4ajZdYMOGyfqX6rz8h+oVxTndQ1cEvNZHh5WseG8eoBjqqM9
 q34Z6KwKIuEeus150hNsSaD96YbK66z2+QGQGLIAav6q40xX2IsTtsQa+6aeNpaxn7oj
 1K7hyDrksPCYUife9ED4FYVZ0hxGwlUKLzhvfuMLveoD7clPai7d1Pb6KJ1LEwNDiznl
 ADbp4iaaqO2Ei3fZFSv8gsIM0Y8a/N5ch66qZfiKGxDQAfqpAvWqZVDjjUsYISPPWueF
 jP/Q==
X-Gm-Message-State: AOJu0Yw3dFoSTg4nOHw+X/32FGXhq3zI+PQSh4/2QPTEFkmwYWupomgi
 uD6vGh9dZl4Tqy1xN3lSJBeovTzHkGRrVzIrW2UuAA6DUwJ23HTqAEZLBw==
X-Google-Smtp-Source: AGHT+IFOti4c4iDqQQd+NwH3zL8AoXTAi2swhp9DRkZ/+rh0ehqlYOKsL+seg7RgcLIjvHUbN2SfsA==
X-Received: by 2002:a17:907:94d5:b0:a77:c199:9d01 with SMTP id
 a640c23a62f3a-a897f84d5f7mr526782966b.22.1725074252921; 
 Fri, 30 Aug 2024 20:17:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196b89sm276982666b.114.2024.08.30.20.17.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 20:17:32 -0700 (PDT)
Message-ID: <66d28b4c.170a0220.168944.9c10@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 31 Aug 2024 03:17:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725074253; x=1725679053; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=g+j7bXy2gDomyIdU+JK1MpJmhnL6/bxpitBg3OJx9ME=;
 b=UDNaKU8rCjK8TgfocDIoZhNieY4mXYTvUCM2qjfjWjh2VQcxR4xGLyj97/4ofC92W2
 oJ1p4bMt6KegdfIfNgRzKtID+mcDrQtyfiLoUQYw8LhgDa3l/lq+pGA8bp7Xd2fL3eSL
 KlS94dXxmWzgPQvLqEbkXtNtjW3XmetUGnaDCWEDmn5eM0niWPPILK8HR54YVBoJGOVO
 1qaDQY9l1Vnn7YeZNyRwvaHdW7EhoUkBREzNEQfQTa/IZwb5bMS8JBeAdcivF+/YVFAD
 exKwxCDAnzWEfjzZLdmRJkjA+ZHw/NHt/1jQ3JfmLu8lgo5DQIWVwa8rsfi4uEEEwujK
 BlIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UDNaKU8r
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-08-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  4  |  0  | 13  |
  2024.05.x  |  7  | 16  |  0  | 23  |
    master   | 14  | 259 |  5  | 278 |
     next    |  3  | 13  |  0  | 16  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 23
                  babeld-1.9.2 | 20
                  linux-6.10.6 | 19
  gobject-introspection-1.76.1 | 16
aubio-152d6819b360c2e7b379e... | 15
               linux-pam-1.6.1 | 11
             armadillo-9.900.2 | 10
          cryptodev-linux-1.13 | 9 
glibc-2.39-74-g198632a05f6c... | 8 
                  ffmpeg-6.1.2 | 6 
android-tools-4.2.2+git2013... | 5 
                directfb-1.7.7 | 5 
                   duma-2.5.21 | 5 
         gobject-introspection | 5 
                  ntp-4.2.8p18 | 5 
                       unknown | 5 
                xenomai-3.0.10 | 5 
           at-spi2-core-2.50.0 | 4 
                    bsdiff-4.3 | 4 
                 gnuplot-6.0.1 | 4 
           host-doxygen-1.8.18 | 4 
          linux-5.10.162-cip24 | 4 
     linux-5.10.162-cip24-rt10 | 4 
           host-librsvg-2.50.9 | 3 
                  libsepol-3.6 | 3 
            linux-fusion-9.0.3 | 3 
                  cairo-1.18.0 | 2 
                      fbv-1.0b | 2 
                     file-5.45 | 2 
            gettext-gnu-0.22.4 | 2 
              host-rust-1.79.0 | 2 
               ipmitool-1_8_19 | 2 
               lighttpd-1.4.76 | 2 
                  linux-6.10.7 | 2 
               openblas-0.3.27 | 2 
                  acpid-2.0.34 | 1 
                 agentpp-4.6.1 | 1 
                apparmor-3.1.7 | 1 
                  assimp-5.3.1 | 1 
             batman-adv-2023.1 | 1 
                  bind-9.16.48 | 1 
  binutils-arc-2023.09-release | 1 
                    brltty-6.6 | 1 
              cache-calibrator | 1 
          cloudflared-2024.6.1 | 1 
             dahdi-linux-3.3.0 | 1 
                     frr-8.5.4 | 1 
                gerbera-1.12.1 | 1 
                harfbuzz-9.0.0 | 1 
             host-delve-1.22.1 | 1 
     host-moby-buildkit-0.11.6 | 1 
                   httping-2.5 | 1 
               iproute2-6.10.0 | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
               libgsasl-1.10.0 | 1 
                  libsvg-0.1.4 | 1 
                 libv4l-1.24.1 | 1 
                 libvpl-2.12.0 | 1 
             lirc-tools-0.10.2 | 1 
                   lsuio-0.2.0 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.9 | 1 
                    mpir-3.0.0 | 1 
             netsniff-ng-0.6.8 | 1 
                 openssh-9.8p1 | 1 
                   pcre2-10.43 | 1 
                 pixman-0.42.2 | 1 
           python-daemon-3.0.1 | 1 
         python-remi-2022.7.27 | 1 
                python3-3.12.5 | 1 
                 rp-pppoe-3.15 | 1 
                  tllist-1.1.0 | 1 
               valgrind-3.23.0 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/f8d6487ac5c951eb6a2ab7d03f4c054093956958 | ORPH
   s390x     |         agentpp-4.6.1          | NOK | http://autobuild.buildroot.org/results/eedf5993f3e02bf9b35da7efc1da44ec4d82b28f |     
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/e479b759966336e0ac1f26e6fa8567b39bc486ab |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/053e40e13bc1a9a66902ee079cb6f25ab86b5cf1 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/855956e319c95d73bd05a23b4110da6d2974a0a7 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/10446ce6207039ef1f3bffeaec2c512db7b3e02c |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/f1a1f5caf94cbd6edcd15f9a47856596fad0979a |     
    arc      |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.org/results/839012ff9b9f7a6fd2d8b6302830a645cdd49d9f |     
    m68k     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/50094d4c0e993fd92401e094439e1e627a548bbc |     
  riscv64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/9de3f8e5ac10794aa569abb3977c16e43c72273e |     
   armeb     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/5b8363d7b9256e86df6f06d26a7309f3c7593265 |     
  riscv64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/9830fdc9713ee0c510ee4108dc5de324cf6b1333 |     
 aarch64_be  |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/2fae938a426e276a5e955c19b99147d725f426ac |     
  riscv64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/382cba5cbb7894a31e9f9b7e05ab55d27010d664 |     
    m68k     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/9a5e111a8435d287009142b130cacd2f97552795 |     
   s390x     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/82aa3c3fa7d72dc841c6645f6d73c26ba65427b5 |     
   armeb     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/7ef363201587ce180bac744e7be344dd3e68d358 |     
  riscv64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/b53617ca6ede7042e8274ac187015976437323ff |     
   nios2     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/2cf7d71eaebb4f3d7cb5663f1d326b78ecd5fb12 | ORPH
   arceb     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/4b2a3bf24bd4c08a8b0ef33145727ef52e861b84 |     
   mips64    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/1bbb5b807fbbd62228044b27da90158d1cf778ad |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/087379ed830f388e50ec9612abdb888d784e3004 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/eb1b7d69d51f5d32a329afe92e1993f911de84b2 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/2a6d0bc5e5d902dfe98b3a3d26bcc3f7740442c9 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/d938981e83821effc756ecf937894f245d313d11 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/09658819e2252a2d772d1d52f8ce30cce917e357 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/fd79f80e9b6f4b4ef0f98093a8791cedc837768e |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/f8007242ee1bcb67753059271287fb93283e1bf0 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/c3dffe1413d8cf9ef275aec3a4ee5d18d47e2cbd |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/56d05ad5a4ffc9abb3318fdbd4410a1c0e3e3f79 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/bc942d349fa86214f6b3458ff20ce8e73a3de79d |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0c5cb08052d9d6ac975b58eec6211b070d11aff8 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b2f19329273d6e26891c313b813c5d762465a11e |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b7e1d59fb2d9892a0ef31fad983418aee546ff89 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/44862a585fe7c37c64b80f52487fface78fa543c |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/f4adcb47cc76fe9e1db394c4ad3e50d858c835d2 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/e1591d70516c46a57d351295947e984c6660c67c |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/27580bd41bdf1496b7364bf4e6e26a8dc9c4e2b5 |     
  riscv64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/44de5ca67f0bb3d16bc1f31cfa4e45ba5150442d | ORPH
 microblaze  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/64ec1129598628f0f5b76867fe2c3b39bb64c99e | ORPH
   nios2     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/abf0fed33e6d0bd143d27d0c112d2a3886d29c0e | ORPH
    or1k     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/50430efca1c7ce9405b27aa81640bffd0bc397f9 | ORPH
   nios2     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/885cd93a96ebd718639175d4ed2424b58e76ca79 | ORPH
powerpc64le  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/747cca2bfedd48308e0bfd8e9e51043d83d7ef15 | ORPH
   sparc     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/eb85d6d1a8da6780ce822889cc554f66e9e836e1 | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/ebec74bc898d478383c1902610ea3df84cd612c2 | ORPH
    sh4a     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/51ce6b29784de58187251f43583be594bf0fb0a9 | ORPH
  riscv64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/a619013c4e0d9aa47abcb1be71c3a4d467a66eb6 | ORPH
  powerpc    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/f4234050082a695393f3645f45c8b4f0192f469e | ORPH
   mipsel    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/1915d07886f03c079fb4554c248a3bd75010d6e9 | ORPH
 microblaze  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/6afd0e4751452a53c615e3eb9439d7b2d836352c | ORPH
    mips     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/072ec05bfd040ffe87c65e0ae4fa417aa12f29a2 | ORPH
 microblaze  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/31b1a35af93fde65fd46fead4e46399dc5a094fd | ORPH
   armeb     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/c03b63528151b1ec223fa58ca2271116fbd95812 | ORPH
  riscv32    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/ea205acdafc5c6dc17a9594d9d4bb064e0698c0b | ORPH
  mips64el   |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/d1eb451f6ced8eca0f83261d93f817cfbc631130 | ORPH
  mips64el   |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/00e38d90c67ca2a3517a9bd8359d1137ff43c4cf | ORPH
    i686     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/f65bd15d85334d1bf24f69848d54b01e5ff70690 | ORPH
   mips64    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/6b737fe5902591d19592eaf9d649a944d5e52a3b |     
   armeb     |          bind-9.16.48          | NOK | http://autobuild.buildroot.org/results/6f3b548bdff9f7049608d04a4c39c97ae81aec8c | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/ec50538c38e2fe599f9865319fc30f2376a345c7 |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/4a267883b127471a77432dd11036d1b247a65782 |     
   nios2     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/f5bf80373e172503943a79a0f293d42ae9c39727 | ORPH
microblazeel |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/6c6fa874956be98a4dce01a77db0d767f3cbd1b4 | ORPH
powerpc64le  |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/c68d725bf8190e990f70f7603ceb7ac568b2b7e9 | ORPH
   armeb     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/594ffab8e3a3bcf320f223040d20016d29432f12 | ORPH
   mips64    |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/2a4162f00fbf16cf82975dc44898888e1de10ae0 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/7d98a7bca8026ae8d0a2d0e803ab91e871099c7e |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/b406b0646bd66f72d7dc549a2623c946936d4b4e |     
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/736fa3501b1a8f01a8bea8610466f00d6ba6f0df |     
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/6874f62f0731994791674de535e1234782d7f58a | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/a7d60ff0d8fed942e47100fba09c84d264f8cb41 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/2826709037c5be1dfaec4b2b8eac79095ba8b8b3 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/28d542010c86c903d1c06e2f37b97e2d854a11a5 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/31fe32972344a0ec4cdc55bd29cac6598529cb25 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/e6038ff79eec56a32d8552d4b6157d37910938ea | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/26fba28f9f3d666f557fc0b3aeaec9581f4f3069 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/5959c2b5cc8ffc06b96d5382e2b499fc9414beeb | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/25fde5b54b9161726433501d1ce1afe7489912c1 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/75f14d4b23d5a6972a21da90a1a67dfc5792a9d7 |     
   arceb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/c80046fcbcb06170ae5074afe5fff264ba7796b9 | ORPH
    i686     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/76c3bff78e9437d99f4a5561bf846bab58788321 | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/985e79d2c66443e15e07f6cc700851121c1b1ac5 | ORPH
   armeb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/4e2cb2fddeb57e282c228a35083b46c8275e64a7 | ORPH
microblazeel |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/00c7820374a459c384c67abbebfc71a133f6f979 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/c44d5a73c26065ca0849ca83f79539d275d1852e | ORPH
    arm      |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/e77a3a48ed383882b24b090b515b6a51a8e5adb6 | ORPH
    mips     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/4f43238b347dba250bb4056c302d6dc01f74093f | ORPH
 powerpc64   |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/309c48a01763757a2c4b717c9d29b080781e2e12 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/f6b6604294bb7e50e5477d8fd6f6d88121cee871 | ORPH
  riscv64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/7fb960a0cf9d61284ee052b1438f56d859b58e33 | ORPH
    arm      |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/b85ecd6a11109ffc48a43c4373fdce98999f5315 | ORPH
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/dbd8269e7281289befac3c016e96c979e6ec50f4 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/dc399e8161e58fae094c6839591322b32c84d423 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/aee2bc6e0244b8c88d760c0dd467fcc622747da6 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/97f1f71f6ff34c1d845a321093fd64b603c99f6e |     
  mips64el   |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/0f40e1521ee2b1be0ce951e9383846eedad17e9f |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/aaf2e0c29f9be60882537e014e5c5db3c45ef1d0 |     
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/acee8ebaac29aeb022936aabc4da2c51f40adca2 | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/ece8f03587c9cf6b2c775726cd632acf12902e8b | ORPH
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.org/results/f838999f71e262b2a5fee4d08c0b617c1b1433ee |     
 microblaze  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/8e02f5500e241840c39d68ab5a206bc5d5cd9b91 |     
  mips64el   |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/4ba094c371fc53558f6fbc0ab6659d74cd1f22f4 | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/98f43bbd6e2d6ae4c0ea56249010699d33533109 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/28fa3916fef591e6984c499d910257113b9e9cc6 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/cf4ae9a49ba83932fe18302a20a6f729a0b08465 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/aa6efe88bffd4948c0ae27246266fc287b29036f |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/a667ad798c7c68cfccc85e162c765029775bbc7c |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/49a21c0f1bb5665e275b9a58b41e7b0546f5b103 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/150a953ee9c506f92e0a4087225987c539c136fe |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/08ddc9de9216feb778ef5419fa65a1a12ff6f9a2 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/81841a1b54b507d8c2ed0c04618bf53d5cb74098 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/3299583335bde80df4eb3bd890280e22b71c1f69 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/3eb53defe22c31cc3c8582157cd9a7ae92789213 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/2765994a9f53f60053a38268cbb27134dd70cc02 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/bac488ce9a68c6042cd6ffcafd9210225fd34777 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/cd5941659d15af8f4531b55434fcb4260847389b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/0d93a8eafe744ca452e05374900722bf38be1fb3 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/b30b0c83957457b39668a78b9c6961a60236abc5 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/81267600bc1ef454df84504bea898f6f4948578b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/33a832503e220308ff341425e63673914bcb4768 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/db7172073fb00662088a228f6893822d452b636f | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/391f798eaa635f188dd75135ea0b71e96bf4eff2 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2f3665451ad4409a31bc703abb5c058c4d43b94f | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2874161ab7db9075e6e7a36d3593f68fadd97e60 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/c94b47c8b132c0c52d6ee797c43d105d21b344ef | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b9ef0e47b2fd26a257356fa4b863151f5b906c75 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/e4a1a0a364c3ef4fad3d4fcfa6ebd3558f3f510b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/362a2223f357ebfc4569a1b0c94f219794f3566e | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b8ee6944a4d02fb29d4da9107f8084ee7ed92bdb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/df2cacba53dc8102eb8e9f483362b20bba1078eb | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ce6113b465bc74202734c30898c1f84358bcca27 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d1694dab0d83ccad7eaf877337a4f21426001376 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/a29eceaf0b19e6fd944b65771665734073ff6651 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7147bc898883eb5d41531ab3fe1fe0e1930b014a | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/435039752c47c87ba8275736e7bb64ad7f651de7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/aa16cec38b9e3ccf067a38b7a6a64ace1c199d65 | ORPH
   mips64    |         harfbuzz-9.0.0         | NOK | http://autobuild.buildroot.org/results/90ab954e371b2404dfea678abb5c8bc04ee4a052 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/a0002ec28b1a0cc707b45ff96283d5b288a609df |     
  riscv32    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/b60646507957ff04ec81533371b22fd7659513bb | ORPH
    mips     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/d8b2437a8b3814307ffd30617eac0e3ba4b6a15a | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/29c082aed50ecc90fa6674fc596148da1dadf8ef | ORPH
   x86_64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/950e3f5699551a0d7c93c4193ecc250ffc871261 | ORPH
   nios2     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/9f47094ed0e6470c32db865518b63f4e97a40d46 |     
 microblaze  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/3b0ad4598ca2cb7edef26a4142640be3756a5fa7 |     
 aarch64_be  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/410e1a658741c0d69ca64647159e926e85029832 |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/f4bb7db87a7c1b67aea79c5529704252d7a6fed7 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/135ebbc6888ed66afa73f04f750e9dc0986e2568 |     
    i686     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/a6f51420cf521d85dc68f20268c7b1b7cb40b68e |     
  riscv64    |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/b2cf70f7ff51bf1f5fe1fa34eef67adb0a96e072 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/6ee8b81e408f47cf88dbd17d47f004ed9d1b944d |     
   sh4eb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/1a00db311fbe391b505f5c8ee05c3ebc0320da72 |     
   arceb     |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.org/results/4a0ac7e08b77455be005d2ed416a5f0317fcf868 |     
  sparc64    |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/a0b52343ee3ca1be77ad8d061b7c2a338144ebeb | ORPH
 aarch64_be  |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/24d251bca309216dfeea97151c82b835122bcfd8 | ORPH
   x86_64    |        libgsasl-1.10.0         | NOK | http://autobuild.buildroot.org/results/6619c7dd90b634a44f284152c27d68ba41788bcd | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/8e16da08a71ea405016d6066399087e4c491f032 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/daeb89bfc2d45f65b857b59f7f3c44c15f737914 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/abf5e3c2f0124eba1a0ab6e969abb5c6cbe6cade |     
   arceb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/b26dbdbc49b61184127f99d5ad66eb7f885f33f9 |     
    arc      |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/e60366568f5822fa2ff0784be58d6621fcb55bda |     
  mips64el   |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/e1b8ed544ad13f5c15e36ec982d836277d7e6a5f |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/9c24a6ca4908c94239e1fff675d342f9d13e16c2 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/91f1a38a008b8d824ddc98e781b43801944382f7 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/e705f5a771ac570e161704c64c36f940796286b5 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/bd0e0334ba4c6b1e05347e1c9cfa4f04ed2dc687 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/926e4c0ed8d7774311ea0d8e71062889797368ec | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/15773573db34e66775abeab6083bd1d7fa1b51e0 | ORPH
  riscv64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/fa0f5f70c8d07ec550cb833e8ac765c6cad8c551 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/68ec8b6604192e631a75b76ed4ece3013a8d5f95 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/b7bcd5e97dece9b482da21b631c10f1eaa7613a3 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/ff57ae8ac0d6f85294fac0363801ee3b50431852 | ORPH
 powerpc64   |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/976c10c3f77ffe61bf1769e223314bab5d2978c7 | ORPH
   mipsel    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/358c414c8afaf0212f6f14bc2d12b66d0555c191 | ORPH
    i686     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/74c553186b8533f84cc83249f14d5f12a04f04a6 | ORPH
   sparc     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/665abf32c889d5a1a1d3474b32a9819cbc13edd3 | ORPH
  mips64el   |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/d8e68cd9d07b475b8111221934c69e9b2e887c90 | ORPH
   sparc     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/e26f278bc698347b263869d7375727e985bbc0c7 | ORPH
    sh4a     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/3dd6e28a10d6dad91600c094f02c79e410edd931 | ORPH
  mips64el   |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/4e01a5efc18c8cce5d8c82f8565ce2f8c22ef76b | ORPH
   sparc     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/c5b1f1a6144e2a1e31cc6abcd41b733d1e99c4f7 | ORPH
  powerpc    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/1431f92bac0e570ebff9f8c34057c3d34aebba72 | ORPH
    i686     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/0f7db6861f244cfd51ef1ceeff386d2704504ebe | ORPH
  powerpc    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/c8dd0e93c29864b05959418709fb1ef3367cc889 | ORPH
    m68k     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/bb8d0ce5e91386ef3b3b400655861cc2f65974a3 | ORPH
   sh4aeb    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/cc72e85f25641760d9359f38e98fc39f14033517 | ORPH
   sh4aeb    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/209eecf19666c78bc956db91e357e377721417d1 | ORPH
   mips64    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/01642c54c93066d1f232d80d1162e338bdb6119c | ORPH
    sh4      |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/b2819dc50e8710295ef6b1a70471352cc663129e | ORPH
   sparc     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/bfabcc415294dfff14825bae7960db69eddf7719 | ORPH
   mips64    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/6260ff985228c33fcab9ba1f6cc9e9ef437d6dc1 | ORPH
   x86_64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/1e5d3ba0ab6bd0e36776adf5cd8270c9f1c43141 | ORPH
    m68k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/c2807cb6a62f2422b6e3b024df948a138c31900d | ORPH
  riscv64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/97b306b109caf0e3679af4b8d1b570b78ca93272 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/8117d59fd0ae229c33c871ad6b3eeea3e0c70416 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/b4aef35c9a849ffd1b086f64d8f17ed3e03a4b35 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/2742a467173b8fc500f781f050975f3e1971e500 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/5b39be786c12c6cffeb485549de5050013f5f24d | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/e138056e1cb9b786d27cebd33d6da0676ad23d57 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/4bd9f0dd58e2165b644fdab00203951cab7edecd | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/0442c5777569ff2ea056c88ab9d2827c8d9f1744 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/f89e04f934184f8a8259e7ff68e714462b6431bb | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/0a75a35997189f2ba4bb70a509f8bf673536ed9c | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/7a387a622e3781ced7f63f13fc8c35f113c1709d | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/b6ccd0f111b684419eeb1546612e87092c6d8653 | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/64a0d27466941906cacfabb5cfd0c9a05c535d54 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/1de912a0f9d2ef35d53f87eb9db1c49bcc370a02 | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.org/results/6ae7cd8d4647444298ab21e7e86bc6a9c1112cb3 | ORPH
 microblaze  |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/520cab33a45cdad3713ebaf4da9cb999d41b4e22 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/60e5e1e7d017c18d1948b5519a18199e552b7ab0 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/c9b21b2f1547324410d43f966e8f7e5d4dc54228 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/ad81bf92ab2c5992de637f1a0e1e7eb74ccbd12b |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/6adcadba00381741821809a72fddcd61e3fe9601 |     
    arm      |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.org/results/5c239b3438c0ec314d92e7298f47d8592bfd2f20 |     
microblazeel |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/b672b2fa85eb682a9889fb679d36d77ba2296e5f |     
  mips64el   |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/0b78602f6c800e0de762208df3064a8a261a350f |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/d260071e257d41358c5c64461af5e93e0129aeac |     
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/39bd357b46ce1b3727125bb20b0932a02444fba1 |     
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/230354733b7b686f4959ef50a8fa777b2c8dfad3 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/b8d6fb35207457143d8375899dc8f1d8227ade6d |     
  riscv64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/fa7ae5a84716112ecaf3ea15d9b711eada7a2e32 |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/3f70beb51a6a370d80d1a99cd0d46615be896bf7 | ORPH
  mips64el   |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/f9a108a9ef620b8678784fae18e1c5582f4e9dbd | ORPH
   nios2     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/5083da70b9ac3baa9a9208b3b7552f5e3447eb96 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a9c13e54b9147b87a8258ce22c9c0d83c7eaec30 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/92743cf4116fbcc1fdf45bb11c9a3e07e1622438 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/fcb203936e26ec90b2fc7896dd6d25d7466f99c5 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/3e0ddfc15fc082ced0f6fad59a4ca1459a5f8b0f | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/457e87b00e5e5f36ac73f980efeb539a42f3cf4f | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/859b0541ce29554f5ffaaa57153e4b3a10c2af12 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/76e7ca2322b770a5dbe3db98548f32d140968a84 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/20804ae1a493906cabfcac6ef4c99526ccc7854f | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4d4d27b0976e6ec7e7e3cca10cc208945f112421 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/75167947af3eeeb221c9141870184a73fe2dd36c | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b4509320719c1148258546063e2d84fc9b55b0ec | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c80e0ef376bc1c4a5dc740497d65c99fe090137c | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9fe7ad9a498122d5afc34172060f15682574e8e0 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7577555389bc0dea0f323bc694fef61a60d63c11 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/fdc7cdd6ac7aa2655dd46dcaad3e6c30e93c5d9c | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9bd24228595f26b3ec9796e50931975b1cab3a8f | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0ccaf10d011d90f683faa6881f7e441c6a2e1558 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c92f1241956496c1c34ad0db5dd351818aed00ef | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a57791bfd5a466c928f1376a21a0c28b22e01158 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f71acb822a626d42a13e4960f58ec5b2d08f712a | ORPH
    i586     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/d2b0e275ed92fea483fcccbbd84e850f790c8e11 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/aa395552d6b3cf63ca1053b1b2ce67334ef3e429 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/d829139a553c37ff90e5078c5d3b4bc964cdb272 | ORPH
    or1k     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/d8c2cadc0aa23a9088a36ea4d04b570e22acb6a9 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/e0b142d24af4f72849f6263b0e1cdafa51f3b6df |     
   arceb     |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/101cb6805da2b28faf1d64f67b4ad30b9069f529 |     
 aarch64_be  |         rp-pppoe-3.15          | NOK | http://autobuild.buildroot.org/results/45d8fa75389b542bcea4bac2fc2415804f1a48a2 | ORPH
   s390x     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/25b49aa8f9218f706433dcf245bb6da85d7c62be |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.org/results/d3161cc3c2ffac44d9d53fc2e4b99a1b7a7b7624 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.org/results/fb73b43e1f38bc992ee8315d094a839abe3d17c0 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.org/results/2208f33ce043f2e38a6c6ac5e0601e096a565bf0 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/cc314ab07943ee1c523568c02e063f899e192d7f |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.org/results/672139a4a322d5af88818329ad4947e04b3985d5 |     
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/f63ca07f9c19e1fbaca8c49ad02b0579b0b04e8b | ORPH
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/2e34ab72d896d03ac8690682abab595c6ab9986f |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/9554a069f98f434ff3a770580cb37a97c4f88a16 |     
  riscv64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/5b0a31d4c42b6c5c8d8fde15184717401e71fb5b |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/b21026eea27c5dafea7cf36cad0c9715d51e124b |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/e9d55c59142e7b13412c12176f0db5caf347d255 |     
   sparc     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.org/results/21e2b36b77ffbb7637cb08d3ca9016d2ca643051 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            gdk-pixbuf-2.42.10 | 2 
        host-python-lxml-5.1.0 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/41d1fa3052c60dc704e4e3ff436ef8109c04cd9d | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/c55a0b8bdae8ba061a86960e495b6331fc54b1fa | ORPH
  riscv64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.org/results/67755e63f17809b6650be2f7cedd933ddba1245b |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.org/results/0d1b48b81f48fe714d840647cf6030337805ea2d |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
                  libffi-3.4.6 | 2 
                  bcusdk-0.0.5 | 1 
                   bird-2.0.12 | 1 
                elfutils-0.189 | 1 
               libcodec2-1.2.0 | 1 
                libressl-3.8.4 | 1 
                  linux-6.8.12 | 1 
                   linux-tools | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
               pipewire-0.3.81 | 1 
                rocksdb-6.20.3 | 1 
                 shadow-4.14.5 | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/1cbcb1c35637deaa9503ef99d34561baa608569b |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.org/results/f8ea514108990fecb5be21c808c7cabbb0cdcf71 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/b7615d57b5b9525d5c380903f8e26f21241e97f0 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/5eed71b58121cf03b7e9bbb9f26cb52f35da47b7 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/65119356d98f78298e6e9ff46dc95953fae063ab | ORPH
    arc      |        libcodec2-1.2.0         | NOK | http://autobuild.buildroot.org/results/2f1346790b43ddeff419c8acf79ca2615173dbb0 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.org/results/7cc36a2246eb6d9165371fd61c04eecd7c99c8bb |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.org/results/04d8851a6218ec4368d2ab85ed1847fa4fbb1dbd |     
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.org/results/78a7db491b056c478a634c233f76d7c240025b7d | ORPH
  riscv64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/1e183ccd2485e06a667cf4d6d67e201a78224e91 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.org/results/aca3863ad90cb2a378efb3cb0f51f8d8c762d0aa | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/133b87751435a422b030b2aadfbc43222e9a19f1 | ORPH
    mips     |        pipewire-0.3.81         | NOK | http://autobuild.buildroot.org/results/0c0521d4a34a33b7f294db57bbc4d377d66dfb33 |     
   x86_64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.org/results/194be09a23eb099b040b42681b4999ffe941e3fa |     
 powerpc64   |         shadow-4.14.5          | NOK | http://autobuild.buildroot.org/results/419f2b3f25e2f32c2abe1fc40a35a48ae752101d |     
    m68k     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.org/results/717db52300179775275709b35c60046d26cf5bbf | ORPH


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 1 
             bluez5_utils-5.77 | 1 
          cloudflared-2024.6.1 | 1 
                    fcft-3.1.8 | 1 
fs/cpio/cpio.mk:130: /home/... | 1 
host-go-bootstrap-stage3-1.... | 1 
              host-rust-1.80.1 | 1 
             libblockdev-3.1.1 | 1 
                 libssh-0.11.0 | 1 
                    mpv-0.35.1 | 1 
                    norm-1.5.8 | 1 
    python-cryptography-39.0.2 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/788fbfe160dd77a8990f2ad2d9c108838516c83a |     
    arm      |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/5edec47b61a6317afd5651bd94986681d4b2f5e8 |     
  riscv64    |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/f5224014c96818ba32404053306a7232f551d7d2 |     
  aarch64    |           fcft-3.1.8           | NOK | http://autobuild.buildroot.org/results/54ec8fc5d044a091a123995ab890980d60207ff8 |     
    mips     | fs/cpio/cpio.mk:130: /home/... | NOK | http://autobuild.buildroot.org/results/7909a7ef60ff2d01144a5f28bc48c09dacb86aeb |     
    sh4a     | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.org/results/a4622efda5ae53b46bd8bc70ae04c4eff6a699d4 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/8d2f9f2d455aabe0981aa85105527ef20294c585 |     
   nios2     |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.org/results/f6e8591d9a00734771468574b6b4b9d69db0df90 |     
   mipsel    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/3213e533ed3f39921f82c944ab91504bb8c4eadb | ORPH
  mips64el   |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/6c54fb61638f0410b7eb8e99df8aea7b760a0766 |     
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/1109e0c79ea27fc597bb64cc04e01c0a48ccedd8 | ORPH
  mips64el   |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.org/results/f3126dbf5e9f8e512e26f5294c87e59ae8fa34a1 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/84cb65e3956c966d324d685031c51cddb582c0ab |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
