Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1473BD24468
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 03:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DAF581FDE;
	Fri, 11 Oct 2024 03:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyWIS9dcrxtm; Fri, 11 Oct 2024 03:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18C781FD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18C781FD2;
	Fri, 11 Oct 2024 03:17:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 765491BF5AE
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 03:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64CEF60D68
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 03:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0-ob3C3TUMv for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 03:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2968C60D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2968C60D65
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2968C60D65
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 03:17:35 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c928611371so2156883a12.0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 20:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728616653; x=1729221453;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kwGuIFg+DlHRD3dQSLdsPIGKtlJ1RNBbtyLSOFuFRGc=;
 b=Opjh321a2qNA/Dr63wTVqYhqHnCfzYLxprz8qUlzmLgEIgTTa5kjT4qcCIU+a5uIS3
 HSLRPYF0g/d5EcwJoMqJ5U+JKDVJjDlqfzAMJjxyErGRoiAZyqyqWC7h7WZpVjCeAlhv
 HuS2FSf3WDP38IE5YoiyrUZ4aJ51caoP7VpTG5G9Vbf/5QftLHSe1+EjPtzO5J0Yvhq9
 4cNrT6ni3NaHMFnWiI6ctrj/TE69TpGD+nDKLjjFEgwi6mghyxJQ5etdPgX/kB1BqFB5
 z2nwJOVc+uAgv6pg6DkHyUhYocwEzObHWAo1ZWy1cUyyxWq4E/GRPe726KfcWwNTOjDJ
 nFoQ==
X-Gm-Message-State: AOJu0YzX31AJqL0K+VM4qP0YBJiYo70L+Gu1zQwqrlTtRj7lw0FAEo1q
 WhqWtzZLd1VCo30HWS3qPhStyAFLF87XgAmXvhoEu+j3CFVZp23HFRbenA==
X-Google-Smtp-Source: AGHT+IGH+WF3I07s8fK4lMJlYFFsW/wgDQOOTJCbpkcxcosdAh2LQFYaV25i5+Z5457+67UjRWjPbg==
X-Received: by 2002:a05:6402:5250:b0:5c9:89f:9a with SMTP id
 4fb4d7f45d1cf-5c948dac9b8mr517496a12.32.1728616652756; 
 Thu, 10 Oct 2024 20:17:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c93711ab3asm1462681a12.30.2024.10.10.20.17.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 20:17:32 -0700 (PDT)
Message-ID: <670898cc.a70a0220.2cd462.69cb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 11 Oct 2024 03:17:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728616653; x=1729221453; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kwGuIFg+DlHRD3dQSLdsPIGKtlJ1RNBbtyLSOFuFRGc=;
 b=FNAkfcLdLxIeLnAAfG0a8KdspgOnICG7myaKt6w/QOs7I8Qsdv8CISbySgDO4pAui/
 4I58YP6I8rqqVvYkSFh1Ue/c497ihgNcy9IPz+/7bnxHi9MI2hT0PeUIObHwhH3Bhr6Y
 494F1+Dc7l5kpIaWNsFMAMHsSbRWpPFKjZ+lGkge7UJsr8YnBG7UsjJqGiIVH98bHgsx
 SzG4kdpsT2+gp+G4rQ9iEYILWdJiG0qDgAVqKAc/yN1z3YiKAk5u1SvnZtzHUc39vRuo
 mK318A/tAEnyuba6YWd0p2v1iRJNwaUrAloUyGP6QtV55E7ee2/2l3JFNWTa2/QoloyF
 aGGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FNAkfcLd
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-10
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

