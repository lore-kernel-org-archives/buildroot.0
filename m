Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F44C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 04:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D867049A;
	Sat, 18 Jan 2025 04:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQw8a3RMi0mP; Sat, 18 Jan 2025 04:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F6B60AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F6B60AF6;
	Sat, 18 Jan 2025 04:14:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18024B89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5E85400E7
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 04:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIZ5D92ZRl6C for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 04:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 816D7400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 816D7400B8
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 816D7400B8
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 04:14:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab322ecd75dso493084066b.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737173672; x=1737778472;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1PR6DNdK2kb6zIacV5JLzulnumd/mJOwMf3OXgl+Sc=;
 b=CaaOKv5wpP+R/xRqU5OQG3QnQMaIjcQ+SMHic8RUrcOfSqVTCpQOTQu/VDOJKfLQKR
 r9VYveD2s8IWcf2IjB47Y+KtX58GksDewSw5KosrqU0uMX9SRIGDdoSLa4Oir1w3XQ8r
 pO14mgXKZ6aguD2KhpAwMGqem8Qa4+9CtoZyVj3QNMy1fW5oOanwGL7a0c+HSeaurNZK
 74et9YgyncYcBIC/4lP84O5or9KN314Nbwu1ZcSQvdIV2xsjuTMcPTQBJVGzUlP0FvSR
 6Rg0m3rqAcmlnA+yPABXsL2cItuLeCR/qZiko6JjITMyLbFCiy4c316VylQhTaDyCjEy
 U5Yw==
X-Gm-Message-State: AOJu0Yx0V1CeToTlzLdu1aOGf3JGpxZ6O7awRkA/9OyVIDZMXJfPPZ/c
 9n04tI7L7Ymp46iujR/LMPOfi1TOukwm9MOsTtEUi0yTD0szYp0Dw0lH6Q==
X-Gm-Gg: ASbGncvvLPggoL5QdO+CKbIJYmYCatvcjSpPAnl5M7JTdjj0mmTVOy+iSboW/jaGR3K
 rNEShQ/rvD7Pi2V8X05q4lvvWiPDGfHKfuFIFQunukGIuW0tJf9bsuxAQLI90DdKCRPrt0u/Fvf
 Il5b9aGJbuYu+nGvN1/zr9rvEJZvv7LRiNnFbuUFW0IUJFTTDLKWpOmJYj3EoibGBLuu2daba80
 mJi2cK3sNwS5/RhiJkJXA17NXbolOIIAsiIn+yhRupn68d2WKhY6usnkOJg8riI1nutMqw2KA==
X-Google-Smtp-Source: AGHT+IEwO6x6YKi3w+HOoYMeCA3THqdgpCIDcK3h1vflCJINozswysIhySlH6M7uSVlQo9tDCbIAnw==
X-Received: by 2002:a17:906:ef05:b0:aa6:489e:5848 with SMTP id
 a640c23a62f3a-ab38cd8cec1mr376781666b.25.1737173672209; 
 Fri, 17 Jan 2025 20:14:32 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384cea379sm269947166b.72.2025.01.17.20.14.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 20:14:31 -0800 (PST)
Message-ID: <678b2aa7.170a0220.20d822.853c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 18 Jan 2025 04:14:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737173672; x=1737778472; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=s1PR6DNdK2kb6zIacV5JLzulnumd/mJOwMf3OXgl+Sc=;
 b=l9wqhvnNeYQI2HqULX+QmH+77sGVHnVuSqEIOnYRwAEOqpyInYYMbcy6gaQx8bLsjB
 ymyIcyLEjSEQ8YgItQ5xThKUF9scmsGIdJQBUIOcFsZDL5PhZK0iuX8zxrzl8gBFMjXf
 0xMdhxDURbd7YG/J4KOBs2pjR8NAjlJQ6K33+I+jBOaG+G0rp0GGaGzrPqTBKQMJQ8ir
 srhJUsJ4/PUMKTmzYn6yI12PmsMadWCnm72CS9moeaQVolJO9Iaq8dQK7jFkU1Mgq4vK
 E77Q33j4CWs7rEChTxvTi70Yq3jxiU6M1d9Vs6d6QSV2M5ECBMJjPDeRfnEE0ZYiLlZn
 DeFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l9wqhvnN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-17
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

