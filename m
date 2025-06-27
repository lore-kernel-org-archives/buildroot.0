Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCCCC7EE31
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 03:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3312E605BA;
	Fri, 27 Jun 2025 03:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZt8LjXYmF6X; Fri, 27 Jun 2025 03:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32327608B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32327608B6;
	Fri, 27 Jun 2025 03:15:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0C26154
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 03:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A29AC81E76
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 03:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYIcfFawXMnj for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 03:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BA7C810F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA7C810F8
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BA7C810F8
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 03:15:35 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-60497d07279so3670928a12.3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 20:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750994133; x=1751598933;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngQIeonY0tZicfNp2wo/98nQ/PI7E/LiluRnm5DCLSE=;
 b=H0IZkkLRDWmtl7eglKA/dTDkiV/jSJG7b2Wud/QGlpvAd48m64lyd03R54c+swnAvG
 f67AgeIH4NnG7eotjIslQliXQT/l8lOJVBONOIRqZHBkxmC/eJHpDKXNSwqoUkUMHVlT
 DOxCgtG5/WrFFqGGrdUt3TOX6n/Te0pIElhrAx7+vNuBc9+fdKHNcZJTypwJHPMXWM0w
 8SlekvOiMpQDDDgyMYPCo1cbpL6KZ5K9xCWQTOM53M/85D8FXX2KGHgruWnRyIWeos7z
 poh5aUI9cGw7IslE/CJNo7NnXhTNI5WBiNKyE1mNjSTXqQeHhjEfSo0jTQjmP0aW57O0
 Fskg==
X-Gm-Message-State: AOJu0YwNymzSTR8ghx1UXNkmPOn5iItADJ8ZalvJrSssUqiCRdyLbyKW
 6zFGDfs0sJTrfm3IcqUGCxtqwNFd0zm1gYotDRGtXrv0V+xP2MaSI0zhxlvmwQ==
X-Gm-Gg: ASbGncsUnChsbSrpKfRmBIhJToYwU0Dy4FxgQrm3gk4wqHvMFwWzABQ83jEi+kNFFbU
 uvnDHDLxcykvw93WTYW0gMnKZMT2PnHwdsuxsxQ/BD/XRQ9TQ68llKMsvNjra41L16ZFx6zUx2C
 0RB06PigNRkAaAgk4zXpcaLLjmJxRLW39L1WR+7OujR34UExgm4Nuj/ZHpMuJcsFjNLEF6Ylhhh
 ndA7vF6GzwUVCLWi+VMHa9SGPPlNH0i729zpQMuzmfVpAR1m2ePCOWOYNrDQrLZWI/tWmvR0btN
 RkSP0ta8TjqX/OplyL93RbDXw8ucGkVbmGCCQz+UnxnOchogBqDgCqxk8shC7uLV8edmGAphz6q
 A
X-Google-Smtp-Source: AGHT+IHPjoBDXrjeJK6Mkdgpu9ZvXpnBMgW8iYJ7UtIGIo8cfXafjBz9v1L1rXeUiw+p5QNF+BE8VA==
X-Received: by 2002:a17:907:930a:b0:ad8:914b:7d15 with SMTP id
 a640c23a62f3a-ae34fd33136mr119944366b.7.1750994132899; 
 Thu, 26 Jun 2025 20:15:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35363afdcsm41261666b.29.2025.06.26.20.15.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 20:15:32 -0700 (PDT)
Message-ID: <685e0cd4.170a0220.219911.156c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 27 Jun 2025 03:15:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750994133; x=1751598933; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ngQIeonY0tZicfNp2wo/98nQ/PI7E/LiluRnm5DCLSE=;
 b=PszNGa7gyo2zMRbSdmamRYNU6Xc14GbWwmSsI0RCQ8XOuFsD7qBFAzH8Dpr5aGoF7N
 YTwewCIXvANQARX4rXJUD7ymBj2cdvPAnxmf68M4jzAb0Mb1mNn5GBHG8iHdsGYCFRLh
 nCEduxZx8mJtkCzxSML3dnzOahxZJGiBow8HEQ58eXHDVSuXqd0aI2skkuuJUmHYrt8h
 7YRvJRWFKSAE8SZOq+/xhH/yfRDOY+ZBQNlhn6e2GWy2PT2/LaFhJq8fUoqDwVxCTTN2
 vAUgED06yWasC885b4kdLnql4AYtRrX3+eJBMHoUCdiR6GXf3cPIibAIbrH7hxrZ2vTV
 QcjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PszNGa7g
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-26
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

Autobuild statistics for 2025-06-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  4  |  0  |  6  |
  2025.05.x  |  1  | 11  |  0  | 12  |
    master   | 11  | 36  |  0  | 47  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
               bctoolbox-4.4.8 | 3 
              host-rust-1.86.0 | 2 
                  prboom-2.5.0 | 2 
                     bc-1.07.1 | 1 
                    bmx7-7.1.1 | 1 
                 dc3dd-7.2.641 | 1 
                    gcr-3.40.0 | 1 
          gitlab-runner-15.5.0 | 1 
                    gpm-1.20.7 | 1 
                 hddtemp-0.4.3 | 1 
          host-binutils-2.43.1 | 1 
             libargtable2-2.13 | 1 
                  libjwt-3.2.0 | 1 
             libmediaart-1.9.6 | 1 
                libshout-2.4.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 libv4l-1.28.1 | 1 
                  linux-6.15.3 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20250530 | 1 
            netstat-nat-1.4.10 | 1 
                   perl-5.40.2 | 1 
