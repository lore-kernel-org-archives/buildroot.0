Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92156C021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 04:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EAE40825;
	Tue, 18 Feb 2025 04:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oOotswHgQWb; Tue, 18 Feb 2025 04:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8404075A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E8404075A;
	Tue, 18 Feb 2025 04:17:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDE4968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 04:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA0560F2F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 04:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tz_mgQ9XALUf for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 04:17:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D37F60F13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D37F60F13
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D37F60F13
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 04:17:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-abb999658fbso200029966b.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739852236; x=1740457036;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMKqtj2iifVfOduN4kS9YZxYZS/xtM/J2JADzZ4wgYY=;
 b=RkFImhIF63xtt4pVUcGd0mh60vHACbApk+b1zfMzHZ9/yeVRpsURngXbrCgBqRAyiv
 rLBJzx1FNA7DL/q7vIK2o/WcBBWBdFwYWa7HDXjubbyjgTURxW7XdIB6YoAr+iwmwO0v
 5SrQOcyzSveRrWUxf23+xzzi1p/dJ02AmcVMNiB/7eoEvn/95yCbGsTbGkg765GfuMmQ
 RuaL3vdGESMT0Fa/H0X3QKYpLJjQraW4vrbL8vBsnefm/MHIpGROTkJgZRqDnWsM95qe
 xTan9C+AI7Z9l5BnmAzcfuO/cW+nB4PvTzL6PAIhXXXWD3Pd78y2p7ubhvTmj5BjqtXC
 jy2A==
X-Gm-Message-State: AOJu0YxXJaiHzSameaool5iZlLZ9bhjrunIzumNYMI09nPSckWRdi2mX
 yweraZi2BqfQRLrPlfchS3qmihcCZBGahSnefY6yjLOezJ9WMTF09sp0MQ==
X-Gm-Gg: ASbGncvaRPH68sUZmppZnoJglyUJ7Crb4schufoORIlI9ly34kjJiNmXUbT9OSo+3MO
 jB6RGQzj6CPr1CwqMaCHTwHuZkEFru0Ddn7qRMQlXCXy7DhHBJEl0L4ym/py8kaUdD41RZtuUY1
 jW74wdiy3UODL7gJ6L+Bs865cmYQSag7Qj/y7tp1/aBHu+ZiAsMQicOJzNewZoAqNVBunaRRUjq
 Kyci29vvQ61I26qzTEqRLI2c7Gk5HIiAAfJi7Bv0SPHdQdY6NfgdbIgL4ahv/c+NqbQHCKgaspE
 h58Iblgssxjqrzlx86Q=
X-Google-Smtp-Source: AGHT+IFi+ySPFcmoZYIsDnl85sFmYuByGhuUo7ruGg/2RJrnRYJd0vj48+12QCprbtyQKGJlHG7mLg==
X-Received: by 2002:a05:6402:5107:b0:5dc:ea7e:8c56 with SMTP id
 4fb4d7f45d1cf-5e036139d68mr28029770a12.22.1739852235774; 
 Mon, 17 Feb 2025 20:17:15 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbad879b26sm140093366b.44.2025.02.17.20.17.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 20:17:15 -0800 (PST)
Message-ID: <67b409cb.170a0220.244d95.4bea@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 18 Feb 2025 04:17:15 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739852236; x=1740457036; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aMKqtj2iifVfOduN4kS9YZxYZS/xtM/J2JADzZ4wgYY=;
 b=czVVCP9787gv55V4phrrwnC/Z+JCny6rauNCgqigALg1R/OwziZgg0yh+9Zm1vfJzW
 HV9Ryd3S4A2RwUmjDiY4xL3GxUaAFPbhigIC8fA+0CF3Q/VK4qZuSzsh5RDBGObKHI1p
 JCFpw/q7ha07Veolw2LEZV8gZd9/PYoUFBek7Oxi1KtW+DIWQZs9s/BLp998fwWgPNTU
 rqd3yF0EUxoaera5rFzuixA6dmI77XLOIKlVVilp7fJXxf/Jg4SpsY6K3WuazYyEqjiw
 uD65+gc500bzXc0Hutjc0EEVCVUAxy7W5K+NwTWV2JvGDTpGcuhOyZ7Uz193gDCFe6sL
 R7qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=czVVCP97
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-17
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

