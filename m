Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10856C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C4A606A3;
	Sat,  8 Mar 2025 04:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dp79WTfh9958; Sat,  8 Mar 2025 04:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E767606AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E767606AE;
	Sat,  8 Mar 2025 04:14:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DFC21C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11CEA4016F
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 04:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwAAzeR_Mk8H for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 04:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97DFC4139D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97DFC4139D
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97DFC4139D
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 04:14:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e4ad1d67bdso3960088a12.2
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 20:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741407270; x=1742012070;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+/VL4r+Twv+6ozuvUT9qxSazt25B8MSf9/pRdNziRQ=;
 b=IxvtV3Iyxgbb3HwaK1r78Q4+SDs2lRiQpI8X3hWfQc/FRA+aDUg4Vq6/gh2wF50hhH
 NigC2ED5QYnbrmSjdwCgbaDRc1WJb1wVozjM3z0LTrfoUyWOgXHOd5uLPufMcLjxps72
 28AXHfNHQxzFO0YmdockWrBPolDYt9amJGNFI5Ws711SOwNIp124Bi4lidieFtGG7wwG
 CarV20wHVZlN1xCxDP1zX2BXoxW5zn2pHc62DlltEXq1nYfqIuuxzwAdqCVN5M934uXM
 SXJnrF9g00TJQWBD4PVDGnfKUsN/4dBtd+9gjLxGBYgARb+U6QIw/fXIUzIIjgUafe29
 Seqg==
X-Gm-Message-State: AOJu0Yxf5urIeAEebwCRUsezMVbGFg4BKhfkKGsm+JDmBBjmZSQU4eRS
 GChWDDHvuoYwRT4xI09xsJnIDyyrlfKzKiK+6U2VEZ2QTT7WxH1i/x11nw==
X-Gm-Gg: ASbGncveIOds7u0k6djp0yQZ7gDf0FRXuOah6kYIYYxtaM7AeNNCjNkzPEN1bIeXr+i
 ZT6CVU2G1YiQgYg2iSNx5G6Hw2dqGlWIQaCBTCu6VAoIZMvJHsp8D8fT4LcRKS5hnlSjA5QibOS
 sKmmELBKWrX0fL+4WfnCD0bFjmnBEsOxNA0j4C/+LNXiqv1xt7/nUM8CQki7DojUMePyBH/QPN5
 mzY7gcd9l4MiPuQopBFQDx/hTFENEXwl06cyn/UTjE3SM1DURX+I4EcwwDPeFnqk0bSmonRo1qe
 x/ILN7HjmYzKbKxKoFtE52gNx8Z2PhZg4i/4koD69/7FIwo+
X-Google-Smtp-Source: AGHT+IE3Tv48kvoYtHKLKTIhLdEIyeJI2bXPNHEmK/Srwi18U96UDT20LOcRyijPgJPBlhqL0iMXyA==
X-Received: by 2002:a17:907:7ba4:b0:ac1:e2e0:f8d8 with SMTP id
 a640c23a62f3a-ac2525e052dmr734466166b.10.1741407270239; 
 Fri, 07 Mar 2025 20:14:30 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2399d79f4sm372369566b.176.2025.03.07.20.14.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 20:14:30 -0800 (PST)
Message-ID: <67cbc426.170a0220.2af3f8.f06f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 08 Mar 2025 04:14:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741407270; x=1742012070; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=E+/VL4r+Twv+6ozuvUT9qxSazt25B8MSf9/pRdNziRQ=;
 b=VwyGg5em5hLLeoJ+9o9RJCdYfOMFa3Zh+oZwGZ1/TqePOq9qDywqvE6qBj40lZxGni
 0M1sZ/bGndSY7oltgt1jcEnYJNL8Urz8ESWC9f2srXeh7jtffoJkpb3Uf310/eVwqiV3
 SinBl8kVonIJotSiU8PlYDRjJbdhBz15nDcu+J/iyiMvQWRJvtb8cLVglavlk5l5Lu47
 AzP790h21LSTXE0V9oTB9HbLY0ARALC/vAvnJg1G4CA8bXWvjgYYnZA/ZfDyXmpVP2pz
 xzQlPn8O4U72nlvbyxrMD7k7+2O8m4ruPObxWFtrIpYyuZxrPUVolM0jAh4YFLNwjypT
 G/eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VwyGg5em
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-07
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

