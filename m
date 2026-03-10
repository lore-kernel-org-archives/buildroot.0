Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327D9FCC9AF
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 04:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08B660AB7;
	Tue, 10 Mar 2026 04:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFoxs6fKsuB5; Tue, 10 Mar 2026 04:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5973460AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773116958;
	bh=UzhBoh41ZVQzTzupkGBF79F0wllKGRI07f6iIY3PKCc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bXQFW8qIFUMEjcywEq4qgMue0KaGD9GzTtZc0xPqBM0pp37ihkOCcxcds+2J5yvEi
	 2oYQZYm1+aA1ma7yGMG1hGuQVrb1YYjTHVIcKPkcsmiY/wcHfhSbYlppODL4ElVo8U
	 YcbIUItZvMXkOmOsANo0FLJ8mlvnwu6nKw44K30acPWzDSIuhRBr0mhm37KIau7O5u
	 2BpXi0PrGfqSw3fZXeHwL6GV4mN5u0EneDIVA0gIrUt8A83ObcNaCOczBPROavoZpX
	 zg3/wAz79hKTrnMxbO0O8RtM32LqXIbvYoJxJBj8zXtlwYnsEuQ/UkW0LTJFOZ+6sj
	 JklRQl7uXltIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5973460AA8;
	Tue, 10 Mar 2026 04:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3820235C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 04:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DC58403DD
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 04:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRdMz5ZIwDxl for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 04:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81E094002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E094002A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E094002A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 04:29:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-485392de558so9871195e9.1
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 21:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773116953; x=1773721753;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbrrYBTCiWB9zP9JqVW6fA8KatJWkgMXk+IzKbmP+MI=;
 b=dqFUqaXkxnGcsbYz2jGs5wYMn3RfCl4k1QVhwolT76ojMeZRuZ6SoxfXdTaADFHVcv
 SnmhzssE1Er3dRnFQsofORi9gtf+D2yRWztswPR3+JiTbhWHP/y3Xc5sR3XgxZmYozxv
 Jih6bwucJcJQptDdoaJLkCPcB3tNGIg2qLNDEl7nq8LvzZjyh5OWosxtbNFAuUwXAS4B
 ASMLVKzPHS4pE/63DpsEzENaqcfEUSoKEDC93XSoUSmC7lBMXRIImNFHU5easbMCJif/
 80txo7RNQ1pfr+DEDw/sM0uKTWygqFaIDTZGqCcTmgRoFg2SwSH2QSpTih3S4784Hwqr
 JYtw==
X-Gm-Message-State: AOJu0YwsNEI9Dxmskdd/r9bVaW/cQw7zJjAxKXG46vF4GDlrRxy1FVmM
 fE2dBjMg+MJK8xiB0kJIJnNvx6klAwBeqFxkcc9NbG7L4NVr2hqjsHgOyozbce21
X-Gm-Gg: ATEYQzzUoVqPe83lfoP2U9kFRwPGR6Yp/y9kR46t2/rkBYwL7kFl8EnPUxdIc4/nnuY
 qLL9u11qOtSNfvUtMXIM+WwRnsATyFs/q7hd54fddo9GXE6LHTNVG5LuZFjauwx38+6N83A0tv7
 EbgJeXOd3eWjL/wHqrc/fTdA2CNJlg1804+kpQuc8Pw0hghlbuVKJmJMopzdl3X5eeyXU0Ieihd
 j1iXfUf2GtD4rAm1UD83j2aP5d52YsSxPenwsVRjTwbxU6cNyZ8WCgXN8Xf/00ZEuzoW/LyhYG3
 XL5Dgd1LiBIAO+wXP09tyuYTL2sJkwMpZ/Vy/6hi/is3olF2m7NVCnM2J9ZnIshHYDCk53RVKWs
 s82Cn0N4AVtRYKnngq6CNrHIS8S6daqyoOAgqOl/V97p4e4YLuLsQMB8SvOx5hHX4YflpLYzTbA
 DK858dL+6KAk3trwtuNgOtXj6mEaX1nA==
