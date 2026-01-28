Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83606D35669
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 04:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D6E82A6C;
	Wed, 28 Jan 2026 04:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FinvbnBef-H; Wed, 28 Jan 2026 04:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C4D82AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769573865;
	bh=81OWDbZgw518mAn5x+NFNsh6t2Ab9R+wqMZxGmXHDOE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FgexLsxL5Ej05qteVLBP6Sh1oc6D8vBBrtJs1ospvQ6oPYZSOrJkUEBuWSL0AK51a
	 Dq1w6y5vhb3R6NTQT1OlN3CC/UIDolg3c9dwxpMbWQCImt2KooO0gliDeAKhC7ZzHT
	 6znrn3Lhtm5O6O0ULTrRJP5bs9NCnIQMv0YjjjL4qLLT8H6Yo3Uk+yGyFJy8Cne4GM
	 ACt3q7wyUAmmkn72WDQKJnEI3LDa4fcGsJ6OGR5HekNgKPD+F/zaXkOeLYAO1oGGWG
	 DRvwv2hzkCF9I7vr70p0XCKF03ke9mZjyH7/b0fNN8kq3enddgf5ghiEwX1m8qvcw7
	 vIoe9ALGgvoLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C4D82AB6;
	Wed, 28 Jan 2026 04:17:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C7E8118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 04:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CB34606C4
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 04:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2qv25ME7Ut3 for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 04:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91712606BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91712606BB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91712606BB
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 04:17:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so49333725e9.0
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769573860; x=1770178660;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xRSJS7BPFNBTQRYgHoebgMveiTB7fmLRHLC57FJOAQk=;
 b=RJ6Ot6FGfGEhIS0A6IYaARJUF89wgteoTGnwsxCAqKY+Xk+4cQmACr5J1zRCNaiLNT
 cIDOS5DiW1+ODpWCAHGvowFdthhDRCRW5ZfqFrjbRV2NTfOOJLq/g/U79OPIsRvZzmxj
 VZlNsD13jtc+CfU7eqkENaev+ysrvALZQOn4zQem6Xud4ZIbW4cYnqhnu9W8uD0Ma91i
 +yWpC5m5e6IEyohY3yAfQYmhSgOs1JhBqvFLEixXA+G9qx6+SVqB1tD6kwvQXX8WKawp
 gWJk6JQNa0ukvrABi1A7EyJzViEW/mcn8OgTrd2JG/GpjqoAwIkWILJaw+xHH2Mh5FTZ
 9ZkQ==
X-Gm-Message-State: AOJu0YxJXE+pwIB+MeiHzaTQdLtErvwxmwTuz0hSye+2eF6MNIap0uIm
 aAQevBHKnf7vRjdQpR7K+kf8i8OkSLd8bZ/cnjxbs0rmPlLFVP+AIGcRslsO5Q==
X-Gm-Gg: AZuq6aJiZ865Z5mtbq7/UuMydhz8HhFoDhlLaqOtddHSC4/JVcEBya0scx0SnNJjaYk
 cw0+4N8OP8C4RlzroyBdKcxa0gEstMR0skh7ZZBhPiTo1sEBktAdMI4nhXKlq33gcaUsLHyROsK
 MNM21r4X0ipLFHjax2p6QzWkZ1lIBQgbT07L4YD2AaGGHjcTIDrPGGloLBB+b9EBrIqONSCxMPF
 SmvzaF1vMVOAd+iYZcZPBF7Cyfqu9XET6IIjj+3e4xx4CiUyRZf0CDWfxxgQiy563fGN3grUZ6r
 ke7ZgtSvjCeJ9pEHYOAmd/n0PQPvUhWXDK/MCUbmRzdnAbBwYBOZoJ8ksXWwGTFYCdFZjEeigDz
 R6uKTou6MrgteX2CupP+sxPxGkoSI1JJUdsVf6AdWitobKVMa+aHLz3y4NqjrbJVvoNcQgjcOaC
 blt1lC/vMb6UzWSNLAxA==
X-Received: by 2002:a05:600c:3b9d:b0:480:69ae:f0e9 with SMTP id
 5b1f17b1804b1-48069c53f20mr53908665e9.16.1769573860153; 
 Tue, 27 Jan 2026 20:17:40 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bee687sm156763415e9.5.2026.01.27.20.17.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 20:17:39 -0800 (PST)
