Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EEBCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 03:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CF76F58C;
	Thu,  4 Sep 2025 03:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0qXgP4rMUhq; Thu,  4 Sep 2025 03:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D25116F58F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D25116F58F;
	Thu,  4 Sep 2025 03:19:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A5E9EC
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 03:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBDD36F58D
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 03:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_2_WgWv0a1F for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 03:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FC9661BE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC9661BE6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC9661BE6
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 03:19:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61cd6089262so916993a12.3
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 20:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756955972; x=1757560772;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WPkeXjwGabwujN4NsecKYAZXmpbVdW7etXbOli/qRr4=;
 b=hH91CHbkkjPM9QhvKF5S2IT8u6tT8Far2YXXjC+eyJ8z+hcIS8qzzOjiEbTmNRgFnp
 gv0Tq1g2uOnyiai8WO5+2Ry2fmurnO4SeXoLrkarOAWVwVb10MuOf1lB7OvzGdtQa1RW
 07OCScyDuE3zcNs92bghpJmfR10u+TTxxeowYsrPlHj/c+A6uAwa9aCqr2rlnyJmJYo5
 jesAo6WIY86DiBthMVP50Nt+fRthOqUi2T2J4MmAyLPQyXslwMBA+P1C1JmSnxlMiKbj
 Jz2uelOKMvBr0gePsJuRxh2q24cT5qzpjlRHt9DrEqHIlCab9o4SoY6XkP+jGK7oiS0F
 Kheg==
X-Gm-Message-State: AOJu0YydURjvY5GqmymkrEXz03l1akHzgR3I32lWcKadbTERqymssf4x
 lRJIK0k7e9cPOGgeULf6MiRLF8RhJZXQbjBZqXPmGi9piPNh+zx/csqeOoOgFQ==
X-Gm-Gg: ASbGncu1sn2J074t/0iFXwyiHmGdJQWD0wfovfsYuDs0vnKfDj85yW3MZUABjg5WDeF
 kPlhLo1LmhecpWtzTuWeoeSVykLqNetbGlutvbNd1iICm7eYfwP6PgbbiucSABzJ8FOOPAExwU8
 HEdtl9cqIx25Mzqb9hbcdMdwk4sVXzSs+7unsIW2XsFavu8wTK39IryX/DfvxC6fUTEuLUolSob
 FVeT148RWGUJOc8gi3ifEKJu7axq0t9gwU3SEUuHQ6/UcrTGgEebREE62c3oEluyzuaKTsPLWmY
 qQMLX7mCShG/SXtbQYvJuutyYTRGBvKYA9qayjLkzH/TmHRttAGI+nYomTZN/ndl31lklUocW5a
 dIUbYv16/5HNYi3+FZUuQlg8ilRb4Xnne3ar38rO1
X-Google-Smtp-Source: AGHT+IGAoKdevbkIrCc5ulOViuJszs8f2KEoy7d13cQeIm77scu50xz7JqQ95SDG1BbvLcFQJmOBIg==
X-Received: by 2002:a05:6402:13c7:b0:61e:c750:1ef2 with SMTP id
 4fb4d7f45d1cf-61ec7501fe8mr6576493a12.36.1756955971637; 
 Wed, 03 Sep 2025 20:19:31 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc214bacsm13722398a12.16.2025.09.03.20.19.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 20:19:31 -0700 (PDT)
Message-ID: <68b90543.050a0220.28310c.6d78@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 04 Sep 2025 03:19:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756955972; x=1757560772; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WPkeXjwGabwujN4NsecKYAZXmpbVdW7etXbOli/qRr4=;
 b=JIEzJmPhkAM4MZxx629N9MCyU80RCkhD78hpaHVJLxcBzvDebrBsBZ7DnlbcE/In+L
 DyoG7Sh8/M2dzrtvdyr/lSHSRy3uiIQuWKEEW2dB3v1GMgeDpPncWRCAqJBD6DifKyu/
 yPDvMdygCPSlFZsviYUhgWR1CUjsJGbndaZ3Ow2BdZjKgChe5kjbPdUoUTkIV6APG/Qm
 b/3J2JpRkvtaeMNo9wz9NXqXJKcfvTFzUd9YpWUkK6gduuCqdp33Xyq7rQmYh2W8Jd29
 jE3+2jofkUL76KeRWprbmTC4zHJHjtyLVZWDPC+j9Y0e2JO5/8BrvRiuskp3BjPJTbCK
 mT1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JIEzJmPh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-03
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