X-Received: by 2002:a05:600c:4591:b0:480:1e40:3d2 with SMTP id
 5b1f17b1804b1-48526979de9mr216878925e9.29.1773116953130; 
 Mon, 09 Mar 2026 21:29:13 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485246fd127sm159469145e9.6.2026.03.09.21.29.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 21:29:12 -0700 (PDT)
Message-ID: <69af9e18.050a0220.2eb635.7c3b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 10 Mar 2026 04:29:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773116953; x=1773721753; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jbrrYBTCiWB9zP9JqVW6fA8KatJWkgMXk+IzKbmP+MI=;
 b=QVd3desloFnnTaZ1O6VYFEMl2/dFPmkePc7vEP6eMnNGoEs5x3LjeF9Q+gJEnBkXeQ
 JK5KAPA5T3UoPwBDSNvdPo8dmaipcPMu9mn6aqTxjDNobiVQypNAJl4mTX6rRThmGbb3
 A1slKUuqKBb6dKh1RjOFiRhjBka/iTM6YDyXXq9LDzkh5xGp7ZNCTR5W1ZLwuWq2lQ6w
 dywGPA2r8jXZ/1EiVdC3kBtOFAtJz2rXWdB2z3s7CGW/HWLrHSrs75RB4AgpSWqodMqf
 yHkXjKiG0nN7UZIlZMnk0/uRBXAkg6MFEG51sZCY7JNr6YUpDqhMRpFgRYMDQa0zAhcy
 HycA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QVd3desl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-09
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

Autobuild statistics for 2026-03-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 16  |  0  | 20  |
  2025.11.x  |  0  |  7  |  0  |  7  |
    master   | 40  | 66  |  3  | 109 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.43-10-gc3ceb93dc4f6... | 4 
  gobject-introspection-1.84.0 | 4 
                 linux-headers | 3 
uhttpd-15346de8d3ba42200249... | 3 
             dahdi-linux-3.3.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
                 host-gdb-15.2 | 2 
                 lcdproc-0.5.9 | 2 
              libopenssl-3.6.1 | 2 
        ltp-testsuite-20250930 | 2 
                 mdevd-0.1.6.5 | 2 
                openntpd-6.8p1 | 2 
                       unknown | 2 
                     acl-2.3.2 | 1 
                 aichat-0.30.0 | 1 
                coreutils-9.10 | 1 
                   gssdp-1.6.4 | 1 
       host-gcc-initial-14.3.0 | 1 
       host-gcc-initial-15.2.0 | 1 
              host-guile-3.0.9 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.28 | 1 
              host-rust-1.88.0 | 1 
                   i2pd-2.59.0 | 1 
leafnode2-9543ffaf82406f943... | 1 
libdill-32d0e8b733416208e04... | 1 
             libgphoto2-2.5.33 | 1 
                 libmbus-0.9.0 | 1 
           libmicrohttpd-1.0.2 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libva-2.23.0 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  linux-6.19.6 | 1 
                   linux-tools | 1 
                       mrp-1.2 | 1 
                   openrc-0.56 | 1 
               openscap-1.3.12 | 1 
                openssh-10.2p1 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.0 | 1 
                pipewire-1.2.8 | 1 
           python-html5lib-1.1 | 1 
              python-xlib-0.33 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 systemd-258.4 | 1 
                tpm2-tss-4.1.3 | 1 
ustream-ssl-5a81c108d20e247... | 1 
  wireguard-tools-1.0.20250521 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |           acl-2.3.2            | NOK | https://autobuild.buildroot.org/results/4db9bfc1f4ad5c3a00070bd74a08f52bb62e576e |     
