Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A5C369D9
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 03:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF1040DFD;
	Thu,  1 May 2025 03:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78gcDG7invCZ; Thu,  1 May 2025 03:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C6840D19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C6840D19;
	Thu,  1 May 2025 03:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A9AE4
 for <buildroot@buildroot.org>; Thu,  1 May 2025 03:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25A3181E40
 for <buildroot@buildroot.org>; Thu,  1 May 2025 03:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sqfbzVGeGu4 for <buildroot@buildroot.org>;
 Thu,  1 May 2025 03:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15E9181E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E9181E26
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15E9181E26
 for <buildroot@buildroot.org>; Thu,  1 May 2025 03:10:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so2970165e9.1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 20:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746069038; x=1746673838;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L2F5rfl6/HrqIdPi9xO0TQYQeX8KsdQFR0in0IDThhk=;
 b=JEIXJtEzI+2nNn5lHXwMqwvRrx2ih8/FPsrIgc9DqGtAms2IYpKVh1oGk5zA/Df5du
 rUXV0zN9GOuwBMdnKxzkB0pH4Zf9u5aqKX3duhHWeGoROqH1O3yhJcBYP8wD63FBRqzc
 MKw3oJc07oKkkAKkLvCn4q3of8QBx9ML35oCkXPnkSf44RjJ3vW5mllbpTKNa+KPbkkk
 GDRYBZVoBUYbqIynOEYOzO38JvnffW30WykMskrwK7yVMRou414VdgdicgXgMo/CQcwN
 P3VbJPZbKLsoBDQ5P7uzPdSZcWA8axp8GZam93gacn4jd2psMWa+XhSMdweRwfFz0uzF
 p6Gg==
X-Gm-Message-State: AOJu0Yx2IKr4T8bx744YMeMmEjMQf2c0yZviztnRbD38mWChrCygLkpT
 bh5YcUmjwpVbpNST2D3ZS63CY4E7YszrK2QMKe4AfCYTi1E6pLDzNs38WA==
X-Gm-Gg: ASbGncvB3JJNrHkQo0ll8rBKni5kzmlPDpo/1Cs9C4QXRQ5L0HD4eKDHYBrSr1w1eSz
 M+FzZ4gaB57xQdR84+XEgLBDR2BFRm5wn/NRlh0zGUyHd2UMLeWzgJKhfLySQd1BnXb1de9catc
 22BVQicPJ0pa92HImF88WwczWNmGvtuB6d5V6ob/Clp6MlJQvSLxBpFkN7Rwwx28U25N08HAuqM
 SkOaT6s/ENXCVON0tFO0Uzw/4vbyV3lMhtykYDnIaeRZJo2Tj53EQPJV6/8vP8TZxEBynHWbzLB
 RFKeUosyg5uesl/HcTtAyv79hISkZc1FApqLh2hJGH9pKsDhWtjMbpc=
X-Google-Smtp-Source: AGHT+IGefAlvXAxgGSzhYnQxlNItsEzEUr6LlFc2eEvjLZjS4dxP7rXd79a8R+1Tay1A+efZ4q663Q==
X-Received: by 2002:a05:600c:4f42:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-441b6ff1fb0mr7202065e9.4.1746069037888; 
 Wed, 30 Apr 2025 20:10:37 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20c3fsm43422795e9.28.2025.04.30.20.10.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 20:10:37 -0700 (PDT)
