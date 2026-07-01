Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E95C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 03:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3245161341;
	Wed,  1 Jul 2026 03:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwjgBfxYyaNK; Wed,  1 Jul 2026 03:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E310561340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782876407;
	bh=SjR3RfT+Idpog+/bvyB1LdnEVscbvqIHIIEullvQlI8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AaT0p2v88vhY02xTYJ1c17jh06lJ5ridy1W2IAnDwwFLeO3UroLAMmkvoeYbzglwx
	 jW+GrgF9m/JEAMQdvWcTz3wmpUpPTgdkQ5G/wvZTFjIT+xZr2mxlgbRbDUlfdpMEFj
	 /gD8CwrJFY4s1JEiGcUivLhyf/KvPXmPZ0qK0kMV3ranzqt7D4Bw94UkkQ0MPYUTGl
	 w3iDx0LKeFxQvYHX24QTyRod2WJIiVrm25JNdAYWr09DoHVGNS5Zek9Hc3J0XihRQh
	 9At3UPbQY2DN2rqUyBNkGbPBK86bAhXw3LFPMrZXDpyXuvFyz1De5K92o/yUV5iH5W
	 s6dntoVN/Neog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E310561340;
	Wed,  1 Jul 2026 03:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 715BB2EB
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 03:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 573B34021C
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 03:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcWcHG74aTvG for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 03:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B2BA4012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B2BA4012D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B2BA4012D
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 03:26:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493b779003fso506575e9.3
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 20:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782876402; x=1783481202;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+cn3otS/ZWIV0CrdXcuBJZ1eBf0mwAgEoY+2WzAPJc=;
 b=gREpSL9buZoEAW8PiaNW4h1fMFOokY5//w6eSn6Q7g8dpi3HdQ5DWX9oxeiSg5HkG3
 syQt9u6wDGiPjGMCXRPQhf4yOrmm7dVfdVXCIGj5pMVHGYUxLQCV9k6yvqNWyexvnGx3
 pnGYmUNmWyrQTqz7EEmheWfhE6MzH1jZCGSsFTo8Ez9GP7oQ6K6amNDEaZG7e11nE5za
 5C1BHuN5hny963PsrhVz31wdOg1beJtuGfG6wDfcyaX+N9RjeWT5vBBNpXBC1B44u9yV
 cSfLr6VR8jMYcohFGHhH0478kWvHMxe/JY89OXAm0eLlGQNEblhcBjXfF2LDX+ADDaZI
 LInQ==
X-Gm-Message-State: AOJu0YyTR2lG5UO8eQM0FnK1GbPXP8sqV7ibZBSmQxrfkrrxcV2fTjqa
 U6QFp0GrG6FBY+lsup5S6HNK3QIpnzfDrvgfRhEp1Bvg/ztH4oCIkZ0XLYu050CR
X-Gm-Gg: AfdE7cnkHyJ3THHs7QjY8A50qTTW8rS9+CW4rG3MVYIIQ2W5l6NCOHc1e+hS5xfOMQZ
 0ouLMftqOVqqKUz0GwnVDaM31f21GjmIQBZR2AYX/NxoSTdYLsA4IknuYTlsEiXc9r1/+1BkqcV
 b5gQ6M39TzIPjcc0dOQGh0+ZQnG1nxhfDkMg66exFSx0Sd9zMPSMAMNhy/Jq0bseELsuCtwhy9j
 rKRyvmSbk+lXccLCKeAmw2puMGrwxCT5bgGPwie/EApmRwIV3NSAm4x0LxkptgoyRUgDZcTm2TM
 GciKFNMJu3puONyrXdo80qJtIDu9ejFWxrbuA94MxS9EF+orSPvshUdJrPjBk3W9pIE+l7kv2R0
 zruP2yL6gERx1mPmU3chVTvi0FJzu+Nnb640nZYM7csXsXiWAGtssHQ+MH05Bd3RU4UXzrZ9Mhf
 MPrucGTHmC/URAN1d8xcdA7kuR6g==
