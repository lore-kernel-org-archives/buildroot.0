Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375ACD3ABF5
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 04:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F61984858;
	Sat,  6 Dec 2025 04:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaWLwpAFfH9G; Sat,  6 Dec 2025 04:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DED88485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764995246;
	bh=pygBvbltAJOX9d6BmQAvjlnIdm7i9Jl5xSwtZkPyUoA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kexykt+ohFww3KuXuFgYpGsJrbtmykAXaRox8dB+ai8hhwArIeedpHreHVBZdkdrW
	 w3XjRfsVt2pPBNHCA4ermc9YRd+r0ospTjco4xgcosPDFbDd4hlG+049IN1TE+YI5N
	 9cNAYBlgiXcmZl5nZOjGv69gFuZ6HYavW6mlx5LXPcPTBVk4/NhAoEMP0ywR0CdnvX
	 t+OUEH51mg+PgtxmXVtbz5hZzzSNgYNHjl73/zBtEmc7muX1x+DzmkrBwQEov3BNUW
	 CQcrUkb9M1ch+u1OkhTaQnVjDNpLyLBOt/5q5nhwSZ18QdnQYyDWtVkdmHpAYVc4Qg
	 WcT5lbBqkMfKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DED88485D;
	Sat,  6 Dec 2025 04:27:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE9F1A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 04:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2187608D6
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 04:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7tElVauW8es for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 04:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 634D16084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 634D16084F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 634D16084F
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 04:27:22 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so37071155e9.3
 for <buildroot@buildroot.org>; Fri, 05 Dec 2025 20:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764995240; x=1765600040;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJkBA+dm6FjVtCE9rvZqZZbLEy4o2OxHtfiG4KHLTCg=;
 b=o1GhQpMnlQnQr8sVbEzsFKfqYOH1fg84W9UiIgathnZQupAMwxp83B7WJOklJTNfqZ
 4k6SNZSt9V7Zrost8otEnYCQ4ZNGk56aaikIGSr6MJOxVyK8ciJRVRVaLfn2gXieqfny
 Hu4xVXX4BOunASR2Agg0573Z4YgVlUXhVgbvDb822WMLvTuqoQDhJNyn4ZJ1/NkDcZC1
 dNJmXBkxOFuWmNFrTBgww1Y/SF6h9Uf6c/NAtqVy4kIy+0GcSZ/AB89v7jySs56Cq1QT
 brk+tuoeLWoG4RsjxsX00CfyPgFqxoOkdOEdGpPZ2BpCz4T5LO69irgAdafhLqONnk8Y
 jr3g==
X-Gm-Message-State: AOJu0YyTe60nxoDmR0nuTPZKvETfGUq0FNvxaxMn8/Yz+iJgOC3ZRCMj
 u4g5tgsq4MFuUYR3tdbCZjI/YW1a2uOWhJM471v8AmvDZBRupJ2aKnmq6M2T0w==
X-Gm-Gg: ASbGncv4z7ekz4bsi9hVbcRF3It1EWJok6jz8ErMsY9KfzfOAqwI61VwF1pj8KocUuO
 SzsAJP8AbcGWZujf9e5Z3UZ2GrqqcU7aQ8lGLFJOfVb2kmBfrPp1LIzy+ipGrSzVK7yrZoo/SoJ
 qvRQLAOzLZwfG+RhYkoLcwmWIAUuvsvSl6G3HnsQaXGSAUlcyt0M4t8gnMTCnuoeEI4suWPPjba
 JPV98h94BotanHnIglbNZWXq/47GSwYWZq5sZWIXS03L7bZBHGpB4wYWmP/ytEs9JCI7NHZHRFc
 S9XFt8ypWDMhEoah428LgRD/m0pyAYzIMaGJNtlaMkdciAdKpPYgHuc0TOChQsNv8k5hxjUaNqk
 lwlCH3Fr4Ftc8pgw/EjfAAhWpzKe+FsU4qbbmyBiEDcvmWlT5Zu3FmIYR8CsI5ndIArS9qAYofI
 CWpuS2e+kvtQaKhaVT5w==
