Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A99D6CFB9
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 04:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD1A840B7B;
	Sat, 24 Jan 2026 04:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbhf6v7LYI04; Sat, 24 Jan 2026 04:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECE440B84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769228242;
	bh=d0nYMVwDiDCREoiA3RiRxYKzufCa8a1u1tJwWQn+xiU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WUPfU+u7CjPg0FuGq1lkSyzFXKJ1qt8Z0echOcjZpi4+jcaedBzdBqa2uMjCVpmJT
	 QLM720TO04L5bV7MLZaooQ5lRwd9nBYm9DKjYia8tZbCNZDoCye1GEUz86hKRqpjNQ
	 FSLWivv0Yk/S1MB2PrFpQhtHUWsvY3vcWQSfU0XqkTXnYkfHRoB61qzAQYqoiNZ9rQ
	 RN1TmwvCDoiPUG1t7qPU/H2HouFF8JJya8aBEI9yVdKLVhABDVTL8c9Jb1dt+hyCQM
	 igCtast6WzLd1oNeqAa+8KQfML/3XS5GMLSmSrKYCk0F6SXynCC1G6++nIuVZjXjnc
	 z0AqXbrluMRXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECE440B84;
	Sat, 24 Jan 2026 04:17:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C57EC122
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 04:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A731240B84
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 04:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5r-4GkPqAWO for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 04:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3FC640B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FC640B7B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3FC640B7B
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 04:17:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso23698425e9.1
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 20:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769228237; x=1769833037;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qeio79tReuOYEawvhhZTQrh8vGdHNqN9hY+S7Y9ixZs=;
 b=l/hRdGGtYVGW67q6YqjAv/W5lXoYs2nqfzBfgGOjIxGBstlzH22OA8QGCoHobHQBiT
 M/CCjJxi++JtCclTR8xWVj/Xeic/00Q0I6aIztO3T6tpMLCygVmvhYWIJXOuxce2TDT8
 xrRKP1mCUOAG/zYP52TwzqEbZqlIf9pKuYet2skKdellgQLYhkQ8TLobtZOeuLtacZUZ
 aLpPV8/9H4GtHPTH1K4gyWSRuRtGHspW+Og6n6+tCNl0EkrA+nt4O3vAlQsoSIJVsed0
 Oebxe6tkFqBys1f89kWmgbAJaNC9XsCu3NaXH6a0DshphYN+3k3HNhj+fgNcVFVoFD7l
 6a0Q==
X-Gm-Message-State: AOJu0Yxl06PKogfumxPAxNYRUISIrAXlSX5LwpYwSWItxEZfZKaaybk+
 p+v83eBeFcYo1zAWDXtB9OnihxIuTqIVHBVdSfK0D6KYSlPkmNCNOqt9Te+zrQ==
X-Gm-Gg: AZuq6aLmc0cGHKRMqEruSvWrgsUCeWJ3R/zvP5GlwOUFU6XCefjIC7a/rnSmlNU8hbx
 iiCt2QxCfvk6hj9t/ENDFGuO6iFUFU7hIoyarLWNw5TBGjWqe2aHkb6jtQxaq9WxV8mkBDOYHIA
 8DFmGYaKNgiPVICI2j54wfsid5PuG4IAlay1sh/J18b0XSUYK4GEdfZe5N0nGUeK07VY6hVsh5R
 2+JL22ylQUVz2g4DRYPUjm1Toxvi8RKCiWBwS9480J5UpZ72KyHQYiT4qxWX9NidPKgh1E4ZFHQ
 L/j7dpkcYTetVYCXT0074RdqYoybOaOe0G/BaQBTHLvbEPyRLZh/hgNGGZ+/ccMe0b9vOCk3bpn
 7A4KNML/uLT2TgbEaWy6bjJ8Jz1MpaWfErd3f77TVUSdpJCD63EwlDPp370yVH1MyEWDrJa2ZMY
 B7TDC93tX7vlOQY6BiGw==
X-Received: by 2002:a05:600c:4f8c:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-4804d2ebc2fmr88978635e9.11.1769228236575; 
 Fri, 23 Jan 2026 20:17:16 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02f71sm11846489f8f.6.2026.01.23.20.17.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 20:17:15 -0800 (PST)