X-Received: by 2002:a05:600c:3484:b0:493:bdaf:83a7 with SMTP id
 5b1f17b1804b1-493bdaf84d5mr42735615e9.28.1782876401688; 
 Tue, 30 Jun 2026 20:26:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4bfd47sm56073215e9.2.2026.06.30.20.26.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:26:41 -0700 (PDT)
Message-ID: <6a4488f1.51d65a57.22a612.f8d6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 01 Jul 2026 03:26:41 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782876402; x=1783481202; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=F+cn3otS/ZWIV0CrdXcuBJZ1eBf0mwAgEoY+2WzAPJc=;
 b=KBLkGMbfk0fYBFV7Gns8Ca9n6ppjdsKIywccEvqA18BjR6a+zQnrWuAwUv3mMtbXkK
 O7NCSpAGsiK4yNUmeKFNd8V4Ru7zkQveRyl5fDmX/YanycVku1kFceiYHeKrzIUQJ8lN
 M8wD0o0IIdE6gUObPLHifYR+ZbnJBopKdrIYpnFNBsWebLm79lEC4wIeirQWiHjLUXlu
 JjbSUqEOiTtMwOqS12YEYWqio0Z62qIhhi3Es8fqyeTY8xFN8Xmih+6C6sU/AVvFBmsA
 KxWjQhAV9H93kQx85xMPDlGBZT6527VNbdiNiKSZdQ6lNBgMmVy4+ubgG+iSRHLyAnCM
 sSpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KBLkGMbf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-30
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

Autobuild statistics for 2026-06-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  4  |  0  |  4  |
  2026.02.x  |  0  |  1  |  0  |  1  |
  2026.05.x  |  1  |  1  |  0  |  2  |
    master   | 19  | 47  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.28 | 3 
        edk2-edk2-stable202602 | 2 
  gobject-introspection-1.84.0 | 2 
              host-guile-3.0.9 | 2 
host-vboot-utils-7dfa482d6a... | 2 
                    lua-ev-1.5 | 2 
ustream-ssl-5a81c108d20e247... | 2 
amazon-ecr-credential-helpe... | 1 
android-tools-4.2.2+git2013... | 1 
                   bird-2.15.1 | 1 
              containerd-2.0.7 | 1 
             dahdi-linux-3.3.0 | 1 
              erlang-26.2.5.15 | 1 
                  ffmpeg-6.1.5 | 1 
                      fio-3.42 | 1 
              fluent-bit-4.2.0 | 1 
                    grub2-2.14 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
       host-gcc-initial-15.3.0 | 1 
          host-intltool-0.51.0 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.86.5 | 1 
               libxmlrpc-r3335 | 1 
                   linux-tools | 1 
                  ltrace-0.8.1 | 1 
                   lynis-3.1.6 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtl_433-25.02 | 1 
                  stunnel-5.78 | 1 
                 uclibc-1.0.58 | 1 
          usb_modeswitch-2.6.2 | 1 