Autobuild statistics for 2024-10-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  3  |  0  |  8  |
  2024.05.x  | 16  | 24  |  2  | 42  |
  2024.08.x  |  3  |  5  |  0  |  8  |
    master   | 13  | 77  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 7 
           host-librsvg-2.50.9 | 5 
                libcurl-8.10.1 | 5 
                 linux-6.10.10 | 4 
                  ntp-4.2.8p18 | 4 
                       unknown | 4 
                  bind-9.18.28 | 3 
                  evilwm-1.4.3 | 3 
                memtest86-6.20 | 3 
                 coreutils-9.5 | 2 
  gobject-introspection-1.76.1 | 2 
                 libv4l-1.28.1 | 2 
          linux-5.10.162-cip24 | 2 
               linux-pam-1.6.1 | 2 
                 openssh-9.8p1 | 2 
                 apache-2.4.62 | 1 
               apcupsd-3.14.14 | 1 
                    bat-0.24.0 | 1 
                  boost-1.83.0 | 1 
                  curlpp-0.8.1 | 1 
                elfutils-0.189 | 1 
                     file-5.45 | 1 
                   foot-1.16.2 | 1 
                  giblib-1.2.4 | 1 
                    git-2.47.0 | 1 
                 gnuplot-6.0.1 | 1 
            gnuradio-3.10.11.0 | 1 
                   host-go-src | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.80.1 | 1 
                libsoup-2.74.3 | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.11.6 | 1 
                   ncftp-3.2.7 | 1 
                 nethogs-0.8.7 | 1 
             parsec-tool-0.7.0 | 1 
      python-autocommand-2.2.2 | 1 
    python-cryptography-43.0.1 | 1 
           python-numpy-1.25.0 | 1 
                  snmppp-3.5.1 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/8d80b1665d1a7680e2c5d2cd4827bf3d35ecdc67 |     
 microblaze  |        apcupsd-3.14.14         | NOK | https://autobuild.buildroot.org/results/723ba7bd76db25d99bfba497d37d2a9f2b5ccc72 |     
 powerpc64   |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/16a3757ddb11f7de018cc17bbcf384f4573e0090 |     
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/0b8c8a54cb9e2aa9444ff147a332d9ba40ec535f | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/644df0faad38ea1caf4ef7c3b5554045998b0cf5 | ORPH
  powerpc    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/6f548ab10a6a00cbdc547b5727576f4650427590 | ORPH
   sparc     |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/6f3e36f9b85ddef7b51b21b17c3e003307e97bfa |     
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/399432868feb758d3392ca2bb3b6a0c92ed16d30 | ORPH
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/a2b648921ceb61bfcdeaca1172b72a41a2b2461d | ORPH
   mips64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/6e2f4149f99ae75e173d78feefa6a82878bbc203 |     
   armeb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/47c2b23dbf9f3e180e4e12bfc524a58402e3006d | ORPH
   mips64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/3e9d338168d16dccb9f52c8f4b075b9734eefd02 |     
   armeb     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/51b3054140ba558d6d2e9dde2be50b3471478887 |     
 aarch64_be  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/f3bb32665e00049f332483e7983823ec8f33dc90 |     
  powerpc    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/6ef62fec593ca859a523d5f7dfb7c69491426a1c | ORPH
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5604e70abe7435b23160f3f97e31e3f03ee92f9b |     
microblazeel |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/8353931df1959f5d5b54c3f70bce453faf6b1264 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/5df482fc09014beb7759d71cc226c2508b899be4 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/5c9a3db3505b2861274de84bc060731b800d19c5 |     
   mipsel    |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/363c2b657445f50ac10536e22a11f18256cdf91f |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/33056e55dfc81eb3062ef1d9b6298060a780d504 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7f8cbf62656215a9e0da7423fefacdf14501aeb2 | ORPH
    arm      |          host-go-src           | NOK | https://autobuild.buildroot.org/results/bf7c86161542c9e930a92373d3330890ff18097c |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/55473cd2bb550712d28edfbb3311e58684b2b1d7 | ORPH
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/1cf24c842e65800529b3e0558198e24c6b7e4b4c |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/5536fe2aeaef045683c36e2316af60053a1e3c9b |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/103da835908cd0fcb748f81cb246eca0b12df958 |     
   sh4aeb    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/4c932425f78eb3fb9c805e93332439acfa43ccdf |     
  mips64el   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/83ed5b81684eba7bb23fdb2c392fa00ff5f51761 |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f72331885c6510b4629cbd5428202f6f1c919a05 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/01b038081291eea522c8c154f06eee9e1120aa2b |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3b6865aab94b5e98c23c30e2ab38ed2195e21ca0 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5b4d3daff9f50e7106ecfa63b93252e791995db1 |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/fe8469f06f626ad7d3357d51120e5c4bf9836b46 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ed0a9abba12753bcb2293af89aea44c04b43ad7c |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b3addae5cb23f79cfe3ba8e992f36084ab245d3a |     
   nios2     |         libsoup-2.74.3         | NOK | https://autobuild.buildroot.org/results/a8750a3e7576d0129b1283724fea9e3e7365850a |     
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/214069ad98edb96ed884c9f8291d46a4fcb88341 |     
   armeb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2cff464fccded054e741ba8109b858fdb34a649f |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/dc9e6f761a7e656daed8e92048548c16d3abe897 | ORPH
  sparc64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0f5c6ba30daf45b9124127156bb7ba2b21ee20d6 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/51bbf19a79dac5e43452b3fd55082170d700e905 | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/d3cf5e51b3414e78f661ba2fb902bf86e7a0f056 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/1289375c8a360d68cb0f78a5e6b2c8e8d48e2208 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/b1a270d597cc695911e7d7d451bcc265f6d9e675 | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/17c18846fe69928cbe9aeed72c2f9be53fb678db | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8efaae4467719274891863664541b718f7beb225 | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/c6a8a2ee576daebd36b772ae7ec4e22c531605c6 | ORPH
   x86_64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/f04707445b5a5ef25771a24df72cb48450cd6688 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/0f2fcd32a9b8c635b53bd91986261f59055cb83c |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/98685d83a5e1d4e72d26bbcf7c24e611e102b65f |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/7c9338385b8a9abb8b27861993553a7cf6e1d86d |     
