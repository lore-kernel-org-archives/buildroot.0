Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F477C43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 03:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0247981414;
	Sat, 11 Jul 2026 03:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDq-jDm2DqJc; Sat, 11 Jul 2026 03:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1EAD81416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783740275;
	bh=Rug2RfJs8UtjYlOaP753blPfIMWcpC40MSBElWPVDvY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rTJistuoFBz+RxK/nKkiG8gyY7a3OeAvM93HudsvZnLJ2GP67B0P2vnAT3q6t7J8Q
	 /yssFB1g3rPJiJDfjKB2b7ixSYhCHUFg/35xULgjzhwx/TrwAZF0IUCxP9EUwcnOtk
	 4TZQ+9RB7vQhl2mSK6npAY08aJCNMRr8xWfU3CdAVnuy/bKlQKQU2OXPx5jNmqwT3x
	 rywR7Gsina3RipFJvtHMG3SG8UlxgP7cWaq8K8PWxF+6815jKwdzbbpM34RdGqLOy9
	 NqJ02ChjfSRo4Xas80977pHTkIV9Um5l7CBFrqbTTY56FW9XZ7dj/yAJFbvTGxY2UI
	 yk6m37nZfZ6Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1EAD81416;
	Sat, 11 Jul 2026 03:24:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F019372
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 03:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34DF640411
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 03:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0Aj8cEzecoz for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 03:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB15E400C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB15E400C2
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB15E400C2
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 03:24:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-474560436c3so1286650f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783740271; x=1784345071;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GVajMau9YK1hd+wtxZhoFHh3WNlFJOU2LIVf45fAFcs=;
 b=TMtLmo/2SGpuY01XZfZ2MPQfrZZlp6p1ufF4Eg4KY2OKH5zVwV9/aWj6Ca6YheTt9D
 Y7jSn/xLwfyR0WhqGDuMK9bzc9crNro2uJfb02SL7uwfBvgNptXExg47Rxf1/1HqW01D
 jbF5D1FbVt5grDJyDndqsvm+dUxJYRrBRKgeKG78EHXBKf1VgKSwJjoK2JXNZRK1P6SN
 KQNTnXiFKQEJHg1mATfOFlnsJZ+ZJpI4Z+/sgeh4GT+tXtEtZ6esspDQe7MPmFM1XlMH
 xc901AxkWIiklIhEE1RKQtHjX0wQoHBueX/tj1Fy8lK8ZRwSmFLa7WUuVnd3SCBpJZRc
 rmVQ==
X-Gm-Message-State: AOJu0YyIS2KkRzQop2dc8iZsZ9JvklkC36PG1NTk9UgqYDFPG2ruNlY/
 4aCa4yxELf2ZCpiYMdx80toLyxU+Iohia9BZnbt7cwF+7zagGZhdMyHAGy+Jz70b
X-Gm-Gg: AfdE7cm1dzp6yNdDrKXgM8PVHuwWuXsTjSM3mR7Sipn7OPmhRjwl9IFwSv1IOPNPSOw
 BNtbplrDeLP50okdps5I5fD0z50nn//1xgcFvXrUYVbfXDRY5JrPH6yOQPezuGLLpQjwm/D032k
 jsmm4xX2WqN0vQbkg7/TlPOJQIwtxv2QBhWNSk0gB+7bLehcfJj0I29ys6OhFYxa43OMHHZyhTQ
 u/NkUaz6jUUhaL4KziN43hpKJjEkJtXJ7ZJL+y77EJ49VgxyLfEHvf5YWWoVijYuHyeKytZXFr3
 MzknEcA1FWISM+AM4i/rDskK6VBxtkycQQud+ayjca54Fay4Jbr3+Q8xc2UWSE4zHSnJIiU4MEL
 iE1NUNA13SXOrD39UqOFBXyQrZcPCc4LoPT5585WdF87ZY4tmlQcsbvyq0fV8FYLHiXWVEC4I0D
 eiOWvaNeoiuDwEcTlobMLaFk4E3w==
X-Received: by 2002:a05:6000:22c9:b0:47d:fc45:8587 with SMTP id
 ffacd0b85a97d-47f2da5c00amr1295128f8f.0.1783740270676; 
 Fri, 10 Jul 2026 20:24:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d910sm62947548f8f.6.2026.07.10.20.24.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 20:24:30 -0700 (PDT)
Message-ID: <6a51b76e.cc089686.163bc6.f4a0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 11 Jul 2026 03:24:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783740271; x=1784345071; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GVajMau9YK1hd+wtxZhoFHh3WNlFJOU2LIVf45fAFcs=;
 b=Vjm3/zGQX+5RgwHPbZbGRAJsEC9RCHci49Ut0/Pq2VCkHpf7xdMUJ7H8pPCHn1Ot23
 9V7ptSjzlua/dQrN8wEV+ZBgnFqONtSDS3s8UZep2o++wXkj4BYQvUEjPOcbJgVKEiWm
 dv7qyyVjp6PF95AfL3a1ilLhFLNZWy5mhis9KjSv4F7XLxHowQReqqoE4ugK2tbPDWSK
 UzkmNjb24fcxJhHelKB3xnZsuvjfTN+RGkUh9DyRZcwzSkizouGG4tJDYmPKWBIVvdJa
 2JoGwEWif6Up08MFinePASaTuIrQw27WykJXHAR+7eFSXZKNaYvrGJAus7D2yP5vdUAr
 w/jQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Vjm3/zGQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-10
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