X-Google-Smtp-Source: AGHT+IFrp+pHYmgcPlsoTwxEEIHolYONYvlqg4HJhRYg4n7tVhnlkudmizefbq6wzHFSYc6wv3hUig==
X-Received: by 2002:a05:600c:350b:b0:45d:d1a3:ba6a with SMTP id
 5b1f17b1804b1-47939e4039dmr13349255e9.33.1764995240009; 
 Fri, 05 Dec 2025 20:27:20 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4793093ac44sm121927385e9.8.2025.12.05.20.27.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 20:27:19 -0800 (PST)
Message-ID: <6933b0a7.7b0a0220.b20f3.92f6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 06 Dec 2025 04:27:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764995240; x=1765600040; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GJkBA+dm6FjVtCE9rvZqZZbLEy4o2OxHtfiG4KHLTCg=;
 b=Y7hfwNt0T7qcYMX8k+b4BxmF1oqP0pEwH3l2Q5g8W5gpN3ZvPhoCL3Lz/HtloF42Qg
 5TupjJN693czlJo1IpY96ptcizAuXXcVRZSQWKtEVHgJj7Z4sS+Q/vYBDSXv65XqfaND
 mBGUGPofxLSAfq5PDFdY6wy7Jd4WdMHyrpe+Qam0oAVwsFcgLxVAKvDokCS+ZfVRXdIR
 SJRxmy6YYKs2qKmWgatMj5w/sE2HvoqdHct+VLVRMcFDJEnrdkEn95BcV5IoRV0gSToI
 BpDdKciypoi5bhMBQtRM7A2pWWhzIYkF2cMQguGW/SKvUZXMZdcWu0NjqDitrOh8VTzb
 swBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y7hfwNt0
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-05
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

