Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342BBF55107
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 04:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1DAA83E5A;
	Sun,  8 Mar 2026 04:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flyFws97S07Q; Sun,  8 Mar 2026 04:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEFBD83E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772943793;
	bh=A3DK3NzxwabxG9qJQKLBg9RrGGdaahnpLWyKBzFLxu4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TKUys9kLiRtqaiiYlIaz7Pk5wZiMzBtFQMAr1P75yKNedJekd0vkQ2KJzlZouRx3w
	 bw4DQmGUwx1bbS2daaY6F+pjo9af4f3vkYJ0TdCEN1Ozp6K9GiaQILLWaR2IfUhy3R
	 GhDNea0CqIaYNAMXNczkshrLsSTo/fGZ1YUoOPWdrFsQQyOfMin8uq/fIsX8+nkvDu
	 msslv0Jl92NwXs+IelXWZgmiu211HkuJ87de569fCYV4NXm7V82HJIbgRJWPLvTKn7
	 fCx/E2lgGXSyT19JvHWFG+uCa6mtn+go5shZR9NFRaQhgcgmFhKx7En+lpi+tzHP7N
	 eRIX6fOPu3HEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFBD83E73;
	Sun,  8 Mar 2026 04:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76552119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 04:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67E7860AF5
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 04:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id schlRI2PsfAA for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 04:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 660A96080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 660A96080E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 660A96080E
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 04:23:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b78b638eso7511267f8f.2
 for <buildroot@buildroot.org>; Sat, 07 Mar 2026 20:23:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772943788; x=1773548588;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozPb2UflNEf2JmZapLnLSLe3acq/HAO0CezcE4KViKA=;
 b=LW6qtFzYY3IqvpYzmEZ/17Vdc4XsXxYDkBysZhHCHE9P5BLzPIfwksjmuNhHuHDowt
 9/xx/e5l0nXnS/bHBwyTnn+sYECiFsp44wbUUn8AAP5Cz85HHEh5/+9UvprWJOHY5Pfp
 BpAqk2o8LeJd9Gb5Xr4/ueC8RAqjB7I7uHCf/Fl2EYaGH/Syef7Xq1kn5fAq0AP20b2h
 tCVsXoxKa6un0/Q+vVJSj7b2uuh4kJThIpVVa6vF0/g7yiAtBCXdAxia/yRv03ffY2Od
 Xqkv98cKSaxe+Tep9dip6TRg1jecn96G9uIKrr+8Edhx39zb826WhifzDnUBmsdGdD07
 m1xw==
X-Gm-Message-State: AOJu0Yz2B12fCuYH/wAF7XDmx2en4JeXC2IDhcujxftAfazQ3XwJMSKe
 ZF/jCBc2c+TKjftsT1swuOTkwh94H85DETrKQhkbP8Kjd47xg7RrxX1nOs62lRCN
X-Gm-Gg: ATEYQzzKHNv/Al/jqt62pddYdlNiDEsH7NoN5FkJzwA6IFCnId/WypifTRv7D57cWNp
 hCerDUlXI0j385TuxXmlZ/cFnUyyoNdZabFnWD2/otnYkV8CeV120jFrCD6xhcaKqkNQwmmJ5FU
 QsT6VpwmMizfCfOVf4MPIqHLVEKzbOqs41In9Er4qkQ8lZx0sfgCDNicR/8g5rpw5xDaXJM0qS0
 eW/idYHgaSrsuaELwJWtbzqzl5dddyMVA3prHINoHo+7Aa+jkcp/vvJiUodSyAHfMQRONW61Or5
 pmJGA+Me1TeU96d0OkgrlLDGYkCE15Nxk08tVP1imet++fuUDCI7khgFQXm++gv/PpgNw9HRhty
 nxtSxM/BCn2UFlwgJQ22+30+rXcqYTwWgxCUpG1bKiuYuTgu/bfHcibVdbTYR+wiTmuKXPDqh8I
 BtHADh+3dZk6sMa8XcEz3BPY0XsZnDDdBkPmDXLCSC
X-Received: by 2002:a05:6000:2902:b0:439:ac6b:dd56 with SMTP id
 ffacd0b85a97d-439da8a7336mr11607342f8f.53.1772943787881; 
 Sat, 07 Mar 2026 20:23:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9ccsm14904033f8f.19.2026.03.07.20.23.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 20:23:07 -0800 (PST)
