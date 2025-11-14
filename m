Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207E5CDE00A
	for <buildroot@archiver.kernel.org>; Fri, 14 Nov 2025 04:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A756F61089;
	Fri, 14 Nov 2025 04:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjqooIr0nSWn; Fri, 14 Nov 2025 04:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D5916108A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5916108A;
	Fri, 14 Nov 2025 04:21:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB535230
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 04:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C954C8300C
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 04:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVbpjnPmEUj2 for <buildroot@buildroot.org>;
 Fri, 14 Nov 2025 04:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E8FD82B69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E8FD82B69
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E8FD82B69
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 04:20:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42b3d4d9ca6so1336377f8f.2
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 20:20:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763094057; x=1763698857;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWWk1rl4d3GC0sJF6kTh/XR2vLdR8V4+SurzMFDtRHs=;
 b=CJtf0nF7hCSDdB/M5iuoa6pirwC2DyUu98qRR6k+6Te+24QxgXfAXFm+iLfIfiqxyj
 eJjIBxiX8WGl9BaPLqo7C+DqOfv4HFwMd5uhQx2G5HguFngR42pqo3YWMiOEZrUfXTBY
 civ/zVcKsH/IBDUT7eehE8I6Gy56mXNm9327t49M9vXv/a0b3uwBSjYhZBZFP3BLIC1h
 V0gtW96+xkBJo+xKKoa0/3oFExFPGdQ7ZrcjhhfI8CuIxGIFFrxfB8uhr5YRQqs69hQ+
 BKYQhKX50Iz4GkV9OZAHH0ox6V6ryb3DJVzBFACaqhDEqh6cFKQIxD4NfUxMFkjNfyXc
 EVXQ==
X-Gm-Message-State: AOJu0Yz1Q++7v8Y25j05xWQnHdR00pe+SppgVk8098IB1QHNUe46Ci+u
 LyWRgrQPEn+ut6uHX2k3DCs27x2DZvHp0hCoETl6Fcu0Z1RFo/ywlD1Oumf9rg==
X-Gm-Gg: ASbGncuSSr+Bayde6pcPUuhTQJnaeoFfR2m3zvGZPq4tAE/ykhQ6u4AbB73fv7uHTPu
 QBxmePEsVIag+r/UKXykerbTPkjqg8zadbzk2pevoxPTtItqP8cH8ossIxc1wf9KKlLSo9P0mqq
 jBYc5nERNP8w6V1cUEiSWwnB7juqaLk9S4on58Q+X3F0guq5XmpsXI6wgex5Y9fG/wBOfEai3hx
 bTRVRPEHEtZg2JNZY783gHJYn+fMm6dnXoig+cgCe/pfBkQGnHBnM6M36bQ/9tMLqBaXH8HTD+T
 qRInfes4IDzln7oBPTrgOVb5uA6yYfg9MGDBOlToHRoI0zR20SUH2J6W73QV1qIVsDW73tyz2cZ
 L4kPpwkBUaqs6rH+x/WA/HPjtij5Zo6KDSkbTBQY23LbRMazgQMbLQYnMZYCO0rnOKFV6G5Yp64
 DncsWNkZM8SJT3ZQw1gsaJ21C3hzVk
X-Google-Smtp-Source: AGHT+IFd4nxCPHWSuubsGF6AYYDD4XhoRIrRTEb9MHhqI1R4rUdCc9S0ggloUIKJ/H3n3R80L7LD3w==
X-Received: by 2002:a05:6000:381:b0:429:c617:a32f with SMTP id
 ffacd0b85a97d-42b5938f44cmr1408438f8f.52.1763094056513; 
 Thu, 13 Nov 2025 20:20:56 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae47sm7282545f8f.4.2025.11.13.20.20.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 20:20:56 -0800 (PST)
