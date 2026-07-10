Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476DCC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 03:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA75D607DD;
	Fri, 10 Jul 2026 03:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdF0yranUP-L; Fri, 10 Jul 2026 03:25:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E7C460705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783653914;
	bh=TCKaphKgIQjnxPr/mH19oNhiWXrLUeLIvciuBoruyuQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dn9o0W3hXAADYEmSiCUnlzUNLdztpJF5qVPpKaIexhkg0vwXj+IYw7InelZ49Ec1a
	 kpDz+yk23qKPpe9A9kS9OtiTOk5cvno28n9Q8mREVktUz7rFkwkJb7ymh5AHZ/lL/d
	 mTfHrZKPY3Sfzc8MLTVc1QEQHHQqJ08p171jII6rMvXn/LcJZpm3c4AC0YeR9CpJGC
	 JheUEhQddcXdPOf/yNYTvBIf+GDVVGiB+WJyn+7zZLp6rLa5paH5ZAKZfCkqFUeGem
	 /Uin+E3I22rtcCcZN3DH3lFWYm7KePfo1mA7Aer9NDM3yyAq8lI31NSfz5gI5KtHXZ
	 Fed4YyOeteA+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E7C460705;
	Fri, 10 Jul 2026 03:25:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BD50A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 03:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43D048136E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 03:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqtfflkY8U5I for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 03:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06B3F8136C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B3F8136C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06B3F8136C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 03:25:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so263160f8f.3
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 20:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783653910; x=1784258710;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/zI6ShKNi9ZAFnIAL8VBFNdXIVLBMCtyRO1uabgzoUc=;
 b=Xcm3EZZ+iodHXIMFszhjUvnFYEUHJyYBujoOCrsXaxxGQn4lgcDYi9Ns2VPLIte0rg
 WoJRX2gq3n5ult6PEVCkrSEttJ5ZUhF14r0jqjCX+/iK94MBkasC0gM2yQi37bzhvFIi
 YjRB/cGZcz3rDhxHAmQbH005BdevGRuVqJdO1mFYA2b9/9+7TLL2rXKSi8BL2chVSjtS
 AqIeFZssY/kKuzXQ+XrKvSvsqKt46UvGASmbHdiYnB8BYWT61YoXQTs50gN2rm2D1YMd
 2NcQHYejSNbnzQgzOzvzVdjDXYJKY6Ib+cTBwKJUi3Jo/EI7ipupICkPLNqzLCdGaJ5g
 wPQg==
X-Gm-Message-State: AOJu0YxeFrK+kCAPhx4MEi8IBuW+i6Ku7UTQLfwVoj3smdrJkD0EDY6D
 sAb6OQb98q8KTHNn+8oRt2B0sxHkHnQaE1h3uqKEbRlY98b+SMztJKidvqKh+NGc
X-Gm-Gg: AfdE7cnfKwL1wx7DtcnmDHGJ51Yl0tPm4zWn0a+9/Twz2zXMY9Z7hWlqyLJQnSMD9XR
 wnQMqjNiUgxoDxVIerM6AEpF5anW1WtxY3ytxWCxi/v4qqqNXRYBYGl6a33uEG+Ss2B4llWQbaM
 5p8RGC76HphU9Sldd10jypsahPrGNK/z6lbpClehdcNpwLgCJqTRiTe2NQPxp3Jpm72N3Qmpgoe
 Pfv+iBURCseTusiWXRR7wCITRtbgNFGgW1hNDAid0ht7ZSYjI/d6syaQMr04PcuiYJ3noHiAwZP
 c/a7VVVtUU0ZZ7FEbuqT36GJ98exRAk2GqTbMFFoiqRsJe1/a8vC2RX1eIfan6StAW+cjHDUBtS
 B+H9TpftktN+RbESgGR2n2Jx0gqMICANWwWNBqf5MuDcGYW1s232xCtG+prs1XKppA+behPly2s
 wbrXwHTZ3f+xHCLQk=
X-Received: by 2002:a05:6000:46d8:b0:47f:250f:7210 with SMTP id
 ffacd0b85a97d-47f250f733bmr660817f8f.49.1783653909599; 
 Thu, 09 Jul 2026 20:25:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d905sm58562585f8f.2.2026.07.09.20.25.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 20:25:09 -0700 (PDT)
Message-ID: <6a506615.464694de.1a76c6.7d6d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 10 Jul 2026 03:25:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783653910; x=1784258710; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/zI6ShKNi9ZAFnIAL8VBFNdXIVLBMCtyRO1uabgzoUc=;
 b=isJ2d+g5zfx/PAQs33OFfiQGRGUYVU0JYncCl9s8bcrrzVwvO8q0RI3MmhRxdZ8tNN
 uFSMSlSuhX03/4WtEDPz+hTJk77nOO5sOj+Xc5M2f1y8qWpc9AFioT+vgYrAmMwh2AtB
 CLixCNF0IupybSw43tIDrgEt3DF4DN7gm7/z2C9zyuPJmOH/t2d8gFqaTaciI4kCHart
 O9wVueCg7e5FvIvp54qmCJ0Yg3vzyk1Y7jzVkvOT3xR4TjkAMd2KeCEdsZcTNVLwFR7C
 /DDZC+1XGOA5zxXw1JxZOOHu26dL5YUJsuSu61XtcrZ55AeLWZfos686Ko855GrDg1Nr
 5/pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=isJ2d+g5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-09
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

Autobuild statistics for 2026-07-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  5  |  0  |  6  |
  2026.05.x  |  1  |  4  |  0  |  5  |
    master   | 20  | 43  |  0  | 63  |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.15.1 | 3 