Message-ID: <69acf9ab.df0a0220.1f44f6.d742@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 08 Mar 2026 04:23:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772943788; x=1773548588; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ozPb2UflNEf2JmZapLnLSLe3acq/HAO0CezcE4KViKA=;
 b=fIenneNhDJLM1v9hB8bT+xqbWYU+ayOdJLT7uPpKqBmiSwZqOp2F+eWJD2WPDr4/hh
 r2yx50hQv85729+JyTJ5K4Ze+Vd1JDqiZ/opqkYV+1bi+GIj+b4vsc0D/Z7ocK0ulHqD
 UCEqs6opNghALImgEy3D7hWSihFZWuuUnhZQNj0W0JCEUMeNxKdSXlIqFxPkr59ECzIG
 gyA0Gc068nP577cWZn1lfisnS5NMRnCW2YwnB3RBmoa+2ShwI2rZFPJ36mxWT0utZVew
 Iv+4WdasiouNhWtn4DRVd3fk6cGVjA3kaAyjCpk7NreRTTciKy3BHbww7DCpUujcOj4l
 Zdug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fIenneNh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-07
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

Autobuild statistics for 2026-03-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 28  |  0  | 38  |
  2025.11.x  |  1  | 12  |  0  | 13  |
    master   | 33  | 96  |  4  | 133 |

Classification of failures by reason for master
-----------------------------------------------

                  libnfs-6.0.2 | 5 
              host-guile-3.0.9 | 4 
              libid3tag-0.16.4 | 4 
                       unknown | 4 
             dahdi-linux-3.3.0 | 3 
  gobject-introspection-1.84.0 | 3 
host-gobject-introspection-... | 3 
                     kbd-2.9.0 | 3 
leafnode2-9543ffaf82406f943... | 3 
                 linux-headers | 3 
                   perl-5.42.0 | 3 
                bpftool-v7.5.0 | 2 
cegui-e7a03afc70c6182a091ff... | 2 
firmware-utils-c42a3bc53da8... | 2 
              libopenssl-3.6.1 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                  linux-6.19.6 | 2 
                openssh-10.2p1 | 2 
                openswan-3.0.0 | 2 
               tcf-agent-1.8.0 | 2 
android-tools-4.2.2+git2013... | 1 
               asterisk-22.8.1 | 1 
             batman-adv-2025.4 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
                     crun-1.24 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.3 | 1 
              erlang-26.2.5.15 | 1 
                    ficl-4.1.0 | 1 
fs/cpio/cpio.mk:131: /home/... | 1 
host-binutils-bare-metal-2.... | 1 
          host-faketime-0.9.12 | 1 
                 host-gdb-14.2 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.28 | 1 
                 host-rust-bin | 1 
      host-uboot-tools-2025.10 | 1 
                  jack2-1.9.22 | 1 
                 lcdproc-0.5.9 | 1 
                libcurl-8.18.0 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.86.2 | 1 
                 libmbus-0.9.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.9 | 1 
          linux-5.10.246-cip66 | 1 
                memtest86-7.20 | 1 
                       mrp-1.2 | 1 
                openntpd-6.8p1 | 1 
                pipewire-1.2.8 | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
                    putty-0.83 | 1 
python-remi-2022.7.27-37-g1... | 1 
              python-xlib-0.33 | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
                  snort-2.9.20 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               trousers-0.3.15 | 1 
           uboot-tools-2025.10 | 1 
          usb_modeswitch-2.6.2 | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/bab8266c4e22f239f96d5c98cd0d9a33a7b31a23 |     
    or1k     |        asterisk-22.8.1         | NOK | https://autobuild.buildroot.org/results/dbd29429d10335c13187bd03599b21561dac9dc0 |     
   sparc     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/1987c7ed16ccfb230b5150b4a92875adc40e4e9e |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/1e2a830d376b71fcb2fff263332d432743ba58b1 |     
    i686     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/5e147c1ed989abf03da1be25293a6b21f7242d1c |     
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/0e42ecc7923253f67e7ba45a8ffba3a55a271ecc | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/77a2c9c39a96360452b3d4ec13c60df5af188842 | ORPH
   sparc     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/359692b331b3451fa44413ee61c43765a7be3430 | ORPH
