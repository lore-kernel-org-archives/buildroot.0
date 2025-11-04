Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDACCCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 04:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0988860DDB;
	Tue,  4 Nov 2025 04:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gId3HlZlsFz; Tue,  4 Nov 2025 04:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A6960DD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A6960DD1;
	Tue,  4 Nov 2025 04:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B24B2462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 04:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A40E7408AB
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 04:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jC68LmV9lkXa for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 04:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3E4E40260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E4E40260
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3E4E40260
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 04:24:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-429bcddad32so2893611f8f.3
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 20:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762230275; x=1762835075;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3HDZDfpOL3ruvEHljhrcY9B7Y6jXy+B6j+y8iX9xUpY=;
 b=J0l5oWyFxyqFSIG8WIEMWFdzbCI5OM40ccaCJ804MghBHeHyq5fvlHUahQc3M511FF
 Uw4ohI1hBWlROS8k1s4mzyllzMD2dNY20JNC42cr2NHxH2gVpkhEbsg/gPsQLdfu6wmm
 NYIcKtGPsObZajK4hNYFBYLqAIsFz+m2oHC72jR6FLD4n5WsYX+kHFOqunnEkj+tAUKl
 guEm5V2CNchiZO3oEnVH60oLUyGEeZIhud4IrSvVlF8m0ci/pea1n6YNN6w2H1izCHHd
 rBcQIVGCeG9Aw1/ho9Kz0S2axBwPoJobYq1gnt1o6IqlEqMamfqwyOy9BownaLUU121V
 2sjQ==
X-Gm-Message-State: AOJu0Yx6d6iqyGTncOkGSy5h3yWaBjBapJc/QkK34R69rS3H8unckz43
 DBd2O2o3Ncx22ZQswPwzNE34vrX+1r/skGJz7RyrzGSC9E9rw5XCwbLETd71lQ==
X-Gm-Gg: ASbGncvx/gFTFj/yq+DmaMbTqeiBcIqWX3HrZNj96Nuevh2pK4ZN387mHxpEeGC1pgd
 hYhN1eH/1OVtIkC/NlsS6Fp0i5KWOmFjJkI+k7KlNpKI52s2PlxpMmI4X3t3wf6MtiEphn9pZwF
 QUzxIMcSa9NQuAWniDN07myVgqII0Wy99z7HwvzBGrEy+6JbvDflrDtYWkQIzWYi82o3loUexhO
 XhAhqq/pXG44he4e0EuKGpIMhSHI4S3huPxczXvIyhptCL+SeUxi4K/byixULCRGIqLN+q9wjIb
 yusmZRV8RA6Sn9NxDw+t0YhvrBVLVXexsPWhY7+8SvX/qwNJ998g+FCK6uL8OGO+IyoSqD248s4
 2w/eoTa0yE1M0/evAcYAhgv4djefbwWW/Yrmt+K9MrDNQRiJqWADJDyVeMazc2uE2MrLIQLmtCr
 6BntFxXIk=
X-Google-Smtp-Source: AGHT+IESdHzvmDkPe397+ci1n++Bu9ma4AhD8plw0ZP8y2NE0hq3HRIOLeI7O4nTcsRvVQ2Vh+kqcw==
X-Received: by 2002:a05:6000:3111:b0:429:cdd9:807f with SMTP id
 ffacd0b85a97d-429cdd980femr7069728f8f.61.1762230274600; 
 Mon, 03 Nov 2025 20:24:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f9c8esm2101494f8f.33.2025.11.03.20.24.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 20:24:34 -0800 (PST)
Message-ID: <69098002.df0a0220.2830db.4d13@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 04 Nov 2025 04:24:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762230275; x=1762835075; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3HDZDfpOL3ruvEHljhrcY9B7Y6jXy+B6j+y8iX9xUpY=;
 b=iFKd3eTw5VYGmhuGOh8g3tj5onVJ3ivHIq8JJi2wAi9hGEa/La9M5SWlhUUyI4Cpw5
 KNw9EzNIJvpoMvo9jpb5NfSnRdGQwlhQiZcfzs8bKdq71YJE4rM+EVZkw9yY2zY1HqGG
 VsA2hItNBXG8xijq7mPwZT7QL4DqMnRGtu/0t2IzosfGEguT6qLJzKsBsNdJJ8xgcYRq
 Bm6NkNcjj/mv25PNqnFhNG1B7Bo+NUHgVsXl3m+Me+ME+6sN48HIJqapvlDqMYXckxVo
 /Hx+Gsn+2gxZoylqqIGD+WeNzCAn71aD99tJb7fUIi3v1YkqpEyDdRmXcoulMQFfMZNU
 /YoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iFKd3eTw
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-03
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

