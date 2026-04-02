Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134B7111227B
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 03:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3566078D;
	Thu,  2 Apr 2026 03:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xzz5TLHfxh_o; Thu,  2 Apr 2026 03:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27ED9608C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775100661;
	bh=l1cdkrbpYqS5uG/5X7jqnmQq9PLklLIzsn75f9Cnwu0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KNTFLr3YBPRN3k4TdhxuIjBqShInmuKnSLYqL/R/ptgsGa/UcksIaZ6e8ygaAsDvc
	 OM/0dtmzBPW2ogMgU7i3BExpbIBri11wGYDRGbdEr4G7EBgBQTQ71xFMFHXne/NPeh
	 zDMPwIWBuCA+xM5b4VsXwwClLcY+95o1O/R6sgqcSnatC0Ja/3mp6LHigs+gEHjzjK
	 FxAICymKg/2leR7Y4Ux5EtMy5Nq7CSnaNI9uxdn3Ow1Hjbtmpcbs1abLpkqlJrPtN1
	 C0ZlnpMc3xmzfaCtp4fESb7wZAudtMfcjndGBwYPcHvzIzJPfXU0NJHtNlFAWXs4PY
	 SdTY057bY3omA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27ED9608C4;
	Thu,  2 Apr 2026 03:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78CCA2A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 03:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AC778110E
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 03:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG6tbcrGDtVE for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 03:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C0ED8110B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C0ED8110B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0ED8110B
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 03:30:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43cfb723698so360573f8f.3
 for <buildroot@buildroot.org>; Wed, 01 Apr 2026 20:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775100655; x=1775705455;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1WPG+egv4/e9lbpqU+2Mwel8W+9/wYbtccqT7yr0Ik=;
 b=CyLGZ2fRnzVRnN4+I4JUO2gZfOffIzHQziX1zg6Tq0qmqsmPq8I85xhrouIWLV17Xh
 EUW22mpOStcfuB4feT32mjPvcBjqzAJF1YMOpfGjjSZhnDJiRZP58BtT00hhmYcxN7Bl
 9/0+WUapMrsfOzEv5gHjqgcxJvoZp1PI8kpbCvf8YiSSqnyqqHrGmRxv0j+KidhaTUxb
 TsR3MTdiBoN+ncmerq0tf++j6WkC1YbmubjB0czea4ffYV+F3CL6Ih8EEJrb4Ub5V7qg
 iEwEmIVFCh/G8NQQLEtRojEYRfF+CMgygkhE7lRs7ghYiY8ZARrmopJmYIOnpmHbN2/e
 Dh+w==
X-Gm-Message-State: AOJu0Yxb7NPeLGUiAD+1dSTPgD1W/uh2FqvgJLgcXQWIKWgfrWvdQozo
 6vorX1d6bhVynO77ZScK3y5cmpSqqBOrWxek4y5/VXNA8w7f3jGDDf4xtMqgvMNE
X-Gm-Gg: ATEYQzwYEM8y4IUNjzwK1z4pYVuZv/FooDn9VS1lEaO1zB2QO1iW3WF/z49NAVe/qMI
 nkmLeUfUZKQFTUgdbvewUgSGRJ4oa0W0DfSpVwNmZFCU2U9RY2oib7t+i/aPqHw5+KPP6PAo48R
 DmyaggSIYPA41Q7mgGIAvrCyT07P0VORLm1CV5Fcg0BXVJVbh0lSbqYllIN8SWbjB9i/qqYyeDc
 EM+lFmWkRsXns1OC5mS7zoH2kXtmlJJSSSfQ6ttD/AQFMS4V+Yr/Z0TIqEbVLdr/hGAlvzYVkec
 2wWXFX8FiaVOc2orVYAXcCQYkcvo2XUetXASS9nKv1ki4sZfHUBmSZPU1qry4Ewm2vUGUtYZ6r1
 YXs0FpHoNuKkUyA1Ixs08CyD2nYkdROIGVIYdEhYB6uaBZc61s+ukvzusn3CWGaSUG5gNL2nlli
 T9ozyLHGRf6EqlGq8QXB0jKeqBLg==
X-Received: by 2002:a05:6000:2010:b0:43d:121c:37c9 with SMTP id
 ffacd0b85a97d-43d15048629mr11694233f8f.3.1775100654343; 
 Wed, 01 Apr 2026 20:30:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c60a2sm4476739f8f.10.2026.04.01.20.30.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 20:30:54 -0700 (PDT)
