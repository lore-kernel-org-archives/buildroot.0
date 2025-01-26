Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786C5C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DC181E2D;
	Sun, 26 Jan 2025 04:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O13wEJGMeaXA; Sun, 26 Jan 2025 04:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E01E81E2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E01E81E2B;
	Sun, 26 Jan 2025 04:14:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7255694A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 04:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58F9C40376
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 04:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HR9IBSw0IJ-k for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 04:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6354A400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6354A400C6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6354A400C6
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 04:14:30 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so740220966b.1
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737864868; x=1738469668;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5QUeFHGayVYG8tMuz16vXY+jIVOLSQmzqiJ64/m3P1U=;
 b=rjUy5y+5nXCZWXKQPLugSJ4q/Or1H4WB2gPs5a7SPbxc3SmRJUUqR74RqQ58+EulMF
 fj/BB7Lj9nVdnYvvdLWbzZ5UVUOSyac2JfVuqtmm6ST9/Rwa6yZt5z56Jjr0S1p/tkbQ
 BvEHWSPx/Lw1wXfHTNx/Y3krCBR9xhGevK4sFWAiQlc8h3uC2TySh4lshJtyLiWgnnXX
 rG1OJGuHKLBHDrkHMuVkzzCls1PQ4e+BHEXCC17aqblq0iD8437dqKXdESc9TC1IPv1p
 /TTn3AD/Tz3SFGrBABGfFf51chkVIeQBfYuVpu3BfU7RZU83SdHoL1hf1pCK9NG1otQs
 KHjg==
X-Gm-Message-State: AOJu0YxSBS3AU8L8dIfOpUBY0cW+rARD8nVB/2wY9R0EIniQehK99Ndz
 TkH5UIHvDnwgT+RVVz/o8CIJ1G3uBIiFKg7Ps/b6N2NtVaw4drwQjQvV6A==
X-Gm-Gg: ASbGnctc+u/WLjTgN3B1S1b26UhlRkhZamoXExz+hsJrxzX618i3VU1T3Qe0GMxf4XU
 jNTLhWrgpsUbYZ0gWSoT0jNzStifpltFTd/iUcHSuW6bxjrxynw8auPmj9jQtkKdobtozjyn3AC
 JrkD1lkMpWjPpRLHy8BFnNPW6uVGGvAnrkpdKh6wQNh8+MdEqcOlQa1jb6TxPkZ/L/cgIfAcWS6
 bEU/uS2ymrhaghZhL5AUb0V/qcJGQLZ3Hyq/mMjfSC+f0tJTVWuqIDB7bBqoXMB4muQ3su2oa4i
 Yw7y2mKP
X-Google-Smtp-Source: AGHT+IGUHh30iHWB4BBnvaLmmAEPvGzZuTshjwpQcBr/h1rUNiOLWUUWiHQ+495oibzqyz/v2iNBGQ==
X-Received: by 2002:a17:907:1c26:b0:aab:9361:f8f8 with SMTP id
 a640c23a62f3a-ab38b3cdfa1mr3277416266b.50.1737864868268; 
 Sat, 25 Jan 2025 20:14:28 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fc485sm372165866b.160.2025.01.25.20.14.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 20:14:27 -0800 (PST)
Message-ID: <6795b6a3.170a0220.746d4.bff0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 26 Jan 2025 04:14:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737864868; x=1738469668; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5QUeFHGayVYG8tMuz16vXY+jIVOLSQmzqiJ64/m3P1U=;
 b=hSuJrxLixV+mp3ME9AcQ8rE2pgYM3voNTMqwk8gIPO7CnUUiye5LlzZDpV8QMHSKLb
 xYMdifVKbAyTGnkqj0L/awFmtiHtp0AYuTS5KHbaISyLmkSz34FwExpGWjBrvFGN9brx
 EQ5zXavZ1vAPM9UON0X4/xPa7UcBy5x1+vXdx/+HCFVFCbyPWLLi6EOsBQZrh5wrIvUa
 XkYdC/sLmdBuXGmK0S9DVqGV5vdDltFvB6PxcdeoQ+tBtScwJ2xoLn90G6z4WZom1XtL
 uzjcASaElyXXIgIEWRy+vgu1bg3IyMaP9gHzIIGE77HshCWJj5OpiNce81AwMX/eNLBW
 1ZFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hSuJrxLi
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-25
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

Autobuild statistics for 2025-01-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  2  |  0  |  6  |
  2024.11.x  |  4  |  1  |  0  |  5  |
    master   | 13  | 52  |  0  | 65  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 3 
                memtest86-6.20 | 3 
             util-linux-2.40.2 | 3 
                  ntp-4.2.8p18 | 2 
                   pcre2-10.43 | 2 
                   perl-5.40.0 | 2 
         python-remi-2022.7.27 | 2 
  binutils-arc-2023.09-release | 1 
                   cups-2.4.11 | 1 
             dahdi-linux-3.3.0 | 1 
               dvdauthor-0.7.2 | 1 
                  evilwm-1.4.3 | 1 
                    fcft-3.1.8 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-3.2.2 | 1 
                   foot-1.16.2 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
