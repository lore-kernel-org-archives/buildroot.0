Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF74DCAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 03:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F914607D5;
	Fri, 12 Sep 2025 03:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVP7J_4cJsAo; Fri, 12 Sep 2025 03:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5113607DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5113607DF;
	Fri, 12 Sep 2025 03:20:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58CF025B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 03:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 563BE4025C
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 03:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEf0j5J2woFs for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 03:20:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDBA540248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDBA540248
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDBA540248
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 03:20:12 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3e75fb6b2e2so1507358f8f.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757647211; x=1758252011;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i6xgOe8hX7BCJwnfmhN62kFWCgfKROtv/r+iX6MNcc8=;
 b=F55Ado9p1Wcbdo5hhAHbWhI7rS5UNGjaSIBSpSwr3CQihqvRtgD9nUW3OB+4p2nLiL
 uiFCPLBkNJrDCHAYGMxaG2bKQNrdpCOhCU+yyWlVv5uJshdZuUPkhu1TU1y6W81gVYis
 IGrpLJhoKt7GwTt1iOXAVgCQBF8hjVWv7ZSHbLXK1rt8/S75f+jct0aQBBgjT29K9ncg
 yZZII9ZcP3az2p7SsBuGbc4WZxjNIAzDQKKfUtqomiT+hcnZWXJsjenKg/LhQ2YakXZp
 Wz6wtIUiAI9HxJmByjlBy+ai4V8GHlnkehsGNZv0aLS6XNkWkUEKBV1nIMM08sHe9XYP
 Sodg==
X-Gm-Message-State: AOJu0YykLgfQewPE0jNLF6XVpov4poZpJj/4QkoCbmfZrni48yGwLHey
 HgDxZmRzWf+PDd2Ll6IqUnUj6k3j88D8ZBKwideQQrdcIztOSC16TE1ZS26i7w==
X-Gm-Gg: ASbGncuHxNQnbdfRoVNuFc9YVIgzdaYwWXwJdjGD3BxFJDhczyCYkNXizFWPb0M3mOM
 NuSpjoKjw1wqPDpIGWGWeOEVgJqhpS+gJqigUqIl/m0XbkuJiRiYrmOee1bOVLJ0Itov5JF01/b
 Kl5Y11NUlMLGF2BCzCU4P5LLGnMgq3+vqc9xYSlGdJp50y2z3GHS8SRo2AP1ZSoZIFsuOOQXBfh
 D43Py+a7EJFybSNgHW04qPlXBKxSVOyysSX/mnODnZZxG81e7494uhX/cs3z+ldF3noLSQNuN6e
 vXyoNIk/76rMfH4mg08zB/QZn1toWw5Rf3kT1YGmQfhDy3j7oUuaqU5EOEPkWbH1qMs8bIuwjCL
 NimQvdLWKfPkzzQLhSCQtGp8/Z+TqtlLPcC7mC9HL
X-Google-Smtp-Source: AGHT+IEO3tj70vsyJvZLCpMOC1BsHK9SJ+gpVmV/Q/uUmJU6n2qnu0VRGQ/hnHb6fO7CS+UWec7e/A==
X-Received: by 2002:a05:6000:26c1:b0:3e7:620e:5295 with SMTP id
 ffacd0b85a97d-3e765782ae4mr1078650f8f.11.1757647210399; 
 Thu, 11 Sep 2025 20:20:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015313a0sm25617195e9.4.2025.09.11.20.20.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 20:20:10 -0700 (PDT)
Message-ID: <68c3916a.050a0220.88d06.9e41@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 12 Sep 2025 03:20:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757647211; x=1758252011; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=i6xgOe8hX7BCJwnfmhN62kFWCgfKROtv/r+iX6MNcc8=;
 b=cc5VQXSBtiAYgNzyPkT761VWZ4T27596DByriWU/KU7TdNVlOGar3ddHfW37oFd7G7
 ERhxSC77g4OvZTzbD8fB9jG2I/hSixOmMcNzOI3MXO92GIDw8ORFeSxwEMFOcZqIW2Gt
 Cl8cgtsk7t43lBL4I+JTE0ZkH6FfhjLfEk7Ejkn6ZPqcWT/hAaa4O9rBqSodCWAo+BIb
 naM/E/XxtE/W6/g2EbmvKvU27wIAwMPcc+pfRp+Y2+0gYDHP+Xl3ae7Y4kdjZXJTz5Tq
 nhRC5H22mLoZxBGbLtF9Prg1zHKBUcrHsu2FaTvOEP2/04Wk1qBicLo6gGZYiSaQEYLj
 12aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cc5VQXSB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-11
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

