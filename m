Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D37D4A5F5
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 06:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D086C80C8B;
	Sat, 17 Jan 2026 06:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqL7Q0XGqWN6; Sat, 17 Jan 2026 06:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F39080C96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768629879;
	bh=0MNflRpG+t/xffPL7wWL/v6UKmNdDwW4J/uNiTR7owA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rpUIRI5tMzHNXqvuWq62fyR2QtyCblcS3BuoANrljDzGO5O66Ja7nFGjfIwwOF2aR
	 Lp45bf/QxKC/G1mjZkldVD2JTuGy9fLjUW5fKju8wJ0kjRAvT7CmRerNkGdFvIDSt6
	 jwhKBDG09LAs8v9OhNvk7MjcqbY1r0cJqJLxSS9E/ZIGdttEQIvp/GQYfV3wNxtrg2
	 aU/Ns1sihAt/k788FgP3V2/5qgtxA7/c+eqlOUnLYd80dTXZWAvWkvsGMxBbGoYj9W
	 VYdh1uK9vGGi0xjfulA0hiBCEBiHIQ7TR56aHdaN+Rg+jVfIeW4dkD34lmgEA4UHmY
	 HVyXbKUoim99Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F39080C96;
	Sat, 17 Jan 2026 06:04:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0AE8223
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 06:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC830610E0
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 06:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBQPNrijva_W for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 06:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34C10610DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C10610DF
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34C10610DF
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 06:04:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b8719aeebc8so506652066b.3
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 22:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768629873; x=1769234673;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVe1f810wMJzRQ8xcgQgmkLJcOFuUX+a/XlDSZOZq14=;
 b=nP1IGdiA3oSdUwfwKFGZsixvzjwRJOKF71M4ytjPXBlHQ4ZUrqyhQgLomI0obRueX0
 B4M4/cnJTKWJxWxajC9mjl7muQk1eub/iw/RdZOlTcNY7nal27Zu2OS9GyuBhLibLnB+
 d3DaZb72vqbuqJoHEVARd85ls9abCEp7l3NV4H3XXuOpWDNJa+mjjoR7goWBgl3uz818
 Qsx385rqeI0Qi5FRJOSmKT/ZTxfw//fR+ViLvyun87jFYcFW59Y9zrFDEUXA6J6V2JOf
 3NeC/MQ9C9lChCGKexkIat74q/ur5bNbxAe34UjOSvXVScm/4hjs2NmDzcj25p5oJBlV
 0FSw==
X-Gm-Message-State: AOJu0Yw9x/DCCUa2hdeQ0VOYq+WNvaZW9ZhbMp4xlhQNgcMAa07Gxqp/
 lq3jRb1Oo8gjI/6eIDmlvfAN1YjFlITztGmacirgJzMuKQVC+vQN5Iw1JlFv2A==
X-Gm-Gg: AY/fxX47Z+AL/5esPAURYzmeXv/ScaVi2YLBcROkjUoYo0nnc3nNb3q6Bh+Wy40P32Y
 OW0yKBvrYwH+NASGtuRc1/Wcjghq+cncPsIIrI4IwuVTsOX/mcie+GaGl/XzBlRHEcu41PAd9zd
 HmXNu9ULyS58X3eq9+ueN6Lb0OZ7Vs0dO6AdddGdDv6DS8QFq9ZWwhAdd39XH33L84uKWmoJGSj
 +68nD1R7U9xngKRxJA/HeAIz4FwK2CSWFpeCTjZtdQlmDCODuPLJGdOKSupZwwAI38d3KVnBf4d
 T+4wU3hcSyrNX6ZCxJZrNaycvMWfnW3kiQJETr+vTIbnJ25VzRHCsumwMT8JhaYpqBcQw+GolJA
 yFABmio0Spxw3k2eWAjKmZGTjgJS7noz7VdSzQRgWNd0XFcWWLdIyG5FSYqMj72Xd9JSlNDESfY
 XLeMZK9jJsk+vuAsLpRCMob4kG1kMD