Message-ID: <69cde2ee.050a0220.2fb521.7ceb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 02 Apr 2026 03:30:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775100655; x=1775705455; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=k1WPG+egv4/e9lbpqU+2Mwel8W+9/wYbtccqT7yr0Ik=;
 b=d3rfk8PLBzyF7zYrX1lSSJRL7rbw2SJ9SfJl08ORaiz55460fIhifNKFMnRjogecA9
 Kb6spgPo2I/aXyvnufExX412b0IAtEBoJKBsMbBwxVmoRKhbetf+p59Qe4hqc3/6uyuZ
 BDeaZ54b2HACUjDvt7NEdkW6RlchIR5VQLHSC54cJJu22J8kulogvm7RUyWLQKmQzis6
 ghQOAygzExlDDngTP2XUPnEwvRKD9tC/yPOpYw1H/D7ayNhmkQ1EO0PsB1ZXwSvkTXEU
 EFAnQN5m9R+4h/sXsAZQqB+Xq+JCP5k2oLI7e4XEW6oJbgTSxowECWPu0kREz98CF1kl
 uW8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=d3rfk8PL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-01
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

Autobuild statistics for 2026-04-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 31  | 44  |  0  | 75  |
  2025.11.x  |  4  | 16  |  0  | 20  |
    master   | 47  | 161 |  2  | 210 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 15
                flashrom-1.7.0 | 7 
                  libnfs-6.0.2 | 6 
glibc-2.43-17-gdd9945c0ba40... | 5 
  gobject-introspection-1.84.0 | 4 
                 mdevd-0.1.6.5 | 4 
ustream-ssl-5a81c108d20e247... | 4 
                 vmtouch-1.3.1 | 4 
host-gobject-introspection-... | 3 
leafnode2-9543ffaf82406f943... | 3 
libftdi1-v1.5-62-g5e67403c4... | 3 
                 libmbus-0.9.0 | 3 
             bmap-writer-1.0.2 | 2 
                    gawk-5.4.0 | 2 
                 host-gdb-15.2 | 2 
                 host-isl-0.27 | 2 
           host-libtpms-0.10.2 | 2 
          host-mosquitto-2.1.2 | 2 
                host-odb-2.4.0 | 2 
              host-rust-1.88.0 | 2 
            igd2-for-linux-2.2 | 2 
                  iozone-3.508 | 2 
              jpeg-turbo-3.1.4 | 2 
              libopenssl-3.6.1 | 2 
                 linux-headers | 2 
                   linux-tools | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                openswan-3.0.0 | 2 
                   perl-5.42.0 | 2 
                   perl-5.42.2 | 2 
            python-numpy-2.4.0 | 2 
          sphinxbase-5prealpha | 2 
uhttpd-15346de8d3ba42200249... | 2 
             util-linux-2.41.3 | 2 
                acpitool-0.5.1 | 1 
                apr-util-1.6.3 | 1 
                  assimp-6.0.2 | 1 
                    bat-0.26.0 | 1 
                   bird-2.15.1 | 1 
                bpftool-v7.5.0 | 1 
                 cdrkit-1.1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
          cloudflared-2025.8.1 | 1 
               collectd-5.12.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                  delve-1.22.1 | 1 
              e2fsprogs-1.47.4 | 1 
                 fwts-25.11.00 | 1 
         graphicsmagick-1.3.46 | 1 
                     grep-3.12 | 1 
                haveged-1.9.19 | 1 
                host-acl-2.3.2 | 1 
            host-protobuf-34.0 | 1 
               host-runc-1.3.0 | 1 
          host-tipidee-0.0.5.1 | 1 
          host-xfsprogs-6.18.0 | 1 
                   i2pd-2.59.0 | 1 
                   jimtcl-0.83 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                libcurl-8.19.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                    libev-4.33 | 1 
                libglvnd-1.7.0 | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.2 | 1 
                  libnss-3.122 | 1 
     libphidget-2.1.9.20190409 | 1 