Message-ID: <6916ae28.df0a0220.2e4846.591e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 14 Nov 2025 04:20:56 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763094057; x=1763698857; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jWWk1rl4d3GC0sJF6kTh/XR2vLdR8V4+SurzMFDtRHs=;
 b=NutVbnwRI6PuktIbDWjj2uBidOCNgbF2IlV24Qvl9HcSzgE4QmxafugkY54xJ+hEhE
 JwWvADJ/fVSH5zRRqky/3mwgD1Yw0mIbza2K0UvRDsIblOFDvJX1/MfZnmE3Ie6m3EAX
 N0bqoCqUXxZgg5EKF9qmuxq+4lRwwyINyeYpW3ElrqUUb2VvVtShzwnlhBlfrs4zo+ar
 pHb4EvcI3MjKwVPH5bwLuv7cgaOUv4yccRXLoQ9Ipl0ID7/UHSzmYoMsQAy4pKqW6Kag
 1exvTwNRl4xZhe7AzZ1PelWY0UGs2GweahR7oSTo388/QbTln8g1vghLv1doKEMkOr+l
 c4Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NutVbnwR
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-13
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

Autobuild statistics for 2025-11-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  5  |  0  |  8  |
  2025.05.x  |  1  |  4  |  0  |  5  |
  2025.08.x  |  2  |  2  |  0  |  4  |
    master   | 35  | 83  |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

                   libcap-2.77 | 8 
                python3-3.13.9 | 5 
                       unknown | 5 
             berkeleydb-5.3.28 | 3 
                netdata-1.37.1 | 3 
             dahdi-linux-3.3.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
                      fio-3.41 | 2 
  gobject-introspection-1.84.0 | 2 
           host-openocd-0.12.0 | 2 
                     kbd-2.9.0 | 2 
                openocd-0.12.0 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
            altera-stapl-0.3.3 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
                    brltty-6.8 | 1 
                  broot-1.52.0 | 1 
             bubblewrap-0.11.0 | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
               dvbsnoop-1.4.50 | 1 
              erlang-26.2.5.15 | 1 
                     exim-4.99 | 1 
                    gcr-3.40.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                   gssdp-1.6.4 | 1 
                   gvfs-1.57.2 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.88.0 | 1 
              host-swipl-9.2.8 | 1 
                  iozone-3.508 | 1 
                  janet-1.39.1 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20250127.0 | 1 
                libdnet-1.18.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.2 | 1 
                libroxml-3.0.2 | 1 
                libselinux-3.9 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            lttng-tools-2.13.8 | 1 
              luabitop-1.0.2-1 | 1 
                 mdevd-0.1.6.5 | 1 
                    mpir-3.0.0 | 1 
                openntpd-6.8p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
   python-pydantic-core-2.41.4 | 1 
                    sdl-1.2.15 | 1 
               trousers-0.3.15 | 1 
               valgrind-3.26.0 | 1 
                  zoxide-0.9.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       altera-stapl-0.3.3       | NOK | https://autobuild.buildroot.org/results/a0b91126607b5bf0500e3e3ec92c2a541484ab8f |     
   arceb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/0d6c07b22cdea84257730da6e0fc2c0cfa1ef0db |     
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/105a6fce6caef6dbf19b3c03b7d90c11f9a68611 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/91f2c9c1ec034505a4e53659f8b0beca5c26e123 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/29a0adb8cc8ead89d3b121f72c136cb5a1b8eac0 | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fd781358d4c2b226e60f2da38fd70b72ccc6b2db | ORPH
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/18f9015ae8390ab012bef33b98d0dfd40488ebdd |     
  aarch64    |          broot-1.52.0          | NOK | https://autobuild.buildroot.org/results/066315e9132cf57be77c209fcbb025ab116e4915 |     
   arceb     |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/3286a9c75d753d53544bbe97a0520c8621de0542 |     
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/63e25259b6cf49f8d7b4d69214fc1911ae45a8e8 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/187f46223108f5f337edbe954d4040aa8b0d102c | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bad6ca7aba8ce17abf295dbd428fa7c57c2597fd | ORPH
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/417bcef1beaa521012e7cbdd55e06b905ccc20c8 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/a615b87c0c7055e80e71e63fa0193cbaf7e6cf4b | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/a4cd75d5fdf3e7bc42841686fa50b18bd8837dc5 | ORPH
   mips64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/e157c11008bb006fba9a2df42560aa23c174a798 |     
   mipsel    |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/7dfe7c105f5d798174ae2672d4807d0ac6899ec4 |     
   armeb     |           exim-4.99            | NOK | https://autobuild.buildroot.org/results/6f3227dcc441ca6ec618d498bc6ce1d0f0845fe2 |     
    sh4      |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/21493a06bd57cdef16a2d4a4c60e9d83348f5b06 |     
  aarch64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/2f36c2af978bea43e78f84df874ea2f76321ca78 |     
    or1k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/b99ce5c207a6dd199a5ce6e20215b3cad088ee92 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/e9cefd9907645436d4152074f40ce431b254ac8d |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/137c6972d3d6ddcaccbf7a1a0a20a3584365beaa | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c7d3229aad113ef04ac2956e5260de994811f5f7 | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/5545b7f29b7bb531ec9fba5227c3396c933ac541 |     
  powerpc    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/68230563c20cd2530df4e7dc5312514cccd85624 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/811fd293aba5c596608121b352b17f5fd788d384 | ORPH
    i586     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/2eddac0dc4c949604574767a86673245dc1aeaf3 | ORPH
    arm      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/c81c3c84cd83c5dcb99450dbbc99cf851babf30b | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/cd55c537f12d5dd152220388d032cb6c61416ed0 |     
    i686     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/a1395ad481bc9fc4c82d7982dc35df2e696f4088 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/fd6aebc25623bff1b447a0fac4d397f96de14035 |     
   xtensa    |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/751c6cb5cbda47e943c5835cfdaaa2dff8186884 |     
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/cb24db1bc32fb7c0788daf47e8e294044af3100c | ORPH
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c473c46787f1732da85e6f5ec2d3c81cfab8f59e | ORPH
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/8fa99205ca272b1cb602e2a6bad00f81512a356e | ORPH
   armeb     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/e3dff8f7a5304f0accdc0e62fde6ace834eb3d1e |     
    or1k     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/b25fbdcf90e5a85237566cc17012ee05774832d0 |     
   sparc     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/ca51bb885363dcf56d9d2a9dd8c9b2424bbe3671 |     
  aarch64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/75b4b5dad273eba29014fb1113f8c377638dcb3b |     
    mips     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/a8a9ed111c51aee366880572636e6439a062ded8 |     
   arceb     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/e9d7c8d4a4b4a3245f601067b99a44760ef40100 |     
