Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F683C021A7
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 04:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D1E80EEA;
	Thu, 13 Feb 2025 04:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHlrSahYkfHY; Thu, 13 Feb 2025 04:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 203F280FA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 203F280FA0;
	Thu, 13 Feb 2025 04:15:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 285FCC2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10D7F6116B
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5dwlhwBMk1m for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 04:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3E5561168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E5561168
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3E5561168
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:15:11 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so77239966b.1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 20:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739420110; x=1740024910;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mtug9l2nMPDkLp1HfFznVoRQcAwO/8S3B7s7IUKVguc=;
 b=neOxXH8dXURphO2RUEh31gn2pPCEOO/gGHKGhQqSRQFUoqnhB2zep5noJrF/p6x04o
 7znVPKtFOlmncDzX6jZ2EJnBIm3wvhQ/qJ3QjO6EOMp7B5K5ARbSImDOUM9Hr3VGsId4
 UTYull7QyPcU0vSpxw3+ia73t+UHkNMbVrALuOXjc1w5tqyI4MI50RMCwWXwX/v1bSEE
 FSSqmsHxoouZsAGliWXZd5rA7VVp/9+Ows/BBggRC3K3LKvZE6cHcYAxw3JH0onjMDpk
 d5YtrlpgD32x9duWTCWteYuJDCEgIGMIaY2gKj3c2BscXRL6PtpNWIK7IaRvSfnO77s/
 QMqQ==
X-Gm-Message-State: AOJu0Yyr/bEwxTZLgn7McIfgljnjs2+t9J21M/n9hhUNGFBYamtVD6Ye
 CDwZsGFR3GdoLu1qyZt82f90l5iG3gYYi0H5Ev4IgTZkAauYptPqY2crsg==
X-Gm-Gg: ASbGncvs9WQyCPA4UfC6usoSdOr9Vy24RiVO1gH6NjX2NiqrMC3VDj4WMCYq5dO9UmX
 5ofsA50Twxr7OypF3556f1ptRf9qKEzHKCoktXWgoS5ObfOaImK6BorLTPU0wtVcOLVYvhSukDs
 8M/IdbFFC2I00Z2z81/cZSQ184uF0DdENZfNUuW0S6n6XmmTvh4eVwBwVTYjk3xIR3y6uiBtEIS
 c0va2aU7pRpo0cLfzOkIpwf1lxzgFJchejwYI6gIp3h6r50XTn6z1p9w8ZLi9AZu3Dew6fB6dXz
 J/uYUZ5dwpjP2Exsd9M=
X-Google-Smtp-Source: AGHT+IEiCxihI9v+2z3lmpuur/GR2H5dSk9xK16zSzffKREQ7wnBL9OKzB9HoLDfp1a+qjLoc+sSKA==
X-Received: by 2002:a17:907:805:b0:ab7:bb93:56ef with SMTP id
 a640c23a62f3a-ab7f3381dc3mr502712066b.19.1739420108823; 
 Wed, 12 Feb 2025 20:15:08 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2709ffsm434134a12.60.2025.02.12.20.15.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 20:15:08 -0800 (PST)
Message-ID: <67ad71cc.050a0220.f46b8.0d34@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 13 Feb 2025 04:15:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739420110; x=1740024910; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mtug9l2nMPDkLp1HfFznVoRQcAwO/8S3B7s7IUKVguc=;
 b=NYusrsw9Woc9dyBcKZ1AcJrQZE9dm9pMBfx2LlEEPkB9JZCDy6R8WiunKgL6MM2G5w
 jAXFWvXCL7u4/J87edKZgdqyAcuGMrnsja/JRCiTnEHUFRG8snsjsqPYK8gGIWi3+LmW
 nyStgbZHlo33MvfmwXofEucNwJvqWUzer1AgjFh8M+rBMMbbCvT1C3gl/tjJ3QmSyrpk
 DQfNQmt5To3nVAi6ojv22WCOR0enxjh3wx1N4E7kJrnxVnw18DMEyPaesPCR9pNCS0eS
 3qorqv5PtC59xhm/CzrbB84ovmBXTgBLaOX2CUP5lEc+1/HlErkntRMUZZPlRuTTaejj
 R5Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NYusrsw9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-12
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

Autobuild statistics for 2025-02-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  5  |  0  | 12  |
  2024.11.x  |  6  |  3  |  0  |  9  |
    master   | 14  | 404 |  0  | 418 |

Classification of failures by reason for master
-----------------------------------------------

                 sqlite-3.49.0 | 311
                       unknown | 10
                   perl-5.40.1 | 7 
           at-spi2-core-2.50.0 | 6 
                  ntp-4.2.8p18 | 6 
             fontconfig-2.16.0 | 5 
             util-linux-2.40.2 | 5 
                 c-ares-1.34.2 | 4 
             bmap-writer-1.0.2 | 3 