X-Received: by 2002:a05:6000:178a:b0:431:53:1f49 with SMTP id
 ffacd0b85a97d-43569bbeee2mr6394716f8f.41.1768623451252; 
 Fri, 16 Jan 2026 20:17:31 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356999824csm8541460f8f.39.2026.01.16.20.17.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 20:17:31 -0800 (PST)
Message-ID: <696b0d5b.5d0a0220.314150.54fd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 17 Jan 2026 04:17:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768629873; x=1769234673; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bVe1f810wMJzRQ8xcgQgmkLJcOFuUX+a/XlDSZOZq14=;
 b=bxPEc3gWuv60/ioOtj/tKjv0Y8uIzerJhw299R5h9zQYBSA6rkXHxQKcom70pRmQb3
 VwETxXMrRTAE7/D9tU0caaG+ffAFEI6y+NaNroc8b2qtEeBft4BiaGf+J6y5x8h8vqOv
 jz+Kbajo92K3q1ATx1tr8QivMD8/9J1whOgDDoJiAa7Oxu/EHgDyRszfQkdGCorfyTFy
 XWHjxd4sgalOL5PKA1kMEon1ZSRF2LUjNP4HrCQcRvwR5rbiK2JGLxc3y9677TJLDj7O
 BAJRXi9Whl3eg+/PC+pJG75yF+gBy7HvpcOF9M26WFwaAqKUfCJZVhLq7TnONvX9ZLEM
 sbQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bxPEc3gW
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-16
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

Autobuild statistics for 2026-01-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 18  | 30  |  0  | 48  |
  2025.11.x  |  3  | 13  |  0  | 16  |
    master   | 43  | 120 |  1  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 8 
                openobex-1.7.2 | 7 
                 jasper-2.0.33 | 6 
                       unknown | 5 
                   cvs-1.12.13 | 4 
  gobject-introspection-1.84.0 | 4 
                   perl-5.42.0 | 4 
              execline-2.9.6.1 | 3 
     linux-5.10.246-cip66-rt29 | 3 
ustream-ssl-5a81c108d20e247... | 3 
                   dante-1.4.4 | 2 
              host-rust-1.88.0 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
               libunwind-1.8.1 | 2 
                  linux-6.18.5 | 2 
               linux-pam-1.6.1 | 2 
                 lockdev-1.0.3 | 2 
                netdata-1.37.1 | 2 
               pistache-0.4.26 | 2 
                    polkit-126 | 2 
          sane-airscan-0.99.33 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
               syslog-ng-4.8.3 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                 aichat-0.30.0 | 1 
android-tools-4.2.2+git2013... | 1 
                   atop-2.12.1 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.2.0 | 1 
                  cairo-1.18.4 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
          cloudflared-2025.8.1 | 1 
             cni-plugins-1.7.1 | 1 
               collectd-5.12.0 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                easydbus-0.1.0 | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                enscript-1.6.6 | 1 
flashbench-2e30b1968a661474... | 1 
gemmlowp-16e8662c34917be006... | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
             igt-gpu-tools-2.3 | 1 
                 libbsd-0.12.2 | 1 
                libgeos-3.14.1 | 1 
                libglvnd-1.7.0 | 1 
             libgphoto2-2.5.33 | 1 
                  libsvg-0.1.4 | 1 
                  libva-2.23.0 | 1 
                   lsof-4.99.4 | 1 
                   lzlib-0.4.3 | 1 
                    mpir-3.0.0 | 1 
                  nginx-1.26.3 | 1 
             ntfs-3g-2022.10.3 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
               openblas-0.3.30 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
      passt-2025_06_11.0293c6f | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
             util-linux-2.41.2 | 1 
            vorbis-tools-1.4.3 | 1 
        wireless_tools-30.pre9 | 1 
