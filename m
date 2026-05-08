Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AFACD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 03:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D2894144F;
	Fri,  8 May 2026 03:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1mwiDQNW0qZ; Fri,  8 May 2026 03:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2383841452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778210706;
	bh=99DcfpwPUvfbG9EqZ9xzlBMGRtktTh6l3yYWu5eTpq4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HtOrLrx2z0e8oe6jfqn3vkYDzmGeeqDunUjKl21tVikRaYMWwvcgYcqAVYh0QTo16
	 fL140PgXzjR1tJVDAbpE0kbJ2hblNvnWMZz1YknVZ5KuwgjtKBQrolvEEOvXpjmVwK
	 WHcBbn1G60o/TpnyACa7h8WMfOBxNNNZk8Iqi02rmaBGNWJqOiZyTqo+J8CEKH8ITD
	 TtcmXTSHK5toDGnhQGc/Ktg8SpTHRtCOyg4MAxFI0RlTa93/vOCtGdwpSPUHu/ExMi
	 HJZzboeQ2ZZQrpwJHEJAHSyJ4pqDjuWNhVP7SFfgA0RdbUgIaGqecrm0P+ll1AihpM
	 TSGXpfiJ+bJNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2383841452;
	Fri,  8 May 2026 03:25:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F7C7317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 03:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310BA409B3
 for <buildroot@buildroot.org>; Fri,  8 May 2026 03:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7P_duBDragtM for <buildroot@buildroot.org>;
 Fri,  8 May 2026 03:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B2314030E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2314030E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B2314030E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 03:25:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso13844265e9.3
 for <buildroot@buildroot.org>; Thu, 07 May 2026 20:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778210700; x=1778815500;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juANOvPHXskAWOpIPW3XHSIejnnujYZiGTUdhiPkBgI=;
 b=a7FjEC0U3xdEUaauRjtZAPZEFXgrR7Ua4ytPgHX0j7pAVjsUo9OV1G29IR8uUyUEOm
 K5GnhnejbumjZXu3UO20lMZgbarDLee+ffosfTk+pIA+CSfJ1edcg7+vTbFP0ZewErXf
 5iQ5jxrXSS3NoqWbdFavbzGZ/ORvPb/VLZWmNa18utY6RzaCM4RzQMqdv76+/qQlb3Hr
 3DqS4Ij8txt/olv9S/DUZXtcqUexvJfrQwm1o7oyQ+XttafXL+l+X6sg47Y5uzfYoTmf
 Qee8y0i7/Ykjv8Trq53athGMt/cXMbp27gKDZiUdpUCiaVqoNUw3ij1K+TfuOt5GrJri
 VMrw==
X-Gm-Message-State: AOJu0YykibWCrpbHxImdU4LHPgXsLrl3m1raFT75SwdhC5ruEFXd8SBr
 x8pmUc50FMXt1G6kRDGe6a6WOUO4B0Oau/+qpg6Wa3Td6yaa18RTjidXOcqe3YYv
X-Gm-Gg: AeBDieus6+9DFfmyY91pNkWBqApQFdbDd20jgCmOjuX9rDlxE17u4aWeq2FcIDudCXa
 1tkrmIEMcLERXCyTC9lSJFxQhdcRKN2LvB7L5vHAslEliIUChC1D4JLZpQy4Ie5GAZSSA3oPIHR
 d4pe2kkq3S8LQZCqFJnlOxA3zc945rRSLB4zVfiZJ9M8CusEhAQggpN0+KvgwKoa6Q7rBSmzyRs
 NIeNLmXX4Wm9mkcW44GW0+gILUX3wF5u7+xpUl2tJbRNvCUbBPN6Volg6z+0Vdoa8xaal+Dnr8y
 s1zYy3am/o/PDDX7SNGMsAeJYooOouVzqEAbWlaWzwLP7BsgU6Cerj86TYWW+zrbVt8PlxKxmc4
 QqYpUlnaLSWLLF6UCwntykCNbKG+DR+xOIffvlYhzytV3bKV3WoU/cR4t8oZ1poGGqlPZzcBkmP
 uRtcUxbNELcgZLRWyW7Nmcrp6A5O9pbtE5PMS73tP+