libuci-f3fc0b76040685829191... | 1 
               libunwind-1.8.1 | 1 
                  libva-2.23.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
           lttng-libust-2.14.0 | 1 
          lttng-modules-2.14.3 | 1 
          lua-lunix-20220331-1 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
            optee-client-4.9.0 | 1 
                     pigpio-79 | 1 
                pipewire-1.2.8 | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
              python-xlib-0.33 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                    sbctl-0.18 | 1 
                setserial-2.17 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               valgrind-3.26.0 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/3c3d000d9134a1960dd6484196a11611cc55389a | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/550cb20f0447ed5dce5453584bc473a376c90996 |     
    or1k     |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/4c1dc0ab368ea5b6dc3e59f198eee68dab0e8de8 | ORPH
  aarch64    |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/19a028ecde80d7acfdb064c657cc6fe9208ace8f |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/2ddf4fa4aa0ecb6ead30f0071e1b74d6130de4d9 |     
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/b2f84cbf7f1f8d0e3049e0e8918d335d8b5de753 |     
   mips64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/993d1a8d2a91aa31c0d1fa69736d617ab532f89d |     
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/c28c9fbd4fc341ba25b624668aa6fb0548e93d47 |     
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/6b0f0c7222caf1b5a5bb51afc8f4cf71e8a5e24b |     
    arm      | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/af2c309fcd002b6ef8a926848003939c17ef190f | ORPH
powerpc64le  |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/fb44e29e814cafc08d9b9aa104575ecb5dfa955d |     
  aarch64    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/aa902ee59ea21905e3a5c148802fe69ff487c431 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7d5c4cfead3cbdae593bb5301b2414882ea81d96 | ORPH
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/fa71fb3adc4e1bbd33123a703ac6fbf97b64d31f | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/5252f35178ae9080dc62771856a62d4211bb224f |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/8be2284c19506a90d94ca3766a30bfff1ede65f0 | ORPH
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/0944079aefd7713ed16bc7dcab3feaabda2dbbbd |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/c1a00d4dfa0af4f538241614f670027e01acbbde |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/234b50ef5c417e9090711a1da8106112dcf4505d |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/cc658f361e65f76f973382b3fcd277ba328c4651 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/d9664c6994f07aa2bf4e6df23a9f7419e3e4cbde |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/58e792ba198d05b3a8ad54e50de257a915e26127 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/0e8819572aeeb66fed04512d66227d2f767633fc |     
  aarch64    |         fwts-25.11.00          | NOK | https://autobuild.buildroot.org/results/eae3cd8022b45f700139fc3ffec8d4ca9fe380a9 | ORPH
  powerpc    |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/973e9f9129991d34095da51492016128e3e93256 | ORPH
  aarch64    |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/2623ec1b1a24a86456c96559a64b4264ec11662a | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/f344145505a5e28cc593214e8c55378fe265aeec |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/79eee76bf98076a628fa3509b71463bd6d4304d1 |     
   mipsel    | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/6b7e4424d3b60423938cdfb66bf3cc6c0b91b395 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/c7985ae9513979da1a6656e16fa29f4a74c48e8a |     
    mips     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/10c2e25fb5e6c2c9dfe84660aa82bcf1b169d2e5 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/515ccfc9d67bb48e40478e8ead5820a19c081dc6 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/94b7dd97c1011bd516fda6befd70b85110540c1d | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/42c176645e824e282d0e71018ca05130cf643696 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2e0d08d4308b53ca52f5f5c98cae1efafbebc151 | ORPH
    m68k     |     graphicsmagick-1.3.46      | NOK | https://autobuild.buildroot.org/results/e121242da46925eaf3fe86e63e30f45d61dd98ca |     
 microblaze  |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/ba6b7fb5e67561d0f06ea2018f03da226fa5ec1b |     
   mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/2dd13a3455dfaab33db7e89d7d300b1004aab889 |     
   xtensa    |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/7b619b73b5bd0b0c3a95a8a6e486abfff3c2a208 |     
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/932b381f5785922d4ebc797ecb99e00192ba0555 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/386e4a2da1b5b9a1dd997899b520fceecb6c4769 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/439c4392be4fe9b3834b83162434af0bf6e1c433 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1117e543f108cfba8249e85a9f76d0afe4daa8aa | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e59816ad00b90121cd949b1093e720cc016a9310 | ORPH
    m68k     |         host-isl-0.27          | NOK | https://autobuild.buildroot.org/results/f63d32ba4a991a5cf21ba13b15fc4767c2a389e0 | ORPH
  mips64el   |         host-isl-0.27          | NOK | https://autobuild.buildroot.org/results/9af30c022b69efbfb2120c073fd463b625ae602e | ORPH
 powerpc64   |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/c825528a2fcbc9d002e027c55b4d6946d152d1b3 |     
   sparc     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/532a3996db5e32375b2f41b53397d324a4705a93 |     
  powerpc    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/bc753931d51be67ecb49f3801a1f6c9695c397d4 |     
 microblaze  |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/14e037354ce371208396cb07c4d905a0fb2c1cc4 |     
 powerpc64   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8ee0d22e9f708eb7d430cba7b4034d3595b024a1 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f7e1164fc6b8c1e0984a5547e1ec3cb0102706c5 | ORPH