fs/ext2/ext2.mk:66: /home/b... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                   grpc-1.51.1 | 1 
            gstreamer1-1.22.12 | 1 
                   gvfs-1.48.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.124 | 1 
                  liburing-2.6 | 1 
                 linux-6.12.10 | 1 
                 linux-6.12.11 | 1 
       matchbox-keyboard-0.1.1 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.9p1 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
                    qemu-9.2.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/004f710ba50493a4344e4bf11b8a442047a5e6df |     
 microblaze  |          cups-2.4.11           | NOK | https://autobuild.buildroot.org/results/00f060b50504b8e97a71534768288d68e7feda9c |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bda6e6f5025052db79c8676fcb58f4b8d1935de5 | ORPH
    or1k     |        dvdauthor-0.7.2         | NOK | https://autobuild.buildroot.org/results/12741b4cea1e6472491c69c5a8a52590a52d1b01 |     
powerpc64le  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/ad49b56ca1dc03c2987aa8e9545dc5188673fed8 |     
  aarch64    |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/80d2ab6af17a42acf7f411dbad3517d355519e8b |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/81ffc05951f834007c98c24917613161569c94e9 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/add00d317d442d6229c2c1b7aaf7abc4e4ab014f | ORPH
  mips64el   |        fluent-bit-3.2.2        | NOK | https://autobuild.buildroot.org/results/133f3a07f6b32770d7cdada982c1f96c031dc108 |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4c04f7084af09063879a73491514ffdb1e9cbd7b |     
   armeb     | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/aae6c7ee1a7891f2a5e70436399ab2e1602d57b8 |     
powerpc64le  | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/81cee05be29a30733819e31d10e00e6ebda23641 |     
   arceb     | fs/ext2/ext2.mk:66: /home/b... | NOK | https://autobuild.buildroot.org/results/b7079a64656c0acd304bb1f4cead5438115fc5af |     
    m68k     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/4a5418ee8a96607664c6ca710957e2f21d50e4d8 |     
  mips64el   | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/0e8b617c6ee8cc4bf21ddc4d387b3f6f14460d69 |     
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4e0879734dfb61b0243246d41ed8f905095ca050 | ORPH
   armeb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6330446d8e0f70463eaa1be98055c41ac5b208a6 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9fe1de9de842c6bc4276d75fe73ba6e138c331df | ORPH
 powerpc64   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/c8094056a46b23e91cacbc94ce774aa970c7caac |     
powerpc64le  |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/2b7e0e5c7ef8cf5d4abc5902fdec6884cb761ac9 | ORPH
   s390x     |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/79cc2189c3e28ba2c845415041d6e680098d9c4e | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9144aedc89ddbdba23a002bf4a469acf80ac1362 | ORPH
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/49a2373b84b12cd43cddf2d721915579545811b2 |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/bc37f2017d55295f7accfcad88bad07a6e23695a |     
   mips64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/6a71647b0ce654ec82ee106fab2c67483da502db |     
  sparc64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/fe3a23fdc072876761ed547d7ed228aa7de6aebe |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/4cac17c23b0e5909c93bf76f6fa84dd39c5ea313 |     
   arceb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/acc1c01bb5ed95f705d9667698215fa191db7956 |     
 powerpc64   |         linux-6.12.10          | NOK | https://autobuild.buildroot.org/results/bdc97ba6387ee9d6a76c09f97869ca71ad4695ae | ORPH
    mips     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/3a0e41553b0999aa33a671e482eb573315fc588a | ORPH
   sh4eb     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/0e658766cc958927de26d14efd32ee901c2070fa | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/e21ea82dee904488fb432a644df0b7132c529a01 |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/db53da42d63bb4c731149250d30d3a3367a640fd |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/e49f2ad72312118a3a6c03de963a234a86e58891 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/00a98925eb9252c8e0b9e92b9d367374383d97c5 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cf69f09d364477d00aa0f6d55b99e03f5ba00aa2 |     
    mips     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/8353be0d650799df415f2119b895316800be1a8a | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/7d15cd303adb014db07ad5a2c05ce71e0481ed04 | ORPH
  mips64el   |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/a0991dd91149ff8dd02af5e9520ad8b550e7dd8a | ORPH
   mips64    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/41780cf194123a72ed913855142cb4b202e219ff | ORPH
 microblaze  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b68a86ae387d59432ea18e09b8be1241c92a696f |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/44c869d102d582a55e4ec96151693d822d3a6aae |     
    sh4      |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/2d8fcdfa2e45409c4b165a53c8c2ee0a948bca41 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d60e73ad4e16b57a827fd4935a2cbf2f42a92200 | ORPH
 aarch64_be  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/c9a128aab7908a563d994c083947eb8140bd7df7 |     
    m68k     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/a784c831c35f58943d7b501ce5a95585b6b36e57 |     
   s390x     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/ae8920bbde0c53eb2db2bbcc3d87ed7e55d7dba3 |     
 powerpc64   |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/2fe214cd2b508744fcd5d5a1d890a55e17d23974 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2ae9e29bbd27895644d2297f7dad06b09e0a8a5c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/89cab77e433e4f363b0d9f4da4182da038aacc14 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/66337f321c29ca3018395026f175bc9aa04448d0 | ORPH
  sparc64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/487e1bea4a50dc63c7f6bf54af3299df0b7e200e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
dvb-apps-3d43b280298c39a67d... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/afa7ef8ed6898ec0c09159a922c3b740989ed2e5 |     
 powerpc64   | dvb-apps-3d43b280298c39a67d... | NOK | https://autobuild.buildroot.org/results/1cbd3c247e89c613983b02b238b3b4a1fe7f3c42 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7c6872e1f6845ce9fc6c4e6e1b3aa2479fc1d3c1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
