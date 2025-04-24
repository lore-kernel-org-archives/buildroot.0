Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B17CC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 03:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54E9F60794;
	Thu, 24 Apr 2025 03:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3dgmovVt0wv; Thu, 24 Apr 2025 03:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6496460782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6496460782;
	Thu, 24 Apr 2025 03:19:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D2601BC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 03:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 420EE40254
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 03:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIBnVcTd-fyV for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 03:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47DD14021A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47DD14021A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47DD14021A
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 03:19:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ee623fe64so428205f8f.1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 20:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745464754; x=1746069554;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aWrhOZQu8jxXIaQRmcZpkbSWyiMOaokZ731vv0g3EJQ=;
 b=W2l/T+ye/jT27Ig6eB4JJEITBGBsWGz5km81UL0LXH7E/xVOHhqYk3KpFLClK0n5SN
 LyuZPr5f+oQ4KTzwL/vmJ5n1Mk4g8CpwYHuAa3h+g/FbKuZtxQIznWm6uBr7JpTSCLwf
 jyZ5fjqwCitlS3vViVerQMzWjm2qs7R4QXHoH1MfCDsCRJ06883N4ocI4zgX7BmqIM9R
 psfC3lZul58iDySCTDNGFqWOhaF3tNSdT5StwNJ+9zx2ExvSUjMpwuI+p9BdtzV3LPES
 twr0vx86SJGgvIda1j8tVw1/TKWQkXrXaiGuH9B+OMtSJkcF7KnhZsaDQiteYan99Qjd
 0cxg==
X-Gm-Message-State: AOJu0YxRHCzYas9T9aH6aNJEfakjJInsUiKfnpFrUrQiFpY8IkQpk6uC
 0ouaG6ccoOK3yoGvBGgpbaZT0D+N5CtuJh1MVi7zHr5Adpjl98ymh50kbg==
X-Gm-Gg: ASbGnctqr9yHLX8gVJ0PiV/zpJ8Ra8oaNcFs+JMER7a6ps806M6MyA/vXAXdKLAwf+G
 yfwN7MZmQVizjXmvl1dUT2Gb+/iU6dQKOnjCYO4RkOjVX2UWdCUJ+Ob6qzIlbEAfwwk6Hh4vQEr
 OeDEcujYLU4JPqoXUPmKIG859/chK20+M+DQIUoUdbufxADzqxI2Qp+/wB+qEnnY+vIXMOX0byl
 WzyYxIIV+dTIO/kpHsAhliePbikGhwI8lqNoZ586pQoj/j3cT1LNmofCXUG0WwzMa68xMD6ql8h
 kRlrnMcqd8mDv6ou2j2c7ccUMs4hWfNencni+GI6spAs
X-Google-Smtp-Source: AGHT+IEXvz6kdw2Ci7sdzvaZQEFehct5D4Z2edm2Vq3/HEb1zuPbNZEdQBvnJCGu61aNCBs8cKqYQA==
X-Received: by 2002:a5d:588f:0:b0:38f:6287:6474 with SMTP id
 ffacd0b85a97d-3a06cf596b4mr547149f8f.15.1745464754295; 
 Wed, 23 Apr 2025 20:19:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4a80e5sm597231f8f.6.2025.04.23.20.19.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 20:19:14 -0700 (PDT)
Message-ID: <6809adb2.050a0220.3ba28f.1354@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 24 Apr 2025 03:19:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745464754; x=1746069554; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aWrhOZQu8jxXIaQRmcZpkbSWyiMOaokZ731vv0g3EJQ=;
 b=RgkWEI93OSbtvNKiK4igLkZsrspiRBdB8y85hUAr0/49B8Onov3DfvIWisjkcaUSJV
 /3ikw8L89zsyqEiZnUIoF4Y68WzMootiws/pa0sLQYvpsv6ky8Jba/zdZ6NeW3TECBTu
 eiGh2gtrUTYV+1Ld5k3RkI/j8CVzxjUtWarm+MgwGKM+ECIzGDSqgc27jixZE6Af8tB5
 DcbMxvAULHg+fW+GTs52/nsNYERruPakHXgfwk6L8EVatnVIThSBilHAhi9Tw4rpB8Jf
 V2E8wfItUMxCfhtQj9ZmT3V/t77IH4pfjJN8NI5GnID08Mq76LZT24mFUUrlYfKNgs36
 6GvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RgkWEI93
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-23
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

Autobuild statistics for 2025-04-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  5  |  0  |  8  |
    master   | 10  | 17  |  0  | 27  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.13.8 | 2 
  binutils-arc-2023.09-release | 1 
               catatonit-0.2.1 | 1 
                 dc3dd-7.2.641 | 1 
                  evilwm-1.4.3 | 1 
  gobject-introspection-1.82.0 | 1 
                   host-go-src | 1 
              libcamera-v0.5.0 | 1 
                  libjwt-3.2.0 | 1 
                  libva-2.22.0 | 1 
                  musepack-475 | 1 
            netstat-nat-1.4.10 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               syslog-ng-4.8.1 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/610ec2e516cbb3c0e409f6e1ef7e186ccd318a9f |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/ff05b49748c01d235abdab45c3f084005b3d4249 |     
  mips64el   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/3f41455f42b0743d7fb4f23a749731084f7387ae | ORPH
    or1k     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/dc5ad6e0a9661e1c09a82fdc0c20f53d83f455fb |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/14dcb40b3472cae2d25caf08c72b967e9d7a880b | ORPH
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/104d937748368eeecbd12c50396bd541e2fbc764 |     
    or1k     |        libcamera-v0.5.0        | NOK | https://autobuild.buildroot.org/results/6b7fa8ce934ad0d8bfabfb41bac494931291378f |     
   x86_64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/86c1aad089dfb44c9cdca77e4654bf719e74d007 |     
   sh4eb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/00258b8b408ea6374374cef3a7d33c1d1a21d9b4 |     
    sh4a     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/98f51b7ad70e661a276d5d37a7587f37f2d5a8eb | ORPH
    i686     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/f88bbc271ab1727a2f8a4d4d5690994491c7ccac | ORPH
    i686     |          musepack-475          | NOK | https://autobuild.buildroot.org/results/cfba6ed71c1be8b1396cd26621b97e1eed81f39b | ORPH
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/01537eec669ef07e5c62c618171f65cb2216d070 | ORPH
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2f0f269911b535fc41da27d1308eab663c1c58a6 |     
  powerpc    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/7511c2dc9b40abfbab70fb5de49598ef48401bbc |     
 microblaze  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/dd2b1dedbd92280dac01ae4d6454ef7eb08cc539 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/2dc023ec3459742733273e07895b620d67350b83 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libesmtp-1.1.0 | 1 
                 linux-6.12.20 | 1 
                  ntp-4.2.8p18 | 1 
   python-pydantic-core-2.27.2 | 1 
                setserial-2.17 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/12dee30e4dd2c99c049b47eea60550ae232aa160 | ORPH
   armeb     |         linux-6.12.20          | NOK | https://autobuild.buildroot.org/results/723b53848f6aeac92385d7d5769be4f70e9b1e0d | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e06f338197184d4ab7d72e99e11bc38b4ccb3ac6 |     
powerpc64le  |  python-pydantic-core-2.27.2   | NOK | https://autobuild.buildroot.org/results/4856eef68de42aa384e3cf70d296964bef69c029 |     
   mips64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/7961a540d8321978abcab51acf1d8eaf998ded20 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