microblazeel |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/34b8cccf7a3e6450b7079db6994461272250db35 |     
microblazeel |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/ddbde0b38b849493a3a8ba2fa1d427d3a636cac9 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/8c33962f9aae734683355fcd74a1377ae21d0256 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/1ebe42f7157394944ade9e11d98f5e119cbfbb94 |     
 powerpc64   |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/557592059a44db70a52372da43babf822ed0901d |     
loongarch64  |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/31376420698368a4eb042e9ab96e4e4fadf63914 | ORPH
    sh4      |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/afa5faac2e09e3ff65f008e200ce00617aab653f |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/04bedffada0c0683c81a744b6e77a9c8fe228234 |     
   mips64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0b5a09ddba140ac085e53d35ea5974589941e275 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f8abe02831969b73a66679c6d0bce125b11df2f7 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7157924222547ae1b2ab68f1b7663f807888678b |     
    m68k     |          jimtcl-0.83           | NOK | https://autobuild.buildroot.org/results/a0521bb34673d69b1a66fef9b301f4f774a34423 |     
 aarch64_be  |        jpeg-turbo-3.1.4        | NOK | https://autobuild.buildroot.org/results/b367369b5237cf7cd34e7b804e7e690afa0b3a8a |     
 aarch64_be  |        jpeg-turbo-3.1.4        | NOK | https://autobuild.buildroot.org/results/29d5a691bc6da8bb23ea700a5ca06e25c984788f |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/1861da231028a2cc1800eb49954fc952dfd39d10 | ORPH
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/b7057f05dbc3748c4686f2a5ea12bb1045f4064e |     
   sh4aeb    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/95356053b2958883358c1f41e0680d7b47813385 |     
  mips64el   | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/bce159acf6f73764e31f0109deb4f52aeab320a9 |     
 microblaze  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/72e6962a78dfbfd73ba2040da572510d38c53628 |     
    mips     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/a89fc6f0785989e88f794dc36cbe53f2901cccd5 |     
   mips64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/e4d2ab8a8709aeeb96a893f8fa8fee0544739c3c | ORPH
  mips64el   |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/ba0a6f073b2766f963c1f0bf0414981a3df091ce | ORPH
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/6fcc234370cc5433f45a9c2e2bae54952b8231a7 |     
    m68k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b4208f131fbae3ac1c9bc6ec5da1e7e1e5e2e292 |     
    i686     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/197ce4fd8c2bafa5f4d3ce333885c4fc0f0821ef |     
 microblaze  |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/345d191fdb6a70a5c60dedc26838700fe766eb1f | ORPH
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/eaced81a5bf943b0c6a15edf28b59089b10a9772 |     
   sparc     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/c1e3b45b8b1f64dae5b0a407505f1f4ba66d5ae9 | ORPH
 powerpc64   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/291250aadd616ad43290e73e2b6035c2634f49a8 | ORPH
  riscv64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d9a5c2c6d934717ce846e79a230319e7f1237f98 | ORPH
  aarch64    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/e696e800d86228acd84b81b603de41c49e60c7f5 |     
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/e77b3ee61360984f85cf0a7dce6a320192d40d56 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/9805987238852f7db40137ef2335b4dd6e9e9fd2 | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/eb89a1c68a92eda58adf7dd7a9391df16c8fa0c0 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/14ab5a9a6808516d964eb7a66ce8f79ae787b3af | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8bc65a1c454a029c34d922962899d92f9dedbacf | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/3c1bf40c3aa9f7823edd5008299a50a2ac5de47d | ORPH
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/f72350cebc5ce39e190db0b2357c5cb79c1e5320 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/97106cf510b300caacc9a5e0072106004a62bf59 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/1ddee75e5dfaae7672f7f180f5f8f6b7c0c0bdd3 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d6b04140757180c9fa6c7fc8d2e610d9d6c507af |     
  mips64el   | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/29f7802f066591f676d48c20a59f399034c8a5bf |     
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/34ad7165bb31c3550a85646e33177698df64825a | ORPH
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/78b8ee23ce1ea55615a467e67f70b88b7ab5f5ad |     
  sparc64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/c88f9d72090922e0bd5a1da22a247b7a43d11cfc | ORPH
