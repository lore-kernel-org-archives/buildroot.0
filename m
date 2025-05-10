Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436BDC3ABBC
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 03:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC43835EF;
	Sat, 10 May 2025 03:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSLEgPJYqBzw; Sat, 10 May 2025 03:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45FC9835A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45FC9835A6;
	Sat, 10 May 2025 03:10:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84023E2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 03:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69557835A9
 for <buildroot@buildroot.org>; Sat, 10 May 2025 03:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7eMmAMLumjg for <buildroot@buildroot.org>;
 Sat, 10 May 2025 03:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4466A83521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4466A83521
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4466A83521
 for <buildroot@buildroot.org>; Sat, 10 May 2025 03:10:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso20773465e9.2
 for <buildroot@buildroot.org>; Fri, 09 May 2025 20:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746846627; x=1747451427;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lsBinndq7O0k33BMrNFV4vuFAP3MxyxX/K37ywxIccE=;
 b=Og57IOBfQqIM6yseNCCqzRjj6O2iWzCis4CT5EDxlp4PKa+uRbQ147gAvqJblnuWhy
 9kbQD2+wFmYGwfgwonhPx5ZgIK0dBuaw5EJtcfXMObFI/mWFSzuRw/k1vBmIP9y9iP79
 MkNyXnzys87G12AJ2OdfxXZ6fmL3zC0ghrMCngNPablo3fYvSAUMjPgJVu/Y/f6IJav8
 uvb3mwSLNxPYgtRSTw0xbvD0Eo2MLzKyY4L8PDvNP4RL1qemNsCLprnUg8Jd5HmWiYRX
 8FtmmioQYV0FldkE5qO2AbPF5mMT+V1EoD9summ27hhkhKXwVvd3y1EIa+VBaN7y9ZSv
 mWAw==
X-Gm-Message-State: AOJu0YwPQUKzDLXLYI25tTOCWbcjUsuPS4E9txiOuGUzQlA5GtFRYFX7
 hBDh3UuWT5lBBvcAsdvpyfSAdmM9PbqmllenL+cFipPCH0yJZ4VDQKKH8A==
X-Gm-Gg: ASbGncszfRaKctIMebpI21QQwyM6XeLsPyI5wRfZcnT3LS14Ti8uLOe0v7eTpXf4rFR
 /kDCnGZdFrtXlo5tcOioZYaYMIMwUWKD3pSvW1ZAEuH479PIkBW6gmFgzgJ5FahPpjbxBjNoNwv
 sBMTQvLrka0TCj6TJVYsYrizfJ2/F4bTf973irJ/w7TFSYieapoHWtbVrh5m96wieMH05WVvMSQ
 Bsi2DfOg0dFETZC1C/yGijv88br2SnQYi+wDO8/fpbZThIuii+sdnVgr6ZnFd9YbFNQX0vnbFEp
 LBEcG8eBAW8xHC962z0eqXt+FtuUZqQJLTuLesCcNwJXmqFybhzbtOg=
X-Google-Smtp-Source: AGHT+IFGsosdrAyzDw4AKer3/4zdCQmXwoCu6B/+tyErI+MyTcb075d6RTCl7xMJtFscFvoLQzw36A==
X-Received: by 2002:a05:600c:a00a:b0:43c:eeee:b70a with SMTP id
 5b1f17b1804b1-442d6dd2421mr46034075e9.22.1746846626629; 
 Fri, 09 May 2025 20:10:26 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d6858566sm47739845e9.32.2025.05.09.20.10.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 20:10:26 -0700 (PDT)