X-Received: by 2002:a05:600c:a111:b0:488:79a3:f04c with SMTP id
 5b1f17b1804b1-48e51f46d1bmr124864245e9.27.1778210699242; 
 Thu, 07 May 2026 20:24:59 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68eaf237sm8516115e9.6.2026.05.07.20.24.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 20:24:59 -0700 (PDT)
Message-ID: <69fd578b.050a0220.1ef2b9.b2ba@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 08 May 2026 03:24:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778210700; x=1778815500; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=juANOvPHXskAWOpIPW3XHSIejnnujYZiGTUdhiPkBgI=;
 b=YizfzxyGBV7w+Gb4a5+WjtGt2RAU6wSWkrnL7Eo3YUA1heRWFlkrFxyh3afrro+1uj
 6DEzkcdAG3YZ++we+RTay7zOeuLcKcOjky3ydBA8a32ZHEAA9m8OITgAPcv3dO8le+Hp
 TGZJUDf0XL5zZtQyM9HCOlUBhOq772kmq+2cOd0fgjifGh9hM29+cuI57/+nHZcn7SY+
 ITCjntMyZkvjDpRE2Z9syUT/G5rit+8t3xRLTzyjdIjKvFvtRlZYreWsMiwhK4gK1gJV
 o4aL+rwpT3LgxDgELoXUwG4t2m1noBsNw1QtigOqpppIdYWVj/cGJ092dkiiMYaYZV6s
 8xVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YizfzxyG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-07
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

Autobuild statistics for 2026-05-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 29  |  0  | 33  |
  2026.02.x  |  5  |  6  |  0  | 11  |
    master   | 42  | 100 |  3  | 145 |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 8 
             dahdi-linux-3.3.0 | 4 
                  libnfs-6.0.2 | 4 
                       unknown | 4 
phidgetwebservice-2.1.9.201... | 3 
                easydbus-0.1.0 | 2 
                   guile-3.0.9 | 2 
                 host-gdb-14.2 | 2 
              host-guile-3.0.9 | 2 
               nushell-0.108.0 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
                   perl-5.42.2 | 2 
      shadowsocks-libev-v3.3.6 | 2 
           uboot-tools-2026.01 | 2 
uhttpd-15346de8d3ba42200249... | 2 
amazon-ecr-credential-helpe... | 1 
                 apitrace-13.0 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  boinc-8.2.11 | 1 
                busybox-1.37.0 | 1 
                   dante-1.4.4 | 1 
           dialog-1.3-20251001 | 1 
              e2fsprogs-1.47.4 | 1 
            erofs-utils-1.8.10 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.84.0 | 1 
                haproxy-2.6.27 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
               host-dracut-110 | 1 
       host-gcc-initial-14.3.0 | 1 
               host-nodejs-src | 1 
               host-runc-1.3.0 | 1 
                     host-rust | 1 
              host-rust-1.95.0 | 1 
          host-tipidee-0.0.5.1 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                iproute2-7.0.0 | 1 
      libabseil-cpp-20260107.1 | 1 
            libargon2-20190702 | 1 
                 libavif-1.4.1 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
              libcamera-v0.7.0 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               libglib2-2.86.5 | 1 
             libgphoto2-2.5.33 | 1 
         libhdhomerun-20210624 | 1 
                 libjcat-0.2.3 | 1 
                libnss-3.123.1 | 1 
              libopenssl-3.6.2 | 1 
               libtalloc-2.4.4 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
            minizip-zlib-1.3.1 | 1 
                    musl-1.2.6 | 1 
                  ntp-4.2.8p18 | 1 
                     nut-2.8.4 | 1 
                   openrc-0.56 | 1 
                openscap-1.4.4 | 1 
                openssh-10.3p1 | 1 
                pipewire-1.2.8 | 1 
                   ptpd2-2.3.1 | 1 
                   qemu-10.2.0 | 1 
                 rtl_433-25.02 | 1 
                  stunnel-5.78 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
               trousers-0.3.15 | 1 
ulog-0389d243352255f6182326... | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/9361cafe533419ce3e69d0b7c8e9c0739cbd8559 | ORPH
    sh4a     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/97f3e69df7b023dd0104a2ec98f6b39088ae9149 |     