Autobuild statistics for 2025-02-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  4  |  0  | 10  |
  2024.11.x  |  3  |  2  |  0  |  5  |
    master   | 16  | 117 |  0  | 133 |

Classification of failures by reason for master
-----------------------------------------------

                 sqlite-3.49.0 | 65
                 linux-6.12.13 | 4 
                       unknown | 4 
           at-spi2-core-2.50.0 | 3 
                   perl-5.40.1 | 3 
                elfutils-0.192 | 2 
                    gdal-3.8.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
                  brotli-1.1.0 | 1 
                 c-ares-1.34.2 | 1 
                   cvs-1.12.13 | 1 
              dropbear-2024.86 | 1 
               ebtables-2.0.11 | 1 
                  ffmpeg-6.1.2 | 1 
gemmlowp-16e8662c34917be006... | 1 
glibc-2.41-5-gcb7f206537240... | 1 
  gobject-introspection-1.82.0 | 1 
               harfbuzz-10.2.0 | 1 
   host-flutter-sdk-bin-3.27.1 | 1 
    host-mender-artifact-4.0.0 | 1 
    host-python-greenlet-3.1.1 | 1 
                  hwloc-2.11.2 | 1 
                 libcdio-2.2.0 | 1 
           libfreeimage-3.18.0 | 1 
                   libks-2.0.5 | 1 
                liboauth-1.0.3 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.11.6 | 1 
                 mdevd-0.1.6.4 | 1 
                  ntp-4.2.8p18 | 1 
                   pcre2-10.44 | 1 
               pulseaudio-17.0 | 1 
                     rauc-1.13 | 1 
                  rt-tests-2.8 | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/a45622badd54223a756ff82dba546641b65011b3 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/69bd48a5d2a6529cdacf164706c7412df3a292a5 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2b6c69765f459135af22579bf528ba6c4e45cefc |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/b0b8d4918302c2b757a82b9a1c6731975cd6d198 |     
    sh4      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/2668074d5cdfa168c08748f7762082d434c630c4 | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d791fccf92c07c251ce9f5a600b61b248cc4a363 | ORPH
    or1k     |        dropbear-2024.86        | NOK | https://autobuild.buildroot.org/results/423a06eddabd003717f5f91ae62a7703dfe34c99 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/2301ebece77e3da57589b8fe0312c92f7b2f854c |     
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/943861dac509ca3618e0e2c51b2ca23f45111465 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7bce31587a854dfd82389f575d9e1d38c3dd84a2 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/14e476eafa4c529e08c75ed31dea621a83b244e5 |     
powerpc64le  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/b58c8e72c771fbe2336dcfbf4d8ea6aa19c61992 |     
 powerpc64   |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/0b55987581dc4dcea35a886791055e07f15376f5 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5a4325733e834a7c596611af4b49a8e5bfab828f | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6dca140f56edd381c169a0694600894d14d947a8 | ORPH
   mips64    | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/b9c636d55a2520bea41641fedcbd7ced6016acee |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e1759cc56e48e95d71231a6f34859e0fdc24b61d |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/65af42cd4461177c6368f069b2fe73110f14a472 | ORPH
  riscv32    |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/23c56440a5fc91a9f9e4d5425d6b6ac906f5ab51 |     
   x86_64    |  host-flutter-sdk-bin-3.27.1   | NOK | https://autobuild.buildroot.org/results/46f0582ce6e53c8e6b3432f08be222edd65bb156 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/d9b09cfda4be9617991a6a2897cb687fa1fea419 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/6cea1f445e17da3ff0d1e54913f43ab54edf80d0 |     
   x86_64    |          hwloc-2.11.2          | NOK | https://autobuild.buildroot.org/results/07abe57fde19c3454bfba8fbaf14389a198bab7c |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/4f97079d4f14a5f233aaed75a532888aff3e81eb |     
   mips64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/654ee8a6c7c6035a4bce2d797638ef8feb2b2278 |     
 aarch64_be  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/83a207bee796afbc619b62c5ecf89c662484170f | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/14cc2f80338edc35fabee0073bb0d99f07505ac5 | ORPH
    sh4      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/104a0eab20a7bd197f1b2fb911090548898c7213 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/06647bf9e1817d1445b1b63221b3381ced672333 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/48f0b3d7124dc0228642fb0e7a2552ed63707567 | ORPH