Autobuild statistics for 2025-11-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  9  |  0  | 12  |
  2025.05.x  |  0  |  1  |  0  |  1  |
  2025.08.x  |  1  |  5  |  0  |  6  |
    master   | 39  | 94  |  0  | 133 |

Classification of failures by reason for master
-----------------------------------------------

           host-openocd-0.12.0 | 5 
                  linux-6.17.6 | 4 
                    mpir-3.0.0 | 4 
                openocd-0.12.0 | 4 
                       unknown | 4 
     libphidget-2.1.9.20190409 | 3 
                  libsvg-0.1.4 | 3 
                   perl-5.40.2 | 3 
                enscript-1.6.6 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-15.2 | 2 
    host-mender-artifact-4.1.0 | 2 
            igh-ethercat-1.6.3 | 2 
                  janet-1.39.1 | 2 
                netdata-1.37.1 | 2 
          sane-airscan-0.99.33 | 2 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.58.1 | 1 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
                  cairo-1.18.4 | 1 
          cloudflared-2025.8.1 | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
               dvbsnoop-1.4.50 | 1 
              e2fsprogs-1.47.2 | 1 
            erofs-utils-1.8.10 | 1 
                espflash-4.0.1 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.3 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    frr-10.4.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
host-am335x-pru-package-5f3... | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libselinux-3.9 | 1 
                  liburing-2.6 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                  linuxptp-4.4 | 1 
                 netsnmp-5.9.4 | 1 
                    olsr-0.9.8 | 1 
                openswan-3.0.0 | 1 
                   pcre2-10.46 | 1 
                 pixman-0.44.2 | 1 
                    polkit-126 | 1 
                python3-3.13.9 | 1 
                    sdl-1.2.15 | 1 
               syslog-ng-4.8.3 | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.1 | 1 
                    webp-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/967f58bf3b003b336c2eb0dd98310e5c46dd47da |     
    or1k     |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/8515ef72b5671975863ee50da506b5734b45372c |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a4b70bcc8b815154cdd261db13aa0060a9fc4a5a | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fcc5705a4574448f84f942257222842260b73739 | ORPH
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/24c321bb0e101555fab212bdc538e7ca2329f491 |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/50c7bc7ec51df96afa97488caafccc7ff6b5efec |     
    i586     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/7006f4f89a5fe6f0580b1dfb5b1a3492faeb0d61 |     