Autobuild statistics for 2025-12-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 13  |  0  | 20  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  2  |  4  |  0  |  6  |
    master   | 36  | 69  |  0  | 105 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 8 
                    mpir-3.0.0 | 3 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
    host-mender-artifact-4.2.0 | 2 
                netdata-1.37.1 | 2 
                 xinetd-2.3.15 | 2 
               alsa-lib-1.2.14 | 1 
                      atf-0.23 | 1 
                    brltty-6.8 | 1 
              containerd-2.0.2 | 1 
            cppcms-2.0.0-beta2 | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
              e2fsprogs-1.47.3 | 1 
                     exim-4.99 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    frr-10.4.1 | 1 
                    gcr-3.40.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
                haproxy-2.6.22 | 1 
                 highway-1.3.0 | 1 
              host-guile-3.0.9 | 1 
        host-sentry-cli-2.20.3 | 1 
                  iozone-3.508 | 1 
                 libbsd-0.12.2 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.86.1 | 1 
                libglvnd-1.7.0 | 1 
              libmhash-0.9.9.9 | 1 
                  libnss-3.117 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
        ltp-testsuite-20250530 | 1 
         lttng-modules-2.13.10 | 1 
                      lzo-2.10 | 1 
              mariadb-10.11.15 | 1 
                    mcelog-194 | 1 
                    olsr-0.9.8 | 1 
                 open-lldp-1.1 | 1 
                   openrc-0.56 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
               python3-3.13.10 | 1 
          sane-airscan-0.99.33 | 1 
                setserial-2.17 | 1 
               suricata-6.0.20 | 1 
           uboot-tools-2025.10 | 1 
                       unknown | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.14         | NOK | https://autobuild.buildroot.org/results/d65379890f67dab7633cf371c129938ecd397c7c |     
   mips64    |            atf-0.23            | NOK | https://autobuild.buildroot.org/results/1dc36f326ea5cf46e4897209814c99d980902232 |     
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/3c4684cc01c481192bed43340fa516daff848a22 |     
    i686     |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/1cd0f02b48d29a0d9bbdd7edbc6a92f5104525c7 |     
    mips     |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/9c34a08ea02499b28093ad3fa184cee10b2883ac | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0195b61a6229aea4aad4fdf441f166f5b8b9efd3 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1ab14698b4fba88443621e375188502a86a037c9 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f8777ca1edbec8dc25cf011c0ba5bd62943ebdf7 | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/31e6f1eeee79940f445c9cc57870710475d5547b | ORPH
    sh4a     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/72914a0b15bdde072711cb0b49b21e8d25afeb7c | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/a54f5617b843e7f366a9ea20182c575e82f509c8 | ORPH
   arceb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/f9d36c575b3189c4d78de39a87be7f9508c87fa9 | ORPH
    arm      |           exim-4.99            | NOK | https://autobuild.buildroot.org/results/e067b27ec35f551779e1e893603e6fbcff3cc4b2 |     
    arm      |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/1c0a3948118c075ee1e3ef8539075d5953ab243e |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/553d3595947b3e23ecdabef1051c0557ac03f287 |     
   xtensa    |           frr-10.4.1           | NOK | https://autobuild.buildroot.org/results/ae11d682af1f2246a5e7d4a0cf10aabb78373eb6 |     
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/e68cc291aa5694e89f01fd24c8d8cedf63199ab1 | ORPH
    sh4a     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a2dbb5f79b5fb25daf7ed67d83ff410871f2a958 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/c8e4d5c8a902d617d284fd7aa5ee0a6698ab911a |     
    i686     |         haproxy-2.6.22         | NOK | https://autobuild.buildroot.org/results/b4177b38e594943e3351d4e768e01efae7cd5db5 |     
   xtensa    |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/be4942b410a85527de55c9aa3c2c94d807899694 |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a7f08763d207237a6b06ec30e0939f52b9d88bb5 |     
  aarch64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/cdff16a561a4b910099bbe43e56bd7f176c905d3 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/1968c76862f6a1517c0aa8da7608cf2a2715492a |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/30a22cab8450b9c34f6024732e830710bc3b53f8 |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/cdebb849afb48b8f6c07118c7f145492a2884b71 |     
    mips     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/770dfe23a5b6119039ad191ce0cadbede1ccc448 | ORPH
   mips64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2387754585a2b80af32fb9d03e2c554900fbceac | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/6a8ff3ad8fbb40f79c3468ecb1d99c8f1cc163db | ORPH
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c18bc5f133dbc1f9886a7e5e324c242059eb9810 | ORPH
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f07543700cd4c382f0e3364a19f621904c1fe3dd | ORPH
 microblaze  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7cd1684508da412f6263120bc74e1d0665b036a5 | ORPH
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/8d68eaf343f19a395de4cba14faf98752ef56c95 | ORPH
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e6f3df4ef852a2cd7051c2dde797b2bc1d8b54ae | ORPH
    arc      |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/9ac14cc574b0f860b8df14be6d4a9cce247bf953 | ORPH
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/6b03d53270d355bc2fd79b242c651fcdc6db7d4f |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/93ec41d4bafd4d5a105b47b7a5ae13a1abf1c2c2 |     
microblazeel |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/77d5f1a31f017b7225b5bc62080ce39a246a5ed4 | ORPH
    or1k     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/fffc3202a105be55e0ba782fc8f47951006ad87b | ORPH
    mips     |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/076ba510efc9cdd078d93d228e2dbfd3fc7b4cc3 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d347dbfb594fd535ad8ab498e10729437a51ef76 |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a5bff72b6c1c9f2295f3647604f5535a810a7cf6 |     
    arc      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a944eeeceae2fe9c6eaadaddf8d887af8049c4b5 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/39ff45655cb438c61cce4398edf440a924985112 | ORPH
    i686     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/e2de95e85f2b51437f5be3c1356a29a6c0f500ea |     
    arc      |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/f73258677820d4b6dbf092c1f1b3d309d6f32e71 |     
