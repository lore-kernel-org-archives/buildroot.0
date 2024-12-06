Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE3BE7716F
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 04:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3198961114;
	Fri,  6 Dec 2024 04:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZZBNTL9G1Vd; Fri,  6 Dec 2024 04:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37DA461097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37DA461097;
	Fri,  6 Dec 2024 04:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABF1BAE8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 04:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BDB0406E3
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 04:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBFKESfyfn_F for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 04:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04FD1406BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04FD1406BC
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04FD1406BC
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 04:18:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d123ac1c3cso1734065a12.0
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 20:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733458683; x=1734063483;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kiN4iXJAZL8Uoz/pQjDhXq4Gu6JndZcD0QyL4Pg/4ig=;
 b=Jm4So1uHSVBtwH/NbnM2m2EC2EU/eDFStsJCDPmIRAV1evOy5whEovM1nV/gNZPCzA
 +r6wgU6aVlBHO/jF501dgwoKb7zBP1HgzxEqA7j1c5oPC+LSUdrWeynA45SltS06UgKp
 6/1M1i58iGAHwMJ7APNjtAxw1AD9EUZ1xX4iIFCpN4ZrYDEcy3gvH17job2QZXuNDDUt
 o3wWUUueFpq6ohv1Sr3wC8wI32XplqYYcB6Z0+ackqNjWRrl+e+1qW9qn7axwL9mqPrO
 zvXH0mwzgGdLaoCDnSEN1tP3wVB7/UZ+STEm5IwFxW0NttQboguhZ7b97E5/PVe8skeb
 8d7Q==
X-Gm-Message-State: AOJu0YxqjoPKCy/fwun61lCzOLpryAI3xPtPA43AG65DcptMHbNB083n
 4VKXn2s85Tv75VTILmZ/Z5CzcdsAS73Af3aAkDUPPbFrzqaeN6jDZFjQsw==
X-Gm-Gg: ASbGncv5dZh4z4Vl6NpORd9Od21HkqZ5MWihNZgDdlxnSK5Rq3RF2KwHivs6Eh3IHyv
 63FlNDszbQKSkaHYBZo80E7rOPqUCRz4kxvG8v54wtPK+MsJ78v0JHd7TrYsNtJ1qhoRiBGLCGW
 0+8qdZ0+aZV5Cc0bg3j+vFZDVJeV6CSHzmu9xwhybFSYfQVph/U4aPvTV38hao2gPtFcd4aki+E
 453svloSrGAQq4WkV2HnZ/uaOl1Q39VXwvgsyjJgfNTh5FetNIHrA==
X-Google-Smtp-Source: AGHT+IFfoYk0p3wNI1yUk2bEzyIQHA7lhbe2RSGV5FFeuPExiDWInOJrw1LzDmVo4MaT94na7qqgvw==
X-Received: by 2002:a05:6402:35cf:b0:5d3:badb:cc05 with SMTP id
 4fb4d7f45d1cf-5d3be7c27e3mr1220254a12.33.1733458682477; 
 Thu, 05 Dec 2024 20:18:02 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d14c799200sm1568391a12.65.2024.12.05.20.18.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 20:18:02 -0800 (PST)
Message-ID: <67527afa.050a0220.b0b64.5c1b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 06 Dec 2024 04:18:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733458683; x=1734063483; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kiN4iXJAZL8Uoz/pQjDhXq4Gu6JndZcD0QyL4Pg/4ig=;
 b=ndw9vDlzyucLTTPJIpkWRlRdLMLOSx9WKZFKyvZYpUPabm6ZNcp8PsJ2dyYegNwtSM
 C1WxSjI43sLAXtJNmMkJCeydNI4OVsV8dpzh2XqQ6i6JNsG3Uqn3SzCY1rdjtSkrdSuV
 lLe5BvEXIZydPcy2992+AV9z9eQ9gR1+h583rlekPQfCaV9hDkUudpdI/BF/O5wKIlSD
 UU9XEaI+IPk8D12dpFqZkU/4Am4pI4SWZufktQW6tTNyyvpUskOOaIcMI8+gyAvMrK+b
 C1bbSbTTephr1NI+2HwF1Bj16BqQ6eCMFG4ms22fN6pgxNQyxXfHGB3meQxYFyzsI+/a
 nxIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ndw9vDlz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-05
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

Autobuild statistics for 2024-12-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  1  |  0  |  6  |
  2024.08.x  |  1  |  2  |  0  |  3  |
    master   |  7  | 51  |  1  | 59  |
     next    |  2  |  5  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

                  gnutls-3.8.7 | 6 
             dahdi-linux-3.3.0 | 3 
            host-binutils-2.42 | 3 
                libdrm-2.4.123 | 3 
                       unknown | 3 
                    brltty-6.6 | 2 
                 coreutils-9.5 | 2 
                  ffmpeg-6.1.2 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
               linux-pam-1.6.1 | 2 
               mariadb-10.11.6 | 2 
                 apitrace-10.0 | 1 
                  clang-15.0.3 | 1 
                    dust-0.9.0 | 1 
                   eza-0.18.22 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
                  giblib-1.2.4 | 1 
         gobject-introspection | 1 
                 hddtemp-0.4.3 | 1 
                  jack2-1.9.22 | 1 
           libzenoh-pico-1.0.2 | 1 
            linux-fusion-9.0.3 | 1 
                lmbench-3.0-a9 | 1 
                   mimic-1.1.0 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
               procps-ng-4.0.4 | 1 
             util-linux-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/6a509e7dcfd0d78cbd7468792c820194a478501a |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/5bed8a23ebd57c8e55a14e2289185e4e20162bd7 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/c9db55dc83e47619731bd21bc31cb26a7d252016 |     
    i586     |          clang-15.0.3          | NOK | https://autobuild.buildroot.org/results/a14389104bd7ee33ae68c7838d9522ac810048b6 |     
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/ba26afa60d0bee2bab7208aacb5ffb6d2ed9a756 | ORPH
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/7332d4df65540932414dfa3fd129b19078ad7d4b | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/85785269f9f9b0af709da6d41c580302b70c1700 | ORPH
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/937b32784e3ee78212bd438391c5aec8b505d345 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6007c7d147c2d8fea4200369577dbeb47d9f9418 | ORPH
    arm      |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/c61e34ea2240dec2b67cf2c1d18c243b1058c353 | ORPH
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/8a9f7fa3a56357e67a6fb6f4fa52e852ff590e58 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/43fc852b43c6222a68f7d9cab45de446250f1cf2 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bcb66c6485db33551c35709c2463c1ac65109651 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/cd97918b8eaf7a9edb950f6fc46e9fe83b10b2c4 | ORPH
   nios2     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/14cabe8f99250d89a1fd33d082e499629add048d |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5faf418844c5bc434b955ac09eedcc73b6b8e3dd |     
 microblaze  |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/c86d99d2db3b690328a0d789b38028dd01eea64b |     