Message-ID: <681ec3a2.050a0220.9024.c562@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 10 May 2025 03:10:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746846627; x=1747451427; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lsBinndq7O0k33BMrNFV4vuFAP3MxyxX/K37ywxIccE=;
 b=TgK8KxmbR22V4NJ6vKmfY0ywg0ljigBIaBLKAk0yXLINZt2eLQkUYmKQkvdb17BSLe
 cYArU8yiQJE4JF1nh/95HvH9kFn7d7BPk6Umib9xCpFtkm4G6nhLv2Ns2pAdIvOf0L6e
 L4iQskYmBt8PT3XuZRuRt4SGAjLLYYGkkLImWPuYfbMGKwTZ0ilOuuYFBCQGm3QT0/z3
 Mc2y7dll84qn7QYxAwTXTomrS3VftBXVFR3MpCp4WzE/6OAQY35mGo0qBkqV8tGIGgTi
 oCbodhrOUApBHLd409oRVm4QWkZGf2GflupdDoG5UdbZTpsF0ngNnWYbEBthCGSNqsWl
 nrOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TgK8Kxmb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-09
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

Autobuild statistics for 2025-05-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  7  |  0  | 10  |
    master   | 13  | 77  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
     linux-5.10.162-cip24-rt10 | 3 
      passt-2025_02_17.a1e48a0 | 3 
              asterisk-20.11.1 | 2 
                    brltty-6.6 | 2 
               catatonit-0.2.1 | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
           ghostscript-10.05.0 | 2 
          host-binutils-2.43.1 | 2 
          host-dbus-glib-0.112 | 2 
                 host-gdb-14.2 | 2 
           host-libtirpc-1.3.6 | 2 
              host-rust-1.82.0 | 2 
                 libmbus-0.8.0 | 2 
           libzenoh-pico-1.2.1 | 2 
          sane-airscan-0.99.33 | 2 
              skalibs-2.14.2.0 | 2 
                  bcusdk-0.0.5 | 1 
                  bitcoin-28.0 | 1 
             bluez5_utils-5.79 | 1 
                  boost-1.83.0 | 1 
                  clang-15.0.3 | 1 
                  dbus-1.14.10 | 1 
                elfutils-0.192 | 1 
                    flex-2.6.4 | 1 
fs/erofs/erofs.mk:69: /work... | 1 
  gobject-introspection-1.82.0 | 1 
                haproxy-2.6.15 | 1 
            host-binutils-2.42 | 1 
        host-f2fs-tools-1.16.0 | 1 
            host-libp11-0.4.12 | 1 
    host-mender-artifact-4.1.0 | 1 
               host-parted-3.6 | 1 
        host-sentry-cli-2.20.3 | 1 
               host-yasm-1.3.0 | 1 
               libcap-ng-0.8.5 | 1 
                libdrm-2.4.124 | 1 
                  libnss-3.110 | 1 
                liboauth-1.0.3 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.13.8 | 1 
                   linux-tools | 1 
                 mesa3d-24.0.9 | 1 
                    mosh-1.4.0 | 1 
            netstat-nat-1.4.10 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
                openvpn-2.6.14 | 1 
                    proj-9.5.1 | 1 
                 sudo-1.9.15p5 | 1 
            swupdate-2024.12.1 | 1 
               syslog-ng-4.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/7efe6983ec1582d6dfbab5e2a7fa63e46d827cb2 |     
    i686     |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/c089321b0ffce9f6382f701fab4a1ef07056171b |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/83daac537f6de93b980a8ad64bae75da9814cf0a |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/513f2b9ed57c0b043b4bf23dfcba380bf2bdf9e9 |     