Autobuild statistics for 2025-01-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  4  |  0  |  7  |
  2024.11.x  |  0  |  4  |  0  |  4  |
    master   | 11  | 62  |  1  | 74  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 4 
                       unknown | 4 
             util-linux-2.40.2 | 4 
              mosquitto-2.0.20 | 3 
                  ntp-4.2.8p18 | 3 
  gobject-introspection-1.76.1 | 2 
               iproute2-6.12.0 | 2 
                 libv4l-1.28.1 | 2 
           oath-toolkit-2.6.12 | 2 
                   perl-5.40.0 | 2 
                 agentpp-4.6.1 | 1 
             berkeleydb-5.3.28 | 1 
             bluez5_utils-5.79 | 1 
                   cvs-1.12.13 | 1 
esp-hosted-927a34f99724bb74... | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                    flac-1.4.3 | 1 
                   foot-1.16.2 | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
               graphene-1.10.8 | 1 
            gstreamer1-1.22.12 | 1 
                   gvfs-1.48.1 | 1 
                 hddtemp-0.4.3 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
           libfreeimage-3.18.0 | 1 
              libunistring-1.3 | 1 
                  liburing-2.6 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.1.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.12.9 | 1 
             matchbox-lib-1.12 | 1 
                memtest86-6.20 | 1 
                 openal-1.22.0 | 1 
                oprofile-1.4.0 | 1 
             parsec-tool-0.7.0 | 1 
            quickjs-2024-01-13 | 1 
                  ramsmp-3.5.0 | 1 
          sphinxbase-5prealpha | 1 
                   swipl-9.2.8 | 1 
               unixodbc-2.3.12 | 1 
               valgrind-3.23.0 | 1 
wilc-driver-linux4microchip... | 1 
                     wpewebkit | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/339f2d719a68d7573b654382d7412824fdb92451 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/a41f17cdbed452ed47fa5e69d0e1c03715ba4ce4 | ORPH
 powerpc64   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2f268b6212da4567bd923058ddf87e3b4c2405ff |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ebbd4e0e6bf285c91ed7bda1686980fa713abc3d | ORPH
  powerpc    | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/3de116f54de4af7e78bedc32969a9b98bb09417f |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2880b34d42cb036b3c787fc806c6f187412ec3ab |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/898b29aa4ac8e4e4ce73844b0d4580219d9a5444 | ORPH
   arceb     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/afbbdaddd6f860aa180e97440c8aaf04477153d3 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/be43bfa313a2a0bd3b5c2166dce0fff205c2f445 |     