microblazeel |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/8c4cda3419657d997080cfefdc2388b2c90177b1 |     
   mips64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/81e0c8d0996bd664acd08df5d72ad425de552d80 |     
  powerpc    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/bcc8139645da8a09860f18a4cc7059eee0b39b3f |     
   x86_64    |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/831948ca3e3ce4a73f9824dbebb687fbefaf278b | ORPH
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/03c5c3cb8dd1160a411a4267280d58b19ce07221 | ORPH
  mips64el   |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/57bb5f02209d8216f0c472d39b15603e0f5db3c5 |     
 aarch64_be  |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/b63e193a8b56d3d22e284b7bf1c41aed1230f44a |     
loongarch64  |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/93709bdafb3241c8231d7a34f01bd790c6ac7618 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/029dd6c8ce3c829eea990be299866a602f04a32e |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9980059de224e2d270b9cee5a4ef58ff68254c7a |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/100a05bfb8f1bb74de21dd5f0a48fef98852eb9b | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/46f286e32c19c0151e0330b4af7e72940b610683 | ORPH
   s390x     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/395038f3bf94c60640adcfff5cceac2109123a8f |     
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/1de66d2f91a0c0dbf5cf75723cdaf517e41288d3 |     
   mipsel    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/996abf3ffd8a2f5b41811f382aad122187bd4bd9 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8a1ee028698954d939ab7574cd94af6542e3feb4 |     
   sh4eb     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4f75cb93e296207d04358d35577117deab3e2061 |     
   x86_64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f239b04c0eabab689f1bfea23f4bdecaa32e85fe |     
    sh4      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/1c82fc1de6da89823980484a23e605ac05a18d52 |     