Message-ID: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 28 Jan 2026 04:17:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769573860; x=1770178660; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xRSJS7BPFNBTQRYgHoebgMveiTB7fmLRHLC57FJOAQk=;
 b=QWXs3gjVVBiM6VpXNtszxwV49Unkw921xWopONph/Rc7+niy03p3SZJfI/lcHsNnwd
 UOPIWgCGqe4eeHMf1w/tl8ozudsSfZ0Q5Uuu9pZTnedwulaN0Jyh8cREccxhaYexaDZv
 WRbLt2ibN4ta2yR4z++F6qJWu71QVPSOneBAAVvPwGLpaec5F7JIMW6z1kpxHOZOOLj4
 WVimKPX3pupfMKO+UuJRTwcoSEYxP54BZDgbiZ9eMGawu8rQnkXQDWYNZlK+Qz28W2k/
 NGg33zJXwfH8cGBymvsvGJ7gMJo9iL8KQyujpKnDNBO/QsoLAP/MAauYymb7bkqlmFRK
 TXxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QWXs3gjV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-27
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

Autobuild statistics for 2026-01-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 12  |  0  | 17  |
  2025.11.x  |  1  |  4  |  0  |  5  |
    master   | 36  | 59  |  0  | 95  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 9 
                   dash-0.5.13 | 4 
azmq-v1.0.3-54-g819b24035cf... | 2 
                netdata-1.37.1 | 2 
                openobex-1.7.2 | 2 
           at-spi2-core-2.58.2 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2024.12-release | 1 
                 c-icap-0.5.10 | 1 
                 coreutils-9.8 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
             docker-cli-28.3.2 | 1 
              e2fsprogs-1.47.3 | 1 
                  ffmpeg-6.1.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-15.2 | 1 
       host-nodejs-src-22.15.1 | 1 
                  iozone-3.508 | 1 
                  libbpf-1.6.2 | 1 
                   libcap-2.77 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libglvnd-1.7.0 | 1 
                  linux-6.18.7 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250930 | 1 
                    make-4.4.1 | 1 
                     mdadm-4.3 | 1 
                    mpir-3.0.0 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                openocd-0.12.0 | 1 
                   perl-5.42.0 | 1 
                     php-8.5.2 | 1 
                pipewire-1.2.8 | 1 
           python-brotli-1.2.0 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 rtl_433-25.02 | 1 
         s6-linux-init-1.1.2.1 | 1 
                 sudo-1.9.17p1 | 1 
                systemd-257.10 | 1 
ustream-ssl-5a81c108d20e247... | 1 
               valgrind-3.26.0 | 1 
                  vsftpd-3.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/224cffd8ab3060c5baeb76abe7249d66452b5a3a |     
  aarch64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/3ccb5d270fe679c6c60c485c7f2ea4fd3a6f3c9e |     
 microblaze  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/0606edd6c40bb594cf2f5a4ece4f60381d494433 |     
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fdf141bffe1676c61c7b1b5961f719bf88900c15 | ORPH
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/826464dc0c5453a6fbe98ee7d2194418954e5e90 |     
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c2b3506253ce337509c82f816eae8e03c69b4f52 | ORPH
loongarch64  |         coreutils-9.8          | NOK | https://autobuild.buildroot.org/results/db3e8e7c049eece0b9dcf3c5448c15ba6c86ddb2 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8e96fae0a8f7de8e537ea3cfc7cddd3220fab3ed | ORPH
 aarch64_be  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f0141330501cf7158437a0325a81f5552ad4cbaa |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e65f46549f64a4b02505b0f89d5f2107d49c4258 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8f02f0e0945ab010bf096d7890750064ba8cefe1 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/0bbd0a7b84040aa21771d7eeaf72fcbf9c61eb62 |     
  mips64el   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/ea0ffe934cc919dcfc147771c90420b9b722d124 | ORPH
    arm      |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/8ae7818f93f4e29cd4a8f37cc735632afe40094e |     
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/3bfd69cae0690f03e48bc4c384db25419ca43f84 | ORPH
    arc      |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/0e513d8dc69f28b57d1f021aa7de3744c70dc54f |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/93e336ede05ccd7ad75bd7b078082e03a3061f0c | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e5c862c385d725fc3659e977c594bf641fd67679 | ORPH