powerpc64le  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/afb8c499a5c4ebf3804faf80ef90a3d23bcdfa3f |     
    sh4      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f717c1b4befbae9f9662fd1ae4b0594634fb9a2a |     
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c5ee7c58fe5aa6eeb80b7c553597ee9af42d2fd5 | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d6fa7ba94d2411be43eab8b9a574d5d28e7ab820 | ORPH
powerpc64le  |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/eea2301bad826f918d22753462471d9255191932 |     
microblazeel |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/390b99c18b85ea1d23260f3975da0a97c17c3807 |     
powerpc64le  |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/3ca55d3588184c2a2baf1f77e7556c3c8172e9c9 |     
powerpc64le  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/f2662ddb883aca98cb9ece26a71ad1b09951770f |     
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6b72fa54e58460c2909c0efdb24d8a78d6f01b7c |     
powerpc64le  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/75e1927b743e83cf1b8ef3106708ddee52b4910f |     
  sparc64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ffdc8795068057d408bcacef7d330e99ea4cb970 |     
   s390x     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/53f63eb56da07a669daa9dc73e06bfcd2b123f2f |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/3a2d8c2ecc9f03c3f6aee982f34e905878148705 |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/398138051de8f5c9cbe9149b0fe4767749a67b71 |     
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/39a3a6155c1e7b7bf901689a2a2791036e86acfb | ORPH
   x86_64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/76dfdee600554d188d9f3ed4a57b24972db8fc32 | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/c2b4c874188a40c4eaa1c4b7569e2114eba0c6a4 | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/1894363d6a1924ee8a5f78432c160cd95e9df116 | ORPH
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/38598aaff7f9b149a8e298389432b186bd643bc3 |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/670d5d55e0775c294e566cf21e297cb28611408a |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/3791d2ab26d7ef0fb49442d6ac5b858adf2944c4 |     
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0928e20960d1b7fac9c203e95bb37342445cea78 |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ee37269c7df0dcbbc357b029f7fa5a3f67f5352b |     
  aarch64    |           pigpio-79            | NOK | https://autobuild.buildroot.org/results/f36af268d94843e7ee0ed5daee6cff69911fefdb |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/b0f5d11b335dfbe4dafa33b7cb83c51e0a0d6878 |     
    i686     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/e3fea12a1e651bb377d5627fe386dd2dcd3a0c4d | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9393a9cf0466b67de4298224a0b3bb27be31ada1 | ORPH
   armeb     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/067b538e53da094e53b7739490075b89956a8d46 |     
   x86_64    |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/34941e5258da56777757528a6fa2c0e98be44745 |     
microblazeel |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/d5b497361312246be32980f21480e0ad3035a1f5 |     
    mips     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a9e087b2a445e02ea40a4c7fd557dd1fc944996e | ORPH
   sh4eb     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/cc67a645afaa0bbd47d3f84b65ef06d633bd94dd |     
   mips64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/5d8bfd5468f95d2b4f1bf79cc59f777581025f59 | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/6d44ae96af4b9d4787f7be7f44431e3b95a05433 | ORPH
