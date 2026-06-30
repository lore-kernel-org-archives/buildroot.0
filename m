Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9520BC43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 03:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1AE80ADC;
	Tue, 30 Jun 2026 03:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HpnjREXHn8I; Tue, 30 Jun 2026 03:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A08280A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782789999;
	bh=aFvHWm0yRpR4mEJpAPW9xBb31Qvx4kMBn2GyGJO1R8Y=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JWbyo2+5WEjiz9NaaEHmur1ZsMEgqs+kuRxoaropI5HawFvvnXYSaYEXx/PLSEu04
	 jdVhSJRJmnSC8nPInRzZvjyTumNrEz8nwgRSO6RoUZ8+FD9/VnZ5mstO9S76fNgZyP
	 G8IKmo6EaBhjCr3CfeBn9scH/sCpIDVrnqOza4GLv0O7aMlIr3Na9Y17dzOgC7IpGx
	 YiONX6NP58g4xEWDsnc7TMVjihmexFBqzENwP4ZMDSzwu7JA7T/Kad9XVzGNKGyOL1
	 z5tS1XIqeu2vMK/fUfjdNjanVdxOrbSfGMHO0dZeFRdtZKjb3rpRTxeijop810IXrL
	 DVtapAvwgL6fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A08280A5A;
	Tue, 30 Jun 2026 03:26:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C02D8149
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD44C6080A
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpU-PZiMDx0Q for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 03:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 873BE607E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873BE607E7
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 873BE607E7
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:26:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-475417f010dso295453f8f.2
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782789994; x=1783394794;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yx7TXJVCFmc9quSfG2XWx6qr3rlLidx6OJIWPxu3L2k=;
 b=LXh51DFgZnTb4EIKbTFj+4RWg+2sSVzMbTVhtNhvRUUxC8RtkqoWBHa44A+nLhzKel
 035Ml+/rAPx8cRep4AA3tY+95jdqXAKx3RM+9bOhFWK/0ITN4I9jlfG+bx96+KNXCu75
 raSB8GawmVAM0vTP0klJyGmEWHmFaT0Mx2W5JkAmTjOFyWXg/DNqf/jGuI2tgg306Hw4
 CkRjSTPs3tgp/uz1WELiY8HD6ptoSk3lLilJhrZztINVO1/pzktZh+x/ePiUvgyY8GLp
 OTa2P1HbvV0ov8ubkh5NSLODpW2qE+6cqV83QC8cIL6LaWcl3u1PRtZe1Ex1f/4QqqG0
 KHrA==
X-Gm-Message-State: AOJu0Yz02ACiZadAGPhKD/YmvfcYgn8u081ENjsnOlCYkCL1Fdijw9Iq
 GAyoJdecb18TKYvsOaX+5CSDciufsNjEX/wfyFKuzsitNCGGBA8VN59D9yx2/GVU
X-Gm-Gg: AfdE7cntmF4D+aTs1cazQe9xt3b4RmVmNd6xb70r+yUfMj0M3Juqs9D3l6yrHF5xiZB
 bATvMP0odZdmzWoeR3lHr+9HXEA9PQznfTYs2WJKmsesivAA0EuWR1F6lplwak8DsUYZNCkkYbK
 CyWQJSi4mGueLM/91MuMa0vScGH1dei6nR/vgUMzC8ZQnXmmrXhqBSUCThtsgGVPZ5MwTDqWeTW
 q6W9x+9e7gC5mcR8OXX4VDmJXkjjqO/Zw9L+WMysK3qHop5Nkds6N01e23KRBlquzA+ZMjRIMRG
 IMXve7bb9HbBWEwe8enULqiKF5wbS1SmVDFj/rtkZyZkHHJpGlhFCKeRa4FRwBljOoiEx/1AiGK
 C1pxWXGad8nMDzUf9tQxo4jL88aLNTn4eSJui74k0D3tsH8EE5P2sZ3eYJY4jOKI/9AJaeXYiSb
 pBbufyroI7BVSvpNQ=