powerpc64le  |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/31be8037a1a30ab6bb4debc22ccde5b6333d61c6 |     
   sh4aeb    |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/9664a75eadf5f4325828b2063c12d0230c3f592f | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/103e408f9ac2fbb294acc2f87dfdb0d183f4e3bc | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6771d63b2cc55ddf9cad492b38d1db665ccb88d5 | ORPH
   sh4aeb    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6dcfdba055ee1084555904d0a03c5b8500b82600 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1f1bba1bff70c46c4ddb4fd85266e7e2718a9494 | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/c7c8f6b7c1541e0e36e46871d8854e361d338e29 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/70ee43f1f34507359d350b34f30465df7370236c |     
 aarch64_be  | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/004c4376b1be1515f45e3de700652445f9d1df34 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/a3876402dd3bc71c2c849c8a2cb025137e1c8c95 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/72c649538d796fed021b0c11a9de97cdf0c7d82e | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f326a697cd046dcd490c9ef801cb54c2136258ae | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/945d7e6c138b51be2fced170d3c0e6ea3475480e | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/34e70b7010beea568c8d489223f18a52293402a8 | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/eb756903ebaf671894958560ffcdbb08c4594b73 |     
    mips     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/28352ec038176a6116aabb004942d1bf835f5281 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/715d6d650842f89427ef287d221fba2017b7f8b1 |     
  aarch64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/b07674a90c425146cf4a43d72023777cb2e39170 | ORPH
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c659d5499626cd0141ce8a6346af21ef1980d6f2 | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/aa124b6862eb39b7e3e48c350f50365a19bb16d6 |     
    or1k     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8ecc31befb9847dc07b6c4bc4c32bce13485e248 | ORPH
microblazeel |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/1146653fc33991271291cec79b4f7ce173eaa726 |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/8bec65386eff7b5a7e5e127be0f0d5569d6d183f |     
    or1k     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/055457daf144b32938bbb00712a74f12d1cb431b |     
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/2e9f2c386ac8e884477865244739820603301d87 | ORPH
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/bc40d1e88fbe497b38ae7a5a3f4ec7ffc463f37c | ORPH
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/3a77430af3c73de90ccf12fbc160cb2715d8e5d8 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ddc7738418a898e09685e3c11b7e790acde050e9 |     
   sh4eb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/40606f94308a8ccabc5dcb9a6fa51fefeb71d384 |     
loongarch64  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/0ade72c1a352bea9134cb036888a23e290359bc7 | ORPH
 microblaze  |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/90f3aa49a2150cb8b900508d500fb36ca5a76b89 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/d03e9234c96ed591984686477d3e1ed49207b7bb | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/14383b80145524419ec84685c78de4c01a3c1b9e | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5e79a15bd67710f7a0a936da5eb301c494211e16 |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/dcb33bf4c05d1176c27b7e61d8535eee670ac09b |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/99a8979a4a0d7951e99f48f27b093b705476e185 | ORPH
    hppa     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/7b2ccdb19e8343ac3a68449002f4def3b46ae450 | ORPH
    m68k     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/b7a26f5a53971cc177dadfc1d146437884d2a163 | ORPH
   armeb     |          linux-6.19.6          | NOK | https://autobuild.buildroot.org/results/c7f05d70179db0204faf2d3aed85bd62cdcc842c | ORPH
loongarch64  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/47abe1ad7f6150b302d70600f8eda47484bd3005 |     
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/101780e23970e25484ecbfb1a4c364b1e96cc7b6 |     
    arm      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bf75e33920b21ec1f0c512e8f166cf930be8ba9a |     
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f6439cefe272363ae8ed0804e32e75e03961f06a | ORPH
    m68k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/02087b3a5d4b4a575c192942cf90081dde657173 |     
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/686b8ba5c627fcc8d635442ab09e3894cc05d47a |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/07ed57c26f55dd4ed65fa54ded91a179f0ecd476 |     
    sh4a     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ec8e1f0c570168893e53fc59ed784c655a6557f0 |     
    hppa     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/dfcf99cebbc1a87a00c89df2094a95f2fbebdee9 |     
    mips     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/4e15e6fb1c8044d7fe573d7975c37aea7e6e6538 | ORPH
   xtensa    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/d81c74eaeff7ff2f9b9649d0663e8603b46b29b4 | ORPH
    mips     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/5f6f48caaf01f4d6d9ccfccaab14ee1efbf45d7b |     
    sh4      |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/5781c2cf62121b65e01dc8c1c7e728290a2c6165 |     
    mips     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b34e91a9fcac4c5a2f9aea617a3c1d4a8e03e8e2 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/78fe4d2959a1ac9aa4775c1c98b107b8fc14a5bd | ORPH
  powerpc    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b0002b422d7332c5d2ea067b6afaa2802b3df5e3 |     
    arm      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/ba44e7743d6462b7341a328704895ef2fbd94e87 |     
   armeb     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/65e30d3e58c28b6ed5dfb8cd0c5013fe760fdefb |     
   mipsel    |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/121c53a8a7eb90fd2e80e63d27cdc9f4a7a909f8 |     
 powerpc64   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/14912dc4b2a1360db40f90eebaafb0450d644f5b | ORPH
    i686     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/c355ffcae3dde47d44d1185705b4fbac5743e8a2 |     
    m68k     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/3cc243526290169d36f05d993cdacc1a4f179083 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fa32346545d0f4525421514105fb46e9c80c4bc3 | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/72e731802ad55840eae23ff5005c019e398219a9 | ORPH
   xtensa    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a6be3c8a3f48f86c1a6bf3b9e622e3de20268091 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/85853aaf4afde46c4c63fe35fc64da05062ce88c |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0533bbfbef511534d869d4a7dc7547be88c6283d |     
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/248d20bec1e38840bb2942fd8d295a0dbf11c97f | ORPH
  sparc64    |  wireguard-tools-1.0.20250521  | NOK | https://autobuild.buildroot.org/results/30abd312ffe21a6ee24902ff37afc1ebb566fa7a |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

          host-faketime-0.9.12 | 1 