loongarch64  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/5a1132954ec2e7a56949a69d6ae6481726296713 |     
  riscv64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/2064cb165991ccc46ff38231096d0fc40697db47 |     
 powerpc64   |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/9abb5bb9ff9f2900c6d5db002b4f4160f8b8cd07 |     
   xtensa    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/917a324685602b7e2388aff25b180aae87bf6e60 | ORPH
    m68k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/3342bffb6c579668cfc7fb2f1a72dd75f15b088d | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/5ea65725791653107f785196e8bb407e709b534f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a8581ace3518091927572c85f2179f6349cf8c9a |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/f189f993002b5ddbf504fd3430281598206280e6 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2dc2ce6b1a00590508fa33a2ca48598c8c05f8fc |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1ad30a722d55bc815827297f28a1ef171869717a |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f66eaf74e67cbccf080ef96e6b96cbcd2f6edd57 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/3b4d33f03948a005c6cd764a38d8ab0ff7aac05c |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/6285a6a57ba53890fad93e826d2b4040bcf9ef5e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5f0170fad225850ee28f582469e0f9bcd3e5a9c3 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c84a13f8385a09a6675700e196438295c2aae944 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/807c719f3f58af82a070d5960685353e73d18b72 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/5ec470ffa0e6a7a762ff4107f16e888848cc43cd |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9c4d62117d2ca1e47734c1646249c1e72f50a4ab |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/a5af281db12c837d3dc0e65455d8278a1dde7087 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/f2ef07da2e9478d7907156fe87ce7d297f53d346 |     
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/82e5af6ead76ca42298343abaeeaf0f4258b00e5 | ORPH
    i586     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b7d3feceb3d4379896f8b2284306621a5070f4fe | ORPH
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/78ade566cbf3a3d98645bc96e2dcdba5f21f188d | ORPH
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/c5575906b4269db0384a813aa3b89f20512bb4db | ORPH
   mipsel    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/d2ad69d9018288d1b8f1e5faf5f39860b3e07374 |     
    or1k     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/32485a14626180ce9848503bed59d330ad2b7440 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/610a284f9b3a56a735032d3e4630b78fae3d1ee6 | ORPH
    arm      |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/fea2eeb6375cd0f761887d8f7b22f9c9058f9f2e |     
   mips64    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/091b777fb57ee9255cb85b30a0162a9e0714b487 |     
   sparc     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/192362503fd6e6f4d775312c07823b1fbc5f8e48 |     
 aarch64_be  |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/b3074a4fc154207c78a937e319a42a21517d45e3 |     
loongarch64  |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/7e1eac5ceeba9cfc474cd5d8f6e82e05f4c86e1a | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 apitrace-13.0 | 1 
           at-spi2-core-2.58.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giflib-5.2.2 | 1 
            host-coreutils-9.8 | 1 
       host-libunistring-1.4.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
                 libmbus-0.9.0 | 1 
                libsoup3-3.6.6 | 1 
                 libssh-0.11.4 | 1 
                  libva-2.22.0 | 1 
                 libzlib-1.3.2 | 1 
                 linux-6.18.12 | 1 
                openocd-0.12.0 | 1 
          powerpc-utils-1.3.11 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/16315992064ebbe26f89e660e6818dc999f888c4 |     
loongarch64  |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/ea91ce75dea85be18138342b6f1179cebf64971c |     
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e5fbda0fc2f8ced766f0fa53e00ee8738d1d3afe | ORPH
  riscv32    |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/a1aede46ba806fd99803940d7a73a3d6a4f08112 |     
 aarch64_be  |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/24642611576098f10a42449683b4414c6382dd0d | ORPH
  sparc64    |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/4d6cf64dfba121d58bedf527c3db91eff2c452b7 |     
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4cd65f69ea4703511d825e5e3dbfe840cbe6f5a2 |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/afd41f3f91e15ef5e4cbe13f6b79baf005bf5497 |     
    i686     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f789bf4bc89051335412ac476bd23e9223c3718f | ORPH
    arc      |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/c7d409b2165c8899bf6bb626511976ca3fd1718d |     
  mips64el   |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/99ab474bea268c812c03a6b8cdb7c43afd6263f5 | ORPH
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/5c9bae69f45f17a312977dffd10311a92f18a887 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/8b7f479c8d10af3930f2f51799923dbba43d1005 | ORPH
   x86_64    |         linux-6.18.12          | NOK | https://autobuild.buildroot.org/results/763755f20d9c6a1682b7b7fa02cf77c49630330e | ORPH
   x86_64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/bc612820c54f10353cbae99e4d170ccab6e639da | ORPH
  powerpc    |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/d7d7d777623c6412649ad31175017308d995530f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 5 
                       unknown | 5 
                 host-gdb-14.2 | 3 
        host-python-lxml-5.3.0 | 3 
host-binutils-arc-2023.09-r... | 2 
                  boost-1.83.0 | 1 
                   exim-4.99.1 | 1 
           ghostscript-10.06.0 | 1 
                  giflib-5.2.2 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-15.2 | 1 
                 host-gdb-16.3 | 1 