X-Received: by 2002:a05:6000:27c9:20b0:473:53b7:e390 with SMTP id
 ffacd0b85a97d-47550caaff3mr1587806f8f.11.1782789994272; 
 Mon, 29 Jun 2026 20:26:34 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475671d02f5sm3878837f8f.28.2026.06.29.20.26.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 20:26:33 -0700 (PDT)
Message-ID: <6a433769.795e137c.53c1e.45f8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 30 Jun 2026 03:26:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782789994; x=1783394794; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Yx7TXJVCFmc9quSfG2XWx6qr3rlLidx6OJIWPxu3L2k=;
 b=GMQkB0vztfALjOCRuDyGEqbXb//u1GV0D8KHN+IPV8F4H81NaL3XuYhcUTmIYSM8FR
 Rju3BVAi3VY7KrXWZl2OEAEl+Br5h0oWZ/HpHP2SvMVUmqXGq+ti9grbZcYusAigqd0m
 mk75HSzyZptUI40UAatvCg/Qzv56jDV7/5rCCyDoMcasTU8YGxqAuNGcd7O2Uk/h+lQL
 Qega+rkKpjVU67MvwR/v3OFMSdJ0qxnzryKG/ZWIABQvvoboOiLlWTs0/1vsQpvvgnVH
 TQHOoObyt3F6gzY6IZkpWhvJQ+rL7YYlZSpLPc3PMjZwwwtN8YEcUBd+nz/joT9d/mM3
 1sDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GMQkB0vz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-29
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

Autobuild statistics for 2026-06-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
  2026.02.x  |  1  |  2  |  0  |  3  |
  2026.05.x  |  0  |  1  |  0  |  1  |
    master   | 16  | 44  |  0  | 60  |

Classification of failures by reason for master
-----------------------------------------------

        edk2-edk2-stable202602 | 4 
       host-gcc-initial-15.3.0 | 3 
              host-pahole-1.28 | 3 
                       unknown | 3 
          host-intltool-0.51.0 | 2 
        ltp-testsuite-20260529 | 2 
                   perl-5.42.2 | 2 
                   bird-2.15.1 | 1 
             dahdi-linux-3.3.0 | 1 
  distribution-registry-v3.0.0 | 1 
             docker-cli-28.3.3 | 1 
                 gnupg2-2.5.20 | 1 
  gobject-introspection-1.84.0 | 1 
                    grub2-2.14 | 1 
                haveged-1.9.21 | 1 
    host-mender-artifact-4.2.0 | 1 
host-vboot-utils-7dfa482d6a... | 1 
               libepoxy-1.5.10 | 1 
            libnetconf2-3.7.10 | 1 
              libopenssl-3.6.3 | 1 
                   linux-7.1.2 | 1 
               linux-pam-1.7.2 | 1 
                 octave-11.1.0 | 1 
                    olsr-0.9.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
                  prboom-2.5.0 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
                s6-dns-2.4.0.0 | 1 
         s6-networking-2.7.0.4 | 1 
               tcf-agent-1.8.0 | 1 
             util-linux-2.41.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/89bf874c819eaaaadd112da96818d6c1c99ad72e |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/be69427ca131e1aa8d86f4a94690b5ae1370f302 | ORPH
    i586     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/feba4f7ddd6972d9bcaa14fa124b1ecd9461026c | ORPH
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/e43c1c3e0f36b8eb6fddd1953d44bf029c35b87f |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f5af0a5ece53385e95c89a45dbfe960da275ae1a |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/a8dbf5607d3ca5fda721e4da4486675d7173182b |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/cd299df7b2a4fe1b8d3b8130c0a8237f2f170fb7 |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/fb33d9452b4c91ac2e516807650dde001269d823 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/f550e147ef9165ca405eb41ec21716638a8b141d |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ccec944646e8829d1d53f7d541a8d238328d3172 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/87c239bc8a94510f72054eedd7d7845c4af8ad31 |     
   x86_64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/205412bbf6d5d67fb37e11ac880c3b5088257f3f |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/0fa23a3c233804f88a4b75446d99f32dc8b053b8 |     