powerpc64le  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/ad9e320592aafbc5230ef82202e8757a98e39ad9 | ORPH
    mips     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/3761931779da0ee726875423502b1686d71e23ec |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cc5c6bafcf5670bc30e27e0f704d2c498e572ef4 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7613edd2f13c9e1beaf11b7ff12c203c63c5a7aa | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2e63496b6fd08d6584b11630a5ab38a95bfca37a | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0b6de44067cffba812da6a61aec979b5df3c227f | ORPH
  mips64el   |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/008b378af90330d39f3427ed7eaf31e6ecb7f2d7 | ORPH
    arm      |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/199a563938eb90013b870902ff6fd3d8e390a381 |     
 microblaze  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/ff7545625f7d7dde83bb14404da5650e1191cdca |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/4d14e0c9c359f33d1eba7e93826769de60cb12bc |     
  riscv32    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/eb6e9d7de0e197643b62651099dda63062450adc |     
loongarch64  | fs/cpio/cpio.mk:131: /home/... | NOK | https://autobuild.buildroot.org/results/7afecfccfa64fe6e1122b2845c3ebdb40d092137 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6284358233b866ee5f9acc9ded85369860d7f590 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2a1a364deff100d92e50719d42ffa51231f2ded4 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d499afa7fc8b5f35a005dc4fb06cbe28fe61be6d | ORPH
powerpc64le  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/7df38432f699359f29f499919b11fd1dd873f8e3 |     
   mips64    |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/fdba97461be35069d4950f0a2a37f403a7c6cff5 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a549931952839ea3a58236a0f24f35202a1ebd8a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3244d5a1310e9166bf833de1c531bf8e8c6526ee | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ff578968152ed9a01776d66493df9631958c63bd | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ccd0da1cda99149a60ba29d87d8a07004378b1a | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3f52fcd164fe90c3045a6b12aa87a10916b44f5e |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/83bca0e13d36e879676ab02908e308f565b8a12b |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6a6ec59d5070c29955f407fc651055af8d58bd34 |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/95a30a534c93f117a2ca30e7ab158413606b82f3 |     
   xtensa    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/67e6d07263a586990d84ff7a4ae9d7fc8e3a2284 | ORPH
   armeb     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/aea104b7dab83a2a475385cfa567832bac8b1a0b |     
 powerpc64   |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/2c73a4f71e9d24cb0e28c8fae66f9170b1926ba9 |     
    hppa     |    host-uboot-tools-2025.10    | NOK | https://autobuild.buildroot.org/results/965c0fbcc4acfae2a7b1022c1ff6d15ffc32e017 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/b4fa7ee0520a9e615645cf8888c4dbf05042c193 |     
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7e01b89935e2d640ef838c2f6c42f68640d88238 | ORPH
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/814c2305ce53555dcf2a65f4eda8ff432c4690ae | ORPH
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d93c255b4b2dfeee6fd9e25f3320180c530ca6e7 | ORPH
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/e50520297bf8a7e2d017a0b6a75c175fe833ed55 | ORPH
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/2e0baa9cf1717a7305df11e18cdc7f376e2bc8f7 |     
microblazeel | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/93c292b9275da20549f1b069483c21298e43c127 |     
   x86_64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/250787b560b3e166d655df4f40fbc1d26ce04219 |     
loongarch64  |         libcurl-8.18.0         | NOK | https://autobuild.buildroot.org/results/102a2c143864204c5d916e5424065898cb337bf3 |     
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/0f392bb1cc2073e91eecedde99ac94861d0023bb |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/ad3c048044f5ca899a8e4c2420bd28fb615788ea |     
  sparc64    |        libid3tag-0.16.4        | NOK | https://autobuild.buildroot.org/results/cec20248cb274a242d67f8bf245d3a1f6e064ea7 |     
powerpc64le  |        libid3tag-0.16.4        | NOK | https://autobuild.buildroot.org/results/03229a0604d0f6d7ebd83855d09c7351abffbd36 |     
  mips64el   |        libid3tag-0.16.4        | NOK | https://autobuild.buildroot.org/results/782a5bfa0a5dc9fc835da9728070d6ac2f654176 |     
  sparc64    |        libid3tag-0.16.4        | NOK | https://autobuild.buildroot.org/results/7cb7258c963826963fe0743f68df3f7f5080334b |     