pthreadpool-560c60d342a7607... | 1 
               pulseaudio-17.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
        vulkan-headers-1.4.317 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/4f2f0083e9408b102238f08bed4d0d38afce3c15 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/36d949a7ae5b6c20a83ffcf8d64f9cb635b4f732 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3eb1b227960bc9c9f0a745ea56673ef5f88707e5 | ORPH
   sh4aeb    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1c62cbead67f26379f6322b4c2866a2e9b3bc041 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e85489a7fc00288b595c01a4a1c10acc32da24ae | ORPH
  sparc64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/1a024afe10ee2559b3928cc532feaa6e09c4e62f | ORPH
 powerpc64   |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/ec1ee71f48466a6238ed94c9dafcf70daa69be9b | ORPH
    arm      |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/0be549ca39b67182f91de2bdb5e9cc1812caee1a |     
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/11804befc6273e6351283a9479d54fcbf1662229 |     
   sparc     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/7ed4f182eabbf7b2e833d1bcaf8150ed1e7f3bad |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3520a8aeb0123de46f013490f981238815ed12ee |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/20e97a4fd19f58e3545ad12b00109136bd46cd32 |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/6b57e6b2ec71fc02042967c9aefa22b2f43641f1 |     
   mips64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/7e7c8b3d1215c83573d15d1c949e0915326ab8f5 | ORPH
microblazeel |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/163ff86fcc63a6eb5dd1697cb295f3b2fbbd539e |     
    arm      |       libmediaart-1.9.6        | NOK | https://autobuild.buildroot.org/results/cbf142d07eb175a8307f90f58609b6dd31cad06d |     
   armeb     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/e57e7cae5406b04c9a790b4e1e37a982df62f04e | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/81ef15a46d1cd75c0c5a22e48c969793eaacb09e | ORPH
    sh4a     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/7467d3ef840f4a072f814ee07fa19353fb124a3d |     
    i686     |          linux-6.15.3          | NOK | https://autobuild.buildroot.org/results/0ab2fb669cd8e8f56278c2a6a4ae41fb8b81a4d6 | ORPH
    m68k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/ed27b6b8e14bd70d547ace2d5c5bd11be4298b1c | ORPH
    arc      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/b1a36f9971c97300670d8d772ace11e5fedceaaa |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/9ec67b7fe3b18dfdf5456a7e68c2fb785904a4b8 | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3f4575d50ef93f4645062b179d4bb5db53324aac |     
    or1k     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/41b58078e6bb5fa29420856319ae5106448b1729 | ORPH
  riscv32    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/bbcf5bcde27df4485c43f6da234ece3e9c64a732 | ORPH
   xtensa    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/804fbed5fa82a52434cf369543bcf44db80486cc |     
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/539fc999c3dc9744dbabcaf0568ddefe4c0d2ff5 | ORPH
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/3b2a248a61972f2d9b113b3aff5318f0bf16d41a |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f197002211d6783399cba7a2d497d76e343c1301 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/506adfd6eb8c78db6057d64f836c53e0d10c3474 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/674a7ea15fb7399cc9a3176d883615051644682c |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/cac5366e9b91f46763fa44b9a7a2ca6314b887f2 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/81f925bfc1e185ae79a2aa483259103cd65a9c58 |     
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/671bdeb663cf0e4f30a5c6b9ea05b26a6cb14fcd | ORPH
    arm      |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/3832422058b892916727e4fceaf9f9e52a3bff3e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   crun-1.18.2 | 1 
                elfutils-0.192 | 1 
host-binutils-arc-2023.09-r... | 1 
                    php-8.3.22 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/c2bd9026c6d706410b0271c7a29a4e66b50829d3 |     
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5edd04df17a35a22ca23e4a9e56d3ee29696ac46 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/679ed503a9a08fff46d79a1ccc6d56e58d784867 |     
    m68k     |           php-8.3.22           | NOK | https://autobuild.buildroot.org/results/2f6d6111437d6127e59a59ddf44047d8787812a7 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    bmx7-7.1.1 | 3 
               bctoolbox-4.4.8 | 1 
                elfutils-0.192 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
        host-berkeleydb-5.3.28 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.1.0 | 1 
              libselinux-3.8.1 | 1 
       shadowsocks-libev-3.3.5 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a2a27ab51f8873890395e72bc2f29c5b7ef2fa04 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5fc6dc71b6de0a021a19796893e3bbdd7bdb4a82 | ORPH
    i486     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6df6eee0ebfe7026001138a80e674435f84e719c | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/49999266712380f90391f15a05d39ff8ae90bb70 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0d290be8c61ee8fbb1e5502aeb29f4f6218ebd2a | ORPH
    i686     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/3511bb1b31ed350476e0349260c2393483e30dd3 |     
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/61ac02ea3c35a863d476fabdd735a609aca7bc35 | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7dab88b44b553d59e66427126b0590b128124bd1 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/93bd8897ec830619d555189c2f7e932760ed7664 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/28f671b6497ca63e0cace2fe19e65aee5c92ddd3 |     
   mips64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/e0dbab9c019a42e84cf84b78de168233d99b2673 | ORPH


Gitlab CI results for 2025-06-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476560840 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476556662 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476554822 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476550932 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476550127 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476545515 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476539250 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10476538582 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462720742 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462720374 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462422109 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278637 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278493 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278436 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278431 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278415 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278406 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278387 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278316 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278268 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278066 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