x264-baee400fa9ced6f5481a72... | 1 
               xwayland-24.1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/2f5c32ccaaae5136c95f0897236fe08843850d5a |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/96c1b460341bbd854184068a362211eb8444396b |     
 microblaze  |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/7cd1bc33b03b3ec7bfeefff2426ccaab25a20ec5 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/bf61520d015336f327208abb122ca4dd5e304ed2 | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/c5f7797af4615d792f0fd15c4d198c049ec12cd7 |     
    mips     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/864752995a1fea3b553fa5616d166f0994cb10a0 |     
    m68k     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/52f36eb1aefab1d43c9e5f1975889186328de055 | ORPH
  riscv64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/5da118781f82e5cf7cb92bf2d662ca0f64f63be4 |     
  aarch64    |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/477302de76ec805d74fa7c61cf0c381b62eb6004 |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/4c8463f0372560f4c3a20b0f67854460f0d1c400 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6dd4fc89778d39b008eb7b57d670538992e47cee |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6091a19e27a1b5ca7645ab2195cd47a56d1ee26c |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3d15d2bb784d5881783b539ea1dddc9ebc429d24 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/700589499df833eb2964c2c0a2aa19f1b7322ba2 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bfd11f1e07c99c9cc7b2c635e9e064178ae1ab5c | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0043a494f48ece48e57768574bd52a47536b2de0 | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f09a88876eadda681ac53bbf139126bfaf315ffa | ORPH
   armeb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/3043f6c70ec1e57bf005d6cc7745f808bfa38aa5 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/35cff618119e39877e9fd98f5cdcfa4f1cc97455 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/69be0e6988ef5349bef6da617d9d9892f5cfba4d |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/af9d656f83641ceb84485c6ae2fb8f719c29582d |     
microblazeel |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/adfb33baa9a9df315c05593bdc82d7cfbecfa555 |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/af7892010dd1eaa395d6d817756c7b0fd819592b |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/1be42712fa5824192c73eb7f24c0584daee9baa6 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f1cf0fab6d6a6e3095c33c24866ce40d586fdaf6 |     
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/c740966a92ec0686889d6244a1d49fd4ed779684 | ORPH
   x86_64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/f479d17273904816e7ae9037823ad1156b2f87ed |     
