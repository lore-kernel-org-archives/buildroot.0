Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD464D10379
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 04:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11EA040AFA;
	Wed, 26 Nov 2025 04:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ocj35PnvB60A; Wed, 26 Nov 2025 04:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B06BF40B1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B06BF40B1B;
	Wed, 26 Nov 2025 04:25:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4373C35C
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 04:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3568F40516
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 04:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYtKcW9WdSAH for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 04:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D02B40065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D02B40065
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D02B40065
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 04:25:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so2853255e9.1
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764131151; x=1764735951;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQETrca2uR+Bhm7PlhhYoAKc/N9NEuZJxDrJXH7JZBU=;
 b=DZCTbwe+sNlAIZKyJpqFPHoAAxAGPbtjcTDxLgM2vau3VifnHsTJ+7cEahfsSazhd7
 zaYBc4FinZjCxxK3W93gaLvTO0bVfRb1Te9qXrYdSv7OjbUm52f21Umntw2LkOVF0JlJ
 yqaKVVH/ZOs2yu6Hn9vbnB9T+p5U7fWXEdYF/qfcDeOE7GwW5ie2GOcK4WwBJNtqveuH
 YLI6nivvlFSqQSfRVo+eLTnnYHAhvWnPeCqeQaWP4WuEtVGXTjSrv74obNlG7IMEEvK2
 XMyhTX7hxgdq05w9W19ZOalAlF71AVlfU+kTDcffqMkssSDRq5AEg4kWZGvXD/U/OMkI
 xUCg==
X-Gm-Message-State: AOJu0Yw03FwnGrf/F5adXodQzYw8vSgUMBY22CcotAdTvfkRxufzNqgs
 fAeVAt3LQ6vKWtL/vSXlxlqnhQCPUqkV4r/tGIFMYRGKJjRsX1+IMapbQ5/nZQ==
X-Gm-Gg: ASbGncvctEusMjqu9QiBD/Q/hQgeeA8kxZuaH6Pp8nWNakbTF+tX8MzHKhSPBuJrVBG
 MaGA1YS/IPUiSYo4xFsaegG8++0wC5WSV6L1+R1lalvcnFEPD4IOb6xeZme5r25gEtHQAz76Djc
 mqo8OyEIYXEv5zm/MLw8VFry0NRr2pREv3Fl4RkO4sOaakmIxNzWnj8S1z53EDiknRJRu1AYyPS
 WijXv7y4Xt3LawjGSdfw3qEnzAD5dyqXbFUVdHaI2A762SFBGr7vmIwBW4ngzVw9unaGyuhbIqt
 Q7CkfYZPWt3mwQZuANURqSOZoZHL3jGnjGkhpxUPcx2QVmPLe9rZH6MhTMOBIR507Pm/dFClQP2
 wV52tkfDwIVbMt698i5pJcUhTjzuODrXOaZgt/VUCdKeM3AzfplgbkXPSh+1h3Ff+LGeK9c9iwT
 V5QE+ON4nJoSF/1mIb9A==
X-Google-Smtp-Source: AGHT+IGPriTvuVaHgnP1YPXo2zSrRGynvUpPny3G3CW9xGpuzPKRWrRruCEkTdptg56IoqvGMNaFKQ==
X-Received: by 2002:a05:600c:4515:b0:477:7a5c:6a8e with SMTP id
 5b1f17b1804b1-477c0513800mr164259195e9.9.1764131150960; 
 Tue, 25 Nov 2025 20:25:50 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790552c3c9sm32469175e9.0.2025.11.25.20.25.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 20:25:50 -0800 (PST)