powerpc64le  |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/a0c368ffb97041d49d1634f9b3ee919a0516690f | ORPH
    arm      |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/bfd25fc287ba27037c70a4f45f0302627611fbcd | ORPH
    arm      |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/0195fbb27b9c772c4c8cd16c69dfb37a33b5918e | ORPH
  powerpc    |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/ab494f60f5a0f427e9b3f4437d3f44f5c7704acc | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/e52a1c4869d53d866a5e01ef4e26a30924e72338 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/f85b1e03d9df146b2f527ef2d89b5de4d5a96684 | ORPH
   mips64    |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/102e0726ae47812929e68c419d666308354b8d0d |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e7c954bfb3a53ef852e5032521dda147e621fb73 |     
   mipsel    |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/7444bcd457171ae3cf8948fbf726c51841d79b8f | ORPH
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/fb357a9bd1f57b43432ce6e4c8de0a7d828fe97a |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/4d087c586a22d98295fbba7ff9388a2fe7fb9ebe |     
   x86_64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/39505715a4a9a68416b2647d9e87e630bd64eb89 |     
   x86_64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b274be9752566aceeacd6563f44ca24e71648580 | ORPH
 aarch64_be  |           rauc-1.13            | NOK | https://autobuild.buildroot.org/results/49a4c5af560ed0d472d026268c57ce79a78f1956 |     
  aarch64    |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/7957f2fa32f423bb8d94a5fe3c8c74c2aae2482b |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dafc8086ba71d0e6d125be34ffdc971936f14ea9 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eb92408f1a27559e1f9e235f5e2a33dd679cdd72 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fa05ff5b85d03a6fdd146627a3b4046aa10f005b |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b63e570df1cfbd432f284b5f4a02d0747a5470ce |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0dd1677b3893cf5202e3f697f04f0e8b9dd98d20 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d7dea4482dfac9720bf447e865950330194184bf |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5d36c33ded69c8f609ca5466b08d58f934edcffd |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ebadf14eedb1f4be77758529c34bdf8eb27d3ea5 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5dcb7a598c8c6c0a36de2213d788b5c913e7e5a6 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f5cfdf3e4ed872312659bc1ba82f9e006ebdc5b7 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e312a9472f0dc57682c09ba5b9474aec0ef4b81b |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/665796745b4be7d610ad6fd479f86b1480cd91fd |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2ae5c00901b642e33df5c83666a56881387fcbd1 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ca4105144c1aa657c14836ffa0f1069c1c89d54 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bb9f0537fdc4309316a0ce17cc4d297ee12d0b99 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/13f3586e420367a0248fc4953a2122604cee0928 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5f5a1047522e39f477dea0cc94d09935407176c7 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9a7e3127ef3df9b126f7c449240ac82728c866fd |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b57862c0365939a462c028f968a2fb95731c0c86 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7dbf93126966f7e390b41f919967b244c05e02df |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9e82cc2e1f0f64beb7741c8674890f9fc5d654b8 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e86d6a40b32784350e6f19cb5fda23d90dcdb9e |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8b77167eb507b1d31616cf6b4852c618c6cfba3d |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/36f100e17fa2a97013372e23257983de9c10cdd2 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bd5b0e7c8cdf099d4b003af16481e074aa9912ca |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2d46164350df4ef879bbd63e22642c0a2e34a471 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d7ef00b050303c1e15cdce2423256110494f349 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1fc96f7d01519b99b0cdd2cd8c5c41a67757bebf |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b5ecc9c6b01b7c281bfe8e8cc4b9f30ee3b5fa3b |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0a1af9dae7bdf5320f3c2c4884253cc1136f6a3a |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/43c30eaf076e9eb5a3b802c727541e8dc4107364 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/802176b9fe2965601da3b8f36e01fe3a55f80fe7 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cb67cd7a8ec6d1c94f9eb9bfcff53c331ce6d88d |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1634bb8bf093f161965b5e86808f2baeff11d823 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/544939e95add30c85351cd78f102412c7c66ecdc |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e65e9508df5eced4dfccd4509f6031033f2ec3cd |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9e0d9f473a502fa7505b64b0606a724ab16926b7 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/172cb9a5da62d8ef9f2e9809cc971f74037faca3 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9a47c5e7f87f8bc415f120da34bcd60be74adfc6 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d413f8874001e9cdca2833f7f4101faf292cb667 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7229e9b7e0097c5141cd1fbdda59cf762ad39f8b |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e91c97699418ad895d47fca34e7d2e4dcaca9c3f |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/812bc8969293a6c4fb4eb4df306cfa6b7e134e2d |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9e13efa07a8cfd1e0434647a54cded94ef3b9796 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/02bb5bb4cc95f47d829899d853da1bffd5622b27 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eaffef8a14f1bf1f2aa4e7c98186f479f3d320c1 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ac01789fa868234a71519219e5e1d102069aaed0 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4db6a7feeb8c6f1cd6d6391505e9124552c87c4a |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/12dfdcfa1e8538d0defa1230cb025dc5b87c4a89 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/34d5011a76b6793b091d143c8687c270ae232930 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f5c8647265ab3e32e5a4e3663e100fd72880612f |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7d0cc22e23c05f65f5787f35863fa6f59bcf1039 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d43ebf808c4bb61455907f078f1731082117fd27 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cda3c799467ea03fa24ced3a5f745d8c8b4fb33a |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e3230e6462821907a5f10310f4156fe77716a5a5 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9246c4ff5f5fe78dd883563b8d5a8e307b4a1f1b |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4771afd21c94a44235b2379cb5126d38f7fe108e |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d0ad21876891b2fd4a97515fdd0fba8a2e0c9bdc |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fb12eccbeb591cc9b30e0859710e92482e767e82 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/02a327d6a6f20a0e206aaa4582dd874c95a8c378 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/88c06c1b7a996f6cb2cc2c9397fabd337cf26767 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3a35979fde928f4cabe7ba1426592c56798ecccf |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fc75555317f060b710dd9c7c32e4993a2ebb0532 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/569a3750681cc10688ac663450dc2773a317bb07 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8f0ef7b8d502c601d4ef635f3ac51c9774140a7b |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/6b0778d1bd073822f6d8dee46e43b8a4806266d6 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/48a5275a9b4140645d3c981b05c9de1a024be1d5 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/d549110ce7d9759e7e56b9af2547a7f92c69f0ac |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/25f0f1604f4974c8af0740c87814a358b350c52e |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/57308a1b1242139440eb7a7faf0c63ad486c6435 | ORPH
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/6c30303c421e930c6a4f37202f047b15438c3bb1 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/c0df71b8fdfaf055e8e3a5d0236deeb17d3bd825 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.75 | 2 
                  liburing-2.5 | 1 
                rocksdb-6.20.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          liburing-2.5          | NOK | https://autobuild.buildroot.org/results/a9afaa33794946fe2e99e7d021fe5f93eaf7c6d3 |     
  mips64el   |          linux-6.6.75          | NOK | https://autobuild.buildroot.org/results/18505e00a60689b686d693128c1269c7b98459ed | ORPH
 aarch64_be  |          linux-6.6.75          | NOK | https://autobuild.buildroot.org/results/3c9e39ee5b41918b3da812a34f895f7988e71828 | ORPH
 aarch64_be  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/803fb4b7712c16fc1138171007ec7f2676ce3b0c |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              tailscale-1.76.1 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        tailscale-1.76.1        | NOK | https://autobuild.buildroot.org/results/3f6bad94a16518234812f6933e83401114fbc54f |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/2d0d02d9e8aa78a8eaff00c61a55a2e6a9a64eac |     


Gitlab CI results for 2025-02-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298750  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298742  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298731  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298727  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298721  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298720  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298711  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298689  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298664  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298628  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298600  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298549  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298542  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298533  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298477  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298475  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298472  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298455  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298424  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298421  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298396  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298391  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298306  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298305  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298300  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298297  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298293  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298289  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298287  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298279  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298275  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298273  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298271  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298266  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298261  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298254  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298251  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298244  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298235  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298230  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298227  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298219  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298214  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298211  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298207  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298197  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298188  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298171  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298163  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298127  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298024  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298021  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153297855  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153297854  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153297841  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9153297810  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
