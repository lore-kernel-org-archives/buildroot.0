Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D6BCCF9EB
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 04:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5FEE846DC;
	Fri, 31 Oct 2025 04:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFbPGAUYU4kI; Fri, 31 Oct 2025 04:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7840A846DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7840A846DD;
	Fri, 31 Oct 2025 04:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B756F445
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 04:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9482846DD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 04:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfSdJhfj4yk5 for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 04:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01651846DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01651846DC
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01651846DC
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 04:33:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-429b7ba208eso922717f8f.1
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761885200; x=1762490000;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JJDDcb0RSH9YYObJVGzXDhoq1bRRxpebUOYftWpOf8Y=;
 b=OagXs2ggzimM9hHPQsWlpQNU2vGgAMrPDCnWCRhu5iXmJI3w+0BTrhQjZzE/pj5lk1
 XVrfyGSSzc80O6u4ya/5AG2QKycvXrzKa9JAPk8jPud7P3jPjHZ/IZBw1g0xJ3D5zTS5
 P2lUD5Jv6iP8y+BJG1UvrI7CqVJiW89DScEPN4olQlI5R6bRC9zuhbfMaarNNPzGV4B1
 xqH3xBzIkgspN5LnPP8qs5GPt9KXbEmSj5fA5IZUElwVI7JlCh+0tL9S9y47juH7YmR3
 n8SNJUtMHrUWZkJwZ+C67EaP540gEZEsKzL52P6I/wqxG//TFhLTIPHuWNsN2rjHQBX1
 oNVg==
X-Gm-Message-State: AOJu0YzFHDM+weL1CLtVCuxPnmGbgvHiZCcBnA6AmZRQzordQUtIKKCx
 wlkHJ0XfLJr85I2qF6WI91DKuXqNyy7by7JmQXyBiSXyGaoVNpx0rL5F/k5SUA==
X-Gm-Gg: ASbGncuN4CczUPlPzZeLsSRL9hJ7GJCqaze5me3zWEWf68k1ZEs33F9YWaJD8//O5pG
 qXawvUEtjJqyPLVtHis6RaXx5vVehMOiBTWntn2S+4lGVB0pT7luQzdTSvRGs7GyN/9UcD8PzYW
 FXxEn2V+f/fuBhkLxAh6gpj1KBA4R8946F+MFqK5BN/YjfitMdy635VllEgrMjUaUwQ02JXWJ8Z
 rlHlNpo6zXux+vpxeNkhJiyLYWqwBUZ7/z6dXcG+KUyWthV+1ptDuq3171I9zwkcN7ZYjV1Ccjp
 rzI/r54ZFWzx+tde03OzAPGYkfzXIIquKECPd/U+M1ssbo7zDYzh7abxRehWMMi2eR4h6D094Fe
 UB5h9t3FJajd02H0LR11G3t57os/MfAgWFN7esR6QDZTKVqabGV/WzB7q1pFOJ5HsAh7UksM/M1
 GFj2ckprhCqdANf/or/Q==
X-Google-Smtp-Source: AGHT+IGueyLoOxJoVF4aO4GePVLIRDwX1qgIoVBUoax/8A42BmUjO+y5ti5GhIAvyg4Lc9KbEDLrJQ==
X-Received: by 2002:a05:600c:1d9d:b0:46f:b42e:e366 with SMTP id
 5b1f17b1804b1-477308cb9e0mr15956585e9.40.1761885199381; 
 Thu, 30 Oct 2025 21:33:19 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13eae16sm1181693f8f.32.2025.10.30.21.33.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 21:33:19 -0700 (PDT)
Message-ID: <69043c0f.df0a0220.173c2f.2068@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 31 Oct 2025 04:33:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761885200; x=1762490000; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JJDDcb0RSH9YYObJVGzXDhoq1bRRxpebUOYftWpOf8Y=;
 b=bndkRe4ExMhLRcGm11Z5onCllb5u4tTHBnCnC6mY7WlVZCiFGD0Xv16rf2i+/JsXUC
 oQ1qP/18IOkTl7Ht2MeILO6Z7VguuqiOBfPnnJ1qY4Y44cLeTi3oJG3ZZZClzF8LPlv5
 etd2ZNdDlcNxDkcWGXBk9R8vujmapptjrPzkzK6Sv7+nOyLderwN2zQTMy1SU8GdD96E
 mGPHGSlyt4LSQf6VFMN0bhnK9ZFEqglYydELEIF98P81+pGcsqcCtX6MQZ1CJEM+gMEV
 bTK4pGzitx0mBHxQSqQ8XOM0npkxjx4dRZ/ZU0bnkIa4Khz483yQekPW9NU1MCMoWgMF
 XSng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bndkRe4E
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-30
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