host-gobject-introspection-... | 1 
     libphidget-2.1.9.20190409 | 1 
               openblas-0.3.30 | 1 
package/linux-headers/linux... | 1 
       sp-oops-extract-0.0.7-1 | 1 
             superiotool-24.05 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/9eefa8955c8a7eca5493a88b4a4e5318be5a5e05 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9558926cf338c5530165f6ca6cc845edbbd34226 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/618f26bf98f4ecce5d194836767b44eadda28ccd |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/1d5c17e286c4832b9134bfdfccacaa68ead50408 |     
   sparc     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/89e4e3c4eb7caee54c6c9b335db35c8b4c608b09 |     
    arm      |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/82381dc2a839ffb51707309c6ffebc9716fb78e6 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/7f0f145cff1c6686c19dd34ade9225a5e4a9c749 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                       unknown | 2 
                host-acl-2.3.2 | 1 
host-binutils-arc-2023.09-r... | 1 
                host-odb-2.4.0 | 1 
              libopenssl-3.4.4 | 1 
               libvorbis-1.3.7 | 1 
                 linux-6.12.73 | 1 
        ltp-testsuite-20250130 | 1 
                  pdmenu-1.3.6 | 1 
procrank_linux-21c30ab4514a... | 1 
python-remi-2022.7.27-37-g1... | 1 
                     shim-16.0 | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/40806cc103ce407362903f627d01c930bbb50c01 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c54565016ba99593cc9d54ff2dcda2b3cea4bbd4 |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6b46aa2546c3a1444c52c5b7d0bb69c829e8bb73 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/fd95c129e76c9b10a3cd1a8833596577fc4eb3b7 |     
    or1k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/40c585d9a039b11520bca8bb5bfbe528356d419c |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/e8daff27ab3ffa5345313cffcb52797466749ecf | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/805b76e721388e86b50dae60f5444d745b7cda0e |     
   sh4aeb    |         linux-6.12.73          | NOK | https://autobuild.buildroot.org/results/a96f50f5680bd96c57dfe72a40a82d05c3749717 | ORPH
  sparc64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/473ef17274c32febbaa8e7e00915110e8517d5ce |     
    i586     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/ce94ade87f7603d24c9bce363548acaa9615c8f1 |     
  powerpc    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/2592128c55011d173a14bf5a9cb488bccda2fe2b |     
   x86_64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/84355e95de6cfc9688464382e9553b337745445a |     
   x86_64    |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/0c3525a9690f2b6b5076d3514119d3590e4370d8 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/3751f1bfd31093242405ba17804153a52eba4e3f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/001f3e4c2b06990b3c553a489691e17642740e1a |     
  powerpc    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/3ed101a1dc41a829cdc08e588b1efea23d61f089 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