Message-ID: <6926814e.050a0220.1344d1.ceeb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 26 Nov 2025 04:25:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764131151; x=1764735951; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VQETrca2uR+Bhm7PlhhYoAKc/N9NEuZJxDrJXH7JZBU=;
 b=WrNBx4hXhtJV/c2JgAQlvi+XW4qpJ2BiXhUkvU7s7wOLF++oLCrtjiEg3xrv6XunXw
 07cepoBL3vktUphJ0OLqfTCCj3acpEOyId9mOBybrZn1QWzEFPT0VrutI0pz5FgNpBLY
 +yMlu8FlVDsv6SNxekz+wPWybGQdip7Ofz6K1FEbrVAuuckpkP6evWQ309PlZdbPGSzS
 XNBHEEe261PAtS6Lro7lUnPkt6MHzNASZzePY2gZYL+4xXyI+GEUzQAjXV9gaBmuBU9b
 UOSwC1zPExJvgzvx4FBWA0/oQuXKdiZ0upaCKDT7+NUFcuyq8KfsLV2Hx9i2a2ez+C9g
 qKXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WrNBx4hX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-25
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

Autobuild statistics for 2025-11-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  8  |  0  | 14  |
  2025.05.x  |  2  |  4  |  0  |  6  |
  2025.08.x  |  0  |  3  |  0  |  3  |
    master   | 34  | 73  |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 7 
                   cvs-1.12.13 | 3 
             dahdi-linux-3.3.0 | 3 
     libphidget-2.1.9.20190409 | 3 
         linux-headers-6.6.117 | 3 
          aardvark-dns-v1.17.0 | 2 
                   dante-1.4.4 | 2 
            igh-ethercat-1.6.3 | 2 
                  iozone-3.508 | 2 
                   libcap-2.77 | 2 
                    sdl-1.2.15 | 2 
                    bat-0.26.0 | 1 
                  broot-1.53.0 | 1 
             bubblewrap-0.11.0 | 1 
                  cairo-1.18.4 | 1 
        edk2-edk2-stable202508 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   fwupd-2.0.4 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
            gstreamer1-1.24.13 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
              host-rust-1.88.0 | 1 
              host-swipl-9.2.8 | 1 
               iptables-1.8.11 | 1 
                  libbpf-1.6.2 | 1 
               libconfig-1.8.1 | 1 
                    libev-4.33 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.33 | 1 
              libmhash-0.9.9.9 | 1 
              libopenssl-3.6.0 | 1 
           libsoundtouch-2.4.0 | 1 
                  libsvg-0.1.4 | 1 
                  libteam-1.32 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.17.9 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250530 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                openssh-10.2p1 | 1 
                   perl-5.40.2 | 1 
                python3-3.13.9 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                safeclib-3.7.1 | 1 
              sdl2_mixer-2.6.3 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             strongswan-5.9.14 | 1 
                       unknown | 1 
                     unzip-6.0 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/b9a2a08ec65308241e6657208b8ba39a907709a0 | ORPH
 powerpc64   |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/bbb999e3e6e7149dda05a532dcb1472fcd0ff0e7 | ORPH
   armeb     |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/eaf5e6877821d8613bc87eceb4c144a9e78cb394 |     
 powerpc64   |          broot-1.53.0          | NOK | https://autobuild.buildroot.org/results/c2b27e2cb502478b957b21057eac17ea2dab9d74 |     
   arceb     |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/97debe866ce194bf66ebaf5ee84f9f0c2d50778b |     
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/8fe5f7455d0fd98906b0068d3d6b55a12b11cb70 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/716e43149761635725fb503ea35238b81acf03fd | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cd90d6c5e68ed362eb001e26208efcbc4fdd7a5b | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/33bda8b08bec2c4b9513a14aeb4e583cfaeca6dc | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b31bb278925f26c19da9a739f3b4c8004143ad1c | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a5f08b03af2d1b818cde963c1eef89ba58b5c94f | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/34bd409dbe3521070fdba7184be45e5ce0139b0c | ORPH
   sh4eb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f98df4e3befb47b5b1d0882ea0af1952a0a82dc3 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/55dc8051915fbcb9037b42e558fa4fa072f619d5 | ORPH
   x86_64    |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/e6380abbe858912122cc9a097047f9ac445c6582 |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/2720da2d5c70dffd0f5aa520daaae822376d49b0 |     
   x86_64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/541ec6c548f7e0c7b30600642ba71117d2755f65 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/063673f407be74bb8532d2ab6b9c619516daf201 |     
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c9f56a29aece53e765c713afdaeeaf3932e85a11 | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/1b9fcb9db3bed91b56b36716fa47625221dddbc6 | ORPH
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/40039a857b0b6ca33eea0f22fee9e715d6d45e12 | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9fedb72526e23b00aafb66bbbee9c46633e8d42c |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0fd5f39ec1442b8795ad37f2d40640d0f58777fd |     
 powerpc64   |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/0e7ec3e79d08610a0a598a87aec8afdea68d4c82 |     
 aarch64_be  |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/ebd7c91635d1bb9480a368357361eb906102c279 |     
    i686     |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/4e156c8f6bdfd4feefc291d29e354572bb629842 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1d669a3685ac5e0d6a88872b692c69b79c05b6f5 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/34d9a62c4d8eae33e060bddd2da7ac92c1f9af23 |     