powerpc64le  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/278c6f2961c1a4ff6a5e3c2f8dfb6d99044b9747 |     
   mips64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/3a458b98bcefb789bbd3e53b2673e3998ac485fd |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/97b3814c749e314d74e274a99a67ddf1d6af3871 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/5bb4813935934502722dc0a90ed7c92c2436436e |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/823227c9e3acfc775d27a7f0e69f746afef04ab7 |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/9587e4a263dc728376031f719fe86362f783fb17 |     
   armeb     |          clang-15.0.3          | NOK | https://autobuild.buildroot.org/results/2da028f3bb8a111b401e734b8ca62cf7b4521ef9 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7679332a6de4f4f03fc303d548e16d45480da9e9 | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5e11282f31024486f1dff9b840e16011815a449d | ORPH
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/501c75d89d31ea3786cbda399f91de8a0d7b1e35 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2b8d71cf5ef57d5ada1f9f07bc84da171c0b60fd | ORPH
   xtensa    |          dbus-1.14.10          | NOK | https://autobuild.buildroot.org/results/6ba9960a101447b6111ffa04659d68c32ac08875 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a7c65eb21471be295d6ff1c484a6a6904a1cd55e | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b0d10b66b7e342151ac14efb4a6924b51e67a166 | ORPH
   armeb     | fs/erofs/erofs.mk:69: /work... | NOK | https://autobuild.buildroot.org/results/f239ffb08308dc2763b7462e92f2202b4fe68b56 |     
   armeb     |      ghostscript-10.05.0       | NOK | https://autobuild.buildroot.org/results/e6f45c9d5a576fae50fe7eb81121c20802582ef8 |     
  mips64el   |      ghostscript-10.05.0       | NOK | https://autobuild.buildroot.org/results/72b60ffd7f41a510d4543e089a48a4e84e25afb3 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/98fc1df2f4ee728f99268c699ee920ecb0f21791 | ORPH
   x86_64    |         haproxy-2.6.15         | NOK | https://autobuild.buildroot.org/results/8dd3af5013e5e559f2760e935135a9a29be4b714 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ef015b90a2610277f02f656a55107ea7db316e49 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2cfc370d0592fbb141d1558d6b3bb5eefd8677ac |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d066490d7fcc521d02f544ec8f47f4564712e529 |     
  aarch64    |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/91d74de79a3265100284bfed80e4425a1c084b19 | ORPH
   sparc     |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/eab1469535d469ad991a4ef9c1f1a44afe024aba | ORPH
  riscv64    |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/ae9fc7139233ce78654ad1c53a18c66f77f8bde3 |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c12405a0805b773addd6b4e4ea246b4fdd0443f2 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c4b75ea0228b77e6714f2e4c44c310d634953019 | ORPH
 powerpc64   |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/4c33026cbf2cb6b224a22cd65af357a8342d82ad | ORPH
 microblaze  |      host-libtirpc-1.3.6       | NOK | https://autobuild.buildroot.org/results/abca98bc69ac51af3652ab2d0d187d1461f83515 |     
  powerpc    |      host-libtirpc-1.3.6       | NOK | https://autobuild.buildroot.org/results/ad936eb34dc8797e72befa0590e83b7bf03756e7 |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/18a8ddd48bf678147405ae6e0750ce64b2d67e0e |     
  mips64el   |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/66e075e79cf47efc6a3efbba38b6b47e84b0111d |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9f0e7e6f51caba6130d0a404812c17008f79a49b |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2f7eaa090c99c36737972cc22f4c1e5ec9467b6e |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/83560d4be287e9def03ec42a9b7d41f31529fe79 |     
 powerpc64   |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/a5110dc17850f81e8e8765876a52b1a940e11ea2 | ORPH
    or1k     |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/821464af46c81437ead67fce6570eb2f0f986214 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/bc15641d69183fbe77d8e72bd936963e92e34c34 |     
   mipsel    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/48359986da2450fdb5e2bf15537a3571453fd39b | ORPH
  sparc64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/46748d5a2992a456807be6a39ec664948267569e | ORPH
    arm      |          libnss-3.110          | NOK | https://autobuild.buildroot.org/results/a843b1911e0a0987da4cb5b92e49318ee98f0482 |     
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/0521b956a605b68af982282046d935947cc98ca4 | ORPH
   sparc     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/3ea0dabd8d228eca552cfea7e26452a25b358965 |     
 microblaze  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/7aa3ca33c53ce9feafe8149fa416662e28a49189 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2ed8f77e73a0a9f2324b6eb18872a9fa68b694dd | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/857dde6b4049ddf56b758bdc8913ff809a262494 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d43762a3c71130403fc2ddecced01bd5d82704e7 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2c96c3661e0b84313430ec9890b2dc62713ca723 | ORPH
    sh4a     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/f5962b2a0a0be36ca91e911c4e50c655248edc86 | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0289eb1a52379c30078ae5415735516485f44586 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/e9b568c1945d3d88dd929e59e07327a7db5ebd36 |     
  mips64el   |           mosh-1.4.0           | NOK | https://autobuild.buildroot.org/results/c66c7e81d6ebdeb5378e2cdb32021e79e7d8f60c |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/0f44d82ed294ced2710dbc097f04c734039fab9a | ORPH
   armeb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/9415b5e6476889432d78ef923e7288f71726abb9 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c139437fbf83ad3afefc7df2bd77129ee6b17fa7 |     
   s390x     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/fe5eaea7aa06beda606825cdd0bb11f172fc62ec |     
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/b82f89e89f348ae4ece8ef7a38e1ca657a6ebc0d | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/266923dad9bc8a3f6c7dc6affef8c0f06dfe7c81 | ORPH
   sh4eb     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/11523dd65a3dd4d56528a6ecbac35ed4617cf6da | ORPH
  aarch64    |           proj-9.5.1           | NOK | https://autobuild.buildroot.org/results/c6fb64d571feeb818ea90ace49525c1c14faeb56 |     
 powerpc64   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/a5b0669d1ee5ac0768e7bcddf9e324405eeed134 |     
  sparc64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/137d69041cd448e16a2bb45a4840606e82194ec2 |     