powerpc64le  |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/bbbea470b43be8fcf0e82d7f8086669b04217455 |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1f758b87ce7e08ecc002a9de74d169e61f805c4a | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/489cf5740b01373b20d04043eba989a1622d8b40 | ORPH
  mips64el   | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/0af76a35e68b104c6285dd9f64a5ef97380c1f2b | ORPH
 powerpc64   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/389591383f7ad3a619017e00f4a183dd28a4609c | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/c366324bdea539a5ef2115cb414cb832b9cc445a | ORPH
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/620150e4e602e159db14c60ef9bc61f677b450aa | ORPH
    sh4a     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/3ba83a3c8cd197ff34b52c7ab9fb1a662237dbb1 |     
   mips64    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/31c9ac97767a0575d2b15b2c0466e3df388363a3 | ORPH
   mips64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/850bacdd449209ea98e626a2acb76ebd3cbd22c8 | ORPH
   mipsel    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/7a402f6c0a145d97ff1f0c4d54c54b7f070907da | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/b5f30d8929eeb91964072137440b92b0f05e2a63 |     
  sparc64    |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/d845f773cf83f78b651442dc744d606b48e90dbb |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/231a115602464e2c51e1fe87990469d540e8d346 | ORPH
    i686     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/2a7745ef4b890727c26708fad77465a523667c9d |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/047b7d5cc97943353d6169696f4a0cbf3deaba3c |     
   xtensa    |           frr-10.4.1           | NOK | https://autobuild.buildroot.org/results/a00d088133fa6bebf0fa493791c81025d27f1f66 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/dbdc35d659766d58b44709d52cb2a37036a854a1 | ORPH
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/87e4b84f3aee64d041c3b845cb003e6b90649ffb |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/9e17513ca7741800a03737ff449a40d7e92ad4d4 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/02781b73eeba2f93a809216cd8b3962739a6610b | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3985e318d20d04b34ba673a4c118f5bc0b215797 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a1d425cbb76a8097040dc8992ba1fa92159c0db8 |     
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6af7debee20d99a3744cc979167431ac6eb23fa9 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f154c97e633ff840e272c9446e3174cab2fac587 | ORPH
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/95c9cdaddbd06c477a9fd3e9315ac1f6c5cafe5a |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/625d994c7331af22bb56f4e4c1ef85f301a9b03b |     
  powerpc    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/f347af7cdee27abbe666754529e7d7270efab3c4 | ORPH
  sparc64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/bff27dbb577e33d6666d89929c29b8ab3d2ecd4f | ORPH
   armeb     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/e7f12b27cd8ce49ae34c8320fc1c79c887df201c | ORPH
powerpc64le  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/64091197411326bf4447791576e77bf0da6234ee | ORPH
    mips     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d6fd48b11853c16bfeac583c6815d3b91fb1d973 | ORPH
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d11ee9dbf66456454d0b6f0dd1116e4639068cd6 |     
   s390x     |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/e21852dd9cf0d143790be31070692bcef1ed09e5 |     
 aarch64_be  |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/2b460662a4086175c20dfc9fadf32401407573f1 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d767f27876017a2c9a661344fe9c85f7b56494ec |     
   arceb     |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/824a9c02dafaea91f802aeea89a149edd35ecef4 |     
    m68k     |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/5ba024629fca2b3f9e06764c11a5b43d1e44cc00 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/5e97a16046a780aeb4945578609cec7593d5a987 |     
  aarch64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/8853a20cf02af0e6292e5c0f3bef0a5b1aee510e | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/15d352bcc69615f981e9a0ee6ae4db8193d22a6b |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0b7047bea76f45f244eb3067dd65d54f2c2fd915 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9f717a5a7e705eae30b975795397e71be278ea48 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2140861046f7c133ab0b61fef03ba7857c1360b9 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/396dae8d263926fcd36d21bd692ca9cd91344545 |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4d7e088ab8fe2508f46977d85422f290dfece662 |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/42704b84271b66436b4c93c16dce474311939eee |     
   arceb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/282252e5cc4b88debefbf9cef1f627cfdfc39cbb |     
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/cebcd126d52e90691fd01ed38c5b33cae1c0204f | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b08d92c2e1bb00f707a6d88a8e4c92d172d8ef22 | ORPH
loongarch64  |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/aa4f6e1f85b704a6c9adeb6b3cfc4d76459b9e90 | ORPH
   armeb     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/14f9ac87cca7bb21d94bf138c3c6d10c6ff725be | ORPH
 powerpc64   |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/7829f7bbb691e5fc2b106ea6e5e6b51d4a188773 | ORPH
    mips     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/9d918c6c5ed60be1e66aefe66eddc7ee20befd89 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c3db5a79e73e0649bbedc72f7e35c0edc40c67ac | ORPH
   mipsel    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/99f918ca1e0d4c78c5ed4a40d1111c6d837d6898 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6525b7460b9df2f055519b6e724f4b007c6606c9 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b9e09f1bc7604af06f1237a5e6bbc44dcaffcfe3 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e32f4aaa97288dd56032a30b13be52eac28c3993 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/26b3abf9d394f37b832bdd08d49dc4ff7963f1a8 |     
   x86_64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e8593ef42afaa9f6b275277606a08fc6f74650a8 |     
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c02231aa83fd70c392d8a3ce410ddf46806875d4 |     
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/0be15f0a55815cae0fce0fc6c36c2c003280745a | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d83aa42b42ee5814d659a6f9c63e33bd2f39b17d | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/91ae478459322540f11c03b2ec9b8ae503ad7439 | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/4647b81647857240b231188df67d3ee1c51f7887 | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/db194f83bb6ec2c1993771a521927996118a4094 | ORPH
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/83c6d370cf10d74b29e69954f1cac9fc31e6466a | ORPH
  powerpc    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/af9f1547f2249e61b429bd5cd12a6d9d09af4074 | ORPH
  mips64el   |          pcre2-10.46           | NOK | https://autobuild.buildroot.org/results/dedfc3a1f6ca5445b24fcc843ffb918e2f2fa2a4 | ORPH
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8c3f60520f22e90776206e0f06e2aa709d669969 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6adea12c761bd7d65cb995df8700cb7e48491c70 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c7ed62a638be158bdbc012dba63d859ebced082d |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/670811d5246b70d4068d30ec06e6013e2a89bb51 | ORPH
    or1k     |           polkit-126           | NOK | https://autobuild.buildroot.org/results/83e2ad19f704c11f839e59b47a5cb0110cbb3c69 |     
   arceb     |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/c0e5f1a23c794d6ae1adc6e2cece10d86985c5a0 |     