loongarch64  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/eff3bf97fbfc204a163a1dab2819233666353dd6 | ORPH
    or1k     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/6045c8e6ecf060e4ab36521d74a40e99f1464808 | ORPH
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a117265faf4947966a518c27e98aef37ce817623 | ORPH
loongarch64  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/419b084f20f5c270e29f243471dfdaf6002d52dd | ORPH
    arm      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/972ecba6f688333bebaa7a0337e728bdf4a2d4b0 | ORPH
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d48e3ef9c9210b99caa429f487a4082e2f8c0a62 | ORPH
    m68k     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3879b10d911aa267841219e6dd7f5e133fb8908f | ORPH
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/97bac6df9e55f6238132baf60f157a3a6781c9c8 | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/e49ca4fd72c2a93b2905be8202a05886bb8e59ee |     
  powerpc    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/043299ee4cf825c5a852905f9f6aabd2657ea935 |     
   x86_64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/1ed3e736710402a8af4e83d5ccb965a3a710d8ce |     
microblazeel |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/ebb35d1f40b8a6000fd3fa6ea99a5e3c42500bb9 |     
    mips     |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/f59113a4a534aca3c71246967060f4d47046d43c | ORPH
microblazeel | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/51e5c4e7d6943136e26b84c436d7c3cbc46f2aff |     
   armeb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/cbb38dd66540b3bf6a3a72dc4ad63409825e31fd |     
 microblaze  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/bd868674f9796879d1d9af52672f7d3e00c333d8 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/2c0aa71d9d583e52f0e4b5aab193572925db633d | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b4f7ef9521510a16b44ef7038a96fee0dc4a7013 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/eb7d172049825dcf5c048c5c0ff774b26701faf1 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5cdfe9c95186f07614cfc7dfdf1703baceb39312 |     
   sparc     |      libsoundtouch-2.4.0       | NOK | https://autobuild.buildroot.org/results/980f1b993445450695c65a1d4a8ff47eb86cfa50 |     
    sh4      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/527459cec2de45359904869774975fbf036e6e75 |     
  aarch64    |          libteam-1.32          | NOK | https://autobuild.buildroot.org/results/bbda5303065977b2cd7bc1bd09f9d4f509b2af14 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8ee8ff878f54cfa5d135b9a5424f36f1446a7304 | ORPH
   armeb     |          linux-6.17.9          | NOK | https://autobuild.buildroot.org/results/a4b6e3dfd03f2b610aac61562832298c91a0f0f7 | ORPH
 powerpc64   |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/e802658a7c1a8f1f4addedb4c5b6b34f41d6e9ec | ORPH
    i686     |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/4b23840df79ab12114c7f1f3df7c51d082aeabee | ORPH