powerpc64le  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/f0d7c5d1e6a0a3a8f1c3d2d4a8ed3b7caafa0f37 |     
  mips64el   |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/f5eb3c04199cbeb610cef13b5e5669865bcd51be |     
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/833909dfcec68662e39f70a2833f8b41f2f21a59 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/702aa7d774af0c08eb451943fad08d89cbe10c74 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2a9bf130cf757d306464e7bf776a5ef22d8dc5a1 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7fe26d3f9b81028e52a18623498d329b5c55d198 | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/13c510a0cbf834e684bc5aab89e7e54abbac470b | ORPH
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0b548e2c8d328d23ec4af1e6523c4b405944bb43 | ORPH
  powerpc    |      dialog-1.3-20251001       | NOK | https://autobuild.buildroot.org/results/dd169b93e1e0201447ff9b8c33d05cda8918b43b | ORPH
  mips64el   |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/d47740e5a60cf7e0da2d4474ba8dd0eb129f4c4d | ORPH
   x86_64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/de4c90e4bfd6cbb83c933697f7f3ca3398f35953 |     
    mips     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/ae45e9c5ce3af7b8fb8a5e76db2cdbf502d7ac9e |     
   armeb     |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/c32703bf9dbefa41da12dfdf781091ae68464a94 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/ff51b609b975b41f695d03322c8a2267dd8824a2 |     
    i686     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/3f49f50fd43d25f4349cae9cc599faebf28461d9 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7889222a43eaac6e1a52ac26486473835345c283 | ORPH
   x86_64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/3b905f6e3dd5d1b476cf2791108f914dc1c67f94 |     
   mips64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/904be100a7324a4a66baf201e2b7d6bc83ad6515 |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/7ee0ccc306276162ff3b8af1da6c7f7a3eacd2de |     
  aarch64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/ba9086c1f7c4eec5e16a5fea3f2b4ce4c39d317b |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/faa4a112081472e9019dad254d76b8ab41029f1f |     
    m68k     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/4164b02095c7430537bd90d19358464b716e6655 |     
    arm      |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e09f01fe5357ccd34dfaef4fb00d476bbb0fd44f |     
    sh4      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9fb64f3c3e74fc572563c464b808c07a3fa41e04 | ORPH
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6599037eb6b80a5175ddec2367e7ecd7d92d1840 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/1f8e15646e2c901e397f7af044ef0a1a407da28e |     
  riscv64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/011dd105f5d0fd1ec3ba97f9d3edf456de0dd2b8 |     
 microblaze  |        host-nodejs-src         | TIM | https://autobuild.buildroot.org/results/52d6f670671854952a1ff95d5ce8551b909565fb |     
 microblaze  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/cc80e6199d2c7b43bf6235a442e9361f8e88c77f |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/43164064971b780d244c37625d62f99323fa3aec |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/dff7ffdc60593e5f2ac2c40bd0877480723bd96b |     
   armeb     |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/4c0cc58abceae87a848ae4a573c98b6fa1a451c6 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b17414747e7430c7decc618bade3a71920a41b85 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/660a772a4e419595c33785ab91fd805034d62364 |     
   x86_64    |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/06166762f3910f7ba3fba6b7d8afc7860a462628 |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/5e3066fbfa649894c1293047e944fa4d513cf41d |     
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/fc9168c969d42c24f8c68931c78357304384e8b0 |     
    arm      |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/146967240a23c2cb974f3987700241de502e6cbc |     
 powerpc64   | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/f122b3314b0310f79ae1e1b7f95a3a7571b4a9c7 |     
   sh4aeb    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/6cf6f4b07aa1c13120385b0809db9f6f01082395 |     
    arm      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f702d4193ebd130b3d379e9e8d950cc1f9297445 |     
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/269fde8820cdd9a68fbf3d8ad728d541df743cde | ORPH
    m68k     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/99d43bc2bb4d169bb9b0896a71c036e1fc3e5475 |     
    sh4a     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/b021eb1fbee04577a7f96b42db87d0a4ce72162d |     
   sh4aeb    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/9d33a04f3483df313feaa6f766d4a9403f7abe74 |     
    or1k     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/39b6717b2650d7efd16858c2dfaea6eabc4ea673 |     
   sh4eb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/696e0b2f164c6a0b66dd8030b53fc602a1e0c086 | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/28ac69fd8e7d71384ca271e720c6c854b864be34 | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b6749b253874af3b6ce637c871f8241122d166ad | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/509be4385c314575a7d627e73269ad47162e497d | ORPH
    arm      |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/ddc58e6612f3e9817e6a74596e114208035aeda4 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/667d905783ba2196a2788ed3e0ae2ca48fe57e6e | ORPH
   sh4eb     |        libtalloc-2.4.4         | NOK | https://autobuild.buildroot.org/results/eef646b1b64a80aaa9dd257f047621089c651ccc |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/045494e588d76dbb9aaa01936adcb655876a225e | ORPH
   mipsel    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/a95ca9f162e0a775b350546f876514234bd172d9 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/05e52c05bca3f6e90f39f02de3dc581d5679826c | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9c189d75ebd2e4bc8909c0dde7366aaf6fd3026f | ORPH
   x86_64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/3ce5dc8f07777f58dac34ba6a06e56a7499d63c8 |     
   mipsel    |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/5371083c131fd835ff4222373cc028982587b1f5 |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a92875bc0272c0791583546d611c34de735322f8 |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/8be98848de37a9a24d0a22da07bf0ade8e381dbc | ORPH
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/367dd237b69b81b0708c0004d89a7bc226fd8263 | ORPH
   sparc     |           nut-2.8.4            | NOK | https://autobuild.buildroot.org/results/8df4194087bdbe78f7d57b43c8584d14a70c9d59 |     
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/843aaa95845048258d23de61a1f05f8c5e8bbcba |     
    or1k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/279d81b437d7e35b761e76fe4381c4411263be9a |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/da985a50803de72b642b74c861cb1cbd35c8155a |     
    m68k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/fbe33ece3b4c83b78d58d746a82ea78f27918685 |     
   sh4aeb    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/da4793af02242a4b7b49dc9f3cbb207fd848dab3 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/3c1d76c54734fdda63ceea92ba23010645dde6e5 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4ac84aebdbbacd3d9333c137d6bc277ae17ad284 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2091904aa24f41b075c71ffd90ecf2f84199bbbf |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a0ea4e6995b69dc2d60344bf69a0d8a17d43f4ed |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/df6b50a846c907651c5b54d1338fcfb9ed5711cf |     
 powerpc64   |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/8ab228d6a73565e8619d4adc21e78aa80cb9b4d4 |     
   sparc     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/417e13e3550eaf37edc4c60f6838c83eecc3bf0f |     
  powerpc    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/6b0796488487b4613988ebc553517afefdfc7b56 | ORPH
   mipsel    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/920e53164cd4573fcb974c52cf1814309ac07a3f |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4e8ce2b653a4bd5da6890535a9f1173d140a384e |     
 powerpc64   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/40ede844af84df8587322df5fb66936955d3247e |     
    hppa     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/4f547b0672b3b04c0d8f59b5d4e19c44e0ff1619 |     
    arc      | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/47c1a09a7980b882d3b3264512e5f8f9f02fecb9 |     
   mipsel    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/85719b767904b22f56120958ade79f72a0e2b0d5 |     
  aarch64    |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/608dc45f06200ad0f8980d2dcd6ea2e345162fe3 | ORPH