loongarch64  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/5bd3c4d26b57b711afba645e896387b9063b3f70 |     
    or1k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/49143c46dae70f6aa9e5ee28e4b66d5046b020fb |     
  mips64el   |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/ba4b772ee5109792fc030e3d514490bc9269fd32 | ORPH
powerpc64le  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/62379bcb28b90991d62c71ddde01cb9e609f667c |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/92a6ecfd6be413f2194d803d49993bb1e81fb8d6 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e742292538f0facdb9be93ba6700f999dd46fc83 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/0ac6daaad578decc192f82112072ddadf585f5e4 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/18890c9deb6b3d2665b9a5b0fa8beccd8718b651 |     
  powerpc    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/c5a3dc8319480bc7f306590a27a7e24f3a143bf5 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/0429fca9d4ea8fab89ed9ca2981917dad83e8c39 | ORPH
  powerpc    |           webp-1.5.0           | NOK | https://autobuild.buildroot.org/results/4c9466782a32516b887c47cece42f26d3c11ae33 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

            igd2-for-linux-2.2 | 1 
                 logsurfer-1.8 | 1 
          sane-airscan-0.99.33 | 1 
               syslog-ng-4.8.3 | 1 
               tipidee-0.0.5.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/71462acb8f48748407d90581b061967494bae4c1 |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e50b5b6e563e59257331550049fbb7848bad39cd |     
  mips64el   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/60addbd3087b2dfbfe91ec4ab5232a30b598bf8d |     
    arm      |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/d62969f6819e9960b47b5ecdc6c90cd6a6cffea8 |     
   mips64    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/7141babeaeead6f528312cfcfb96ab0dfb28796c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

fs/axfs/axfs.mk:32: /home/b... | 1 
 host-softether-4.30-9700-beta | 1 
            live555-2021.05.03 | 1 
        ltp-testsuite-20250130 | 1 
             ntfs-3g-2022.10.3 | 1 
           oath-toolkit-2.6.12 | 1 
                    php-8.3.24 | 1 
                       unknown | 1 
                      x265-3.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/c4f416323da1b38375c73757f472f76149d47a12 |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7b1166b6bc3986b1e72e9d40d5f78aabd308a6db | ORPH
 microblaze  |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/38394a7415ed3800d3fc9572cbd6b958e1019e75 | ORPH
 microblaze  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/cb5e34444d060bf0245cf98220b238d94b277b19 |     
   x86_64    |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/4b7b77d93fbd6e8cb497788b500cdc09facc60c6 | ORPH
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/cf47788607e66531991f512e13269886e2f11c7c |     
    sh4      |           php-8.3.24           | NOK | https://autobuild.buildroot.org/results/e7ea9551cac0a9e336c9a135581bfd083fc292a8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/46fab6d3d0068b8a0c078ceca63bf15f21e5fb1f |     
   armeb     |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/6297495a25f29c7a6b8f2a249c253baa486cf25a |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 linux-6.14.11 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/228dd917f3bd6305d8062230743111dad0fe1ac5 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
