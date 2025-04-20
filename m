Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C8AC369CB
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 03:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40FAC4062B;
	Sun, 20 Apr 2025 03:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pK-ugDKOKygR; Sun, 20 Apr 2025 03:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E04A40635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E04A40635;
	Sun, 20 Apr 2025 03:20:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EB4322F
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 03:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6032460891
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 03:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5b3SOArbDoQp for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 03:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41CBF607FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CBF607FE
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41CBF607FE
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 03:20:20 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so455800566b.0
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745119218; x=1745724018;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKg9CbV9t9mK604TAnnNAr/aalbngVNc5qVACAxNrTQ=;
 b=ZEocJynGIgdLzCW6plxuR2rq15fKUW2rrpc/DahRFhcL1MTUamm8PxixFmQ7AQnHsH
 gFIMctT4OzrkpGyckLb9JDhqNs1DBKPfqwyFUxm8GOkyR1bP32vjMu71sUXUPmRRVogy
 5qxyBaRvixwy5d70HyxlzJ+s1ksx+hUnFu61KXhWZaZSJz+htP70QapbKoMaZDtLi1WR
 ufkaxfmlcj1EHV1LGky+i/2d5epTSls7X1UDQVRszetJpY3avq/wtb80JMJawQOL/3Ft
 Umwicf0E5bbyIJAnO3WtoEW+TBR2g59suIj6QADNu5lI3pYABGgZ8pOButiYWDusAttV
 Ts8w==
X-Gm-Message-State: AOJu0YxMJpT+t7wjpH5J7f9KSdJHZZIoGEotd00leC2RqLefSVjJHP+j
 gVH3/F5TYKnJicWc1XtXXbDwEhrMvqhO2sL/+05Oj8ygKxMEL4B4uHL+qw==
X-Gm-Gg: ASbGncvjcjqiBYmuuCTueMTnb6FoVrQRD6NdGlL/Ceu23oMjLh8ByrTjzGKcw883X8U
 5JgSROv9+l7TnAaMIooYO3nVmhwdaFcaPyB+HCPAfsRoxbMGDzJdfygKpOE0v0INlqe+jB5vBL5
 pyMAQ5zcR1lh6RaowrnSt+PvUxouQvsgQF9SkU1dfY515c4Sn6K1Ob8x30bTbJAq8cPgvAOfnsc
 2OIG6j6CNRVBmUP30a9/bj+sHd+B8Jr+RiqdxNzgjSYebyL+n1De3VEviL85GfqY7BI7wDqLOhC
 g+7kl/WieBNttgiYDQxvIMRWrM25Wr/uQFZeZ8sn4AMO
X-Google-Smtp-Source: AGHT+IEwLb4qFLZtbk6+DLfK1wYpuDsdA2HXT6V8qnuW4HvrCU8VHXXux5R3MgP15pG7TNDuVj/3EA==
X-Received: by 2002:a17:907:8688:b0:acb:4de7:14d8 with SMTP id
 a640c23a62f3a-acb74b2e913mr706402366b.14.1745119218013; 
 Sat, 19 Apr 2025 20:20:18 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec0b71dsm342167766b.37.2025.04.19.20.20.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Apr 2025 20:20:17 -0700 (PDT)
Message-ID: <680467f1.170a0220.4e872.977e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 20 Apr 2025 03:20:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745119218; x=1745724018; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=wKg9CbV9t9mK604TAnnNAr/aalbngVNc5qVACAxNrTQ=;
 b=lx+F2FtalXsvE3j9YbsqaMKaFahYnzhLTPxMiaHvY52kN5Vaq37i464hzqhtm5NxTi
 yijqIu4qCM8w8atVOvPJZiTXQEiBvB6VgnQn5RHAT2JVvN86UdNOFLJTbCSNz9JjXkqJ
 8N7Mw6NYvh0bR9t44//txtSIer9mvnEHMiUkCDl3D9sAs0nS34Gs5XOqROn+yJblHDVO
 mD202g6AhFJEvuEHuX3NCapH8HDqR8YFT96HQJvYWyxL3GZZbqxwc23XhVKZKUUtTnrB
 n1lbh2oqHo1vWsjqS4K+M89PvyyuAqq/Kmupdo7WAyPrLDJz0VeKRG0vN2hbCNdAUAMx
 0QuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lx+F2Fta
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-19
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

Autobuild statistics for 2025-04-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  0  |  0  |  3  |
  2024.11.x  |  2  |  4  |  0  |  6  |
  2025.02.x  |  2  |  5  |  0  |  7  |
    master   |  7  | 13  |  1  | 21  |

Classification of failures by reason for master
-----------------------------------------------

                  bcusdk-0.0.5 | 1 
               catatonit-0.2.1 | 1 
                cifs-utils-7.3 | 1 
                   crun-1.18.2 | 1 
                elfutils-0.192 | 1 
             fluent-bit-3.2.10 | 1 
             libargtable2-2.13 | 1 
                  liburing-2.6 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
                     open62541 | 1 
                python3-3.13.3 | 1 
                       unknown | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1e650422e533a799c4e61f3a538196b0b55e20b0 |     
  riscv32    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/2421aa28c249f943c0eddd64690a03b02505d929 |     
    or1k     |         cifs-utils-7.3         | NOK | https://autobuild.buildroot.org/results/1ce424caaebfec9b8000eb194f2e2ae653e15dac |     
   sh4aeb    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/560a4ed8cd5d1b00929bbcabfba8ebe7a3364fc3 |     
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7822f0a40487c651adc08c6f466485705921848d | ORPH
microblazeel |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/19f8bb89f4cc374bfa69f05a278eed063a5e8925 |     
 aarch64_be  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/8b43e3f25f7adc107854b632fdb8598a46267255 | ORPH
   sparc     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/29f67066119f547645195204dbe2394eb9d82664 |     
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/18a157db08ae4b07d72f93cdb8fb3ee5fc71eda9 | ORPH
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/d5c51a28c6b755e3852fd4f5b281b477d41fb528 |     
    m68k     |           open62541            | TIM | https://autobuild.buildroot.org/results/2550c8c37872ede71ac98e9472dd36dabba93ed8 |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/9b3da118511bff8760dd42df98beea04f4a57a96 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/bfcadd2d883156e0cc985489b076c1772a9e2431 |     
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/13556ed6d35dde81bae06f422f78a8078dd984ba | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 
                 linux-6.11.11 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.28 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/04a1078717334cd283abf71612efee2ebab39b63 | ORPH
  sparc64    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/fa0f406460af264a4609c800a7c95ad1a1d1a4bd | ORPH
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/65c94746a8d622546e2bd60e9811c6b745db50a5 |     
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/340853f841bb577d7b93ca358adf971656962a0e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               libsigrok-0.5.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
   python-pydantic-core-2.27.2 | 1 
                 sudo-1.9.15p5 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/67c754ed7ccf8c40fbb3039ed734b44d4bf70f72 | ORPH
   sparc     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ab7d0e0e175a1d160d7ace2603a8506188573f1b | ORPH
  aarch64    |  python-pydantic-core-2.27.2   | NOK | https://autobuild.buildroot.org/results/a1a6b5bee6ab3d73a85c1b79078db6a0e714d178 |     
    arc      |         sudo-1.9.15p5          | NOK | https://autobuild.buildroot.org/results/9cc453dc01a28d4aba25c4cfac227e321354bd1b | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/319ff50ce841f5c9470ea41666e8e844f184be74 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