powerpc64le  |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/c822819dbc24eabf6e3a95f2df048a268e76bfe4 |     
   xtensa    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7f1aeec90472dfd118bbb23c1fb55bc06164db70 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/f831b8fbe5358270c639b6063ab96e46f9b8d4ed |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/7c66ba31453ea5ba982a45b04c7e6d7239780e50 |     
   mips64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/803990046b5aae521c72e9b75c77e45bfb0279b8 |     
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/bdc5b45b8cd32ef9861fdc04aebc249a4de145df |     
   mips64    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/1ff89253caaab19f34998e3a83dfcb2ba36bf6ff | ORPH
    arc      |          linux-6.18.7          | NOK | https://autobuild.buildroot.org/results/fdaeb516bb65b1ee2d90a6879ced92d6e6b1b0aa | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9bdf68f0a8ce5e7a9f5898f59a5fbdfd8f5bdecd | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/74c6847e408e71453ddb601ce9e9a260dd4c5e07 | ORPH
    m68k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/0ab2ef4c64810afa71d23ee590215d131fe35793 |     
    i686     |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/febc9eae3f7fbde1e4a8a46750101f16a0a21063 | ORPH
    i686     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/ba5188a4e24ea08149855f49ff97a00f7b7142b1 | ORPH
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/09c97eb92c430694a87b1aa13faffe14f933f17b |     
    m68k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/330514574c27131a4ec333d19c681df2824c2895 |     
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/8c0784ed7922119fb55843f6fcf28745a2d7b3fe |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b1f8fd88d17c6faaaf700f3bf4a5a3f33d949e5e |     
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/d00659450ed8f96bc6a461f1c78e9368994fabc9 | ORPH
  riscv32    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/c48f73d6c9558e7e2c858741b2a95b0c4607eccb | ORPH
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/5f2fbb0100f5abb47a56e806f6893f337c52b27a | ORPH
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e5469a697f9d14d8b9c2b04ebcdf2c8c35ad0333 |     
   sh4eb     |           php-8.5.2            | NOK | https://autobuild.buildroot.org/results/e7057e93e47a8af966f9377cd41a114826793b0a |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/e3efd52741234492727d874117a733b560879c7d |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/66218fd29d851833ca9e4f9fc956ffc812131fb1 |     
   armeb     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/0b61378caeaaf30e281dbabc5a41259c01b14a5c |     
 aarch64_be  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/f0d6c39b96504c82e9ea43d780843b691b1486b9 |     
  mips64el   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/bf784a2c3ea47ef28450343af961710989abc470 |     
   armeb     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/1cf6ea4c97fa39a1571ec92ac08c2a4e07a935ee | ORPH
   mipsel    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/fb16572b8ce2f3e410cbd1f0a9a27fe156eaa0e2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/428fe7739416a7e66c880a4f0b070da82b17ef07 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/7230b7217ba243ab5c6ef74095f0bfe44c803ec9 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6185d20f1aea7e1bbf3e297ecaba404eee5f7804 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/c68639c9a64bb5ee17c964e3707c87b10ed6be84 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/affec73d57a126b120626668301336759d0589d1 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/1913ed5e4b6fc66ee6f0a2f708e048730083c1f9 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/a9eb05c4a8b8252539511678bc8c43cab592f635 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/dd6def02d1493b0517c6616391f311961b3bfc97 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/005d08444218d8ff68a40c918ab7f2c2dff301d9 |     
    sh4a     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/88252f9f5f0838ed7ec713462deef4cc67b98ccd | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/cf042b939308046d95c66e79f2b048bc3d6e7215 | ORPH
   armeb     |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/c9f06814ac2d051865c55ca40c265c3d56f0caa9 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

             berkeleydb-5.3.28 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/648d5365956e5d288b312419352a826cf8ebb891 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/505f7711671af3dca3da37d9ec78a184bb8f37f1 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b3bfac4741d329579c8d5f208f4f19c31ae0ac09 | ORPH
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/2a1b32b9afa300fe0b033344591afcce7ffd2e59 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 4 
                       unknown | 3 
           host-libselinux-3.7 | 2 
                  libsvg-0.1.4 | 1 
          sphinxbase-5prealpha | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/72d18ee2cf30911c9e7623046160a42e438eac0f |     
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a6fe428d70a7a4b7b58830ef02fde9f29f42b196 |     
  powerpc    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/fe6d1b0e06189c52dda13f31a7755878d266f869 |     
    mips     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/2a246a22cb87070aa216cc5471c7dd2fb64dbb2e |     
   s390x     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/aa29575fdfa720a345c9a63501b48f0f0581245e |     
 powerpc64   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/b5b7cd44353425df931f994b3d7c0d8bf05e32b2 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3a82858c1656ad4d5ece3e05312c0ea12a3dcf3a |     
  aarch64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/c4f15dec8f737b876ea055edd0ae875f574d6e78 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/be72644f5079295754a84227030acf66708a8ada |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/be3197aabcf976a2f98170a9177c8a7d361dac1d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/95aa57a475d45d58ec554ab335edc85c8e21c3b7 |     
 powerpc64   |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/c9bfee1957cf5f1872a88873c5176d2a74ccedb8 | ORPH


Gitlab CI results for 2026-01-27
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413965 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413941 |      
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413814 |      
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413812 |      
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413766 |      
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413765 |      
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413764 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413734 |      
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413416 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413412 | ORPH 
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413373 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413364 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