Message-ID: <6812e62d.050a0220.1f1b1.e911@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 01 May 2025 03:10:37 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746069038; x=1746673838; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=L2F5rfl6/HrqIdPi9xO0TQYQeX8KsdQFR0in0IDThhk=;
 b=AxRQHPiw6p1XXjCi7byGyvwwP8N7D5q5JbbiVfyPTY6ga56quOt9iCjGuAvCPH/0E7
 /yxiwRDtDeq/mfXMskAA5GvBoLaMkWZ+2sz5Ful/pKiLds6tNvhxwy4jF1C576T+dm+T
 C+liEi5AaY8fceYcht1aPDHuBdZ9YBrCrPmqZNref9zbbvGc+m0rojeW8X63kqzuF068
 h9gKIUIXb0JqhW+0x3tPRgEy/zsFCpg4/A91tprm8gl1RHm9IfNlX3DnfeqhUk5BokF7
 +sF+6tBBV5YAJckj+dTl9lX/5xP8Sh2lswZyEVb9ew6wa9Ii6BDksmLqNehDSCcqAKgv
 iIAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AxRQHPiw
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-30
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

Autobuild statistics for 2025-04-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  6  |  0  | 11  |
    master   | 19  | 19  |  1  | 39  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
       freeradius-server-3.2.6 | 2 
                  libjwt-3.2.0 | 2 
                elfutils-0.192 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 hddtemp-0.4.3 | 1 
               host-nodejs-src | 1 
             libargtable2-2.13 | 1 
                libesmtp-1.1.0 | 1 
                libsolv-0.7.30 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                  linux-6.13.8 | 1 
      passt-2025_02_17.a1e48a0 | 1 
php-pecl-dbus-b147624d480c3... | 1 
                python3-3.13.3 | 1 
               syslog-ng-4.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/af249f4a3b0329c37c5c7b66e6c06affce8ed29e | ORPH
  mips64el   |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/003443655700ca89ed3f1977bfb09cd4f9c24425 |     
   sh4aeb    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/a351183451d01f9b42f016350751a010a8407ebc |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6b40b49002abfb989b505ef1add7ae7010895ee8 | ORPH
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/f4e64cb04a03b002c17b00906b3bede8810ea69f |     
  sparc64    |        host-nodejs-src         | TIM | https://autobuild.buildroot.org/results/def9a5c761a31548328b8152c788a7e1a5c61fed |     
   sh4aeb    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/0566ab0508e450c3a5a5a5fbdefedd6f0a3300a4 | ORPH
    arm      |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/f625d868afc4af284e28da0a561ec09d5706e761 | ORPH
 microblaze  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/1ee140757350c2a89b8e5a05cfd45b913f6ca36c |     
    arc      |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/4b2877ce8e4cc2ae8e2c6c5e94eaece5ffa13073 |     
  mips64el   |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/e0b09949b402dc45a90cd0f73e6d3b60c0a6d416 |     
    m68k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/56ab21466112c942defa864660e6f89afcb48dc6 | ORPH
powerpc64le  |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/8132d6161511de4733f63043a210557381ca3c06 | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/636c4a60cebd2ee5e86624015aafc89e00136759 | ORPH
 aarch64_be  | php-pecl-dbus-b147624d480c3... | NOK | https://autobuild.buildroot.org/results/e9892bbefa781b403fd3d834b6c48527c8e078ba |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/b10dc1e6b88e2e6597bcc2e09d89546815543c87 |     
   s390x     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/1c7e93c30ea97fa22f08bdce7b45e0254747f72f |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/cdddafc5c991ec2b359c42f27c2f6c27b2fd4ca8 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/6ccac9063661ed0cca730a214517edd5495b5db3 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b1018b31f3d7fe80605d2ac7ca83e369949b1c92 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
                elfutils-0.192 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                   perl-5.40.1 | 1 
                 siproxd-0.8.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/29e7c16964a507efa38415e4a53aa2f0842ace92 | ORPH
microblazeel |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/519d49528d2bbbac458122c8340380a8bf80eae8 |     
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7d985b742fb5f6d66a862e797fde370a56c552e3 | ORPH
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/6df4c0d4e88450e1eb7c1ea79ef9bc309be501e9 | ORPH
powerpc64le  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/1271f088a4523b78f80f511efc0fe996bff07109 |     
    arc      |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/2ec447e8577934229002d2947bb408b1121fe384 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