Autobuild statistics for 2025-09-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  8  |  0  | 11  |
  2025.05.x  |  1  |  2  |  0  |  3  |
    master   | 26  | 110 |  1  | 137 |
     next    |  0  |  2  |  0  |  2  |

Classification of failures by reason for master
-----------------------------------------------

                 logsurfer-1.8 | 9 
            netstat-nat-1.4.10 | 7 
libdbi-drivers-0bfae6c43134... | 6 
                  libsvg-0.1.4 | 4 
                  mbpfan-2.4.0 | 4 
                 c-icap-0.5.10 | 3 
                   cvs-1.12.13 | 3 
                 host-gdb-15.2 | 3 
                  iozone-3.506 | 3 
              libselinux-3.8.1 | 3 
                    mpir-3.0.0 | 3 
                    sslh-2.0.1 | 3 
                   atop-2.11.0 | 2 
                    bat-0.25.0 | 2 
             batman-adv-2024.4 | 2 
               bctoolbox-4.4.8 | 2 
                   eza-0.20.19 | 2 
               freeipmi-1.6.14 | 2 
  gobject-introspection-1.84.0 | 2 
 host-softether-4.30-9700-beta | 2 
     libphidget-2.1.9.20190409 | 2 
     linux-5.10.162-cip24-rt10 | 2 
        ltp-testsuite-20250530 | 2 
android-tools-4.2.2+git2013... | 1 
                   avrdude-8.0 | 1 
             berkeleydb-5.3.28 | 1 
                   ccrypt-1.11 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                  delve-1.22.1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                enscript-1.6.6 | 1 
             erofs-utils-1.8.5 | 1 
                    fcft-3.1.8 | 1 
                  ffmpeg-6.1.3 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.6 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
                 host-gdb-14.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
              host-rust-1.88.0 | 1 
            igh-ethercat-1.6.3 | 1 
                  ledmon-1.0.0 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
             libgphoto2-2.5.27 | 1 
                 libiconv-1.15 | 1 
                 libpng-1.6.50 | 1 
                libsepol-3.8.1 | 1 
              libsodium-1.0.18 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.16.4 | 1 
                 linux-headers | 1 
                 lockdev-1.0.3 | 1 
                     nvme-1.12 | 1 
                openswan-3.0.0 | 1 
             parsec-tool-0.7.0 | 1 
                    sdl-1.2.15 | 1 
                       unknown | 1 
             util-linux-2.41.1 | 1 
                    wipe-2.3.1 | 1 
                  xl2tp-1.3.18 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/9ace82f3d289d7949f21195df8634a839da0def9 |     
   x86_64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/90eb1a19d400ed78f6f951d3ac1f340f0c863dac |     
   s390x     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/444076940b95d78dfb700e356b1bece97b1cbfa6 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/9d9930061fecf664cacae70e3e01914e20fa3d35 |     
   x86_64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/2089c68dfd82299694e7f7359d5a321543c3cfdf |     
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/57169c6b1965c03609dec8fcc30674e5e6101eff |     
   mipsel    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/04edd07b3a1c2b022e259407c7b0f4bf6c43e909 |     
    arm      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/2b65e7cacef51a69b68554ad090552580805e85f |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a6b11e1cd4d763fdf5b068ff37006591e7c69ac0 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/90da9cf21b791d0150b019a1178fcea78eab43e4 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8593b7776a0c3abfaf829c3fc1b44055c640649e | ORPH
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/873a4daf5f22fae4c8327d3a2547d7839ca70ae0 | ORPH
    arc      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/91021e76586c406db8879e3a26227352bab27a90 | ORPH
    i686     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/0f5f99180b3ca2eb09d2e11bd460c8832028e07c | ORPH
    or1k     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/2cca7ad6590a144b86a999957c2befdeaf028630 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c62b1ee325ed6bfd10102d7d730faf7a0b000407 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4a1c9c91794cfdafbb78986abc02e790871db3c1 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cbf9e9475a501b9f4258fc11922daf4133c9aa8c | ORPH
   x86_64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/cde077f45d50e8eeada36e0cddcd4ddac07b85d5 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/df2a0e4fccb2e38d24b554023c1e7ff615b7b10b |     
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/c3460273765937fbaebdb0d295bd3d9121115d12 | ORPH
    arm      |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/b3e01bce17bf9d985a57586757f9decd1e20f22a | ORPH
   xtensa    |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/162d0a6858a22e4189ec6f40985c65210181ab3e |     
   x86_64    |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/412fbef4059cbf8d18cf360e1bf0a58ee7bac89f |     
 powerpc64   |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/6ce5b22c30720c075e6aadcadc5b8f92f298efe0 |     
   sh4aeb    |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/56dc73e9e58c6b25f6dfc67da2c463b64329795d |     
   mips64    |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/49241393be1e1e85f823684560fd16fe6016326b |     
  aarch64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/62567edce7c55a8d5030bc6438a3fe1f8fb25990 |     
    arc      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/61d7d23db43c44b1dfee8ffdcba4bbb8a1fb1699 |     
   s390x     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/5c75dec3cf5faecc91411abc64e8d93c39e4639d |     