powerpc64le  |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/013ee518d91e52bf4512f14d359a517f8c55ab6c |     
 powerpc64   |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/08f42de0872031b5a8bd1d0aad606cbe11a9b799 |     
   sparc     |         sudo-1.9.15p5          | NOK | https://autobuild.buildroot.org/results/1139e6c6ddb3486313701623df10f56477ed442a | ORPH
  aarch64    |       swupdate-2024.12.1       | NOK | https://autobuild.buildroot.org/results/dad1c55609689ad40d9c1776a3a8bb0299e8b261 |     
  mips64el   |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/bfff1c5e472088f4ba1b75d3143461c43e0f647d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/41541d27cca976ee6dd369deb3e9d5f768debcdb |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/c6524b683a4d62ebfc0d9b4c067ef33189eb6fd7 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9b70e058e16c6552fd0af1fdf302e777a8f942c2 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/5ee2fb5d5512bbe60e3d05dd0de23f203c372422 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/75a7284e6c27ac1d272fd5be5125787c6369a674 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7296824c9e15079a130cd0f064e6f07d03c27fd6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 3 
                       unknown | 2 
                elfutils-0.192 | 1 
  gobject-introspection-1.82.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5c8fae55b5f0919065186f17dce76ab120307f80 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9a1094e10c4730af2bfae077dd5d2a9048ea2a25 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b2526436dca5568158c028c21ccdb87689f4d04e | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bf83aed23ece78ad58fb80e814a6e2ec96d642ac | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c8ca824ee5d77494e129f2199e213e64ef1b40a0 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/ba908d7eaf7f4419c980b00f87751f1d1843dc13 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7174951ab098f6c9c654caa1b953d0a4afc9a680 |     


Gitlab CI results for 2025-05-09
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089402  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089476  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089482  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089484  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089490  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089542  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089573  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089602  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089609  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089615  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089617  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089628  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089632  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089639  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089641  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089646  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089759  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089767  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089770  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090010  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090208  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090261  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090316  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090331  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090383  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090395  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090690  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090967  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090986  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967090994  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9967091040  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979553665  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979553827  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979553918  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979553956  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979554005  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979554226  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979554725  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979555536  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979557493  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979557785  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979565424  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979565671  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9979568514  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