host-vboot-utils-7dfa482d6a... | 3 
              containerd-2.0.7 | 2 
        edk2-edk2-stable202602 | 2 
              host-pahole-1.28 | 2 
               libepoxy-1.5.10 | 2 
               binutils-2.46.1 | 1 
  distribution-registry-v3.0.0 | 1 
                  ffmpeg-6.1.5 | 1 
glibc-2.43-45-gdae425b55420... | 1 
  gobject-introspection-1.84.0 | 1 
         graphicsmagick-1.3.46 | 1 
          host-binutils-2.45.1 | 1 
          host-genext2fs-1.5.0 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
           host-python3-3.14.6 | 1 
                  iozone-3.508 | 1 
                 lcdproc-0.5.9 | 1 
           libmicrohttpd-1.0.5 | 1 
                  libnfs-6.0.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-7.1.3 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
                 openmpi-4.1.8 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                openscap-1.4.4 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.58 | 1 
uhttpd-15346de8d3ba42200249... | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/1bf0030d59bc6282814d9369551a8f206e388c2b |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/89e194f62cda75447117599d74a24a91f92df53c |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/df1398f19278a7e739e9e3ee0ef6b30e8f49e190 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/174c295aa35b026caf1a4fb1019662584f76e2a3 |     
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/542fef2b8ef54feb72fa368d8648ff9227024108 |     
  aarch64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/fa942c80918fe6cef3ef00663050cec00b181aec |     
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/e82bebfb5e12119b5eb6e38f6dd149116777fb0b | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6adbde94b0d5215aebbab8a26e272e1e376775f2 |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/5836d9b2a1f2900d31a847ed7bc89ba7ab39b506 |     
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/5b9333c3e9a76029685d48c3e5ebe32b33b06bdb |     
    mips     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/e7b73d2a270eb2c8d75287bedb30ff8cbc0e1b67 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/407466f1287baaad3ae7c54a17d6aeb5b9255dde | ORPH
    arm      |     graphicsmagick-1.3.46      | NOK | https://autobuild.buildroot.org/results/140e070e2a3f703209dfecb692672458dad69b55 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f0ae064c2575b62aa8f404f1148b43792e928c3f |     
    i686     |      host-genext2fs-1.5.0      | NOK | https://autobuild.buildroot.org/results/16d621d481ca1bdc16de846484c118aacf58db2c |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3671fa583249afdceb8be813c8fc8e875fbf275a |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/54daf5ed21b641ed0892e155404ed001c0d8825b |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/afc9cf135bd5cd0bd6e01b96792b00081af03eb5 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/13e37fe96b8f1dc8cf5a40fffd926f5db515c888 |     
   sparc     |      host-python3-3.14.6       | NOK | https://autobuild.buildroot.org/results/df2c588bcfd549ff5840a748d7ed16e5c00b4de8 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/97dde037faf30480e3e3da625d953d738d5852c4 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/e1b583398ea93d26e4e20f797c3e3e3f908fb32c |     
  powerpc    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/4540ae97996d65b45e256a583ed3befeba9616bd |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/409bd85b7cc82b90997fa20f2df376f846e35b2c |     
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d2bc5342eee3bfde61819a12649259e576eef90f | ORPH
  riscv64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/7ea4442bd24b21a29783cbecf6b48baa38ad82e4 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/0313a802b9101be2af8f123fb86e2786dc6c632f |     
  aarch64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/0c7b9a92e641e2224031d773f52472257bd48fe3 |     
    arm      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0ab34955a9a7dc484b8966b657d0a1fdd9f14d59 | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/940b4362eefd071eb887ff2c439077da1139cafc | ORPH
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/114e95f97ac1443c20d1701c5e4fa3c4c67c2425 | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7db6862bf2a8efa1a1ad348ed50153c727676b91 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/3e5a9a4c3454ba5ffca50d831a21227d34827b5f |     
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d53981c9cfdf8f8b4f336808dd9410edf6eac8ea | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/cd2c2862aacc230cb1beedf0d3257be61a36ec64 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/89426cf0b73e4c44d05d35847458f7a6a59baf37 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/e2603928836eaedb4b4c2eb3452d49756ce075c4 | ORPH
    i686     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/1bc9066297bf3621a4e1b1afef572741c3342aa8 |     
  riscv64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/82b42ba8b414be7b9a54a3af2f016e715e46e391 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b10daf158c6224c5748b8b732206ce660ab9f8f9 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/f54472528c07c257901832bf45469726bdded98b |     
    mips     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/04761a201df43d7befd74d1c894091cf4984c499 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/3dbc13972fe0c31584cbc9d9f928ea0d13a1ad4d |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   gvfs-1.57.2 | 1 
               openblas-0.3.33 | 1 
                openntpd-6.8p1 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/7eaf56ca3b26dabf324ff0dbe75267ab9e92bbad | ORPH
  riscv64    |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/9d296fa4352c434bfa8050b8dbd801bae4319b50 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/679e6d87404e91b9018e514901caa69fcfb026ed | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d4d80b33e55946b9fe25856d7388750101f1cf81 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               libepoxy-1.5.10 | 1 
                 libgee-0.20.6 | 1 
        ltp-testsuite-20250130 | 1 
             strongswan-5.9.14 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/92b85bc0acf1c39449931b13de22edda4687711b |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/9f2847e02781461631aa89f6a929610684821a8f |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/74f6ac967a6fb2eb7ed390511ae20c0541bb2644 |     
    i686     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/2022a3fc7a3efd83c7b20056df456218c443e68a |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e158133d9cb35b837ed2a85d7ab399e03ffa0c40 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