microblazeel | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/1d6b10af957c730c33c81e8ba384a66de3a0ad65 | ORPH
loongarch64  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/3706d008c63d2afa83f7da2403d16cdbbb62b817 | ORPH
 microblaze  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/9726b63ff05cf804592fc48004ba66bc938027d8 |     
 aarch64_be  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/4216825b0667e910629120a7f543736bcf31167b |     
    or1k     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/6efde223a3d455d5eacb37e7e900e779165430bc |     
 aarch64_be  | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/a27261182d5549b00644942d7d9230b187ef1f8f | ORPH
 aarch64_be  | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/1438264056e772780f5e4d404680cab0b7f09ce7 |     
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cab80e50a8c90d395ecf3a8f774886b1f341b3ce | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/239461b17ceaef49ece2b514fc2fea63b7a0396f | ORPH
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9ab9e2d4e89dbcfdd623c6b33be35121e72d31d9 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0092d48a708fa49136d74f04269a057773a3fbc9 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d67d3deb9e371c5d5cc3507751b80c4835b362d9 |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a54d8bd95588f065e6aef4ad9615b4d8c9446110 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/40bfdd6147e749bdd4de6794bd48c9610459bd94 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/25bc401676d7b3976254aca2fdb3c8a4b25080cd |     
    or1k     |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/1a22f8e05e669f1689a9ef480864901787b03d8f |     
   sh4aeb    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a172d1699cfe4b936470e0f76605faef8d80e447 |     
  aarch64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/c48c5bc1dd92d1e594082d62db382ca8c1978915 |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8c22f659891e90430b25f4a5f7cbea99c50f1006 |     
    m68k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/c9475f5b82e36b67d12fbd0a94730c004eec9284 |     
  aarch64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/433815ca2c7f08e678a3ff9d8a992d7ffb0f2c37 |     
    or1k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/712972b81c0446afd79e0d021baab710b9bf2987 |     
    arc      |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/90eeb54951ebe8799efd7989ae070f8b02f39e98 | ORPH
 microblaze  |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/29d2164e0bd5ff04ada80b5dc800e5d26df5ce40 |     
    m68k     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/d5f9a8537ab6b689440cef13e9947b649eafc22b | ORPH
    m68k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/3fe457a16cabf15d12191eddfc4c8fd3e1eb896e |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/617e25e5670cda84f881f296b88b4359feacc11b | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/d0d244d717c6b08225fcbfff6c6b85e94ada6932 | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/54fbb511febb809637703e9f460e8aabacad90ef |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7fd034b94cd7fbcd8f9e7c1a21127921b88ef312 |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/cc3e1e66c8241901b876b399b50b5ae655a9583f |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/b8b329919c293e9f1faf8995dd890cf787b06e9f | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/b349a9070feb2a5a2cfa3c6147e6717bf8c3c09e | ORPH
   sh4eb     |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/03048baaf7db3cb85d94e81f4e32c70a75f6d0ab |     
    arm      |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/80510c7b1620789db1775547f1715969022e5db5 | ORPH
  mips64el   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/ac3b1e4ec0e5316d58f2758fde89a50ad06d7399 | ORPH
 powerpc64   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/0c75ec1758821c8e29ed8ab7a594bcaf2bf4ee90 | ORPH
   sh4aeb    |          linux-6.18.5          | NOK | https://autobuild.buildroot.org/results/823960b43be7cd10e269eb6cc040f0ec25971601 | ORPH
loongarch64  |          linux-6.18.5          | NOK | https://autobuild.buildroot.org/results/19383db8aababa5f6b9a75473991128dc4ef33de | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/4fd96ba7a0ea890fec62028d06a9d837c646bf7b | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/42b58da5c104b57d9b2cb9799d405983ed974915 | ORPH
   mips64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/357d98c6e708cb8e9931662ea14fba5bda1251ff |     
  powerpc    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/a3894283c8e9dc3c507d8e46a00bdd42ffaf6df8 |     
    m68k     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/3ad5baadef5e16e753b2012d41f9c1268eb5035d | ORPH
   xtensa    |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/c86c19a4b8fc4304244e33d4f132fea8e0043e06 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cee3f918c41ff7156875e444480e4c018e32a3b3 |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/738a9b497fc5b254fe4b863de77f20d75fc8da3a |     
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/a7126a966f06ac277e252ad93cc55b190b2a0e39 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/b3eccb5ccdc1d82cc768fbbecb9e21779e519779 | ORPH
    sh4      |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/ebf0fe2e6d2e162fa5ad2bf49c56dcdd13cbb324 | ORPH
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/954fcd44bb807d847c2c3586877103933108f884 |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/92aca05a4a61cb43ffbf7eb69a1c1079794a2a51 |     
   mips64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/57e779200cb74eb1247584c1bb313fbb943bd61e | ORPH
   mipsel    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/e909935484a56b065e5fc0082cf613f8c920bbe9 | ORPH
   mips64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/e006ac0a32cc1e1d4ffdc10b41f02374441b44c5 | ORPH
  sparc64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/ea2a1ef3abfa2da315908cf1faa8638409eb60e0 | ORPH
  mips64el   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/8cb505508bb25f659ddeebb87cbd67e6741803e7 | ORPH
  mips64el   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/0328b0576032971caae906a0721aa7540dee0387 | ORPH
  sparc64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/fb03fa695e723efbc09fa40df81852dec98b4eec | ORPH
    arm      |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/ca1349686fc79afe6f4c8fde85e7b2da20bc0503 | ORPH
    arm      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/2281c613ca45276025a547760b328d2b9baa102a | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/dc0e83c3932094dae748d13be6a0276c865ab31a |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4efb3743c14f44a5f2bb36e651365b660cc5e9ef | ORPH
   sh4aeb    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b9be26eb433a184915c29d507741f8f588072124 |     
    mips     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/115a242247ea47ec73e8a67aef09e751ac5801bc |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/be8206e84608c728aefbb6ebf734c79d514655fb |     
   mipsel    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/6f43ac3be4ab87ab792f1e7f17ab6e86983e18f4 |     