Autobuild statistics for 2025-10-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  6  |  0  | 10  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  3  |  2  |  0  |  5  |
    master   | 31  | 73  |  0  | 104 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 4 
                  libsvg-0.1.4 | 4 
  gobject-introspection-1.84.0 | 3 
                   libiio-0.26 | 3 
                openocd-0.12.0 | 3 
                   perl-5.40.2 | 3 
                       unknown | 3 
                 expect-5.45.4 | 2 
           host-openocd-0.12.0 | 2 
 host-softether-4.30-9700-beta | 2 
             libgphoto2-2.5.33 | 2 
                  linux-6.17.6 | 2 
                    mpir-3.0.0 | 2 
                openswan-3.0.0 | 2 
                   atop-2.12.1 | 1 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
               dvbsnoop-1.4.50 | 1 
              erlang-26.2.5.15 | 1 
            erofs-utils-1.8.10 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
     gst1-plugins-base-1.24.13 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
          host-tipidee-0.0.5.1 | 1 
           libmicrohttpd-1.0.2 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
     linux-5.10.162-cip24-rt10 | 1 
         lttng-modules-2.13.10 | 1 
                memtest86-7.20 | 1 
                netdata-1.37.1 | 1 
                  nginx-1.26.3 | 1 
                openssh-10.2p1 | 1 
                    quota-4.09 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
rtl8821au-dfe6801adb9b3a557... | 1 
                  sdl2-2.32.10 | 1 
                speechd-0.11.5 | 1 
               syslog-ng-4.8.3 | 1 
                   trinity-1.9 | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.1 | 1 
                 xinetd-2.3.15 | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/7990456d155a2bce981e4cef921b01a604d81355 |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3219d6c85c4ddf2703b417019c885175be9f0e77 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b2ad613ba052d7cffcda5f24dfb8d2bbecbbe8d1 | ORPH
    sh4a     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/50c8ff4d08579376db4323ebb85f9afadb44c3da | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/40e44f3f96d11a479f60e961d580429160bd2119 | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9099cca460a38ae5c707e39da581d4d86ef1f9db | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/25946f8619507f5af46bf2c5aab7b3bb1b6c7bcd | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/330a3f99441ee61d6e27b67fa61c5617ab480bf7 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a7a95a8d5f1cccb815c5bf0b12883f04378ac191 | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/ef9bd7bfa3b617e4e2c743b86409afc4c94dda3f | ORPH
powerpc64le  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/0b6fe9134c487286ba16d3e82e185cad3a213b10 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/adbf650c59dacb2c3c70d2e791c825f83e1b8952 |     
  riscv32    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/f398369f82698a7070a3328826c79f2f0c4a3ee6 |     