loongarch64  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/de6cdbaf71902840e737afe13a8ba5bff0e3570a | ORPH
  powerpc    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/424ccbb3c69a3256d8e4061ee67f602eb409df89 | ORPH
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b0c6b5d13b3f9cdb834425921370d468fa166566 | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/5816147337991d3dd6a990e18ed2f02ad95d684f | ORPH
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/166df5949c505e5ead2330f088964253ffaddf0c |     
   x86_64    |  python-pydantic-core-2.41.4   | NOK | https://autobuild.buildroot.org/results/eef7f099244f29d4720b8641714a16ea8705a03d |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/c457246162105b48117b8505e87d3eb40dd15e7b |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/73095711a269a0c3c486c6a4cfa2809ca8562093 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/2230330e41c5a5c6853d148212faf6bd9c4a3c9c |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/0ba6f0fd3f5ef165941d3f35db460d5012855413 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/f4e585569561bc76a6dbb870c6294256ce8a1592 |     
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/a6c8fe9eda682c1699e270c6d0af1854264f86a5 | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/1aa825b4fc2c98229a160011e2561a27e64c8193 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/697fa07ef28e0b8475aba1360405f9d1c1c2eea9 |     
    m68k     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/f8b08fe81fe850176a1779b03903d1e741abecb9 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/8aaa3b89913d5ea94067ee6e8c66d611ed4868f9 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/1851acf520302da131e00b4934428db0b7189557 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/b47368a7daa8e77ad380aabeaa85ffd80df40cbe |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b2276f2fe11c3293580c05baf70c866f1ddddb9d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/6725b14d6d05248fe21f74b6c44233a5edc8b237 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/b350bde0d801982bab9e94f6eb3adfc272f40036 | ORPH
    i686     |          zoxide-0.9.8          | NOK | https://autobuild.buildroot.org/results/7191fce480b86b707053d243cd156c78d874d173 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0b61fdb65c2625da699e035591cfd4357c2b3d48 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f949de7847c418dfaa0d317e8f72a9ba1025ac1c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                   foot-1.16.2 | 1 
              host-rust-1.82.0 | 1 
        ltp-testsuite-20250130 | 1 
package/python-flask-cors/p... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8ef7d2cd78481a7788e3055051c80caca135ce28 |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2f26e77f4a62f41a2f2bc49dfcad78bb1760d35a | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6785ebef29ac5d254797d60be8b78c19518698e5 |     
    sh4      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/e868a54970c0a242bdd6295f8e688890cc6c41ee |     
    m68k     | package/python-flask-cors/p... | NOK | https://autobuild.buildroot.org/results/b7aa36708739565f76b16e4c7d1ba827d510d372 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              libopenssl-3.5.4 | 1 
                oprofile-1.4.0 | 1 
                 siproxd-0.8.3 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/a6b78354c17a4da646a3b79253b09b3ef05a5166 | ORPH
    i686     |         oprofile-1.4.0         | NOK | https://autobuild.buildroot.org/results/06b64fa8400a8df2d2ecd677aeab40f9cdcda007 |     
  powerpc    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/3e37d0351ba0188e3d99c62aa07e95a369d23811 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cb1b242f14420ceb51126349bae47edc6cca3e73 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