Autobuild statistics for 2026-07-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  5  |  0  | 10  |
  2026.02.x  |  1  |  2  |  0  |  3  |
  2026.05.x  |  1  |  2  |  0  |  3  |
    master   | 31  | 41  |  0  | 72  |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.28 | 6 
              host-guile-3.0.9 | 3 
                   bird-2.15.1 | 2 
             alsa-lib-1.2.16.1 | 1 
        balena-engine-20.10.26 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
              execline-2.9.6.1 | 1 
                      fio-3.42 | 1 
                    fmt-12.2.0 | 1 
glibc-2.43-45-gdae425b55420... | 1 
  gobject-introspection-1.84.0 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
               host-dracut-110 | 1 
                host-lzip-1.25 | 1 
host-vboot-utils-7dfa482d6a... | 1 
                   iotools-1.8 | 1 
      libabseil-cpp-20260107.1 | 1 
               libepoxy-1.5.10 | 1 
                libgeos-3.14.1 | 1 
                libsoup3-3.6.6 | 1 
               linux-pam-1.7.2 | 1 
              luabitop-1.0.2-1 | 1 
                   perl-5.42.2 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
        riemann-c-client-2.2.2 | 1 
         s6-linux-init-1.1.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
       sp-oops-extract-0.0.7-1 | 1 
           uboot-tools-2026.04 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/fd9e6a6f9e2d37df3cfc1ed36707aef9a338f24d |     
  riscv64    |     balena-engine-20.10.26     | NOK | https://autobuild.buildroot.org/results/1ba6d19ef4d019b247c401c571e7b30940a36da6 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8aaa629e29b3bdef18516448e43a90a3ec37ee2e |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c310d797458fb3a4df3365f417139f376a844c63 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/ebaba76c05ae317008505ef39679ae9f239acccf |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/47afb796790f95f59a103c7b6076e83ba1303e1d |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/0e392e807dd8dda64585542bf0572f586b41f662 | ORPH
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/32d0bc696ee07f9384ca4d567a4b7342e5587399 |     
powerpc64le  |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/1bf366a923749a54b9284c469285ab74fdac979d |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/55ebbb9da027c1972871a1512e8ba77537ba9040 |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/cf0cf65ffffdb582846d0733a66ab01e0f7b7081 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7dd6c30c38398b7941193e6665810cce6fd83877 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/d940741e90ca30b2ac1332c33d46ee522bb4b313 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b4c831f421eb170afd26f88d5dfdbfc3ac19a2f6 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/31b9d560a357b099a39dac5beb80393f61f88c5b |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/bc76696d311364eec57f34ff9d29208ec086f1c4 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9bbf12a22a2868d738c6d7eafa7a3a761be3dff1 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3104e12c2b2579c69923f26b1bcadc013647f1e6 |     
    i586     |         host-lzip-1.25         | NOK | https://autobuild.buildroot.org/results/2e94c231de6f7c532bc55536a4c887f33eee57ff | ORPH
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/9db08c77b7150bb1e6a19720c2221b8ae94ff45e |     
  riscv64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3d81b9de62e507b0cd91609285391ed25df7fcf3 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/6a5254616c3aa28be2aad7fc3899d5b8a5de884c |     
  aarch64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7124e92d73d86c862937a9360c0bf992816c2e17 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/b8ef874b2672ce222c14aa26c73f2aa9fbe94b7c |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/43c5cbff978e9b9b978766be2e620002e228c736 |     
    i586     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/122d23e499b52c0c2cbc28367bb69a6cab6dc519 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/b1836e8f235a01f13f0d8cf594bce54b212809ff |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ede4878523420cd8367b0868ae63b932c5285513 |     
    i586     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/42b91e405fb767a83b742c1fe2842a7dd71c777d |     
    or1k     |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/55b82090455b770a667b3e0f3b65f8c704c82f94 |     
  mips64el   |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/82dc5b09862418853e8f7809e4002787795dd7a6 |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3cdc349a4820cb1e6e444fcaed62445958bb678b | ORPH
    i686     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/e6b9385130dd046295b07012d917fbf883316772 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6390af193294b5e940653d9d73fdc24d018dd9af |     
   x86_64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/647d2170268e3d579ef5116da42bf88f437c34b2 |     
    i686     |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/362241ad5822a69b7d13c9afd27eec1b775bde79 | ORPH
    i586     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/b8e489a6f4a0221d6c8c9291a15a3052f49466f7 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/5af298b76121f727b8625c40aad418d56858f12a |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/5f4d5e19d010bcb2eb7eebb7f97b7b73af7974e5 |     
  riscv64    |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/bb11fb5add6a2270a6d8d5cfafeebfa0ce46acfc | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b26d4236b842267048ec5ebe41c8dd7cf290d3d7 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

          linux-5.10.254-cip72 | 1 
                     mtd-2.3.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/dba064b33e31780726533fe19bbbe1ac09a8b373 | ORPH
   x86_64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/0f98ecdf6da7198c28fa06dcedfe7779959b12be |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                openntpd-6.8p1 | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bd234d4ac45b26f59340c0e4ff8714c1d4c9f873 | ORPH
    sh4a     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/7070c9d0bc8de38aa37cfe47c8b9e86e15c307ad |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                  libva-2.22.0 | 1 
              luabitop-1.0.2-1 | 1 
                    sslh-2.0.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/1fde181e2af01051b3c4b82be0d9026702f082ad |     
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/974a2ff66aa87539252c334dfa9d292cd77e22c8 |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/20006eb564b07d7c66405b5616dc6e5ce783e56a |     
  powerpc    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/9a46a994cc7197e021e265f4fccf7f87f2f5cdcf |     
    i686     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/8d3a1a6071a3cf6202acddf36ce4dfbec0992dfd | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