powerpc64le  |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/883c66e795ea4491926fee2d8fabad81cb54b816 |     
 microblaze  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/401da1d6c2e5bf1f62ba4c58447c5e47eda76bed |     
    mips     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/c7143eb20ee8ebccfed77e1fd0085a208bdcea1a | ORPH
   mips64    |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/2b2fb294892ff062d79755ea89ea344723770d50 | ORPH
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/50735b5b0efc99dcbf7196fa1fe798e1733ed8b1 |     
 powerpc64   |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/446e9a11709974d6e1763386145b0277af4a3dc9 |     
   armeb     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2f0ec25ff97edbbc86bbf14f8db7e535bb19de99 |     
    arm      |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/4d190562881123f85c75504e5b39e14feb85b580 |     
 microblaze  |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/4ec3811c1c5317264dd68c6bb594ea090383601c | ORPH
   x86_64    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/fa2545c1f15fcb401c067061e0a6d43cb0d3448d | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c3ef6960eba5e628a240af4cbe7560756b5eb4ba | ORPH
   sh4aeb    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/73ea04b75427ed7bded60a9eb4266dd7f22d3154 | ORPH
 microblaze  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/cc7516277fb96d7881cf0168900bd513ca2d1937 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/acfe443eea35b02dfa2ecfb0236bde3c758b71ba |     
 powerpc64   |            unknown             | TIM | https://autobuild.buildroot.org/results/d86d815dc1b1ba3a602423f87522952960ef1718 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3977271fdcd0fb67825175eac374820d163689dc |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/e39cca6dc1254ac2e8603aaeb143a03bd8758afd |     
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6c4463b682dd4f7dbd38e84c85c499c992d13b66 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  brotli-1.2.0 | 1 
              libopenssl-3.6.2 | 1 
                       mrp-1.2 | 1 
             parsec-tool-0.7.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/e9c4d3422e9e50652b7e7f30cab64a37e5212395 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/4e9565e2c4f7edd805058a960e36807715468fc3 | ORPH
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/7c8f24505f45df5a98de7885358f7d002b96ad5c |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/dedc539b381b672c137d307e2d49412b2510c86c |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/3d7d762f60c9795451be079a5b5ec8f89fa0cd7f |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4ef73f044c3dda7f1b2e64006d6ffd74a369b3df |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-util-linux-2.40.2 | 17
             util-linux-2.40.2 | 11
                 libzlib-1.3.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/008adca80fb09843c7ca24276af5816502483b7f |     
    m68k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/7dba300c60bafe6dac1c173743d5f26126fe3a4d |     
    or1k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/7d6e701fe595928b76358f1d5808653ed1f78e1a |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ab95746bcaf723256b08228e9193e7ebae6b5d04 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/64861294a6a73f2f772450ad9128423eb0fcecac |     
    arc      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/761b3bb100d76f37feb859604cda696f5ab7a1dc |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/9217931189a31db71888cad29d8c2a305f774c5f |     
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/4d0f17600e195d0381270f8e1fe2927462115a7c |     
  aarch64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/737fdc2ed5fcf0d3bdce1d6b0f6b97357e4035e0 |     
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ada5a82a04de498a196753fbdbf0d8e337e141b3 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e6103db5a8ceb1393d1e45c2d3550547a8e3374e |     
    or1k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/161ab8a9112965e3155c7da75c5c200a1d7d25f3 |     
  riscv64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/26a0bad66d1b35951779c85731dbf586a75eef52 |     
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/d8124bed9c1ac169bb67599f4f81d97c38680954 |     
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/63dbaad513f95099c776042be0211a8120fc64af |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ebcea382c5ef9f39d5a6a3449a2b890c9befa8c3 |     
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/39687cae5c6a946728e0d9dc5e2346c5fa5a2de8 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f396ead815e7d4eeee09069e43945e99afa71737 | ORPH
    mips     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/35a75ffef42edf6873be3faba1ec6397ec26ec1c |     
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6fa1b05f064f844507bc72b31d1a4d2d3d604f8f |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0db5edc85286edcfe901989e08f05360b473294d |     
powerpc64le  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3222d1aeadaf3c911fd74ad8042c770e8fb0af99 |     
microblazeel |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/43423a1eefdccbbc9f65fc66cf764937959717e2 |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3f2ee7bae11a839c39e10f64165ea82beb1eabd9 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5f5452cf94c9d615bbf3f9830abf64f6ecbf7d5c |     
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/be6a1d7586903ad7a4cc10288326e8aac4008113 |     
 powerpc64   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5c1d2090a32dbb236cb09f686679a1f4c133f29f |     
    i686     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8e30aa11a39a6eee4d6b06ab796030e6d8ae4fcb |     
   mipsel    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f3c83d7a4314cc6b8868489bae2de023ece580fd |     