loongarch64  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b74ca0669d928972f022a4ee8bd6be0a5ca4851b | ORPH
microblazeel |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/7a8e27408951b363fbdb3efc79190c1e35f19ad2 | ORPH
    i686     |           mcelog-194           | NOK | https://autobuild.buildroot.org/results/8e588aca384485d85ae62394334ad9fcd70805a4 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a883c142c108231379c6aa25a48eec2af610e25f |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ec89ec45b9e7fe4232114541c1fe5e13d8940f05 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a7d46ce5791e509a23e0fe43685acc1778350f94 |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/11819a6eaac0d4e85e3fea44253a897894862818 |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f013f6c55e7fb693df1c0571ea92b819e893479e |     
  powerpc    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/aaefa9afd08adb72d057620ffe2651bab511bb2f | ORPH
   s390x     |         open-lldp-1.1          | NOK | https://autobuild.buildroot.org/results/072aa8758e5396b5920b4d2ed7cd476bbd69df28 |     
   s390x     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/7921ec9779a55e69faffa07f4727ef7fd26f463a |     
    sh4a     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8c194e3727a6a46fdfd9c14f41e4f50f3a97ca48 | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d8a11efc19f5cd1f5cbef5c04148710499b7730e |     
    i586     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/7eb5580310f07853cb4c23b5e7d0ba3c454e641c |     
  sparc64    |        python3-3.13.10         | NOK | https://autobuild.buildroot.org/results/14ae8c4b76de939649be5ce69f27f74fd718a66a |     
   mips64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/daf345b31c6b5f7415a59d7673117b40527129dc |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ab01e92d811393187b1cc662248dda988b94a083 | ORPH
   armeb     |        suricata-6.0.20         | NOK | https://autobuild.buildroot.org/results/9e757cc8aa03cb99ba61425de029786e47ea7070 |     
 aarch64_be  |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/6151f5c23f3ea6a96bf30438bb942676c54a8344 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/a737579d6f32c1da9e0e7d00f5edc668f2608c58 |     
   armeb     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/940c20eb62c42279a2707dfdd226445493ad0a2c | ORPH
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/441bf91d5859e617e18b346c016acdba6c9c8686 |     
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/4e24ee2988012e3a978cfa991bc8babe75a1da9c |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   atop-2.11.1 | 1 
                     criu-3.19 | 1 
                   cvs-1.12.13 | 1 
           ghostscript-10.06.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          atop-2.11.1           | NOK | https://autobuild.buildroot.org/results/82ee343dd8ea8d36db340a2da5b73ace28c226dc |     
   x86_64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/242160b74b4a037215f76a06aaf407f072a9b220 |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/03d0b19d4707a6f7e8f98d5461e06f2904caaf54 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/e63ee3ac719a9e8d9558949653f16a69cc96f575 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 1 
               freeipmi-1.6.14 | 1 
                   fwupd-2.0.4 | 1 
            host-binutils-2.42 | 1 
              host-guile-3.0.9 | 1 
                  iozone-3.508 | 1 
     libphidget-2.1.9.20190409 | 1 
                 linux-6.12.58 | 1 
                  mupdf-1.23.9 | 1 
                 openssh-9.9p2 | 1 
                s6-dns-2.3.7.2 | 1 
                       unknown | 1 
                    ytree-2.09 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f5d7d59207ac430fd0afea1e38bd7aeb751dfaaa | ORPH
    sh4      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/dbfd91606d7de3ec9e488bd42c30bd5e83ea8c4e |     
   armeb     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/db45697d1b8820580d6566d5293460b69d0991c5 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/61407a136c91aa500eb4d8914555670df87b53aa |     
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ce53ab2ae2e790f98d2e302fd69fe7a656bcd33f |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/07f35ea4be50c7daed9f24fbf377228d93c11e11 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/80be4a39e1788bd3b4e5f487448130aebfbbbd92 |     
microblazeel |         linux-6.12.58          | NOK | https://autobuild.buildroot.org/results/b2a709293460b853f9b7f6c5bc301e8ee6a5a48c | ORPH
powerpc64le  |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/88683e151de55d8446e6e7b54d378e78f2dffd48 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/61da22eca9d8b8a51e283a2cc81eb5d212835d32 | ORPH
   mipsel    |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/7ba55e61ad71ecf57a361b03c0e89c079deac7fd |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fef8c69976992cf66c1e803f0618f87651ce8a28 |     
   mipsel    |           ytree-2.09           | NOK | https://autobuild.buildroot.org/results/5e72f84a997a508807e88863e99caac3c752ee34 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

host-binutils-arc-2023.09-r... | 1 
                libcurl-8.16.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2e7918fe1e031099e639309ce2741d40e39f8ab5 |     
    i686     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/0c3253bb00674ac69e91ce7a8ad027b18c4e697a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