microblazeel |        pistache-0.4.26         | NOK | https://autobuild.buildroot.org/results/e84679b63e533adbd834732cbeae55aacb0ca735 | ORPH
   sparc     |        pistache-0.4.26         | NOK | https://autobuild.buildroot.org/results/b5af5c541dfc931a72100f65a6111a78dd5f80a7 | ORPH
    or1k     |           polkit-126           | NOK | https://autobuild.buildroot.org/results/793163fc72bf7c076d41870f3a7216dd1959472e |     
    or1k     |           polkit-126           | NOK | https://autobuild.buildroot.org/results/67ef5b0e68141835893a2c843f5eb75eacf66a5e |     
 microblaze  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8bc476436c44c88a3d56586aeca11a81831e5eb5 | ORPH
    i686     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/1b10e7a643277783e2413dcba09f7f166245db15 |     
  sparc64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6d8727b13f6f71d494ae2a3b5467b283aee2a630 |     
    mips     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/a24f29f8fe68d0f3ee9fb4b9991d7e6c55773d16 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/d3648f77182ca7d51144f1ec23a0715a3b167ad7 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/5065d1e026d72d6100d23d1d8ab52d718b601a82 |     
 microblaze  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/9ca0db27697cf333635ef268a4dd1ba248c4c151 |     
 aarch64_be  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/1a553e901eddd321d95dd0657739a5ba5a45615a |     
 aarch64_be  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fbd79fafab8bdcf08ccb5643ec36ef834bedc307 | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4e97fd58ae90f46cdd29235609d86ddb1887861c | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c18c0d2b6e65354e8d881cd2906f23bedd9d348b |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/16b215687e8055b519223bb507897395e4aa70d1 |     
  sparc64    |            unknown             | TIM | https://autobuild.buildroot.org/results/961f317db400f0abcb0acde42a3a3e70a5a2d5d2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bc3aa263c3e8b7995025a01065f1eb38e0111bd5 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/99a4ea165f5845261dfd5edaee0ecfc51371fe31 |     
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/77cc3871b3cebb2ec580d552652af64713774f03 | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a2d804f2f03b750946c122ecc9f2077fd10e537f | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ef08860bc923205ab06941ec805a37645e8dfe49 | ORPH
  riscv32    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/5569ada265f521a7b505579e945990491f9e2d47 |     
   sparc     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/c54bffcff057ffabf8077d1a42aa6df42f99a562 | ORPH
 aarch64_be  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/0a0d80eda897789fb00a2b01aeef1ffa4b12e686 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/344bc28c9563c053fe75583124eae300d3c140bf |     
    arm      |        xwayland-24.1.9         | NOK | https://autobuild.buildroot.org/results/e8252330ea650657af7626c71c10d6abca0ed15a |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 2 
     libphidget-2.1.9.20190409 | 2 
                       unknown | 2 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
            host-thrift-0.14.1 | 1 