loongarch64  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/f6d043acc66d8f031908933b5d34bdc1e689b319 | ORPH
   mips64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/425dadaa4a75eae9331351172839402a197749a5 | ORPH
    or1k     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5f2e5e796b22890c39b16772d07ab7e9ef5e3509 | ORPH
    arc      | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/aae36fbdcf124a283109ec0afef5d82e4eedc92b |     
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b14bf6701b5bcb4ec08a399158bdd138e0db8280 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/05af379013e28ea76020dbc4030922be3034d0c7 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/993b6e1364cbbd7a7830babcea761511daa4f8e3 | ORPH
  powerpc    |   gst1-plugins-base-1.24.13    | NOK | https://autobuild.buildroot.org/results/8de5956cba766b5cf86d8c16991d76644fe82579 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/3d85cc3cc2978417a99f399286e829a1689fc42a |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3833db6c8ebd037e75045ab091a760a419dd238d | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/fd4b51866dafeef8ce26d11607376c3cbc058ee4 | ORPH
    arc      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/dea6eee97b6bda266b17b5c147bb66f9a8e642c6 | ORPH
    m68k     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/db349cf8b0376f22529fdb067719b6e1161c019d | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ef5fc035646341aa3a4b8e43b9e05ffc5c3d8773 | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7afe9cdb46d3def01d0f412da2810a42576dc0a3 | ORPH
  powerpc    |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/e42f9519542b62809b3ae3bae52b75800845d3b2 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/070826cf217b1ee2a9f5cfdec1baddbc43928de3 |     
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/27a017e8932f2e98aff1ebbfbd8a79a5dda9e2e4 |     
loongarch64  |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/5ee9ad5b4d8a0ec39a901e180991c75185618c31 |     
  riscv64    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/e14a9566cdb0c991fcf33db22a632ad6f720559c |     
 powerpc64   |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/1de14ccd6fc3109808ea19337af1acaef5078070 |     
   xtensa    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/a31f5dcb098ff943a0b5dc60506e092bbe4c79b0 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/66fee1d840b42f3fd70587c15d9cfd6420610c13 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/743b1a7144c8acdd6538583427d4a5b25d77946a |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4c32467e6f58845edf1ee3689b9178a3712751f5 |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c29655a6bb090e75ab196e87ff7c4514251c25ba |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c3ab0b7f27ca988958096f0a6bff93b5405b974c |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/284f5bf5062d91323ffac8ab0e1d6bf17d665d68 |     
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3dfae7f44c97d477ab05a25d903a52b406154c8f | ORPH
   armeb     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/3fc5787025916b8c68b8cd8a38a712c68da3a1fe | ORPH
    sh4a     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/250e29a19369a00d958cd039367be1bcf68bd4b1 | ORPH
 microblaze  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/bbf06a3fb4704bd4ee4ab3585e1294492cdd5ba1 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/41b297f0167425eadd0eee361e22b53d71c77ebd |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8256603ee00fe624e4dd7751f22c305de00d9194 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b0e526b2ce0f7b532b7a61d8f94b412820e48225 |     
   x86_64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/bd75511afe78c96be5556b66d9217ed306d60532 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/ccde6cccc862c1839dfc0177e71b7d983a093435 | ORPH
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c79b0d3f33426c3cf0639dc68d1cd140d0171bcd | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/734321ad240ae8c3a4fe387730a607e438de6f41 | ORPH
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1ba63ad8ca2ba390897fcf45204f6a35a716b7d8 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/d599a318f03039a5940ea924a821ea71b7e0ae7f | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/cc652f37229ffb750de391f51ac9dbb8bbebf5be | ORPH
  powerpc    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/fe727d35aeacc5561903293486476f2e4620cddb | ORPH
  aarch64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c002fc4bde0c681aae3e53094ac699617a056e7c |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/00de8a397e3a265e3bc5c9016e6bf375aacac8ff |     
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bc95b39682f11c5740ac344af9c131a2b8ec0770 |     
   s390x     |           quota-4.09           | NOK | https://autobuild.buildroot.org/results/7de6acab2b10d1b6b7d5e95104f1f2686bcd126b |     
powerpc64le  | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/caf369bef95a99481c9ce72965fe1e72c400076a |     
   xtensa    | rtl8821au-dfe6801adb9b3a557... | NOK | https://autobuild.buildroot.org/results/13661d220cfa52d6789150625caa9eba65caa91b |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/a23afc06bb63003f2c7ba353ab93080f63f17eb9 |     
  aarch64    |         speechd-0.11.5         | NOK | https://autobuild.buildroot.org/results/4fa136d531bcb2764d8c6bfc77235ccf0bfa6fde |     
powerpc64le  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/49d746bee9e782c6a835326dad597861f7911645 |     
  powerpc    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/26ab7e8d27255aa0ef7b051ed1045baa2181a87c | ORPH
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/24d6c79e7d4c1150d0f6e251de72a3674548aaf6 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/3e199c356f2721a698d54adc7946d9382d462f6b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/5126285f6eece5aa5ce5dc0082c518b29397aca2 |     
  mips64el   |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/816cb34138f3f94dd98608fe2da30ca3a2e18426 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/78accf05b0962c7b78950936dd455d65538010eb | ORPH
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/f4199a2ea9e28697e606f12915f40546db4eec7e |     
   x86_64    |       zynaddsubfx-3.0.6        | NOK | https://autobuild.buildroot.org/results/3aee638622fed5f29871d0bbff4cb4c3fd1fe55d |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

              erlang-26.2.5.15 | 1 
                    gcr-3.40.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/cbcf5ae8ce46becc72176d73dd8cd84533495ca2 |     
   sh4aeb    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/9b04d0abc1ee867c7bfa254e68aa975aedf3e269 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                easyframes-0.4 | 1 
              host-guile-3.0.9 | 1 
             lirc-tools-0.10.2 | 1 
                 openssh-9.9p2 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         easyframes-0.4         | NOK | https://autobuild.buildroot.org/results/cb2e15529340d1dc08ad2a158fa9ed956b3996eb |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/af7b1ce3daf10c8e4f70c5f4c606835e3ad1aaf8 |     
   s390x     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/f94af94a305cd5e99cf0db14c1762394d5264534 | ORPH
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/19d6af333885f6465a09dec6ee09a0fd95750801 | ORPH
   x86_64    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/23ef3d0ea71806fc1ff7e63ef2464bafcf68e31c |     
   mipsel    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/a23786d788b407740279f7c57e597b0c030cfe06 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               openblas-0.3.30 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/22c9c034a273c93b838f9c6ee479ef974b283c46 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/32c9a6f750b06a0ed900ae82cf2ab633e6f96bc4 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