loongarch64  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/7bd1f5292d5cb7fee90821c4925629ef52659fd6 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/6a49468e03464d46a747cc09da5380d5ed7ed50d | ORPH
   sh4eb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/a585acb0ef42829984073e890cfaf4d7b90ee900 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/9d3e072636b1306fbc97dc8651dc5d91da7a5321 | ORPH
 aarch64_be  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/04844991adc506cec08f025d906e185f3ffd5161 | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f3de75e3db5d187cdd5be3a1b5ccce5b95111749 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/7bf65f48d7f0a1472733ff28b9dba183c5b9d0ca | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/be819d06b51965a73ec12a5cb08069f51a2a9c72 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b39696be431a4328b73db76fcfc82117162782da |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/fd8cec0e364646d83ac964500a152086251378e3 |     
   mipsel    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/685aa7565472b668696fb70e7cfb51cead677e73 | ORPH
    hppa     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/091304301116dbb3bc0f81c20211591aae1ded36 | ORPH
    mips     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/5e7ad15d52e33ea96e6affdb9ee34ebcaaea4780 | ORPH
  powerpc    |          linux-6.19.6          | NOK | https://autobuild.buildroot.org/results/a3ed15a9cbb33809e1b868a81df2d318c40fd623 | ORPH
   x86_64    |          linux-6.19.6          | NOK | https://autobuild.buildroot.org/results/4c1cc9af562ae2e4ca47231db5f69ed8bc7f8de9 | ORPH
    hppa     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/44a85a7ef5050656d760782e6342244c4bec69c8 |     
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/c63919e5a9ab94e6cf5854ec60e832d9e29c0635 |     
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b72c0690551c4dea9fb894cf6279d253d8be8567 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/edf15f96bc03b5d09624aa8844d833f42f557a74 |     
   sparc     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/c7385909fc268f43b2fecd6d1e712902f0f88e11 |     
    arc      |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/156e5b44e32faa86e37398efb6446c500dc36737 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/d534ed0a27bf2f05df927dfc9b09e228c7104e14 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5ed32b275f2dbf48b28f78f72a2d06ed0737cb10 | ORPH
   sh4aeb    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/eae37449ade56c335fa56d807cbf05b75014d8b7 | ORPH
   s390x     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/286b194fe4d3fa9a80c95bf26270ac405f368c24 | ORPH
   xtensa    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5f52d06d2f73f28bc558e91476bcd1f09bc32d73 |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/065c2e59faef6d9a855319c6e30d9459ecfb62ef |     
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e76fd477ca3b1ce49a10ddd848250b26f10b4822 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/9e1efede4b3652c45db1092f4ee2e33652b6d45c |     
   armeb     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/d42d3f347acea4c309a9a34e10c19f0401cd8152 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9cae7b5886cf08e9b2836bc5848f525da66a2602 | ORPH
 microblaze  |           putty-0.83           | NOK | https://autobuild.buildroot.org/results/aac4b3342ac4eccb250bde459e10a25e4994fc58 |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/61689372b0f0fe9b514ae8ca3995dcbaacb88586 |     
   x86_64    |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/374da6c30083a6ce405120034cb0a59d1371a083 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/94b2d0a28e8808a81ef8a99ce7c1e899cb6765e7 |     
microblazeel |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/030d29bd854ab131eaa5153494b001ba8aa63fd7 | ORPH
    arm      |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/3d2f567f4e417a4076092c501b8dc8b20080f1fd |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/74283b7336b312bca98caa426ea8fa7142175b76 |     
   armeb     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4de82e5a0f30a9bed01209e18a5ff4f34a50dd6e |     
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/19f47082fd54ff263b2bfa6028ea621066423c29 |     
   sparc     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/9ae5209640af9ee9214765cef7f78329357cf03e |     
loongarch64  |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/2ee24df178d488ea29f915af44f5b85961b289c0 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f44f0a4c6ae9e993afaf7b9aedab70246f4be629 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/43902942d20196671a058fae89ea4f91406a621c |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c2126d843fc21638eebee388c21651088928573e |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/3df3be8e28343a245e4ca04e7d0a1f748ff9824a |     
   armeb     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/8729bd813b08416c3f16887047425222b0ef4725 | ORPH
   sparc     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/2926a22b8af2518076225e8500cc45ac287472d5 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                bpftool-v7.5.0 | 1 
                    fcft-3.3.2 | 1 
                 gerbera-2.6.1 | 1 
            host-coreutils-9.8 | 1 
