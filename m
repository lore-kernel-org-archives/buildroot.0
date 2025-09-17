Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591DACAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 03:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05651407DF;
	Wed, 17 Sep 2025 03:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5KTiSlupr0b; Wed, 17 Sep 2025 03:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E326D409C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E326D409C6;
	Wed, 17 Sep 2025 03:26:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBBA4279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 03:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC79582049
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 03:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cMFwp7wwWCc for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 03:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E80981C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E80981C21
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E80981C21
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 03:26:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b9a856dc2so38180195e9.0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758079607; x=1758684407;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hAvJNUxGpKKaJFu7bBcyA0e4fObfXbSBgHUMjZslFSc=;
 b=CVHOwE+nCdUwut4F8/86f/yjZKvJuqakYa4I69uJxgFBqZV9rMnGJgGYznZ79QgvIy
 KMSslK8dRaBZUfBNQ4yRH86BiurDteBJozjJmBrGEHGxGLldZ8xqfiSZytalklDLrjp9
 ZyMz4KU+w7j5Ou32joiEd3yyD2p3m3VtQoD/mBoyAuw0QDtxEXx93W+ZUB/MViM+CK5B
 Tv7RM7YnY4jSEWBS2Hn1nchFViOK+KSMmZAAANZSvQ+O/ZSXNeKKnR2fGCLf5SbLlXlm
 9gSCzHihDAoTcjfYU+0wZQIAqjs3Vf+KWY6fLNxyRjbbHBrP+O9uNoOdnkbdbO3bvHZ0
 o9dQ==
X-Gm-Message-State: AOJu0Yy7gPdYyeyRGFgTX3jqtGKHcegVufLQJqwV/6+F6LZFKAaHozf4
 Dq3/veLKqjIbCNetbSHpqXV282WAi/o8RDpmMNznQ/KBTN4OJPE0+msCRP34Rg==
X-Gm-Gg: ASbGncsxr6BR+9jZ1hnLkj3nkI+rArmk4vnFMNXS0PgwmyiS39ccmIoS0g7z3e+0TU/
 ti0Jr/0q0CANzjgh+nKW7/qaibaC7E1ahqCqCuuaSoHbdLDGvIiJ20f7Wlh6cQXTLJjQsWqeMHp
 +0fbXbFve6pjOuHqYq+o/TuoqaYE0D/fWHa2WFAZc35g95Wbrqctj27L6DpS/jNrkDkj8QOYhx1
 nb+4WK/QZMws2W5JSxNMVOLeng9mK7fLDesXI3g0ngsnoAgNuUF3H76v+mu1NJZLxS01uyXkiLt
 lzo+7qOpGNKq0BNg4thKx1VM5HdNxiYagnzMRkpbCgMFxdgG6tvGtChOfbeEkOFilN+QCHthlUd
 0wofgPZS7HfUvYm9RSjXE69jgBrubUQ==
X-Google-Smtp-Source: AGHT+IHioUbzpWFRvCWyfQTefUlKy/XlntTuTd/44JJagCKGfLgB3c2uG18mHPfWkAWoZYfkNkzlOA==
X-Received: by 2002:a05:600c:c4b8:b0:45f:2bc5:41c3 with SMTP id
 5b1f17b1804b1-46202174cb4mr4236275e9.8.1758079606745; 
 Tue, 16 Sep 2025 20:26:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ecde3d6fe0sm1192668f8f.30.2025.09.16.20.26.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 20:26:46 -0700 (PDT)
Message-ID: <68ca2a76.df0a0220.2e943.307c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 17 Sep 2025 03:26:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758079607; x=1758684407; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hAvJNUxGpKKaJFu7bBcyA0e4fObfXbSBgHUMjZslFSc=;
 b=WTWVMfH/7jJkZf8gv16HOUm6c0T3LeEt2VHgwG4+RBJXSobjh+zrxuXizoJg+waZn+
 GdpaBo8uWJOZdO5uf4pcRJk45EpdC1YHO9s2UkFG7bEuX7V63MLVtbjUxrBpKjaU//7M
 xr8c8u+wVeZtL6JaveRdXPZu+sM+cStwpobfRB0tE3XDpter/YyoKEL5FTO02+BmDgxp
 iX3oSgGS1XYwpd6ob50XxybK2zbFzK5YcGLK9haZThMlG+wMm6e8rLqlO++PS/GQeiuK
 NYXNqKps7XWS5UtQUKJxZ7r8u9CJ+dqMwrFlsbb5NtbWN1bSo2E8lNnzvijAHZwFaNTr
 m3WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WTWVMfH/
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-16
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