powerpc64le  |          ncftp-3.2.7           | NOK | https://autobuild.buildroot.org/results/38910af91635f29fcd993ab97c61acef3a774441 |     
   arceb     |         nethogs-0.8.7          | NOK | https://autobuild.buildroot.org/results/b424ba38a2602740368218be97fcd55e21953ee4 |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/208f6e0f72de392ce8f5f8d5838d9aee8a562daa |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/370c87c8d3423b36a5b3c1009415406c93bf1bf4 |     
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3cb0ce61da1062ce90c9b6e63e3633daecf4aca1 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9b7275143335750c63bb8232253a6b0e957b649b |     
  mips64el   |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/4f853b140a1daba6d04b1c4cc1c5022c907623af | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/5e7c8e6b6b857fe470b4bc1c1d8635b658b95ce5 | ORPH
   armeb     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/f121d77ebf4b631f9cd09b3319be9768306f788a |     
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/13ad50d489eb31b4d9133f8672ca8f712f21230b | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a3db2ce6787014c263b34959b489f3263fcf970b | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c0e2397d601743112002376a92264254cdbcea9c | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f74b8c49d149d5507914b80f9b3e5d9fde78b5ea | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e5c585a227f1baa415690c69b7abb7cd097382d9 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5c4350509f26c7cb74bd07aeec8bafb78e957b62 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/13f2657322db8876a6eb669e28425791c7a8d1e5 | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/abd2b6f3d1a4f8660c51b4f3b2d517648b1e067b |     
  sparc64    |   python-cryptography-43.0.1   | NOK | https://autobuild.buildroot.org/results/2aecf9edfd2fb9830b5895b722ddf19745605392 |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/b0ef6aaff86cbfc868ae096959f4687ad977c0e6 |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/ce1c073afc12cc2d16ee381c2a47ee2559d85042 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8cd3c6a4fe48a0adf69b4b691aa60ff129b12dd7 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b84b3a1d44fa9e931e6fa522929ce0f3394a8ede |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/29d3ced8581834daa0a33417aefbe32818468e31 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/23d56e0c93d45e8c33690b5ccd85d357e2a00af4 |     
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/8f582a4977ebca520c0b926fc1d19c65e5f4dbec | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                  iozone-3.493 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/316a81422a90ed339bf038b7413e2b617a0684cf |     
   s390x     |          iozone-3.493          | NOK | https://autobuild.buildroot.org/results/cb4496d9c22a0eea45128a42a366ee1f2e1dba33 |     
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/934c46ad7a7e3cead934c7a532a03a7683ed43d9 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                gnu-efi-3.0.18 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
         host-libxcrypt-4.4.36 | 2 
              skalibs-2.12.0.1 | 2 
  binutils-arc-2023.09-release | 1 
                  bitcoin-26.2 | 1 
                    dust-0.9.0 | 1 
                  ffmpeg-6.1.2 | 1 
           ghostscript-10.03.1 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-runc-1.1.12 | 1 
               iproute2-6.10.0 | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
                  libsepol-3.6 | 1 
                   ltris-1.2.7 | 1 
                 openssh-9.7p1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/3bf33d8cbbfd6b2793787dd34f7e7072ac62d428 |     
    m68k     |          bitcoin-26.2          | NOK | https://autobuild.buildroot.org/results/fb263e2f2002ef780a3e0d45d3c59b584661f0df |     
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/60de3e442c1188a0c42f3f3651e8211a05e9cafa | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/09fd4e7b7c83913201e9473b01b26d0c082a527a |     
   sparc     |      ghostscript-10.03.1       | NOK | https://autobuild.buildroot.org/results/2fb3efb2f00147c8e163f604ff627da986288d12 |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/959fa3676939ea3bb5f2e188cc010e28a11f474a |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/65105eeed87aa656452d6b18a44e97c0d3dab573 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2f0c53046f3e2f817d9f734856e6ad3fa8968037 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0154c63662511c84c20b1c6a619fc15d2aebf0de |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fd535be0e48f18b48410cbc7b24419a90470bb64 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/97892cfc3293f28be11d87780a9c6e6a9840e41a | ORPH
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/44b13b5c05006d5cfadf5380b237a4e49a58c18c |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/73c0eccc5afc4f7276dc8241c8d27dea0ae30459 | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/16cd2d035c434301b3d0feb55458a1cdd27a86ef |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/684b82949802440ef06912faa4aeea4ed480366e |     
    or1k     |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/5b69120cc9b074615fb8ea692f5feda865aeaf47 |     
   mipsel    |        iproute2-6.10.0         | NOK | https://autobuild.buildroot.org/results/b8ee2acb43c1f5531b5a94ba29adc2fadcca8d05 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/2d828f15b39e77da53f4b047db39876060e4e362 |     
    or1k     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/e3a492c2eac20d69a0d23122ebc1f45135ced256 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/1ab175f94d91d843087202037bfb3b030bc39046 |     
    i586     |          ltris-1.2.7           | NOK | https://autobuild.buildroot.org/results/5cfac73a52755f053567e68a4522f899aef17783 |     
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/5cc0b9a487d6237c320e3160bb621ca7250e6d6b | ORPH
   xtensa    |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/4b0af01950e195658cfb4183f1a67f61e8cd498c |     
   sh4eb     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/eb08d13643fdc879616a1deae27184fb025d8f3e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a382af2ef3cd8a32fea045e7101b49c26d8f530c |     
    m68k     |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/e489d457c0276d57ac3f927b3c47bab785e8003b |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

         host-libxcrypt-4.4.36 | 1 
              host-rust-1.79.0 | 1 
                    ipset-7.16 | 1 
                  ntpsec-1.2.3 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d48037c67b5fa98928fa24c7d4798e8ec7af5b77 |     
   s390x     |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/b21bf4921b60e09eb265e5ab8d2ddc83e336f47a |     
  powerpc    |           ipset-7.16           | NOK | https://autobuild.buildroot.org/results/dbe9bf97e99a95ed53a724a89185c82217a11fb2 |     
powerpc64le  |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/499394e866ca43d53de419f359dfe6ebdcfd4c6c | ORPH
  powerpc    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/c9fa1ecac2f8d0f9847c38143115b5f99e0b97e8 | ORPH


Gitlab CI results for 2024-10-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038754761  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038754909  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038754917  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038754921  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038754926  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755014  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755083  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755124  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755149  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755161  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755177  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755185  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755192  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755200  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755205  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755219  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755433  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755576  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755612  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755625  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755636  | ORPH 
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755791  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755802  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755812  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038755954  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756027  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756258  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756282  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756533  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756560  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756565  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756568  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756588  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756625  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756671  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756676  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756677  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8038756679  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