wilink-bt-firmware-43fca73c... | 1 
x264-baee400fa9ced6f5481a72... | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/466ed323327928ead7707acbb9ad24abcfb391e6 | ORPH
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/8b24032e2341b58fb806f8d0fd6dc315ae7eabbc |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6e33a75ab0297934f95bf08b4abd13723cba97a1 |     
  aarch64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/a5d33cee5a4438eaf782555cfda4119b14a39a81 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b13088bc868bcfabc2d1e4c478558aaaf65e58c5 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0a22b6854dd827fb1c85d00d20b21a584d920499 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/19f80315bbf194c35c1749af474431e12f4d1014 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/cc01efd70ea455a2a787ec7ac5d45efcbe7137ff |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/4cf41a24309ffa229d60ea3b9222fd8d0764e2ae |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/575ea9260b7fc70e455a72e813f98db56ccdcc41 |     
    i686     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/c0b7e6cfa7ee21d06b6c1bd535f286df848c0b0b |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0ce98e17358bc352292ce189476d800d1e91d72b | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e26f115b33c8071a799881458cdc4c9bd5efc06b | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/1963d892f398dc1891a9347f06aac1950e9bae9f |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/94a28a8bc66087c5d0910b00c0cf23dece50a533 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/2204ee287464b9f9783802c21b3288af8016cf9d |     
    i586     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/084b6815a55e5941c8900521e07990c9437d4d76 |     
  riscv64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f5a28af0f29fe7ee180c43e69ce1f2b76b55c7bb |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a71d441894774f13810027e4ab9be6e4674dbb83 |     
    i686     |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/5c3808ea5912d44f61b8bb94f174c6be5d660262 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/6ee27d997701f28348aaaf613e60809b55020bd4 |     
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c107ebe3568135a14ea733be6a0739576d0afa52 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/fe67d0aa0bdf32f8eed10473f4343a5d968c904b |     
   x86_64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/5a2122661723b79abd95bf0e88d2b8b82ac98716 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c30e2c6001d54930ba3609f22e361a33dbbb49a7 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/4025cc1c8e111eba3d00bd5dc03d5303ec409f28 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/473929bef6485c0f66346340fb670fcb5b52e8f6 |     
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/cc14a5ac4047b1478eb1a233a8588bee50ffcd07 | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/10cb4b3229d17e9e0f48c8b3468039a40771cbf2 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/687c71b2c5aaaecfdc9c74dd1bcf6d038cc311ea |     
    i686     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/2092c1c1475f0ea0dad7e3528d267c23d8d7689f |     
    i686     |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/4ccb5f808e4a81875fc1ede7ba48b82e8a36f7da |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cd0f2b4e4d3e48f1e42178fd3a98c94ec7abd560 | ORPH
    i586     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/bbd5ca8233e2c2a92446d0b24cef5388c7689a76 | ORPH
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/fa1a5e370928a78eb7e9ab11978f7bf08e44b11e |     
    hppa     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/714db7ad16b86162179771e1c3ac6f5770d401ba |     
    i686     |          lynis-3.1.6           | NOK | https://autobuild.buildroot.org/results/815f1b5d1513c7a000376930a628e1b7d4ee91ea |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/14fa186b836f1995c4cff4a804f8b22791cd3b54 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/4316692d6898777f9fe83c85224fd8ee9ec7c6a5 |     
    arm      |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/31ae368c3702f09c57cd905c1910f4c311158c93 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/b03deac520749a9d8cda795be0c5c92afce847ec |     
  mips64el   |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/249d08a61d319a1bdf02299009a0a1a3b6c2979f | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/2986c59474efedbefeac00bc493c4c749e73ceb7 | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6400d210fc48a570ae579974847d0458a63b22b7 | ORPH
  mips64el   | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/e3e4ceb2e362b009f9477bccee4236775c93dc85 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/854e09fc04ad60ed58458a25afd200529d7a140d |     
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/e67495c0ce01b2ad880b0c49638eac102881b82f |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

               valgrind-3.26.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/fd9100de087586c06a756705fd928ca34bce6514 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

       python-autobahn-25.12.2 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |    python-autobahn-25.12.2     | NOK | https://autobuild.buildroot.org/results/eced196b8374c30f44dd1c32aa8d0b52e2595f0f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        ltp-testsuite-20250130 | 2 
            host-go-src-1.26.3 | 1 
host-netsurf-buildsystem-75... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/b9c17eb7b45e5362daa3ab3bb23bbe7a32610c10 |     
    i586     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/dbabb4d8a26f126ce410f8662bd6de31a6907f6d | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/73fc5a00acd1f708c07d1242946dd263f9bc657c |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/969ef273f5187924605653e56f574f66d46425ae |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