libdill-32d0e8b733416208e04... | 1 
                    mpir-3.0.0 | 1 
                openswan-3.0.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/65a57da937f5af3625cc8b91d4cdc05e7ee22436 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6749fc3ec4a1f6565b0063148193982272335305 |     
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/85b2b584c258340f40ec391021145013cf8f514c | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6e420bf02c54e5a888ffd737502db9f68179af0c | ORPH
 microblaze  |       host-thrift-0.14.1       | NOK | https://autobuild.buildroot.org/results/d4228569c17fe4c9e741afe2d131f47c8e14956c | ORPH
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/b29e4ddb6a5418d63d86f1010d076d424ef9ee3f |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a7d381d1bcc590bf30728cc576206771c28f1585 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8cce07c7149e67f9b2059f9b306d6fbe21e8fba3 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ce28fdb666ff4289377c97e8b1b0a1fd4a01bfc9 |     
  powerpc    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/d36189aaa5faca852ebb1fc04a2b0dd50f53c6db | ORPH
 aarch64_be  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/6575c60c38dca5cc70d68e5ce299dd2dbfb9fa98 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/efc625845ebae92637247cfdb045972fd66e0053 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e98a58191ca13dedd4d51e63108664186f359d89 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 10
           host-libselinux-3.7 | 5 
              libsodium-1.0.18 | 4 
                   perl-5.40.3 | 3 
               acpica-20241212 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
               graphene-1.10.8 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                  linuxptp-4.4 | 1 
                 logsurfer-1.8 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/2f3be232c2be557f9fa8bdafbfae5d6478a5f949 | ORPH
   sh4eb     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/79b7ac789777b40d07f9c3c9e05667646f1a9145 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f99a862adfc198b675dae4b19e5b00e6e639eb51 | ORPH
   sparc     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a9f64b585631a414572d0eff110939d0c6b7ede6 |     
  sparc64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/0abe65c13f379927cf2929de81d082c1c99081d8 |     
microblazeel |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/6ae946d8688cd214e86406d87da9dd419b793e45 |     
   sh4aeb    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/963febdf28b60ca99e3a57d84423eac523f1c187 |     
  riscv32    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/1fc1f3e8093394dd1d9ad15392689c483abbf438 |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/786eb51badd5db9cde0e657406cd738d96d9b271 |     
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6d6bc0860e7842ad25b9c90a52f936e698cef61b |     
  mips64el   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/cf1b41ad3ffea3ffa27c66e285ada977cb20f868 |     
    sh4      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/825dd8a4d2f220686dd4674a15944b4fee264cf8 |     
    sh4a     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/5aa721b30beac897a0d24a9ca55e259ab38e8fc5 |     
    i686     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/f89ea4fc16c00df6aaca5629f59e57910338d234 |     
   sparc     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/badbcb3cf937c634c2ec2ff494e5f9791e66ec43 |     
    mips     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/ed6c88e37c18fca0ed128250652277762b0b385b |     
 aarch64_be  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/1fadb635817bf242332f3bd7c1633eb641f98c96 |     
powerpc64le  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/4571cd6f7f0d94aa73b04022f093d1b5e4f74ecb |     
    i686     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/537980406a78c7a9ef305c1082e485a1b9ee92a7 |     
microblazeel |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/9664f7ff6d6a975fe0f9a65b2e67ed4b97304e03 |     
   mipsel    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/b7066ce5e81da2e19f35064de5b106f13f011c85 |     
   x86_64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/f578e76ffda8f33dfa85cd8b98019129f2a43355 |     
   armeb     |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/2a0f2f1c5a85c7308586ee62897d5d4753eb49a7 |     
   mips64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/ec56cecc1ed56445a1bb35fd97626815ad2a80bf |     
   sparc     |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/8cdfdbff8c9764d8f86544e0687ca07d04f9d826 |     
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6b55e902e614b36874fb2f0f7320bafa78e164f1 |     
    arc      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/47556cf7cc3084b4363f19c2c68240d0ec3b1324 |     
  mips64el   |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/3d3280f2a7e87b1a7cb92b11bb1e6ffd1c4b1790 |     
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/e3db0c4ab19c43173b2e19b21521689c592c31d2 |     
 microblaze  |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/d03ef690adada7671a5e753ee6e6b9d03e41874c | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