Gitlab CI results for 2026-05-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332000 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332001 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332002 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332003 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332006 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332008 |      
                aspeed_ast2500evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332014 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332016 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332018 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332019 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332020 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332021 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332033 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332037 |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332038 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332039 |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332041 |      
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332040 |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332042 |      
                     beaglev_fire | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332043 |      
                       beagley_ai | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332044 |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332045 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332046 |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332047 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332048 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332049 | ORPH 
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332050 |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332051 |      
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332052 |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332053 |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332054 |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332055 |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332056 |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332057 |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332058 |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332059 |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332060 |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332061 |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332062 |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332063 |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332064 |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332065 |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332066 |      
               freescale_imx91evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332067 |      
              freescale_imx91frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332068 |      
               freescale_imx93evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332069 |      
              freescale_imx93frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332070 |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332071 | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332072 | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332073 | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332074 |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332075 |      
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332076 | ORPH 
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332077 |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332078 |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332079 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332080 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332081 | ORPH 
                          hp_9000 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332082 |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332083 |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332084 |      
                         imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332085 | ORPH 
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332086 |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332087 |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332088 |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332089 |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332090 |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332091 |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332092 |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332093 |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332094 |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332095 |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332096 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332097 | ORPH 
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332098 |      
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332099 | ORPH 
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332100 |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332101 |      
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332102 | ORPH 
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332103 |      
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332104 | ORPH 
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332105 |      
               iot-gate-imx8_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332106 |      
                      khadas_vim3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332107 | ORPH 
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332108 |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332109 |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332110 |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332111 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332112 |      
                  loongarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332113 |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332114 | ORPH 
                      ls1043a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332115 |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332116 |      
                      ls1046a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332117 |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332118 |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332119 | ORPH 
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332120 |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332121 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332122 |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332123 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332124 |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332125 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332126 |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332127 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332128 |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332129 |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332130 |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332131 |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332132 |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332133 |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332134 |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332135 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332136 |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332137 |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332138 |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332139 |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332140 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332141 |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332142 |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332143 |      
                       nvidia_bf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332144 |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332145 |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332146 |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332147 |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332148 |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332149 |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332151 |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332150 |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332152 |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332153 |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332154 |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332155 |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332156 |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332158 |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332157 |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332159 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332160 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332161 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332162 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332164 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332163 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332165 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332166 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332169 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332167 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332168 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332171 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332170 |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332172 | ORPH 
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332173 | ORPH 
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332174 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332175 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332176 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332177 | ORPH 
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332178 |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332179 |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332180 |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332181 |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332182 |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332183 |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332184 |      
                  qemu_hppa_b160l | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332185 |      
        qemu_loongarch64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332186 |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332187 |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332188 |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332189 |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332190 |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332191 |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332192 |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332193 |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332194 |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332195 |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332196 |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332197 |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332198 |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332199 |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332200 |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332201 |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332202 |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332203 |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332204 |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332205 |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332206 |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332207 |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332208 |      
          qemu_riscv32_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332209 |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332210 |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332211 |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332212 |      
            qemu_riscv64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332213 |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332214 |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332215 |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332216 |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332217 |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332218 |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332221 |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332219 |      
                  qemu_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332220 |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332222 |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332223 |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332233 |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332224 |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332225 |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332227 |      
                  raspberrypi2_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332226 |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332229 |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332228 |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332231 |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332230 |      
                     raspberrypi5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332232 |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332235 |      
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332234 |      
                 raspberrypicm5io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332236 |      
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332238 |      
             raspberrypizero2w_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332237 |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332239 |      
                          rock4se | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332240 |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332241 |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332242 |      
                   rockpro64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332243 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332244 |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332245 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332246 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332247 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332248 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332249 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332250 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332251 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332252 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332253 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332254 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332255 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332256 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332257 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332258 |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332259 |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332260 | ORPH 
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332261 |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332262 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332263 |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332264 |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332265 |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332266 | ORPH 
                    spike_riscv32 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332267 |      
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332268 |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332269 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332270 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332271 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332272 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332273 |      
               stm32h747_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332274 |      
                   stm32mp135f_dk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332275 | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332276 |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332277 |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332278 |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332279 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332280 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332281 |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332282 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332283 |      
                     ti_tda4vm_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332284 | ORPH 
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332285 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332286 |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332287 |      
                   versal2_vek385 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332288 |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332289 |      
                    versal_vek280 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332290 |      
                    versal_vpk120 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332291 |      
                    versal_vpk180 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332292 |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332294 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332293 |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332295 |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332296 |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332297 |      
                       zynq_zc702 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332298 |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332299 |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332300 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332301 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332302 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332303 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332304 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332305 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332306 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