powerpc64le  |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/501e54eaa9d978ef7231d1e295dcd93a230e7ed1 |     
   x86_64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/71c37a084667bb4c4fa6c6cd3a1906584db3c0f0 |     
    i686     |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/7581277ede60b6652dc91f84eba6d7c2db96d2ca |     
    i686     |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/0b38d481deef87c35653d0919db961613203e870 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/7240a752e28bac5eeb9504de7afc37d2b2e8b4a8 |     
powerpc64le  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/225ae37b5de36dd0d0ddca3c4e55a29f08817f4c |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/e2c64d0635caa3d4a9a29a155d47ddfcccabc5f6 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/02d77076a7a60e1469c1c1e3c72dd9dadbfbb7e7 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/b9a617c9cd27bcd8a36abdc9511014b0a02a19bd |     
   armeb     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/4a910161874fa66e36a5723ac37b442d947bf40f |     
  aarch64    |       libnetconf2-3.7.10       | NOK | https://autobuild.buildroot.org/results/70a4e100ccc6a1f6691908b5d8f6d95d5b5179e2 |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/372f7523f2a6f66766101db592d866c92f11bada | ORPH
    i686     |          linux-7.1.2           | NOK | https://autobuild.buildroot.org/results/e65acb27f3660925db3a822ce7afb4d2f74d7e94 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e926458aa702c46aa606447854fb498fb39a59f5 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/feef6292b56a748262e94a3115bddecda3942c41 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/210b9c84fe3c8ddeaa0bdbd0b9109d72457747f5 |     
powerpc64le  |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/29988d235431aa1fb21766ca18fbb1f8b7224358 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7845a84c7ee9059c6681c523d7601482c334effc | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/539dd6c67608b795ddbb24a1b88d2b49933275b8 |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/99a1a98014e3a73bbebd1b39d82104bfb3befd99 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/42b447153ee4d54057046c71d9723a16c5216096 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/7f59926ccd1c0774145017f435a3830cfc4cbdab | ORPH
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/7fb5a030d532a424a73e8ae90949795e80106083 |     
    i686     | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/1527b1652b679357e942c660914055e85099e4e2 |     
    i686     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/b510057d72d7d2b3f5acbc1b7d39eaeac2cab285 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/1c0ec5991f4f5634f7b38f20a908e243d922f0d8 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f1e4cb77f230939044f5afe7fe8d9a27f55fbf21 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c7c2c28222d99cb1165b1a2ddf054d6d61e1b0e3 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/537bb09dca7fcac8a55900df7159e351a31cafab |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/95fbd09759f984f6f567fae13286b8f6fb9c3505 |     
  riscv64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/c67202695839dadf1b70f1b74195cfd2a7598b34 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            python-iwlib-1.7.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/8f23fe28ba0a4ad93260382fddfbc29f23b4dbde |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   bird-2.15.1 | 1 
  gobject-introspection-1.84.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/63797a4f6894471bdb5abc36aea65b442b616f36 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/687552fb269a3f9ddfc703746a3eb67278b7eed0 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
          cloudflared-2025.1.0 | 1 
           crucible-2023.11.02 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/08faca5ab17a6fd25b6dce658245652942a2fea3 |     
    i686     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/c88e77c1df168e2013f57446034e143c4540b1ec |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/66660cc71836ddedaf72033fc36a51f42035e2ac |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/719b309032b41414941794f8acd48bfaff87f415 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/283ad4095bfe8c21f2dd4440348505291684037c |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b58a08d969e727d07e0410a75aab3c663cafb188 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