Autobuild statistics for 2025-03-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  6  |  0  |  8  |
  2024.11.x  |  1  |  5  |  0  |  6  |
    master   | 17  | 58  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 6 
     linux-5.10.162-cip24-rt10 | 4 
                 linux-6.12.17 | 3 
                       unknown | 3 
                   cvs-1.12.13 | 2 
    host-mender-artifact-4.0.0 | 2 
 host-softether-4.30-9700-beta | 2 
                 libcdio-2.2.0 | 2 
                  libsepol-3.7 | 2 
               mariadb-10.11.6 | 2 
             berkeleydb-5.3.28 | 1 
             bluez5_utils-5.79 | 1 
             bmap-writer-1.0.2 | 1 
                  boinc-7.20.2 | 1 
                  boost-1.83.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   crun-1.18.2 | 1 
          cups-pk-helper-0.2.7 | 1 
                   exim-4.98.1 | 1 
                  ffmpeg-6.1.2 | 1 
  gobject-introspection-1.82.0 | 1 
           host-cryptopp-8.9.0 | 1 
                 host-gdb-16.1 | 1 
              host-rust-1.82.0 | 1 
                lesstif-0.95.2 | 1 
                libsoup3-3.6.1 | 1 
              libudfread-1.1.2 | 1 
                 libv4l-1.28.1 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
       matchbox-keyboard-0.1.1 | 1 
             matchbox-lib-1.12 | 1 
                    mpv-0.35.1 | 1 
                  musepack-475 | 1 
                   nanocom-1.0 | 1 
                  ntp-4.2.8p18 | 1 
               pulseaudio-17.0 | 1 
         s6-linux-init-1.1.2.0 | 1 
                statserial-1.1 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/83d92dccd0043d8ccff7307c53651bafe7b7d7f2 | ORPH
   mips64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e61945668bb24b6c02bd5fdad2b81039d960403c |     
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/c95e4e80d22ba180c47a83748791e02aacb6ffad |     
microblazeel |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/4ff5939231736edc564c60bc4a959f174872864e |     
  mips64el   |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/05401640edbe753137ddd294e69178261fca84d3 |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/acc3be729a16d800876794eb5a100888fc486545 | ORPH
  powerpc    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/094ccc68725fc22e8754101be282a17bb6ed166c |     
  mips64el   |      cups-pk-helper-0.2.7      | NOK | https://autobuild.buildroot.org/results/60a56a022cbb492d09d7bd79629c3a748fa00f64 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6ae58483583aa53e332c546bcc0cb34358cf6019 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dbf72e7c4ad2d04259c240d343827f3382dee865 | ORPH
    arm      |          exim-4.98.1           | NOK | https://autobuild.buildroot.org/results/e463886c66f11d56eb411dba6efc36af8dc729b2 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8f4477ea4cc771dba60d01084d30b6d98aed3667 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/866ef94a62ad8ff70c345a040456c0b2c32c9e80 | ORPH
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/5a325484af613cc89cf18315bf3363967b3ab3a0 |     
powerpc64le  |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/a8b5e64692ea74d58e4f1b6b01fd59c7f2b766f8 | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/2a204749382a18fe43d29584fd7289168fbe3ea1 |     
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/dbd20ad462ee5b1d8d7681a86503e5e1d571b34b |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0bd72bef71fed5bcd4082a649dec38e7b60a2581 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b59c14d97d39c2bac1162d7bb95e384d6e13eb36 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a20937c84a30488c787932437ed4889f5c32164e |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/aaa1d1d40f3020e51dab1c31483506b318a49788 |     
    i686     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5eb0685c595d892a979a5418e9c609c7f6bfdda7 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/721db986015fee3a906a53003d56f01fe8167de4 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c7f19c545670bb69071cf39292d27774e4eaad0c |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6a3ebf6cb6464bbf762fc4decb430723b5d365ea | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/433c4877f491ffeb0ae45c1ea9c41f99530984da | ORPH
  mips64el   |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/86b7bebfd3ac115e00d136ec8541fb39f682e06e | ORPH
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/abba881302ecfe5531fdd75aadce201325251667 |     
    sh4      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/e643332792e2d7305f1db5301b4aad5856cf54d6 |     
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/9052d713a596bb49b40fd8a4ffc2615b2185e569 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/eb45896c9ce0ff6b30e200948bc698e17275848a |     
   s390x     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/cd09f1f81b552f9510855655e4f8408645d5351c |     
   armeb     |        libudfread-1.1.2        | NOK | https://autobuild.buildroot.org/results/3d7afc5d717d06d2e224e954045916020a7dd674 |     
   mips64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/265e2718321b14ed1167130a61bdfb9c63f6cca5 |     
  mips64el   |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/3704d506a99899c470949d18f923b57ca65ccdb6 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5e3c1186e010d4157dd1fe9b8b6f8542ed97e085 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/48ebe9692bf05ed795b99fe71a1808573f3a6b1c | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9049938e520d10b085b90e0234beedf9ce0b76fb | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6fb3e24fd7b2c8631c9ff201e462d78a984c820c | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9c02ea6043cc49ca1bb939846dcaf022eb6d5683 | ORPH
  riscv64    |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/4a987f338b25a427237f794799cede9d2b5e29c4 | ORPH
 powerpc64   |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/7a29e3a7a734e08a234845f774a96e00a6323366 | ORPH
   armeb     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/29ff2b1f6a1362318fb4239d1ee869f66108beca | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e9deeb9d9a7442f3bc900be4de630c7ca81680e4 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d10cf35c41e4ab26f7001ec5ac78bfbe7724f191 | ORPH
  sparc64    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/979ae8ade8854f25b948091623f14746705148cd | ORPH
    i586     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/1c660b58f8116c29d68d66f4f371e7a75ba20fce | ORPH
 microblaze  |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/2a34e2491491da548a7e443a4a0b64a58e57fc4e |     
 powerpc64   |          musepack-475          | NOK | https://autobuild.buildroot.org/results/0b83329a5392e8efc611ea8e01b84c2c7146623a | ORPH
  aarch64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/5df6f623605d3fa5156d6bb300bf3d4fb067a1f5 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/039f6d37785fbca6cc7e3a13ecabb743da329161 |     
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/27b8bc87750daf2b61514a9908352b460af4ba37 | ORPH
  sparc64    |     s6-linux-init-1.1.2.0      | NOK | https://autobuild.buildroot.org/results/eefe9e9fef12076d02bf41221f39321ae09444ee |     
  mips64el   |         statserial-1.1         | NOK | https://autobuild.buildroot.org/results/40e725807bea03af86398233341523974a36cc1d | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/c02ef430e0ac8d495287dc9a7ed40103528a0d30 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e95d6699249286a381473208f9cf8a7e09f5fce8 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c8709dc6ac75d11091ee5788517622b4c4365aa5 |     
   mips64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/e54c6b87c8998b1751a58e8300e785d85d1437a4 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  fan-ctrl-1.3 | 1 
                mongodb-4.2.18 | 1 