microblazeel |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/868091d9c03d7afc64056dcab6217ab3665ad8ea | ORPH
  powerpc    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1ef30290f8c8586d8aea1c6520dd7f10151023d2 | ORPH
   armeb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/08924ee72510cd6c050f8ee28a330a6ff1b04f24 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/beba92dac805b8ce7c315b8bdbc9dd7ffe639ed6 |     
    m68k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/80bc8bcd900f3db073de58eb8d3ab4928e3c4a88 |     
    mips     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/fece11a3fb4111f5f8cdeab2c05410091210de40 | ORPH
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/77a89c5df806410f58940744af9ed626245538cf |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/fea2073974b84e533ee3310b6f2ea0b04fcffd1c |     
  sparc64    |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/1c65666423e9c21abf146df2261fdeaaac9f542a |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/abd0b38d65a8e5b71350ecb64b0a7c6e3718b39d |     
    sh4a     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/e683081fd99480b88aae700a1a75c9de8b06bd15 | ORPH
    sh4      |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/71fd626b1eb1ed6adde0be3a56f43d5c439ae79e | ORPH
   arceb     |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/3d8a4250a3b9a3d65cbbc6ff86ed366071d37217 | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/6ad37a95ec2eff4621f537041fe2d9abdf8fbddd |     
    i686     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/fe2b64f98d1b275dee43a0f626d51087b241a41f |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/99226fed933183049e5f72328fdc02b0fb6fce19 |     
   armeb     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/4483a43a4b1682037dfeff5c8223ac4cf98acc61 |     
    arc      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/33bbd6ddd84f8c09743ed65e3b045be166ec820f | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                libsepol-3.8.1 | 1 
          linux-5.10.162-cip24 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/5fced7d705a2bf0c44ec5a61d5e31f1239fd33ba |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/db2ea52e6d93a3edebe8aea43fd4e2d7dee612bc | ORPH
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/38c7dfe745e36be41f2068de207bc7ef8b952b16 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                     criu-3.19 | 1 
                     fd-10.2.0 | 1 
               host-runc-1.2.4 | 1 
                  libdex-0.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.12.58 | 1 
     s6-portable-utils-2.3.0.3 | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/45f9520b652a2e86a5f1c5ce9a23b3af0faaf963 |     
  aarch64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/1cd457e377666eb53239b159279504804866a0df |     
  riscv32    |        host-runc-1.2.4         | NOK | https://autobuild.buildroot.org/results/16c68a53b8ee5d259a1ae3ce2e44f34fa8b910a3 |     
   mips64    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/573d1f26ab459a5400943a6f232ab0c609d78fc4 |     
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/490b6f6cd2e5c75ea62c920b2393cc9420f1ad64 | ORPH
   x86_64    |         linux-6.12.58          | NOK | https://autobuild.buildroot.org/results/ec7708a24a0edacae3564342989a14bfc752d0ec | ORPH
  sparc64    |   s6-portable-utils-2.3.0.3    | NOK | https://autobuild.buildroot.org/results/70f5bd12d45bd00479b78af4f1309ba950c52ca0 |     
   mipsel    |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/ddf48d4a05cbe7f892e2bd68e4e6dd67f5c64a19 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               asterisk-22.3.0 | 1 
    host-mender-artifact-4.1.0 | 1 
          libcamera-apps-1.5.0 | 1 
           oath-toolkit-2.6.12 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/0b05dc35c9e1dfdebf5763e9d2a02fb926661649 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/2a0305008bcec10407cbf432b293ea73d518dfcb |     
  sparc64    |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/2324b265dd8494c8d46808354ce5bcebba50320b |     
   mips64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/f86d55941b4eb40ac9874922feb4193721011b07 |     


Gitlab CI results for 2025-11-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/12204122863 | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/12204122100 |      
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/12204122002 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12204121709 |      
...onPy3NetworkmanagerGoi | https://gitlab.com/buildroot.org/buildroot/-/jobs/12204119947 |      
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12188741643 | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/12188741564 |      
        TestMesa3DRusticl | https://gitlab.com/buildroot.org/buildroot/-/jobs/12188741539 |      
        TestMenderSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12188741537 | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/12188741354 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12188741352 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