host-netsurf-buildsystem-75... | 1 
               host-ola-0.10.9 | 1 
              host-pahole-1.27 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.508 | 1 
leafnode2-9543ffaf82406f943... | 1 
                 libmbus-0.9.0 | 1 
     libphidget-2.1.9.20190409 | 1 
               libvorbis-1.3.7 | 1 
                 libzlib-1.3.2 | 1 
               linknx-0.0.1.38 | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
               poppler-25.10.0 | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/1a6abf8d0ccc8151d5b9bdffca03215e559ef6f3 |     
    arm      |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/19124011cf6729f358722ea968e65cec83029540 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/fee3402275047229f9aefb31b64553c538f840e3 |     
    mips     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/d8d6ae999ab589cd65d83aed2f67e52bb44e4341 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/ce1db226fa35737ebdd4ccd10aead605c84cab26 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8726ab05ed0c5994a8ff90c2c983becb837ae82e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/fcdb06c68274a7b08e9e7019f132526eb4eac004 |     
 aarch64_be  |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/73e62c9310012c63ed0f144a7afb7d23ea1777e9 | ORPH
  riscv32    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/761250e8cbb2602abdc7752d182a44b6f7de5e11 | ORPH
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/c69965cf6ef4f8338f951a06578ccfe16dca6b3e | ORPH
    i686     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/a55be4d08f29bbe41c17d2b7b7d77a2d43a591cc | ORPH
    sh4      |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/d6e0e4c79b2465adeee69b55a56fbcbed02db000 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/58821a2e9c35c3cbe3ec996d38785a0df25d7f47 | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1eed73421c5a52002a3995535599c53295c82953 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a172e981ceddbf5bae6d78dc78a5f2bdb3014c93 | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/b9e684b84598bb5fcab9e4d3b73ea43df120c1a1 | ORPH
powerpc64le  |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/361cba0b6a9dbd24605ac145014a19fa0f1869cf | ORPH
  sparc64    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/6872d6f237a8ccf5715693c5606d0a28e63d4cf1 | ORPH
   sh4aeb    |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/bf9676463fabd7b22eb48d11384f592938d45235 |     
    i686     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/6074b7e415fb6a3c260289cd3af0aa29ecd3048d |     
 aarch64_be  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/399245fd75d5347505b786cb7d3f8d96a92b516e |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/3cff53db5e48d52eb75a0cf51830a2d4fd3375b0 |     
    arc      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/6d3e592fcc21052e54723c5e1baa136af0a00aac |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9a4f2ab9c5c29ebc28e11ead3f5c659181a324e5 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4cda4909d3090090528d6a18c4a61e0140c55de7 |     
   sh4eb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/828e0863d6a8c64aebbf9c9285f624457319ac50 |     
   x86_64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d317adc6484de5e3d37734da87bb637329ab1a34 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8cf11d25110c787708fca38ce0993eb4fe69a82f |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/002824bacbe793e6cabf168f702ea614b65ea4ce |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/2ef779c8fa8856b1b7bc3e89b986bd136d36ed87 | ORPH
    or1k     |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/37c29f16a3d2ede5d9f4efe37d309d549e4f251b | ORPH
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/570d96a83845f3c3276f58595e96c12788ca1ed8 |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c037ec267668ebbe23db2057dab56f6d6d9a19a4 |     
   s390x     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/28fe9e2a17377c6ac4d1f36dc1b7b811e6574fb3 |     
   s390x     |        poppler-25.10.0         | NOK | https://autobuild.buildroot.org/results/eb333a6729f3b9945062217370932d76db2943ef |     
  powerpc    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/765c29b66325ae029a2baa6f3f57674a9bb17d52 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1f806caa45cf5cce97ac47a4b81e9f628a7311dd | ORPH
    arc      | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f3f5413a4e7802d0a59ee574bea84e6c7e2608a6 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/0940bced000746628f5c40fb7bbf975d76a68b6d |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/244ea6b8832b919a2bb2601a862f949d47faf014 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1e369dffe77e7787d56f76b16daade1ff3d53e5 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/2b9389b28bca0fc4b1308ec5b810f352c2453935 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/68afbde790f0fb1b1e3266a0b0b5c00536151acb |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/1dcb6c4c8b7f78c280f251ecc87dcd8e7682d11b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