host-gobject-introspection-... | 1 
leafnode2-9543ffaf82406f943... | 1 
                 libidn2-2.3.8 | 1 
                 libmbus-0.9.0 | 1 
               linux-pam-1.6.1 | 1 
        ltp-testsuite-20250530 | 1 
                openssh-10.2p1 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/789493e3d4efb4463565605988d00702d8ebba21 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/e129e41ab84a2837d1bd266081456caddc19aef6 | ORPH
  mips64el   |         gerbera-2.6.1          | NOK | https://autobuild.buildroot.org/results/f4931a1d6cdcaeab63cc07c9629bdf06027aa029 |     
  mips64el   |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/884041159327508992ee160efce8e02985439c17 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c81d83359706e678f3a9b654e44e7f7f4c9de304 | ORPH
  powerpc    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/bb6f8d0d44c6dedd96f3b23ed9c84b522f12a74f |     
    or1k     |         libidn2-2.3.8          | NOK | https://autobuild.buildroot.org/results/792d58d9972e658251ef7ab7d7e7264c4c1a78ba |     
  sparc64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/540cc8c1621cedea5b93e5d08c3a591d20a2c8ea | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8d23ed37c7d76ba8bc3aa69f155cc623e0950996 | ORPH
  sparc64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/51687720b4335e4e327c5633e4995155c34b9037 |     
   armeb     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/50b30f5062cfdf2262ed8d6b04e82ca7b3ad0483 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7b1256550161a2ddb68e73d3ad2a5659705fad9f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-binutils-arc-2023.09-r... | 3 
                   dante-1.4.4 | 2 
          host-faketime-0.9.10 | 2 
        host-python-lxml-5.3.0 | 2 
            lttng-tools-2.13.8 | 2 
                bpftool-v7.1.0 | 1 
                  dpdk-24.11.1 | 1 
              erlang-26.2.5.15 | 1 
    host-mender-artifact-4.0.0 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.82.0 | 1 
host-vboot-utils-4b12d392e5... | 1 
leafnode2-9543ffaf82406f943... | 1 
                 libiconv-1.15 | 1 
                 libmbus-0.9.0 | 1 
              libmodbus-3.1.11 | 1 
              libopenssl-3.4.4 | 1 
                 linux-6.12.73 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
                 vmtouch-1.3.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/f59880a136aab5c091d0fd88b4ec98f63be58633 |     
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/30faed3c89735fc73a74b57fb89a5d24d134fbad | ORPH
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/952a817af91062ef886f8c50b02e1d4b1e84e11c | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/7918a5708a543f89634c26a718889bcbc284f2e5 |     
  sparc64    |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/7018cb6d3e08c38c1eecca3f2c4735bf9db5613a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c8d73d4b6d610dc63026c726ee9316d9b9c239bf |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/263fbe486155ed081e008856a3039127a0227589 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ceb1296f9085a1241cede3c97ef63465ab9ba907 |     
powerpc64le  |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/8746ce2ac545e89791f74962b8bc62d08ac94770 | ORPH
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/686dbfcd1e87d263ee7bf9c294c3c7856be54c67 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/832c063c167001edfeea949b7ddaf11a512f8e6d |     
 aarch64_be  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/45302065107a7b278dd444389e8ceb6823202889 | ORPH
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0d51cfa35f78fa47d2edae083b7f123f8e105aa6 |     
microblazeel |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/8b8d623dffad59d95f8be62cc8686047fa4305ec |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7563cf3827c9ef43540c2718f3baa3b1d2967dff |     
 powerpc64   | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/44c008d690f545a9c7b06af15d51f5e512bb0f00 |     
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/db613ae7ff997c6696ee38f2ffaebfcacf3610cb |     
    or1k     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/0db94cfed43dd103f404c5d0bdac911946a1b31d | ORPH
microblazeel |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/7f19bbc8b99c9ebbed4bf4a72f6f6b68ae7c0ee2 | ORPH
  aarch64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/d845274c91dbe9a005f86dcb756b663b0f6f7ed0 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/2d241f84538a751eb75438d0977afd2908e471b6 | ORPH
    m68k     |         linux-6.12.73          | NOK | https://autobuild.buildroot.org/results/f456f8739bccedae974bed72dd779ccf55ef9659 | ORPH
  sparc64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/956a3f84e392405b349e67046ef4c78fcc2fc774 |     
  aarch64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/10ea4463affd33d361aa22e1b346e9d1f41e36f2 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/34067737b3a2720c3f4e482d09ddd857992da058 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/5f36a3ff6a9facbee3961ffb4c76c2a22c06af1e |     
microblazeel |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/3a2ee07b48a0a1e6d4cdbacca6ba079d3b61943b |     
 microblaze  |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/28776474a4fd259feda2850397f68e9cf38938e5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