glibc-2.41-5-gcb7f206537240... | 3 
                 linux-6.12.12 | 3 
                    azmq-1.0.3 | 2 
                   bird-2.15.1 | 2 
              gcc-final-13.3.0 | 2 
    host-mender-artifact-4.0.0 | 2 
            host-sqlite-3.49.0 | 2 
                  libsepol-3.7 | 2 
               procps-ng-4.0.5 | 2 
        util-linux-libs-2.40.2 | 2 
               acpica-20241212 | 1 
                 agentpp-4.6.1 | 1 
                   duma-2.5.21 | 1 
                  ffmpeg-6.1.2 | 1 
firmware-utils-86739f2b3ae9... | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
           host-cryptopp-8.9.0 | 1 
                 host-gdb-16.1 | 1 
                   iperf3-3.18 | 1 
                jemalloc-5.3.0 | 1 
                 libcdio-2.2.0 | 1 
             libgphoto2-2.5.27 | 1 
                 libjcat-0.2.1 | 1 
                liboauth-1.0.3 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              mosquitto-2.0.20 | 1 
                 openssh-9.9p1 | 1 
                   pcre2-10.44 | 1 
                ramspeed-2.6.0 | 1 
                 rtptools-1.22 | 1 
                sysklogd-2.7.0 | 1 
                 uclibc-1.0.51 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/f6e9134841f9cccef9fe5ab0972a07060f533136 | ORPH
    or1k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/a23cd0580ffd9c57716656cd7eb496f50eb44ce5 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d58bb6e8f85c5e7e666309a1a1206a28a5c66cf0 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/cc8837c00c5bb8e7121dca5917ff7502a097dde5 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/57f684a087b0b3e12738851c6aea68d092314934 |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/7a56b1374a931d63f306df2d4511da1b89b6daa4 |     
    i686     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3d60c7d1162997e40be714dbf0746e153b93b8af |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5ab7a0e3517b6e604d2bdbd38230fb35daabaad7 |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/dad596125e31c96677fc3bfff0a38b51d0091259 |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/0d99209ce51a3984dda30497027dc3c090a9059d |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/eb9e3f79eedb7204267253ecbddcea114b2ae811 |     
   arceb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/660a4d39a8cd79816a3059806bcfedcbb8aa4633 |     
   xtensa    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/ab0493365b1c155667565fc40b56fd37c95ccf14 |     
  powerpc    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/d8d0e0914eeefdb1a838a3de2b7d241c02f4fa3f |     
    mips     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/b6d69965fba29d94455fc0bbe42d413eacb76d31 |     
  riscv64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/dbffcaac65ebdc1baffd449a91f86ce6605b8fab | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/8e496e2e0029961ee8dea6dd687ea2c6fa4f45f5 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/22237b398bc1727ab4469acdc629407fb4db1b7c | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/86bbb0c998d706478af1a03f4e7f09c49c123771 | ORPH
    m68k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/ff8674247f14f92aee9412c0ffd2606606807f6b | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b1aa5f4c00c6069027beb7c240303f64ed548c06 |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/9a03ba4a8cbb8da91990207766d09085484a0caa |     
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/00393cf0b2c680a7f454826e08bf758750880831 | ORPH
  riscv64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/5e58230931259b6e634d1be213d8e1b836ede16a | ORPH
  riscv64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/b2a4e5b4b63544819e208fddc81a47192f1de0b1 | ORPH
  powerpc    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/b8b6b912054918eee7630d1e825c3188dcc52125 | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/f626097ddba947c0a47ae6b3970032c960df8537 | ORPH
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/b19f5a3d7a6ab0f12c24a32c6bac5ffc6c8d4b0d |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/8631b6c696274730d697a6d2bd7e6603d2581b58 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d6abb0668836a90c3eb3aa5a3b31c7d5b5929c2d | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/fca168a36e9b4645e5e49da8dd4ea92932605a0c | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/0663b915770ad33d9a5a54106a3042bf97bfe3de |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/c4f888dba4578bb8d27a3281a40364baae901c53 |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/61a95eefe8eb515e5184017db7c7bb0bef06bb22 |     
   armeb     |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/f748a61a133b95305f1864962467a44c0e6d5998 |     
   x86_64    |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/49c942ab0598127801d642a603f316507de64c1c | ORPH
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/3b88f5c108c38ed75d9b2c8e8dedd8c39d5ab7d8 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/9162bc863d917082f62e68fa506fb4a2e7f78a77 |     
  aarch64    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/834faa119b0b48a61e8ead2424b2afc640894fc6 |     
    arc      |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/817d1948d363f6131cc678e648de4d37f0a4fff0 |     
  powerpc    |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/445c6945519f9e7d438c82451810c5202165dde3 | ORPH
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/fa34b84759219071e14e45223afad2c0211d07a7 |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/b1c569f1f9379180cfa7e5a1a593cbf76da570e1 |     
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/47a41066794bb1beecaa1acbb769a9d7075b5630 | ORPH
powerpc64le  |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/937bccfac04b1c76f3a9e528c332fab2c68014fa |     
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/d3c300f081605ef77b0a5e19e9213f75538006e4 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/57cddbd1931cc26aedc3ac8b38b684f4febaf05e |     
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/faf21cb2f01c7d41ef08bdbb31623db8e90be544 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a92cb7b26ada47647cf22abfa3d380c724860749 |     
  riscv64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ade40f9e3cf86622e73966035913c9841b7c73e5 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8ac0e6b1c4b2be8f9606c8d277c6b50e21e25000 | ORPH
    m68k     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/bee6ef5703b23cfe6a05bf0f3737c3bcb186d4be | ORPH
    m68k     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/853ae53940d8107b22f66d072fce28c18eb733a5 | ORPH
  powerpc    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/a5c89290828d422cf4e4ad85eebd45b3b7eec282 | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/97af5930b7b16b64d77d776de35c1d09a81e2315 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/99e4ab2197053ee0daf6b3f97b188fa723b18781 |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e008f02066e7c384c268540f75b71c33ca3341c5 |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/13d1d2be6122f80e58f102cd7bae8af3db5d06bb |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c8a623c7ba16a6f27dad07575416a70b5a817f47 |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e70df0e9110fce46c706196f70752c55fe566bd1 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b217db5964568f2258778b1cefbcc9f762f50cb5 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/7259f4f4d0b053b56c9ed7938520717b9f0942bd | ORPH
  mips64el   |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/40d525ce691e87f423e0ee2de8c7072e71b62675 | ORPH
    mips     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/7a6bd94260f088759ef536431d60f0cc442feb1b |     
  powerpc    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/2a40f2a25bf58e887a781101cf603f3b55c2b1d8 |     
  riscv32    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/4ff6c03246a60b89742d997ec709309b6281b8bb |     
   x86_64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/b25fcbdabcc4a6847476ec7f5b583512d04952f6 |     
  mips64el   |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/7cd44b516bab05e6290cf9874398da137f49e14f |     
    mips     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/a24069651b19c1bd0403cff5a3ab39f1e6f7f090 |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/6a94ac95b60040f527a35cb7bc5784516f798859 |     
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/1387bf5b368070d677e907aa3cfa0030b5418df1 | ORPH
   x86_64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/d41b616b44b85aae162f0acf91409749ec01aaa0 | ORPH
    mips     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/50dae65a18340ad95e8e17e51dc42e3ca6c15e52 | ORPH
   mipsel    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/22f4fb54d888c7076d63c13fd476bc25c3b008ca | ORPH
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6959913138367c8bd8e4fa3f72a8f642b6961d0e |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a95cce1747ca4aa7d669b46a26f11b3320db5317 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/64099694cd7d4991661913265da575c8c10fb19a |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/74ec442b4e244119869c2eb3a10db0fdb81ce8a0 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/961ebd02937489169aa693158a9a709780190b50 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/55801c7fe03b4428f1510149d9ea410e607bdd6f |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/94713afcf18e5cc807459fe986eab2348262d50e |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2f4db606353a44d8fbb319afedfceabc214701d2 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2ac94c2d2d499d226bfb3acf31341a4938d305be |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e5d4a10ac7717dc2d02f7320392430f891b53dbf |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c133e35fc57e69c1df16542671be88ec95f168a0 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/74268ef1cf0ccf8ec43036c13c1450c4b3b65847 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8cf74a6e0d6b11be8faf06e2b07c103c1420daf9 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fd211275e82bdc6ec6706727912bb27275c45a6d |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1407bffaa195fcd30e1b8ef2a027345d82432336 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e651ba05f12cc09f83b6866df4cb4207f25960a5 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4e4fb2f7b7049a81b2c268ec02f0bb4c9eb28fbb |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/25832251d11e74bbb42364814911104d26db25e3 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b7fc951b74814482d0c6e6f2164d72dd2087c2dc |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a26d8a28ec0f79d8190766f8b7415e99678a7f23 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8d155c5f6ccc8ef7ceba9b965a8f6e1418a307e7 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/10614512de15c8994c211d62bbe987de2ff4e929 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cd8bcb9133f2534f3ab8bca92744cd2316afa604 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/733acc74cca1797b0a2a81a69e8110de66c0a181 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8be7e1ed3c7f026daae812486203524e6f5b30a1 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a73caa8b1e20b6c61871d9f6f8eb9442d307a949 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9727b53e4f7a3c6b6e77a580854a0e276fcb4724 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7dce7e53ca70e30019e78b16bd1e242b8c0d1597 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0b48772e1c8598a29e35e48cf46f8f818d79452e |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/79c04bbe58c618de48d6a164d9eb61c50d93e49e |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b4a479d2ca963f2eb1932fa7ee922e1bc646be60 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/904343f962208bc1801c1ee7ab7da9e2cd815575 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6de3caad455d053d2fbdb0c10559a27495a0187c |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/896c4e617f5d6feff6b895834a8d27dba01cf9e4 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8234d1ef92556f874cb708c3dc430ce753dae405 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cc0b2c729ad6be7ca2b957dbcf12a1d400008ddd |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f6277401dc50304ecfb3406d518fa916e8b9c812 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/372503ceb3fc101ebde2eeea3ef052e4eb2764ed |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b9aa830896bd8c16dd388c53761f30a358dfa9b4 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bb9c686c595cb656a5e8162f238cd3c7c9ba299d |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/99c267d74b6bb3aa348e4f0b2017f3851b3faea4 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/29721ee91497c32c7212f59baf06c9a460347f91 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/54383cc38970078a254674cf4ac8daf7bbf5cf93 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/894fa0a5bb682f8f21b937cd2e71f1a9df0d6fe6 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6a853c7e4b330be95168673d73bdc9d883969f01 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c53c50e105e0144e302abf087db307f907f2490e |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9a0605c698d641c04afa4ef6a357b98b1bfe510e |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/415ffc6d47e7a7b1996353ec3da50da7ab202a37 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9c05ac7a925ce37b875e2be33aaabb6264040974 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5d7674c91e744cc70de97ad506410adf723cd485 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3572cf7acf353248524bb17dcf6805f8e612045e |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/89ff988345ae56ca39d804d3be347b9a1309fb12 |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/db333d0a3ba04b8501dd5cdc93c90e3bf80fbb72 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a908b096ed6ff5946a6d39f38f0c0cf4141b726a |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6448ebb5427e853fbe5969fdc84adcfbe2cddaf9 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dd8948f7020c17390f8d0b02706b178ee19c5c9e |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cec1bdc188c00287d6486c0d357275c1ca1c8e7f |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/313e1a3e3c5efb1c5f05d927febe418d96176aa8 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d77aacbb04e66469139c2dc736f4a8e7a08ec0b2 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/096710f3bc383c8d168748ca6b0bc2f508c5555c |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/980ac32e04825e71d7abe1bf8626ca4acbe6ba56 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/54b36740e4e6bc8f8e8949c781aaf39dcd3391d9 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bdb25a5835022346cf2b4ddf49a71fdcc6c23d3f |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/127a48dcbcdcaf0431e23c7647ed04990afed68b |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/683e94befc306666b8ae2d5bacecb24deed1ec2a |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7bb4b0d9f6986b934b8bba5ce04ced93bda0c713 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/354194646241d7fc3f5ea79c6ef64649d0615dbb |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/03768c54ae383909b75d6d19694943fd142a3522 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/003f0388e6024d1c23953357ea391f2bb207e0db |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ef9c4f4808b8c2d16af4930dd7cf0ee77b05b79f |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/083ba5675d550b133ef1ce98500aefe035614389 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4e0626955ad44d457339ed7ce60148155f55b94 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dd2b89cef5902e04944ba074f3033236f58a4365 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dce8ec5edaa99d3931242be28ba471403c9c9b71 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0af64fcd068786ccd304eefc5757621b1c388e88 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a6d3100eb2254f69f3edf2118f7016a41a0d44ca |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ed2cafdaad95f8a3bec7839442e84a4ba0157987 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/22555935cb3cdb2ce653d93b235d2009313149d6 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/94e321b169c8f7eaa0a21c6a366ca7638ea93b2e |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4a25022279c6abad947450081c19d7808655a1c3 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/99ac2e6722b1569a7a2815ace940e1a76e467504 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a5c9cffecdec03aef0010b423a11c20ed9365394 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/22156c8ecb2e567a6d5fbcbf3317259d964c906e |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/55a51c49bb1fa3bbb822733b8743821b9024cdfa |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/63d4b728882a170d2060fe9e63bbc8696304c7be |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2f43ef292fbfd33bfb3e886036317f0402795629 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/97e483a89f4726c1186d7b9fcedae4420d00c5cd |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c6cb61905f6993914082a3b44f5d0bbebe611206 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9ebf735f7771d0c849b8cfd87ca60692cc29c34d |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b1d39f3381d843774d88595e112a1c5333d635ba |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ed40549fd578ccd86d3f2e7ed9ae9203dc4545fb |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cecf3f39d9d0b71af9497c18f7c797ccadbd3a1e |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6d25b178e0565bb1c66c614a14304965a054e4a1 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2b05058b485aa5cf4599bf988d90ff71ae1a7c52 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/390a8720d014110c4ce3243b5c708ae2dcfeff67 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a0fb2ebce44419bd2fa05cc0966b801ff5bf1977 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e53f0f57b67fab2ea2f19981aedbb9ecd178b00 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e023f70217c54b7b4eaeece455ede4b8b5e4740 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/abd92ec463815685c2b04e459ce6510f94566c0a |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1e2843bc747ccbdd981ca9922dac707ab300e8e7 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3a699568f3e82682d764612684f1d22d7a6eab3e |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ff71482b78318fd507531941a89ef5ac6c891b8 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/445903b8487af8b8089b834e03852e84ab54d00c |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/01c708073ac114c6edb7cb75041a689726c730f7 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/594a1f16e31a519237001e4a382f29ccec138ced |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0bd9bede3c95f27a0f2b07e9fb5d53215a5e9e15 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fe8211406717220f20548b7db3bc9eee628730b4 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/922b1dfb7e66e10e101b16c70ffaebcde264948f |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/afde4e9bd455fae7e0f9837be9835e78d641eb0c |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a2ea63f8142125b4fc059314bee5ec6fafeac553 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6e8f061885edb6f96c5bf0e2ea40d06743c25b91 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bf9f6eadbbfb9613677ed2e03dabf0acdbab8034 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/415f039e7c528af65397e8e18758234852b0d29b |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ebf85c3fa39d76fda254caeb67cf65d0a7634c66 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b63afa3824af2f16b5870b5c227205eb0b1bb3b1 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f83a2cf4c22d9e63682ecc75590ee1dc6c05df23 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/796052bf552646e14b2d31749892d7cdf8e545b2 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c7c4ad900f0323bd9f2127e8d3aeeac0c13513fa |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/47635f14d130e895a3e081666f31a07af92a2fe4 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0eec063b75fc6ff3400eb3b8d834d49ddcd55aec |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/02bd6b9754e625c89600ad6870d8bd58a288908f |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c988fc29b321b96a9a1c5aa0f745275139ee01ef |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/19342fea9b553cda1d04062f5030505a7f4a3aa2 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/689e3497606a702c6d8793c8acc622b3bed2fd6f |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/85ee8a82fd19688dc657cd5c55fd7d72aac0eab6 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/41e2099ff7e762c39abbb6902b19bde9b6a61fc0 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/54faae70ef129a1d8629c46635f93a2983b4b370 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/214fe48b6b7e9e00c4bb99f89185fe6238b2b2e5 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f28911311368addf6e234f710e1fac634b1aa94c |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7d357a24d16eb9be5c153a589c509bff5f8447ec |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0552ab93fb5325043e33fd8582df53e4edefa9da |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f3f9a322bf81f9d303b40c9fd385e84b46e004d7 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8af6a47c3c9097fe31b06df380f280243fc3fb95 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8c7eacf7733abe065d10b92e91917991c843182c |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a19a871c18da7090279d2d41bde9037be670c307 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fcc221ba86c61a649f3720647931e9baed791031 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e360085e8d75d456fd796459ffa991b844fcc9a3 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6336abb6ebf8714afbd8ae0b5b9c91eeea293547 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/141d40f8fd7ab8c5c65e17b2d90f4586bba8a6fb |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/688b2d0620057654c865e3fffd2bb018dcfcf6f9 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bb178d7ab5986d358b35893a7fe379c7312f5457 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dd670e92704e2c87d12e301536f460d75d04ea34 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3c8e71239110363c1894a334b77b77b53f68421e |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3985e6f4acb56d23a7298578e88219fa42828bb6 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e7bd67b1ebca3a08ace6513c93e596afc1193e21 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/16e7bb238fb1754a6357955b6cbed50c0859294d |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f0468c5622534034ba0694f1b259ee14b58a5b4c |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1bbfaf1883e4e1700f6817a3f39c14b92611da8c |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/543c39934cd406dd27698634b00089b074bf9914 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c1002203a1db932a83d41db860a9924d66493945 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7a443c26ef54f8b98fef6e45cdcdd74ca218e824 |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6aab23cf9bbb112e262cd621914af744540dea62 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bee32077419cb30700c7565d09bb966cb9d5dac8 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a894a59f28dc06526f91ac1badf7ae48fb8c604f |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9c030c72bfd651a1f9143f0dd88bfd4474af978e |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4f55aeb8ea7d25e6bbcdd65c499508e6de9bd254 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0dfeb812b6d831cf7b4c4dda98bae6ea8574ac2c |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/447bda8444e8ebd62ec0be31eb4a7143642afa0d |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/957c085bcb531a759bdf38a2429903919445bb51 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/018190189eb805ed34a7a90876ada0cd7700eaaf |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/13f8eb1b98956fb706aca77b2b71f81e36e303ef |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4dcfd7057364d156c378e6c40b7f240b98f41a49 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/688f9285cf713ab12be131a1b899c55adb411a9e |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/334f8835bc7158fba0f29047267b99d4c6870e08 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dff54cbbc8ba72634b13c519544b57175c72d76b |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/665a97fb42870ccc1938bdfd8ac587db0bec49e1 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/82cef49b04a14b15bc404164cdac7bd6b33841e2 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c842ce1246536bfefcf971c73d9d4dce7b8ab55a |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d225c1bf93deb946e2f7b146a86bd790becc894e |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0b6e657254049a6d8462ccc5bdf827acee4d398f |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d408fae358887d1818647ccc1f7342a2b3cfaefc |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5e1040943c55c0c7dd62ca88cc71fd3a938348bf |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/82801a90c553ee72dee2c87f0891b98268356221 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3958aacec2da0c1c1730381b4c228f85c6b7b3d3 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2e7e9179eb54e8f37dd608dfa761706dc666a9a6 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/be230a422766b0bcea5bd8e29aff43b3df24f493 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/299b03d60ac9991c1c2f321536d6337c1cb6e06f |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9525e322219622bcd5c9e56827b40df635168fd0 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1ff5c6e4e250e0368433c28a883ef1926c12cb68 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ae44e1d7eb2ebe9f6021844b05356b625141de0c |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/61bf2174ae8d465b85626341afac43d540f3ed8a |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eb4f524e0e3b3945702912f08024e18759fa3c2c |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b006c8c4e1d4c1e57a3db01f87d591d8534ae491 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/06642fa882b6ce9cca05fe9b3256552e4e7857fe |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e0f90e9c0a1e44b8c6145fe55260d62974a4c4ec |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/300825e01f01e88651e555a44fc468dccb169131 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a30e8ae1792c958018012b842054a534ae4b95f9 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/544622fc2ca07d02c4f505959dc867b88cf7f825 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/02d5381a7bc267ae11df600cf6875bdea7af3547 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f326420ed80337c80d5b24a465f06891ff83114b |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/212c6748dc3bba50dc6aae85ea1c05ca527dd3e3 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0c66032cafa824b63ca38f3d4d578197cc50eddb |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e418fe20159e4a0c9d0df2c4fd4d968f8b699ca5 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/49640f6a47408badcbe459348b2bf80cbc26bbc6 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/430f1f84fe64c89714c8ec154de54f44e28d39ec |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ff7624163b01583b6ce1ac9fd90180413c62a1a4 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ccdf31b4f4a95100f406380f58219ae31d1b34a |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a475b55f00bfe19662675eaf3514df933912b610 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5250efdc235d86c87eb318a534125d612c7f171c |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/400f78d1fda999008142e33814eb712a6370450b |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0209177a3477309709ffd70d85ecfb63d8935d77 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d66a7d185f565b0ec820480333d8e2dbd7bbbf15 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/72edbd150131a58cf1568379bef5a60662a305bf |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2dfeca5503cd76bee9fe2a24943d2a154e61d98e |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0b59b327cda920332254fbeb09640d140f12abb4 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6d19c227efb8b1ddd9a8dff43978aba359545af2 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/70f0f1ef99d94fcce3d255e5caca745a3e497fc9 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0bf4edc4d51019ae3ff5049bc97b53c7e859f988 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/72cc245b79bec81aa9ffa9aa93831c95e59571ef |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bf311dab5e3dadd41b691e92c51bc59bc72e6498 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5d1ec90acd43738ac5751b884a0be23e75baff53 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/feea969e65729da6158a2534a348f6a665bd4ccf |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/392fa6871bbfb689fb27cb393bc295b1d9698b1b |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f3292fe8371b2b36f307cb65ea3abffaa67feee7 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cc74e3958a1ef44637a1c736c9afae832492ad83 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6c2d6923876c84fb8115b75cd8977e8fe7e00b84 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/df583df07313659b4e7d87d33e55889838fb0078 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b086d029a9b16258c2bcabc534ce8449c9dc7f5d |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/32fa4fcd994165f8a3e383b30c43b0599017bbe9 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/41db61c4806c70ac3247621f6cc836170ca0aafb |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5413c3f4cc9bc716889b5f4c5e9f1418a3778f0f |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/67230bb853e7f32ecae8d05fbc7741fb26d9220c |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9f221b4086c668937ec05d29d44d655e287914b0 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/52b4e8baf2e25ff91ddda71b59fa5d9bd1a54848 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3e8fda31287817687f6a57fd49be2980b98236eb |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c74918c59a4fd03db05b42185b7dbe224c5974b2 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e2375e87b2c72535a8810e1dbbdd83481daedaf8 |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e575879162a28c79304023c907763cdc669dfea1 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f14d077218efbc68a828c020b619e5f7635f8ed3 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a1dfb1c10cdfdf2830384547861d25dedacf1fd3 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/75439a43b6921f172d2e1d98cb6b637addeefbeb |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/af487b958eb88b5477fe1f889048d788972aa2fe |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d0ccfc9967f7d39dd39c2f1ea9840cc044da028b |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/09fb74c7c0ce573fcea6886d16dbe66a720ad834 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cfba36cf40b55a7bec15d87e80329b11ba2ac7c6 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1865cbf5687940359c8a44c53991dd542138ab45 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1be7a9bd5b558314a3ef665aa420e041c959419b |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e9278f729328b1ccd2150a1d6759e8c95a5f03d |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/68cd51ed86b8fb184394ef7183a0150cde933920 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/21be088df204a7eee55fcd1fbaca0611c0d4506c |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0cb496e7e77319b7c00ee6e3ca01c05dd6fd1560 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/37b2bb39988710097b11125aea24ddf1b8077b13 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/77d410e62a9f89217b0c1e3adc1e945960083a9d |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/11bb6ed50e9c15ca778b93999f1303c560cc507b |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/393a89d975e146d174f021dbb56ec6990f5e4f79 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/abb1e88d12e5ccec73d177ac31ea24490af7300e |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c5750a51d6929c7cd0f7cefbba70229d4c018d51 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e62131034945425f2c4e276600552583e36dc346 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bf9805af0de0d8bedf4ccfe7047ee4a98e8ee6ae |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/420eda0fcef36e5d56f41151c7662a6e29f18488 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eb5a21cac76a4c20410703d51809e5e3ec51b43a |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ef6abfee8ee79c10c14ce78dc5f49e3e6ee81fc2 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bd3d32f9faee574fbd588d9f5d3fa31fc00f0868 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0890626a3a3371a791910e6b3cbd1d6b59b5ba79 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/97b36ef54c3760367f701fb302f73c20f0ab26dd |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/936a66dea6c949768e35728324b4e2229c6fd51a |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/42b87c41a00da9f07d1ef2bfd2e86ba39b4c98f2 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d05e1376b9ca9b581b2efa5fc09ed64995c00ff8 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2366751927d0398beb355dbf32c2ed56f5774619 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a53b1ce8a37928ea42203279927c70a7f88162d3 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4d6d20996518802b2c7938bdb9a46851d1fafd6a |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/aaf0468411f4a79c631b7ffcb3d546c477cec5a8 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fee735923e1cc7b14fe503fffe299d33296fc96e |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/993e61997a8a65af49af1e0f9d798b8147a6c22e |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e2f5f24877b45a08fd3467aadf0cd798ca17e46 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b5e305bc7916a00f350b10504570890b213e7ab4 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ae64d09925ea1067b33924111e267937ac2eaf68 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b059533fff43267009e5af0e961716381b4a6e52 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b4af1291367046cb2b35b2b8ed5971bb5edcac4d |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2d87fad36c9cc6359a8699fa9e8338b9f66ff040 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f8a929727b306c5e95257b1ac7004b103ef73a3e |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b97fd053f2ce616bc17da73495689660cd290ffc |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fe8d6d07816119186d5202be0882ef998baa4309 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/834c0f11c085cd54390d6563ad00298e50ecc00b |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/61496e9d6e187db93a10cf94600530e2b14a8187 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d7bc5aa4899bb2bde066d5418849ca1e67a8c2f9 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d0a6528c46597f5159d68f8b1c5404a89114be74 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d4eff59782211ad8d7d804005ca8161074ab9024 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d01c4a40845fbea22ae9e24018a0419aa6ef7d7c |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4f92204df689bd26f84e73e2f659134a64000b52 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/46b09e4b4fd2f66ffb1183f27163d16110baa5b1 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3f06c194ebceb541051253054c36b180d4dd00b0 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/772c16e2dbefbeea809ea8d8fcbb076b098807cd |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7345145b29176225c3fd58253988ea2e0aac977a |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/343aff36d6858149bc5dec665519044826b7e48b |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3d5271e7b807cb942e519f7164a3d9550194bca7 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4c0099c12109f850a5160c91b85b2d339d8aacef |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/15f9a1a35aa1035f619c2f0d465f6d5cb0e379cc |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a305e46dc5811d3ce613836f9a7b6714abb48116 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eada6095112105a3014e9d0cee0bf815f6c91452 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d4d0e79244e4cb28ad0e049ed5d8ec1b1ed9a561 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5f7471f8d8525b5f2e2e1e03eaf0fb6c8550a4b3 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ad122ab5cdd8b444a0dcb9e012035282c937098b |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c13a01b4e0dfb1e3f0e724f57229f1e5e8778226 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/df2de0a3baeeda3702759098c973cf4422edcf1f |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1a82a998a746b794be96e0dfa080c5700d123c71 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bc6246f783939920aaa6dd95819387bad0bd269b |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5b4ef8d6641f4f03521f86337a384e157b5b4a10 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a9aa73eec58a387cd9488d9c891eb96a7b0ba822 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/68bb3bc78b0dc814920f9a4a8908276517427d21 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4ffdda91cd25df1a7b4f3773ed149b896a8cdf90 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d210d471298b8b24386a07ef1a148ec1a8bc3132 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7f9a176777e5545f17dc70e0e89da2fdfb885f7e |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7e68aff6d6edb451fe4215cdc9f7dd497a67d5bf |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3febf070abd9303f37b4b37ed0edd97c80e3e74a |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cf85a9dfb0fe0eb9ed5801223bb962e11ee8238c |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6886966791d788f14ee16f8b6df23a71bb1ff1ac |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/236fd0290f43a88bebd3cd584c6c2d0c9cd3862a |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b2c28e69a982bf633c7af6fc4c91d7b9ef3fe165 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/733fa3d1b871a4486b78e30a34218451855579ef |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f49da7b8f413fe513ea31bcdf2602da869c29d46 |     
  mips64el   |         sysklogd-2.7.0         | NOK | https://autobuild.buildroot.org/results/78c0a53418aa1e292f37ea1eaeffdbf21776154e |     
  riscv32    |         uclibc-1.0.51          | NOK | https://autobuild.buildroot.org/results/2fcfae6f61b922e192d7b12fd388bf4bf8fd42d9 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c2e3285fcdcd69acc741be4fc667ac856d973df7 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/28bdbb60283c04c0ed882c876eca7c397e80e710 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/9ca1fbd8539547bf283579d9a3489c85310466df |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/1723ec02ca4b21b3d61d6148cd7a8dd5b09bc471 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/06fb1275a6c67d0bb6e8e6c0ab31cce2587d5a0f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/a4f21bfd353fb91b921ed9b8ea63fcec51bacb60 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/a0f7520f42c8130dd99301384286c2c39ee5cff8 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/eef35c26979d6008ae8e5c5266d88fb5f8c6c852 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/35870dd0f58a62bea1f316d3c425168a2fd43e79 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/5966c3f717a1c72a85cb2060f02e15b82ca8e3b7 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ffba567d102a2c9e687bbf0c1008fd66d45a36ca | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b0e7796dce5df595b6ff80583a842f43e57fe68a | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/66f90f7fc86e3a6beb39827450e08d1f19b60dd0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/323b41f02961eaaa927b53ac2fbe82bb6b35fd57 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/68546bcae4bfdad462c50fc4fcb31346d57c610a | ORPH
  mips64el   |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/8ce776d6f221e523961c9cc95316ff08b5e79662 | ORPH
  mips64el   |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/fd0afe48f47fc40e3753a195c967f0f74882eac0 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 2 
            gdk-pixbuf-2.42.10 | 1 
 host-softether-4.30-9700-beta | 1 
          perl-net-ssleay-1.94 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/dd76add6996d87863b4b73f717f7c1b314c5135c | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/9ac06f96a92e09a9f6bd9b5768aa5b0651172262 |     
   s390x     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/9a75d984a65b66393ef585a778ca2eb7fc405fe8 |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/13fa84e5b75929ccfc5035eabfbd2b893450713e | ORPH
    m68k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/68a672a7ec34e1c88798cce4a3a7723fd85509de |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 
            freeswitch-1.10.12 | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b1ec321c18e86241e616672611983b336dffa46b |     
powerpc64le  |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/2597861d3e691d674b4aaba191060c5a4b4e6f2a |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/cb0788ab761148afe53c12777fb07102588a8a09 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