Autobuild statistics for 2025-09-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  1  |  0  |  3  |
  2025.05.x  |  1  |  3  |  0  |  4  |
  2025.08.x  |  0  |  4  |  0  |  4  |
    master   | 36  | 61  |  0  | 97  |

Classification of failures by reason for master
-----------------------------------------------

     linux-5.10.162-cip24-rt10 | 3 
                       unknown | 3 
        vulkan-headers-1.4.317 | 3 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libopenssl-3.5.2 | 2 
                  linux-6.16.7 | 2 
                   perl-5.40.2 | 2 
             python-webpy-0.62 | 2 
          aardvark-dns-v1.16.0 | 1 
                apr-util-1.6.3 | 1 
                     bc-1.07.1 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dfu-util-0.11 | 1 
                    dust-1.2.3 | 1 
                enscript-1.6.6 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
                   gssdp-1.6.3 | 1 
                haveged-1.9.19 | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.1.0 | 1 
                  iozone-3.508 | 1 
                lesstif-0.95.2 | 1 
                libcurl-8.16.0 | 1 
             libgphoto2-2.5.27 | 1 
     libphidget-2.1.9.20190409 | 1 
                libselinux-3.9 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
                  liburing-2.6 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250530 | 1 
mjpg-streamer-v1.0.0-1-g310... | 1 
                    mpir-3.0.0 | 1 
                 netsnmp-5.9.4 | 1 
                  nginx-1.26.3 | 1 
                pipewire-1.2.8 | 1 
                     pound-4.8 | 1 
                python3-3.13.7 | 1 
                speechd-0.11.5 | 1 
uclibc-ng-test-132c6134d691... | 1 
                 wolfssl-5.7.2 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/29a7bce254a82b35e8bcd4f9561dd5a579e50ff9 | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/0a8b0284fd2fb48950c55ca3d69e7a818845518b |     
  mips64el   |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/5a87dfd19cbc5a41c63ba452ea331db5ea97484f | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c7e718a8965a68160407355f4706bc7545bc5864 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5496fa2ee9c058c5174f40affc17bd9f4b6e54f7 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7ce5b2be2ac90adc49aef9982e0ee47c2358c576 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1ab25fec3f5f2b3bcd3af426c1a653e9667c32f1 | ORPH
powerpc64le  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/08e0fdb60d6f7afdab0e80a2a1bc4694954aec92 | ORPH
    arc      |         dfu-util-0.11          | NOK | https://autobuild.buildroot.org/results/9b7a8dc2e353d5bc173b0c3330dbd2fc8b9efb44 | ORPH
powerpc64le  |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/387080d2b939cbde0821566add95908b96b8babb | ORPH
  powerpc    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/0519bc17c702fc793e0e97e1c74e9dc199cf1527 | ORPH
   sh4eb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/bb9e96fb3a7fd211e9b0637b1f60d0285a2436a3 |     
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4b70bbb91ef6166c14a8444f3278e989d3979e58 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/d151ee0910b816a4ed4c25df9e16bf9abe775756 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a1b843caa6aa68d9573f481594dab306fe1784c2 | ORPH
    or1k     |          gssdp-1.6.3           | NOK | https://autobuild.buildroot.org/results/3a75fb5e7fd73ce789eb63cb8a40f53a54527cba |     
  aarch64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/c576040685e433192058ed35e47ceb9f8783c7c6 |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/191fa13ca5d39585c3ae2ac3321897c6fcca94ff | ORPH
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/5765e3f2aa629a19f57fdd8b5433693613ae3362 |     
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5ef5b9916b47620656d50f4c097a001c018611f9 |     
 aarch64_be  |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/6fd35976406689536edfad40571129591c34aa1b | ORPH
   mips64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/6b09ef3a0bd40856c135832640d0c20990911359 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c2b4d3a59aa3d9ed1597450bb594748a2738820d |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d5a35540ee99ef6c6b04836901a179303c57a2ee |     
 microblaze  |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b43c7da3cc68314dc569a5e7a542867351904ec6 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/37594d52bebccc7c815941da5dbd6a4a13426949 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/387e84fd2a3abb158079540a33eb45028749926f | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e8e8e9f786f66bc7aa6d8e72754f0dd871a94918 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c5b7ff49af08d4c1b5a6bd2b0c6150a2f2913c5c |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/57b9a46e3c23649ac474c685dd46697a6251c9aa |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c37127db414879c68d60606a4883530d30e78eba |     
  powerpc    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/363a9bcfec921f2b4f10ca45823fdaabf7eb2fff |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b57511029a59e23ca17b1d4ee7743c561c8719f1 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1de9f6b4a20290947102c9f59994773a34eb0930 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d119fdd8f9669769d158738d0bfd0d840173f052 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c57eab2da476b4ac7e5e0c79e85dcffee5834bd3 | ORPH
   arceb     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/157696f5d47d94759fe0c6b2cb16dc16dd7fdac8 | ORPH
    sh4a     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/6cf69dfada0ff007bdd868460bd7281054068750 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b922ca4c713a0b35b05746b05439ac8bc0252432 | ORPH
   arceb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/d825eb214ea51bd10383f2c019323d8bb754fd69 |     