Message-ID: <697447cb.df0a0220.9fb81.2828@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 24 Jan 2026 04:17:15 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769228237; x=1769833037; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qeio79tReuOYEawvhhZTQrh8vGdHNqN9hY+S7Y9ixZs=;
 b=aR4EifcKdMwNeaBiG9f8hS9uL0ca34d3fy/ZCPrWEZJ9hI1RbVesoiQsHMGuOTV5Sq
 bBaF3+8AVh2Y1TTShNpyuYngOS/anXJcPbYv8ylFlXEhWX7Th5pCPTpjgql8O9nkf4IY
 JobY/Q468aURZe+DLJsQZkurEYDe76bO5UHDdopOipuJIGMwKykTMLM84hquc4FdQdBZ
 a8dJ0X8hIp8RNOfV4pRQBWD4uI/5uGLrTY6GM3Mw/jlMtKh5CCiZmFmEQdIxkfrc7iph
 zcnlCmj1CGvm++lZztqT3HJw8Q6+2xu/NKXywVirZeSy8juMZT66UptlVGEzOeagUmN7
 ljZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aR4EifcK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-23
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

Autobuild statistics for 2026-01-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  8  |  0  |  9  |
  2025.11.x  |  0  |  7  |  0  |  7  |
    master   | 29  | 60  |  0  | 89  |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 6 
                       unknown | 5 
                    mpir-3.0.0 | 3 
                netdata-1.37.1 | 3 
  gobject-introspection-1.84.0 | 2 
       host-nodejs-src-22.15.1 | 2 
                 jasper-2.0.33 | 2 
                libglvnd-1.7.0 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.3 | 2 
             bmap-writer-1.0.2 | 1 
                 c-icap-0.5.10 | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202508 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
                   guile-3.0.9 | 1 
         host-gcc-final-14.3.0 | 1 
                 host-gdb-14.2 | 1 
              host-grpc-1.66.1 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
               libassuan-3.0.2 | 1 
                  libbpf-1.6.2 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libuci-f3fc0b76040685829191... | 1 
          linux-5.10.246-cip66 | 1 
        ltp-testsuite-20250930 | 1 
                    lua-ev-1.5 | 1 
                memtest86-7.20 | 1 
             ntfs-3g-2022.10.3 | 1 
                openssh-10.2p1 | 1 
                parprouted-0.7 | 1 
                   perl-5.42.0 | 1 
                     php-8.5.2 | 1 
               pulseaudio-17.0 | 1 
                   qemu-10.1.0 | 1 
               read-edid-3.0.2 | 1 
                   s6-2.13.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/14bedcdbb0ed460db731a880672b6bad8afdab81 |     
 microblaze  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b8171c7d30377c10d3f401a709a933e07d9d2b43 | ORPH
   xtensa    |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/4a99e3b96c8121ad01f7050aa4c390795104a809 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/dcd015972e88e861b0a55337a6324665c7c45b89 | ORPH
    i686     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/6f1196e47dc8902f40e4ac194fdf25c4320348f8 |     
   sh4eb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/2394563973c2653394fb8c06dded3dba845ae192 |     
   mipsel    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/11e793459eb0a02168fb9cb895dfac8fd68eed38 |     
microblazeel |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/4e5e239e045d0ad0a2038d89ffc40a2de38d1866 |     
    mips     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/99fe0cb6f982131230494a219c032fbf28fede0d |     
    mips     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/fe3cb715e4cac2f5b18a8123520bd6e378d6d202 |     
  aarch64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/f07e83259820fbd557c286674d7bdb0cb0107ba5 |     
   x86_64    |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/5b8274b8828bd6d62e18020bc176616ef8417eb8 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b1a2841d6bcea39cea884ba6993bd4ad06149fe4 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fe3a97912d968033e20fb215036900f3dc67d89d | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3ee2ff911a8f9b6f642dd681b59297d2eb7e8980 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/378be0023219819ad60e2ac341910500b3d16900 | ORPH
  sparc64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/a640ed1f7548d9e0308ea821f7b67df3550ebd1d |     
microblazeel |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/80aaae094a4ec31d4b4e3ce459dc269ecd3b2d41 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ec3baf9b838d12549ad7ea6696decd883d539974 | ORPH
powerpc64le  |        host-grpc-1.66.1        | NOK | https://autobuild.buildroot.org/results/688f2fad4e84e113994973b110dc77dc31710004 |     
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/76effb6257ee2f59a3f9a071387a977420173a8b |     
  riscv64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/8b092cd6797d4cc130930822964150bdcc870c8f |     
  powerpc    |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/b98bc3d5d720a3b824b3e4e09a6ee34ad5940ecc |     
    m68k     |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/f99220c701a8beec25845ecb4b0a637d610c158c |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/0f94c7b0eb0e3661e9d66c3554b71bfa3b2fdf76 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/ccfecfdb12bfcff663d621ff521dfbb175774323 |     
    or1k     |        libassuan-3.0.2         | NOK | https://autobuild.buildroot.org/results/363c0418b735a19991e187d09a37d04315f96641 | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/3ce64a53f564f0d045bcae7dcbd89c59d8a427e6 |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/0ab55e5ed069ff25dd2e22a58fd4ec255bddd34a |     
