Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E186CD98F6
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 03:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB9E58053B;
	Sat, 20 Jun 2026 03:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhAXuLtwOVHv; Sat, 20 Jun 2026 03:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FED86168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781925857;
	bh=L03dF0M3KBlI9/JjTdAY0sH/0DGAt52zh8RSs9udYwk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z2MgqOeXZ/Ex3fVUr+eLSlDHM/k2em4EglQlYt0CyxU/iUSjTonDVs3An5Y3IV5kL
	 KreRD1QB1gXYHQheZieH9fxSXrle8IIqx4wpLYDZNjvjw/xTafyujbrXhOMLeXJjeE
	 k9vqVcBy7VyI5n7MYSVYFUWhsnubHnc67QlKt2G71IRCp2yl8KIjIZcMRjaVaJxqsG
	 Cr8GPHviqME4sSd+F0phQ1jEfLCXx25k5a4nILhDbLfisqvxvc0RofGCiXis9dYOQE
	 VE6JlcVdFP/kC3GcJPtRhXnEmQ7OR7LoUr4ZI1/jSXgqQsm7Y+oBFYLtSShAo8wpxK
	 0+MecgpVpyeFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FED86168;
	Sat, 20 Jun 2026 03:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14C6D2D7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 03:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E66FF4EDF7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 03:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQjNSayDLbRz for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 03:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CEAE4EDF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CEAE4EDF5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CEAE4EDF5
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 03:24:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4626fdc829aso1951629f8f.3
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 20:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781925851; x=1782530651;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6n4odYfc8AkJ8uHlxWN5ppiP6+pLc9ONfgGWe8EFQg=;
 b=OjyISFLkol4ulX2UpYrwsreX+xyG9ppqmuEwQbYeXIWgxognXpBNcZ053qBjKJL76a
 9OxzVUygmsG7QiPPPkZE2vaZ3KIGC080dVb9rlBnanreyzLkkFvT+ItsBGPcXYfUnlVG
 yAahixJlpF8PnvZgAbk6Qxkrfbo0oonDT4+3g82uOlbcWZqlNEu/a7d49Y00l7ddtjAj
 pE38TqNF2Wy/jxF5OmsSKGq1207xCPxQpccMrCjXr6RoxqYCwtb6TSd1pfp4F4EYBFke
 O2BmVDbcYVJXYMGjKeoDebPeRq/ZKYHotnIsuwvQQH2CRv4It83i349lSMqBLucSb4m1
 OvSA==
X-Gm-Message-State: AOJu0Yz8+yTONCyd3pnY2oH306eD1Dx5MRnaYgKsuA1OoVpUOIgXSLcb
 VpiBg1RtIsMJxetiIR+eHwXQTMKuxgs9FcyJG/7zeCvbVWFP8N0OspY2ub+6gLit
X-Gm-Gg: AfdE7clyVqC2KFxC7dSoPeaQdB/LwbSQZ5AFlBhgjv8DRJltg9kbhE2vnG8nwrJ9vxB
 HNz8b/bxSu1rBydiulTJR2Quwk+GBT1rGqm5t5x0djamBBm0fPNRXi6m6Oc2A2aiCmAu9HfBwkt
 M8bWGH114XfuiXuuGASpoZrcbQ+Uz3P44txlPIIudzIfYHl6x9ujU6vJFra0KFAuf7IyjInSLpQ
 NABdgKHl33//lO54yFJycEulvgY7G8SWdpjxZxfj07YyZIrgEXRo0bk8UhPXa8IuNZhPnmoOBEI
 KJYbcHNu0hkBsvdCIdGWn3XoYZpTNCnDvcJYP3cnR+lXycwsV2kO1zSFAoXFlAWyPR6CQMe14ce
 XY6Z0J3/RdhU2u98u5b6tfHGV8RWNPxDL+Da15aDMG6z14lF70lLouD7jMqn3BljSHFhJyA+fae
 jO3ztM7+6gENhFqkaDwaenpkAk4Q==