Autobuild statistics for 2025-09-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  6  |  0  | 11  |
  2025.05.x  |  2  |  3  |  0  |  5  |
  2025.08.x  |  1  |  1  |  0  |  2  |
    master   | 35  | 71  |  1  | 107 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                 logsurfer-1.8 | 5 
     libphidget-2.1.9.20190409 | 3 
               linux-pam-1.6.1 | 3 
               bctoolbox-4.4.8 | 2 
               freeipmi-1.6.14 | 2 
                  iozone-3.508 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libselinux-3.8.1 | 2 
python-remi-2022.7.27-37-g1... | 2 
        vulkan-headers-1.4.317 | 2 
          aardvark-dns-v1.16.0 | 1 
amazon-ecr-credential-helpe... | 1 
                 apitrace-13.0 | 1 
             berkeleydb-5.3.28 | 1 
             bubblewrap-0.11.0 | 1 
                  cairo-1.18.4 | 1 
                   cvs-1.12.13 | 1 
                 dc3dd-7.2.641 | 1 
 docker-credential-gcr-v2.1.30 | 1 
             drbd-utils-9.21.4 | 1 
               dvbsnoop-1.4.50 | 1 
        edk2-edk2-stable202505 | 1 
                enscript-1.6.6 | 1 
              execline-2.9.6.1 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
                heirloom-mailx | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.1.0 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                 lcdproc-0.5.9 | 1 
                  ledmon-1.0.0 | 1 
                 libbson-1.9.5 | 1 
                libcurl-8.15.0 | 1 
              libopenssl-3.5.2 | 1 