microblazeel |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/2adcf0a792f1025fb3a3d7d555a20d554518d6dd |     
    arc      | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/37c9a1fbd4ddc854600d618cb2f83d208ebffc96 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5b8a1c1e734a600548f2067e98da8f8753f3841f | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e6f842e077eeb30bc8c51619e62d6ca234cf6cc3 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bf13f7c9571c6457265553225efb0dedbfbde33c | ORPH
   arceb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/18cf80f43a1ab4930961dd9d966dcd3ae528274b | ORPH
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/50f141e772556a1287e18029ae486bef07d49e36 | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/93ef3183097108af038bafccfdb7e74c8043d602 | ORPH
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/4d2e3c7698ba0734ad1cf24261224a298b07219f |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/886580b8557af7db32855866d7cef426dbdb6389 |     
loongarch64  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ca50a43af9b0b74f68fa1eafd9b7084ff74c6348 | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a4b1e411e7e436632883379aaee39fa40a0897ce | ORPH
powerpc64le  |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/8e657e6070a1588f8ea1547e15483249e508f3ad |     
   x86_64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/931dc47eb93ea6f5083bbb18fbf283e9205181b4 |     
   arceb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/76aec9941bace083ac9984fa2568886cb059cd54 |     
 powerpc64   |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/c007e89d5ed7f03097edd0c4fcc0d399858cf504 |     
    sh4      |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/e35d5469b0019028313b31d35bb2cd87620eb7aa |     
    sh4a     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/869b17e34788f1afae18731137cdf68f1216579d |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/77fa818f48da73551a75700a13e5811a48103d2f |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/795297b137bb8a94c176728d39be3b77253b22dd |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5e82b91d1ec295da6c4e126319cce8df89941813 |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f79c67aaf0d4430df13647fe5d2c12fec1e6b099 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c8fc4dddcaa42bd85dc1870782744b9994394a3a |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ce713a2402e91b775910aa965f4a72d235a35f2a |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/dbb96641682b3f23e478f880ba07b2e76956aab8 | ORPH
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b21623eed9df78da5e8786cce199d9904659882a | ORPH
    arc      |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/d6888cfadf4816ad22cf9139eceb598b99fa8509 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/99a68c13d16a3ded0da3ec10baf0e21cfced5f30 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a99fce73af3dfcea3ba77cb218481fa9af518437 |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/a266d490bdde2fb59a75bf7dd4b018451be532ab |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/137da90d54aa3a8ddc1e82de872aeebb974dbba8 |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fe2821c96d20d4bbf9fd2c43e8b56d0553d6e436 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e676d2bc5859df8140767bccc76ed14c85bd30da |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/3d3bb7b4349b665acc2876dd99633cd2a7110018 |     
    mips     |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/ca1d7662f68021bf9d32db7c0301b2aaa6cbab5a |     
    arm      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9d84ba9ad7a461381b7ce56474ee8de3cce1bb15 |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0e595221eaf45ee95aa637d52b88a60dcc13b2ff |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ed2f73f6b0a949d5309c98653b573c743ac46e0d |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/7ae973ff1024cc220454ad6cc7363430091c6a44 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/66e9b157f5147f5419870dc4bf3b167b59b4d362 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8fd2f67a396d9e3a9bc59cfe1aa7b1d6e6f2f991 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a38487a015af3ce7bac9543b5f2af5440f7fd516 | ORPH
   armeb     |          linux-6.16.4          | NOK | https://autobuild.buildroot.org/results/490c2f7811ff2c29352046e7c5d159b3edefceef | ORPH
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/7162e045fceef8a691ba5535657e17b6caba87ac |     
    i686     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/9a69b6695ae0de9fdbdc30b37dfe1aa322c1b89e | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/174e7268bf7c86b8f7449b1c02c1d66b17ceb5c1 |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4509bab944a64e2b07fb628095d27acca7329cae |     
   arceb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8bf7cf80b699862ad514bbc3bf65d76b6523093d |     
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/5d2ba2a1ffaa1188412b201d06e015d803c76d57 |     
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/3252289e88f55a3655c970c85e6c09555b2eb816 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/90decba9c95359f8043f88ef74f505d2bb055a42 |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4cd0758b28dbf89054f30a187ff73712a33d06c0 |     
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/63fa2937889e92b6e7bbc8409d6c8ec084dbed70 |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b260677693bd177fefad2f4fdc08708a99bf52e1 |     
    i686     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/ea738b43a4dc47c27f92f1b3009a1d6ffd8ebecf |     
    arc      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/4b6e58be6b3fedf3be054897a1c6d87fe2c7fd84 |     
  mips64el   |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/015b0f3d73800e861b77fd58a3200b47792f5d49 |     
  powerpc    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/68b8d6d76257ff8f5da039ffaf16e17c932e79d1 |     
   mips64    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/a95d15dd095d36541c361d579d1ba7d657f9854f |     
   mipsel    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/f4050befa5ee34f69a60b7aa7cfe617907980714 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0c7d7b54fcba1f1a411d43ed8504d8b616f5a82a |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/616095271b9c3f2a0894c74200f99c60b997f719 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3c92c27d098450b1bfe9e24c65679431420af88c |     
    arc      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5cc2e62d32543c0f932695a92bf6184a5aff559a |     