microblazeel | mjpg-streamer-v1.0.0-1-g310... | NOK | https://autobuild.buildroot.org/results/60b4588747a63983bf3f6d032ca567bf4614ef97 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4e7424d688880c14b5feda24f12e86d3f9fa9c0f |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/3f880fe40af629ee16e673c359c03c81d6422928 | ORPH
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/44dfd5fb0e74f466440439ed39d3bd0b317a7084 | ORPH
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/22cfc8c2d946927a48560dbaed35000cc4aeb3af |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9541be07a04e675f0072032f51067326572398cc |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/27b3eb0b24cc7f0cf7ccff137580b8047e4f66f0 |     
   x86_64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/0c3133c79882431804802818b91b21e8ff8345b6 | ORPH
loongarch64  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/d4b17000557bdcf0f145a66b0b3c9ec47e75b8bd |     
 aarch64_be  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/bd14378ea2307203c57bf211ba1d19bf6223a0a8 |     
   arceb     |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/2a7a5503fe980b122a41e594b1fdf3d0c5c1e879 |     
  sparc64    |         speechd-0.11.5         | NOK | https://autobuild.buildroot.org/results/da3efe6549c7a279e6747c6492390ccb616ddd03 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/afc8489ba6dd19e8e0ce3115015dcfed3a74b2c6 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/940d424e2e8a4b0205a22e36865f1b57846e393f |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/a53b1760514c8a978aa8e1b07bb6cd442b2f03c7 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/dca57457ea1c413f7b98805a67becf998da55cad |     
  mips64el   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/0b5f784c0642db503fb21a03ac83f234d172d19b | ORPH
   sparc     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/33c1f75d265f976dffa4530c0d0038e74ff1e4ad | ORPH
loongarch64  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/f5afcec7c19c6c1b724af457c51ba2a23caa069c | ORPH
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/ae76a1cb449055887b3abfbd1f46fda77e36767c |     
   armeb     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/0d4ec757e6a72c53c3937cb95ad132435150f48a |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                  brotli-1.1.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libgee-0.20.6 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/512ca3d26fdb5f638ec7d01df4e8b3ead519366b |     
   mipsel    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/2cd21d336f4471a35ee3c3f31003a97e32308a54 | ORPH
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d3adcd39993744b9d460bef1fb10ac607a1732c9 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/39c73dc7e93f0025ff514c8f470198602dd2652a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               host-runc-1.2.4 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |        host-runc-1.2.4         | NOK | https://autobuild.buildroot.org/results/a646bae4b79a6bc5da502b747f10fca7b0136140 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                     ace-7.1.1 | 1 
               host-ola-0.10.9 | 1 
                 mdevd-0.1.6.5 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/8a3877bbd62bd304b7b9050b402277dbf5b6c39d | ORPH
    arm      |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/46ccc1978e51ab6f07a55b65d7ce28a5b8e5fd23 |     
   armeb     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6b71226e3219b64cf0629304358caf1857735dfc |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