libuci-f3fc0b76040685829191... | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.16.5 | 1 
              lua-utf8-0.1.6-1 | 1 
                memtest86-7.20 | 1 
            micropython-1.22.2 | 1 
                    mpir-3.0.0 | 1 
                openswan-3.0.0 | 1 
                   perl-5.40.2 | 1 
          python-tinyrpc-1.1.7 | 1 
                   s6-2.13.1.0 | 1 
                 systemd-257.7 | 1 
                     unzip-6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/40935aef782c7b71d39781bdc045779c3ada4517 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/264479ef6b1280c4f2628adcdafb5023fa80a387 | ORPH
    i686     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/9f3c12f4e436ce461a6e74fd50afb813f1b6df98 |     
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3fe7896e427f11e3b094dd170e295b732ab83c31 | ORPH
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9331278578805dd27747127a5a56af5688584bca | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/da73c1d1e89f0c4cc345e02198aeff802ed5779e | ORPH
   arceb     |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/85731a72c28b28bda3f1bbaf5a19cdd6cb39b170 |     
   arceb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/340b6b80b7523c1d8e30271091f57e6b49eb4f89 |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/64e66f5b907c62ac2090b721f237fb0f0ec7c584 | ORPH
    mips     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5523e16b1528dc3099b930ec69d245a6348e3462 | ORPH
    arm      | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/4a0704a1316133dc2f8845248aba59c281b86715 | ORPH
    i586     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/75dac6a216c48cb013a594ca5e8806b28c9dc5ca |     
    i586     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/6eb96daa87d52e14cb5158cb30ddfc1b5a7cee31 |     
   x86_64    |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/5d09517fe13d6f707f9a93ba90b5c68c59a1fb6f |     
    arc      |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f3c700ff3544ff51559b3739495997d88aaddf3d | ORPH
   s390x     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/c62254808a5a781a1b5cc600ca10f850bc90f09d |     
    arm      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/96d4793e49b59fabb0d3e4ee22d78d27256601e1 |     
   arceb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/c299eff46997dcd4664542b8c3b1c61ca10e9e32 |     
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/be56370209d3e16bb5d60df90a5c35da007bf5b3 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/d7ad8163e56500080ddad9796e531c0e7985bf17 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/94f0a9f5e8ef380f182545099415ca6ad61e66f0 | ORPH
   armeb     |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/fb504ae53ee2cc56e6fd2e34d6aeb197287f8c67 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f30778a7b9d0aeb60275dc8ecafcfa2fb4bf15fc | ORPH
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/8719a0b64b8cb5463d8430e1d6cdb8b5eb0eacd8 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/37a5fe304f2a345d3a024a04417212b64c8f4bb3 |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/96a09d11c50acbf075e6c952ac4ab98eaa11d16a |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/34f5897166f8116a12c437ccff57ff336a731884 |     
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/854fe16639c08648ba32665ca1b5ad90319191c3 | ORPH
 microblaze  |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/1f15cdacdcbe833006d1638ce132770cc9643087 |     
 microblaze  |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/6addbd7d155088293fead0b1487c9bf9893d91c0 |     
   arceb     |         libcurl-8.15.0         | NOK | https://autobuild.buildroot.org/results/e40f21b78065cefeaf8858a1282910a72e8ff09b |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ae683151c29386c78638e7e1e147dd060683eb0b |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/93a62e8e39f3c73b2613c097a6bac63d5b4440df |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/a2fe329f5aa345087a38b9a9bcb3f2ea120fe655 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1e722759de6c8b05a4b2c600bef9f7a97b1f9229 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7bcf24e3b508d1344ad27f53a4e791eea8a24c79 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6354fa987c5b9a9309d0d2d351e54948804bbad3 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a605c527fab4a59cf184193eca19dc2ddf67efca |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f586f353c42ff3ef94825a9c51d324d30b1a507d |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/0b4e3025d41249fc780c609862d3c1342b272458 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fc76ccfc29f81d5bdd836090b3fe66436e7e7a2d | ORPH
    m68k     |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/9ae0cc64836301efee0ae7045e2832461856a2e0 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8c6f918b380e6c6839d6ac88113ea39ed8957596 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/21627d324b04389cf2b458b080ef2f4e78e03e9f | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5395500fb7f600288875bb23678cc8cb45cb0705 | ORPH
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/bf5df38b8ed80b1ea174b03098f5d2fada0d9ddd |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9b37b3774693eb1c9d25f01cdecdf32ed04ddd9c |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/956c9ce8e760c273d95de9069befd61e2c8bb5a5 |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9b074e801caab9acee4e4c8dbd0be22d61195abe |     
 microblaze  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/11e30fdad9acec18bde4c79a52360713acd5ba8c |     
 aarch64_be  |        lua-utf8-0.1.6-1        | NOK | https://autobuild.buildroot.org/results/6b229898c74e16e9e722f8a712c6b4257cf04dff |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/e4a0d63d7f4a6d73aff1f19111b31e98aef92360 |     
   sh4aeb    |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/5352dc09990c189f05641fae63023604c8d06e7a |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c8fcd062ebb06ce4bbee4de9c0424972ca11f4b8 |     
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/372514c9b6ec301df6ec9c6b849e13ab1e297da5 | ORPH
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1cbc5f844a44691c4dbb790e92699af7b8699a7a |     
   x86_64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/90e6c1b0fce7f40b983f3ae69e96e3e944b1c999 |     
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0b262defa5befb6344082362d43a8d01e9da9ac5 |     
 microblaze  |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/3be98ed48727b0d654a7d7e52944534be217a565 |     
    arc      |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/6e483ccd49acc97c19c13da3ff30f389ca4fd02e |     
   sh4aeb    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/390368b4bc6b58b8b2034d78b2edd96c7a7be2fd |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/032e4df062b79cd45ea9d2b01212d02dea3678b1 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/2ed9a5d01ffb9ac5851f9af55e4bc0b15a5bc3fb |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/a4b14972f2d661c780a5325aaa8f8c28743c6778 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/60d48c6f86b5a5c1a8fbf9a29dab4a485f065dd7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/c7534a99f206b74363eedf6b0620cc0230a80324 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/71fb6025dc70673cef73f76fafe8fc43339ce6cf |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/14647830810aa05417d68da0661c2f8d25a9f04a |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/11ef4dfd4894aba1dd473be0c47f420f87e8d253 |     
  aarch64    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/fde97dae237fa050fa8d16ce7d5698bd8396b4f6 |     
  mips64el   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/d3927f1fc56f6772d6b37bf8e7dc8a00a91b5dc6 | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1d7979734c2df19c39660353727e5ac1cf9146fe | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d480f0c258c5628a1522f8e953e949e7f429f58e | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.2 | 2 
                  cmake-3.31.5 | 1 
                 host-gdb-15.2 | 1 
                s6-dns-2.3.7.2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/bdac2534f79e0def3185138f00efb189d68c7cad |     
    sh4a     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/514fcc439e392fa3d6ae0d6b8c1bd3c0e5d5051a | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f408d141566a6b9e9f2418b0ae050fc015a14563 |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/75d606982ea4654959a43a9b24a7af72218a0dd0 |     
 powerpc64   |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/f86e8160725126c52cada48b52dee93e1a7e10d3 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/c9eeca421fe96aca4f16d0c5ef3cbbfaeed81c3a |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                  cairo-1.18.4 | 1 
              host-rust-1.86.0 | 1 
                 libgee-0.20.6 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/3b916b866adcb54a32f58d39beeddac2cdaa48f1 |     
  sparc64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/317df4ff66b1dc4c70ffb3b9e39de6a9c745fc17 |     
 microblaze  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b65d2bec7b690b6875180a42261187d2e14726e9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