loongarch64  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/4fc0f4cd7514b20425eb7993b3392e4600a82a2d |     
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/fae36225d628df570ef5ecec9a3ff79eb33863c8 |     
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a72a8f8f12f3395f7ca4e6074804fe2d1f0e8e10 |     
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/12f7fb13d8f1c311bd7bde4c1409c4c5d2748774 |     
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b0fad7dcd278e98689cb4b9b3f2ae37caba42465 |     
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/ab3939bbd9f127c115609d3495beae16e14a7f8a |     
   armeb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/87bbb0fa6e8291c41484913e9ff27ada8404e3a6 | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/131a31002f909dbc1e9cf9ebed8ff6e7f5642182 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/595d09968d19c7feb4762057f5ad127b6c4fa839 |     
  mips64el   |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/c9c710e8c4c706ddfb3f2c3dcea4776219d6d0e4 | ORPH
 powerpc64   |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/51b811a4a7216280236c0c355b3e5397a2e1c7c0 | ORPH
powerpc64le  |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/c04ad0c87b8e58393279ab3c6256df76b09b2539 | ORPH
powerpc64le  |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/176b77af813ddc65acca5606ef9b1b0ccaf04eff | ORPH
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/52d3a24af0e238afb7ab15ecc9b0840af2753da2 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/ae71f1e37c1d3d71613bbc66491bed8711f5f2e1 | ORPH
    m68k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/47f7d975930eefc17bce4346892cd6ab93d1a69e | ORPH
   x86_64    |          xl2tp-1.3.18          | NOK | https://autobuild.buildroot.org/results/fb6c238cf76b1a513ca104507c0ea3026a49aa55 | ORPH


Classification of failures by reason for next
---------------------------------------------

              libmhash-0.9.9.9 | 1 
                 netsnmp-5.9.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/32a1355b822038c20e9978b677ab6e2f5ff3992b | ORPH
microblazeel |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/403c4e859aa491c4307355a2c6eee704680308cd | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
            gdk-pixbuf-2.42.12 | 1 
                    ipset-7.16 | 1 
                nushell-0.96.1 | 1 
                 openssh-9.9p2 | 1 
                s6-dns-2.3.7.2 | 1 
                       unknown | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c1ac2d520a75a6ce6fc594ea8fb0f5722361c55a | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f71dff9f1b2abbce1009d50d15709b7a954d3197 | ORPH
 microblaze  |           ipset-7.16           | NOK | https://autobuild.buildroot.org/results/930802ecc324c4cfc697191aa6a68642a4188e7b |     
  sparc64    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/3a12c778b5220cafa1cdbb910549584e2c77d724 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b4cfa9392d1257449fdbec0cfaf05338bae2d35c | ORPH
  mips64el   |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/4bb3f922372aef9bbd5b73951a0e6084f1f4f46e |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/342a2a8e5030bc0e7a73cba93583c71086b7d83a |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/ac9989e0e9beef26405ab606509eaff57dd13090 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 libgee-0.20.6 | 1 
              libselinux-3.8.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/f1beb127bbfd12fba5c3d6aa4f6485e538be69d6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/046d50f0b3c3d15c2bfd1c206c67fc9f3ffc6574 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