microblazeel |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/c8f876943dfdde7accbc918466bb1e23b8801c3e | ORPH
    arc      |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/352197386c04c652ea780a26d6ed816aa059f137 | ORPH
  aarch64    |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/a491bfa7c22f637149e31ed02bb13d05e112d42a | ORPH
  mips64el   |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/10d1b895b96ed5d22cc6e8b24d55cb93d20a7fb7 | ORPH
   mips64    |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/f7acb3347213b6ef0a3be4d3a51d3dc3b01014c2 | ORPH
  mips64el   |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/65376491968b22c11cfdc4d61c6b8987d92632f6 | ORPH
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5178bdca599913850b3f76ceb04637d14684c4b3 |     
  powerpc    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/def69f24d3787a09e63ac9e2c194b531a9a337f3 |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9842881598a3e22cd2f39f9458caaae4e0651c25 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/08f0599db10ded51ebb7ec5e1e6e77c41743961f |     
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8eafbde828ecfd1112799cc6d6f12c7affdb63cb |     
microblazeel | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ab7265b366e73e861a10d14e63cac1d80ee0c24f |     
    arm      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/6190f22ffbb8571ce44513281b4519f7c6028bd8 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/0ecd35ccef46bc0eee1bf3a0733cbe22805ba71e |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/d8a89249a063738b006a580b557d9ed2acc62cf5 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/e4f1597033afacbb5222a672d967020125f5730f |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/b355e563ee3f824a9988d0e92d0b7f264fd20654 |     
   nios2     |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/c333dcb4295a4b8b198a3871d321870d05d710b0 |     
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/5339e4c379a431d551202608f2d7ae45d6b90f74 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9118104fc97d7fdf313301fff1d98dbb7977157d | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d3bb7e1c353748ab0303aa26418381d0654ddc52 | ORPH
 aarch64_be  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/ad562bcc39cf122f8e5d78318a0f6d635a783d24 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/406f4afa59b11e90557eb2590f8c383412cca7a4 | ORPH
  sparc64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/4187568da1db74ffe612c90c6c1a96f7c45475a9 | ORPH
microblazeel |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/aa96b474c70469c438428907ce42fff568157386 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/830225c7454218c06335c01fd16e5f24704f846f |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bbe7664422d03f7965c4d6264d4789e07e18ea94 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6a4375dc4bf39437f650bd640388358106f77604 |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/db6ba7ec9803e36fa5ca14514ffdcf3f42d5fff6 |     
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6dcc239827e0061b59273e5d95079ca13b64e252 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/72a7c2d15b3bca8776f6520c49ce7a00cb7c789d |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/4aaa6ab17ba2d6cf96690c6d6b6e689ee4830171 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/526e0e15669425880fa41f827a88d1291088038a |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/89e7487826a8b2ee463e335dbc7dd9da259eee8b | ORPH
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/4eb0e463a2996ae8b9821b76fad1a09b1d1e2d68 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/70264f0479c35557cf5d8d07b6a858fd55754d17 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
               pcsc-lite-2.1.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/7731d15c811d52d22ac80505928c4823cc43f653 |     
powerpc64le  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/1f2a31568686f78ea5cf7fbb9364adcb1dd95bcb | ORPH


Classification of failures by reason for next
---------------------------------------------

                     exim-4.98 | 1 
               graphene-1.10.8 | 1 
 ibm-sw-tpm2-rev183-2024-03-27 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
           python-rtoml-0.10.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/b42df0baff8d7ff7fd393a93821cf4186a0ecf0d |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9ac2a24c5f3a8ba8c0fd64095fbe9adb6c32ade5 |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a94f44ccb0fd07be89ed250cd324ec48bca3158e |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/63baa8eced0960f861649492368ec0e61412179a | ORPH
   s390x     |      python-rtoml-0.10.0       | NOK | https://autobuild.buildroot.org/results/57b387e33d191d36c5bbef142113d876ef6c3c7b |     


Gitlab CI results for 2024-12-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550709811  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550709952  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550709961  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550709976  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710016  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710068  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710085  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710086  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710113  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710141  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710187  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710209  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710222  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710246  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550710454  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711146  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711229  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711291  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711323  |      
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711330  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711377  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711392  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711399  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711431  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711437  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550711501  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712093  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712191  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712567  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712648  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712671  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712690  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712707  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712742  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712856  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712858  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712875  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550712989  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713006  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713052  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713079  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713228  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713319  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713363  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713376  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713382  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713407  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713409  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713415  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713417  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713419  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713424  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713428  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713430  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713434  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713453  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713500  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713506  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713507  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8550713513  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