microblazeel |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/03865d3b043154f2f639c12e6454ae217228c93a | ORPH
    m68k     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/d435f354a29e5b6f13beddb95a5416b233787780 | ORPH
loongarch64  | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/d53a20b6b2dabecc25285a73cd31b4be06be84ad |     
  powerpc    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/600e1141af1618f5604628b463f1d8b36f2e9eee | ORPH
    arm      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/2cc4a85b740c74d74886070a3397d57e94d31ae5 |     
 aarch64_be  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/0f19bd356012a2ee5ec5ac34461a592359803977 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/6cf3218020cad866dd9e389713e7a379c701459f |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fc9edb0c4dff8cc3ceadded341e5536a33967010 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2a69b59544a6549d311e070b04ca8da255bae3c2 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8f57b74d1559019f565d715ef8c1ead1e528c611 |     
    sh4a     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f0bada34ae2c8715ef5880c6b2d884cfb4d7163b |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4cbaf35a66c5b3e927d37074cafd3bfa3e4963f2 |     
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/3f77f22ebb6c1daa4cb1988c2596952012513e7b |     
   armeb     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/d97d226c600af0eab5e8008dbe7e8ca5470a8d89 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5ead883c8dcce99866c3ac417a89523e73c1cd13 | ORPH
    sh4a     |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/4a350a2ea3892ad237b6a35f553b4fecf964706b | ORPH
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/055541303c9e35d24914701984b47fa32a7ba705 |     
   sh4aeb    |           php-8.5.2            | NOK | https://autobuild.buildroot.org/results/adf69ce0e401e6e026911a473f0cb09c642171f2 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7afabd22acfa8ba3ee5bb7ad6906d97ed502f8bf | ORPH
   mipsel    |          qemu-10.1.0           | NOK | https://autobuild.buildroot.org/results/5d0a4de34c98f91e4f3acee176d8c35ba89b0bb8 |     
   s390x     |        read-edid-3.0.2         | NOK | https://autobuild.buildroot.org/results/169dd5ec6367bf52d1b04068dc920d41666a9bf3 | ORPH
    or1k     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/0e32ce8baef9e1a11757e5bbbf9b5c134e8c095a |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/06921c5b1a5aa87207a529c280ec05f2ace8f94a |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f32615c853a152b43a8bc10645b3039eb6a5f42a |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b949fa1df83b5260d7eb2ef8b617cabc11a14385 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e06639eb34bebb0f4c8e8e9dd43346c0892b787a |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/df56bd0c5d25d8f1174dff313cf13df037195acc |     
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d9d8d85f3493290d5b6d2c84681c2f317bb2d167 | ORPH
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/645bbb79e7dd19a4e152a53a5f05ffc60445dba3 | ORPH
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/00973cb2d009f7912698285873324df5584e030e |     
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/f0cf8c65fb35b646f4596416d0add78e36527608 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 hidapi-0.15.0 | 1 
                     kbd-2.9.0 | 1 
                  kexec-2.0.32 | 1 
                    mpir-3.0.0 | 1 
                   qemu-10.1.0 | 1 
                       unknown | 1 
           xtables-addons-3.24 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/e0ec9ed473365112fac4c8c9748a4428e86be265 | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/befbf17136603b81d152b5e4638694b45bad4b2b | ORPH
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/a52867b9f0a0f608d973b230409a31776124f8c6 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a372afd348363d27ee864d42e26e90e79cae39a6 |     
powerpc64le  |          qemu-10.1.0           | NOK | https://autobuild.buildroot.org/results/e022ef59f8004ecbac5a1a8b524e6c4469c17cf6 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/7ea93503c1fb130396f424220fc858a99abe1f71 |     
   mipsel    |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/7c5dba79296322f363fc1f7f3b27e32cf449fddb | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 2 
           host-go-src-1.23.12 | 1 
                  kexec-2.0.30 | 1 
                libselinux-3.7 | 1 
               libunwind-1.8.1 | 1 
        ltp-testsuite-20250130 | 1 
            resiprocate-1.12.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/88bc760790e541a6bab06a079c5d2fd5891f92bc |     
  powerpc    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/754ebf99ec2bc08b3aeb5074ed72887448351f23 |     
 microblaze  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/c076544635de350d915ca50ffc8356c5532ab5b5 |     
  powerpc    |          kexec-2.0.30          | NOK | https://autobuild.buildroot.org/results/2ec0d85c658f8264fcc4eef2deb6c67671e3e7ae |     
microblazeel |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/874fefa2c723ed2bee54e98ad410db3a7093d37c |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/25f30ef40bb770e81e502731b00f8222281fc8ff | ORPH
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/28ec010b11d5953f5c03e8b590b6b0173a144eb9 |     
 aarch64_be  |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/0c7b9e21c14e53c4c2ced9e4d37e2cf458d0e2f7 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