package/postgresql/postgres... | 1 
               procps-ng-4.0.4 | 1 
            quickjs-2023-12-09 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          fan-ctrl-1.3          | NOK | https://autobuild.buildroot.org/results/fbe5a982b1154a97f3f723c15248d113f153ef86 |     
   x86_64    |         mongodb-4.2.18         | NOK | https://autobuild.buildroot.org/results/33cb864d69442f5077d2a2eaab077485e2a622b5 |     
    sh4a     | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/0b7b831b142d0c764fc669eaffc1a4cb33b1b6fd |     
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e538d1463df3c8eb61752a70f8afc1f8131dcccf | ORPH
   armeb     |       quickjs-2023-12-09       | NOK | https://autobuild.buildroot.org/results/2ef47833893ec2b96ab3323ed2a5618ad1e1190e |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/fdc6730c616644df66f4fb8a37cb086be9c2e6e5 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
             cni-plugins-1.3.0 | 1 
              host-rust-1.82.0 | 1 
             libapparmor-3.1.7 | 1 
package/postgresql/postgres... | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b026bcc6796f591c178dda6016816990cd16b34f |     
    i686     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/b2d78df1bc9e1c358397184b4bb4a251c27ba908 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/fe1ac1c730bbcdf3f3c79475c9cf0ce76c8dc9e5 |     
    m68k     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/77915b1247d9fa8fd0eade672fc03e46b3cc66f4 |     
   mipsel    | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/bc7669232fe396ebcd24da17ebf4d40e4d4dc4c3 |     


Gitlab CI results for 2025-03-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776438  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776571  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776601  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776620  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776630  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776809  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776864  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776895  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776900  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776906  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776911  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776920  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776923  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776926  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776928  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776930  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776975  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776977  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324776978  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777112  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777197  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777227  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777236  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777264  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777269  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777279  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777378  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777392  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777399  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777401  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777414  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777417  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777418  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777420  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777422  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777424  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9324777428  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9337872918  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9337873070  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9337874677  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9337884713  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9337885094  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9337887602  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