X-Received: by 2002:a05:6000:982:b0:441:1c18:f779 with SMTP id
 ffacd0b85a97d-4656ff20dd0mr6580609f8f.37.1781925851088; 
 Fri, 19 Jun 2026 20:24:11 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5397sm4374049f8f.13.2026.06.19.20.24.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 20:24:10 -0700 (PDT)
Message-ID: <6a3607da.06c236eb.2556ae.56e7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 20 Jun 2026 03:24:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781925851; x=1782530651; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=M6n4odYfc8AkJ8uHlxWN5ppiP6+pLc9ONfgGWe8EFQg=;
 b=VTn9EPkfFheitJIliO7nTI7QanlXMxDuZy2ugb5Yvi83hOIVh98Lxg/W/ucREonxdD
 y3Ly164KlNMmXXz4+B5ToNSgLKozHK1AcXnGnF3TQCWyQHryy9ersqLzcoKBy0ZSshA5
 qi8io9qDg9v5dSsALpnjiwRQVI+bRQlWkBvu5wRsD32CmX+bFpzlvpz8i9kXq3uR/5qp
 VTZSnyGVgPcG72vRIA5LZb22gH0wlSojsQ7Y3l44RmusZEjc9/sWOXzPr8VISy6qbVAi
 bSNn10VpXZyUVV8i2R5U8ti31t2uz0KUiY1lv624MCZ4W30ZOKXat9o0SWxZEdDFLqEC
 vHew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VTn9EPkf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-19
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

Autobuild statistics for 2026-06-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
  2026.02.x  |  2  |  2  |  0  |  4  |
  2026.05.x  |  0  |  1  |  0  |  1  |
    master   | 29  | 49  |  0  | 78  |

Classification of failures by reason for master
-----------------------------------------------

amazon-ecr-credential-helpe... | 3 
  gobject-introspection-1.84.0 | 3 
              host-pahole-1.28 | 3 
                       unknown | 3 
                   ccrypt-1.11 | 2 
          cloudflared-2025.8.1 | 2 
                   dante-1.4.4 | 2 
        edk2-edk2-stable202602 | 2 
                    frr-10.5.4 | 2 
      passt-2025_06_11.0293c6f | 2 
                  bitcoin-31.0 | 1 
                  broot-1.57.0 | 1 
             dahdi-linux-3.3.0 | 1 
                flannel-0.26.0 | 1 
               freeipmi-1.6.18 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
       host-gcc-initial-16.1.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
host-vboot-utils-7dfa482d6a... | 1 
                iproute2-7.0.0 | 1 
      libabseil-cpp-20260107.1 | 1 
               libsigsegv-2.14 | 1 
                     linux-7.1 | 1 
                net-tools-2.10 | 1 
               openblas-0.3.33 | 1 
                   perl-5.42.2 | 1 
                  prboom-2.5.0 | 1 
                 s6-rc-0.5.5.0 | 1 
               tipidee-0.0.5.1 | 1 
           uboot-tools-2026.04 | 1 
                 uclibc-1.0.58 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/0069a0af29373d29ec7b40903b82b5c0c7049f29 | ORPH
    i586     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/96134d919810dd606e05c0c176de860b33c37d92 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/134fa27fa3d2172e78000073d9c48794dd435271 | ORPH
    i686     |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/59589c97daf93dc70de7ce5ad5c64a46a760e2d8 |     
    i586     |          broot-1.57.0          | NOK | https://autobuild.buildroot.org/results/6cbc651cff99fa96b08d1fe028ad8f18c1400552 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d3afc0b73b35f37b01ee92fd893761f0d7115aae | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d65e12077629a9c1feed5189ba708deb8ab139ee | ORPH
    i586     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/2088e125fc70f238d287e21f63fb5f859e133143 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/669b3d80a88f3d1692e274fbf7e27e75d06983e6 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/87501f3203273ba55188ad9862ad9be86e23cb1d | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4883d05513eb7866c086c215a31931bec4514e4a | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/acc099e295f21b434a00c5b894d491e3da006a6b | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/9c99af006030b9f0ff9b8dfbb2ec3dbfd7bc731c |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/7412e9963256984aa71ff237bc709a8a2648fd88 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/6e5168486fc42fa72e2c1904f85d949cb8ee58ac |     
  riscv64    |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/f6436ef2fc41cddd951de8b9dbef8203ea29e926 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/22dd13f9c97b6d5586ce172b3bd576d71b180151 |     
    m68k     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/6ea8ced6c5cb8c6d3eaa63769932f62af2e2b918 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/97e2d416464dc6bdd9acd0ca4012d3bcc31c628e | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0772f9a62495bedd3d7eeda26ff9a12280cbb562 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/71460dbd6bad7dba2535513c5eae0931acb87170 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/fb1ae650324043882a78a8d9ec5e3a4289d0c4c1 |     
  aarch64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f565a58cf01d0b986889c4f93406175a09e4f249 |     
   s390x     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/80c34398266472aa2e93bc1a63c968d5028bc7be |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/fe9ac164ddf3872ccc8c013c7a2052c01f2ed971 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b57ffdc5fd550bff8c85a6199396d5981aa8ef7d | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5620d0a3c3603a378d7c6d7c16c22d158bf20e15 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/72717bcc8fcf9e9d510b1d319334c7095dfdfaac |     
   s390x     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/68bd7a1044a829cd359f076fefce70018b87c201 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/5c99d8a583011611c444871dc576dbe37a886a5d |     