powerpc64le  | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/cb1d9a4ab32cc8989b69f59b7d49880239c0999b |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/31e0a43748dc8ba470c388fb40afee93e2855198 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6d65c129b40f45b637a97fc05dbfd38fcca416d7 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d3c19d22e197bccbe200224e6bbe1c142ad1bc5a |     
 powerpc64   |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/9f1156acfb616d82ce19411bfd32c240cd3fa56f | ORPH
 powerpc64   |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/63ad19cc04bf0f978bfa680558bc293969c221b6 | ORPH
 aarch64_be  |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/79b905c0a94e597c82472ad594ad250bf0e3cd3a |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8ff560469e1ea18c6319086a86b394aacd80fdbe |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a8be018a6ab9f91e64a559e9bae2fd84eb296c0f |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bd70645d4c42438e4f7bc7a411487a92a6909d07 |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/04fc1c21fa0e116355239fff7465a6db3857a4ce |     
   s390x     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/4b466f0975c94602f28830394f9ebedac705e3c7 |     
    mips     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/83fa6313a8d6962fa87f91b6884ad64097c8fb6b |     
   armeb     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/2a1bc459f66fbca3ac7cfcb73b2f8bec2b0c2a5b | ORPH
 powerpc64   |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/6ddef098aa136b287dddedce190dee1cbae1e024 |     
    arm      |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/77ce5075e966fc81abf6df685e31641f1decf0f1 |     
 powerpc64   |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/632225fb7ab4e4b74afaf6ab69f3d8d602b93033 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/131f08550ae6df1c8142cc330d39af5a33793ed8 |     
   sh4aeb    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b78ade1d0c6af6d0e3484d284e289b2efb9d6813 |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/44a928c0315e71fdc0c3c9aae0d788cf27f32f7a |     
    arc      |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/e937c793ecc2f5ddadbd4f685bfba4fe33c003b1 |     
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4805599978968c6a3733e414990480d2c3664c0f | ORPH
    i686     |          linux-6.12.9          | NOK | https://autobuild.buildroot.org/results/e313e14389a178af2900e20de875d538a486360c | ORPH
   x86_64    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/5065b58cf6b77001f211b77dba43c100f56b3c38 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/341c699b9b0b2e925348665cbcefa70c808d55ae |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/329aa4e637c75021f9c5b8ba98ebea43c8b3ed85 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/dce611464b6869e19f28f5198e8297b7c3b20e89 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/80475db1b46502ddf9f1874df53c6b5ad2c8a690 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7e1b50389742dbd05b17c4ce795c7bb033fb0dac |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/41a09b8fae7cb3b251f475958add999263367ab1 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c74ae072c9e26bd1d110d623e57f29eae69aece4 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1a6766d71128bebbe8cbf4afcb5e1e1e71cc6bdf |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9c2d2fec1bf9d673f2708c0cab03e9bef6bd2ba9 |     
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/88ca5871b3793308e29d16093a01dec3a195648b | ORPH
  aarch64    |         oprofile-1.4.0         | NOK | https://autobuild.buildroot.org/results/14f2b572e21a5db855474073ada8b267eb5e1f15 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/58beb2f21ba5511249627919455782a6220dc963 |     
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f4fe8b6a20f6a9c0559cc76a2da3502ba7f8dc92 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/13e7cdc80bc000d3ed2452e94bf955824ed3ba55 |     
    or1k     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/d2122f8ce2603061b6833e20f553cff60ac1b977 |     
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/748938635c1bc9c904791fac90c29c83004e2c52 |     
  sparc64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/279880a881b5b5c31878305f5c71b9c5b89ed9d3 |     
   arceb     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/c852d4fe2f2c1317a2432170b43cee45cc0327c9 |     
 aarch64_be  |        unixodbc-2.3.12         | NOK | https://autobuild.buildroot.org/results/a824087ca4da3721c2652ec61fb09b09e69611af |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/accda92e51bbda3fbce1ace375ab3e0384297aaa |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/44d6fd6b2b2bd2a95f4ce6d72d18939fcd49e6ae |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/bf787c3be2686eb00949134e54969efe6c08d09c |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/8cd246cd508a946d2ff3503a879367f43375ea53 |     
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1cf9245cf2f063f80e3527df0782086e599f9187 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e266dbf39e1c06169085af676dc2c0c9c1c7788c | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/45260e2d6d884c3532b27c4c06d0356bd303b78e | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e6b4eb1aa88edb052fee4898b226c67a20636db3 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/3b479630369216d69ffc86bb7b287ebab1cb910b | ORPH
    or1k     | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/e3808b0cb58fb102b09209be346b8928dc48b47c |     
    arm      |           wpewebkit            | TIM | https://autobuild.buildroot.org/results/be2dd619c3025a17d685f97324bee2e874407d12 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
                    brltty-6.6 | 1 
              fftw-quad-3.3.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/51c2a31df3a930003822cca643dbbefefb3c41a8 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/db13b7b8980b3d2874d1ec0880956334c2e040fb | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4580491d460f7e65062f8a5b623e9a56afffc936 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cf83ff05b6980a55198bb687828d27d0169d3795 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                freerdp-2.11.7 | 1 
               libglib2-2.76.1 | 1 
            live555-2021.05.03 | 1 
                   swipl-9.2.8 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/ee257de8b063fd0042f5258782c4f5ddef768c57 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/d48194854534dcec425f0ccdf71cedf36be8a43f |     
   nios2     |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/06d2bacfba6f543b409f20f8ed1484caff1f328f | ORPH
    m68k     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/ef2359a0bd020db5372c595a2cc0405814e0538d |     


Gitlab CI results for 2025-01-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051076  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051203  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051218  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051228  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051250  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051440  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051580  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051667  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051688  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051711  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051724  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051775  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051789  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051804  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051817  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864051834  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864052058  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864052554  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864053107  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864053111  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864053125  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864053316  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864053627  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864053926  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054457  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054498  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054508  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054511  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054538  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054543  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054546  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054551  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054556  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054558  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054563  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054566  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054571  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054583  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054585  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054639  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054642  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8864054650  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
