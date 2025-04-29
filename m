Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8E0C369D5
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 03:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB9A6076D;
	Tue, 29 Apr 2025 03:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKqym6GWW7eK; Tue, 29 Apr 2025 03:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 304EC60C16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 304EC60C16;
	Tue, 29 Apr 2025 03:09:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 847951C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 03:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76AB4403E8
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 03:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mag3_u52RnwX for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 03:09:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4438A4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4438A4011D
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4438A4011D
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 03:09:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so5508091f8f.2
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745896175; x=1746500975;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xH0GYvV+IA3WyPf6nImAnIp7TcVdEs677FnNa9llTL4=;
 b=vrU5LqnswuocmFkx5qN4lVDfChLXowobWPqnamwwdKtbjQGVnLQlgt3WYi0IuJmdj6
 +dmMEG7owlGNgIEs00WI+2i73VEYXTFCs2OEB17r/buibkaJC9FB89jHdovUKInCleYA
 USkAjXpG1XtnNR5v643qpOvboqaNn5klYu+RBt9aSAXOrNADbCZzlv4CVuN+j0OqG71a
 R40cLwIr+emMEnSDjCBBxQ8Uzo996UWOQnblNjp3UEvzHE4K7kMbzPQI6ulAwOireyCf
 PEt0KbAZbnpFhV+IfFu/sT02vO2uFraJUsltaP9BwXkiD3HrdG1dhWhnzEeM9awn6Zxn
 XSvw==
X-Gm-Message-State: AOJu0YwvLn3F8GOMH/kUsSupCrE97NLb3DvtF0dOuYrmLKkc6VNoonwE
 x3ULnfkamw1+lK5kbGk4PNNK57DiCJPpTJQN1CJtHcyr/6BdRjQSRrSIVw==
X-Gm-Gg: ASbGncvchP0Q7tqufiKujZKvnxrpK1Qm5ZUFa17bMmS7qYPFMDqd78C+gpEikfHuD2W
 fXIdefNa22PJde6XVF4mJq5FYMcJHiEv4ro80VoIUCInXUhxELIRRO+PXadeWUF6nbOz1FQ2pCx
 WrkT5O8/sVpIYUCQ4U4qvGW0fPw+VS0u5+uzly5oAbAUT6hPvr6+NzuJ0+1U+gKMVOzlI1NEUry
 o9q5uLwFhHfSQA6B7AKv1wKOx7C67Ya16+Fv7B1NTjQLOyknTBq8y6c3I97o7EShto1wegC99mq
 L2MSuMzoxDtu26lF/2GS4M5I2wdZLlSLUD0CaCYwon3w
X-Google-Smtp-Source: AGHT+IH3lVFzAzmqMcA+fHQZzJQC1JP7GCiF8Y07pGu0xvKcTasz6aAynEJg/V+yak5+RWqpNXf7TA==
X-Received: by 2002:adf:fc4b:0:b0:39c:13fd:e2fa with SMTP id
 ffacd0b85a97d-3a07aa6fd22mr5785977f8f.28.1745896175147; 
 Mon, 28 Apr 2025 20:09:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8cd7fsm12653813f8f.1.2025.04.28.20.09.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 20:09:34 -0700 (PDT)
Message-ID: <681042ee.df0a0220.22191a.821e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 29 Apr 2025 03:09:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745896175; x=1746500975; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xH0GYvV+IA3WyPf6nImAnIp7TcVdEs677FnNa9llTL4=;
 b=RenofGlNlaZQ70iibZpCwZcthDE/Uo8DFAAY7B3fY5lWD488PkXoA+5qdJShKoGXBd
 NlCk5kre/Fw2KE6mSWRpP3ufvn7P5AqJVIGCFhBaTXH3y+xJmONzCn2jQgf/0yEI9Z8u
 sy1cWlhh6M/9o4JEnxF6H8u5AhTVX1Xxg0iHwijjjCC9ows6wz0O2GdsuDBP4wlq9Mfl
 QK0uU5/QvHxDNvRKxO3wNYhYOLKKDIT5C1py5/UqbOlz4sbe3a5H44Xzk13RoMSkwTJz
 LjyQqXd/mGl4EL1e0AyeMn3sqsxuu+0XG/01e2rI0tRNCPewLGSzghW6XJ50Dz5LTAM6
 4Q4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RenofGlN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-28
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

Autobuild statistics for 2025-04-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  2  |  0  |  5  |
    master   | 19  | 18  |  1  | 38  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
      passt-2025_02_17.a1e48a0 | 2 
              asterisk-20.11.1 | 1 
                 gerbera-2.4.1 | 1 
         gobject-introspection | 1 
                 hddtemp-0.4.3 | 1 
                   iotools-1.8 | 1 
                   iperf3-3.18 | 1 
        liblog4c-localtime-1.0 | 1 
                  linux-6.13.8 | 1 
        ltp-testsuite-20250130 | 1 
                    mpir-3.0.0 | 1 
                openvpn-2.6.14 | 1 
               pulseaudio-17.0 | 1 
            qbee-agent-2024.36 | 1 
                 siproxd-0.8.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/a51e1e8303d2198474dc3d343d8a8fbf17a186d3 |     
 aarch64_be  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/ec316676abba508ae40dc468a2def5bb3643f515 |     
   s390x     |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/e6c74334936079938ce8df830fdf816f6f48c903 |     
    sh4a     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/09b4949b008e2c739a3f22e32e94a1ebce9497a6 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/597227262dd8c9dd268de55e2a9d52d76c500995 |     
    or1k     |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/3212998ec7809bb17aafdec5d6c79e00e6747707 | ORPH
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/02010beff362c229aaa9e4c8926f004248cb81ca |     
 powerpc64   |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/1eaa99400dc87aaa24e33094de5ea8a0eec3cc8e | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/c44e9c7fa5337a3da15ddd52780f3b1c2734828a |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f0c462b4dc5d17c1d61301ba8719ba98bd58e87f |     
microblazeel |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/253fc8536b0f93d8950d6ab1d353706bb58864f0 |     
    i686     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/031ae6229750d0188e4e4b97a5beaccf7e1ab73d | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/727c1c56697dfd5f2b8bbb3b6370d2a1a0b84991 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bdb57de1bdd0d7dc67a14c91715bf54c97405f7c | ORPH
  riscv64    |       qbee-agent-2024.36       | NOK | https://autobuild.buildroot.org/results/dd3be367bf417b826a2fe9b8924c34c82478e69c |     
 aarch64_be  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/f44e18f7ca572e4ad050fc7dcae64312079068f2 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/623345712b03c5124ba4400c0f61492e209c313d |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/c12f2cd59038ef3cfba5338b310fefb8fd47d302 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/350869d50f2019ef63b756d1e6e084e06d6f1f69 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                  dlib-19.24.6 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4bbe49f61513ab2d5d9654219b1ad76731268249 | ORPH
microblazeel |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/397ea4a81a17ee880b76ba4cbd79b4ae3608451b |     


Gitlab CI results for 2025-04-28
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366743  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366727  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366721  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366714  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366713  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366712  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366708  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366679  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366626  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366599  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366522  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366513  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366500  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366498  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366446  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366441  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366399  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366335  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366104  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843366101  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365833  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365828  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365822  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365815  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365811  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365807  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365798  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365793  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365788  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365779  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365774  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365767  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365761  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365752  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365749  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365735  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365728  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365724  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365717  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365710  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365702  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365692  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365679  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365671  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365660  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365648  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365641  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365614  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365422  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365411  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365401  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365384  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9843365224  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