powerpc64le  | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/0bf6715fff6d1c5f0e4b880ba66ed3be0c3549c4 |     
    i686     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/0f84638d6c057923030581c95b6ae05e3b0f4875 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c65dfcd8a006317003d216099d92a982fc27df86 |     
    i586     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/c3106b6ff8924726891dbc0e37ff100335e673e2 |     
    m68k     |           linux-7.1            | NOK | https://autobuild.buildroot.org/results/460ea98c3fa86e409484277c1102b562bf3cdc99 | ORPH
  mips64el   |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/2319d6a76b1857babf8c515254cf1619c7a582ec | ORPH
  mips64el   |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/e84a19ae66e146d302d3f6e4969c388e225c51b9 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/264b09161c5498a1a7e624ca083619ea5ca3b741 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/2ba6ff8d5cbdc35064e75e6305d43429f3f334f3 | ORPH
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/665f2982eaa36691a03d02f2383e6c42976918e3 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/cc595d1d49b314d5fae1174b0a8321d572584354 | ORPH
    i586     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/97a28ac9f69e8d9db7480a1de43b9f6d8338bac3 |     
    i686     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/c5f073b34d84b16703dbe435e394085ec17add42 |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/61ed2428cc4ed02b7cba16050ce66b5d4398e487 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/de679eaf287d2d1fd1403df80e0c936fef382405 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/985d8b0131636e13f9b78318ec47856b769cfb4b | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d1150926810d3873b86c10f61e49243ce634879f |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4bb0bc01dd050c5272aff34ebbe83a43de4d2b25 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/19d37aed54bf14c6211b1ded4fed508e47ef2815 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

        ltp-testsuite-20260130 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/63b80738ffd4798a74dbca65fb1c83909a16c42b |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 fwts-25.11.00 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         fwts-25.11.00          | NOK | https://autobuild.buildroot.org/results/3f849a883184502bc3a2674d03297a42936611b4 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/53ccba801bb9f9496703b5cef913b145fff9b3ea |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  delve-1.22.1 | 1 
                  ffmpeg-6.1.5 | 1 
                 fwts-25.03.00 | 1 
                 php-zmq-1.1.3 | 1 
             python-lxml-5.3.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/82a90a5a96960e9ab4e385e75dc23242724318b7 |     
   arceb     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/ee4733c34ac9276b9f2f736df1051f31cc6f627a |     
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/9041877ab7438b88f2dcd85bdd397e234eca37ed | ORPH
    i686     |         php-zmq-1.1.3          | NOK | https://autobuild.buildroot.org/results/627761c1e91182e1bebd4b24345ff09e087edf10 |     
powerpc64le  |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/c2c6a95cbd09cb71fedf2a867c7a6892495ff6cf |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8678645beaae5d03248c2315c8b0373a09cdf763 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
