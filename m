Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB1C5DF7D
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 03:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7626940685;
	Wed, 19 Aug 2026 03:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuvNItySGEZy; Wed, 19 Aug 2026 03:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787109802;
	bh=pKoQjOHBxphqhg6Q9rsCi6cx8GV/8LDZM8rSgOApLYg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qOHdnsEhSXnfQmf8py2SaHyKmnSn7BLZsBVrQvRJ5cFDaOj2ab4hULHufZQgqDlHj
	 IROsnWw2hVVZWAGVuwup283SPSPFTxSgOrxpR7/D1MFVltFCYsLfu7Kb25f6939ILj
	 Xo5YJ1nX3CDxEcOMUYE2ujFHv8SArRgxvE4QMJDHEDs7MQxG3kw8S5N/+nclksj/TE
	 eZ1qZpvOzTnlw4w4n4sa3nxrE5XnlehxZHUmRHUVa1vGnQNG+dCOAmpf+K2NVVWRu2
	 seR/XLwXu8czT92mmGYA1EohXs5dAPhKw0B5cL+6pa7gDe1DKkcK76tmOrXcqECwdD
	 KIO+UY892sUeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F291E40688;
	Wed, 19 Aug 2026 03:23:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47ECD1395
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 03:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 391D740688
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 03:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AegTNFEc3N_j for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 03:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ks4y5CSh
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E80340670
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 03:23:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so5329135e9.2
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787109796; x=1787714596; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WMn4KDAVUjL6Npw8d2s3fwierN1LEzAdACDXXftH5SI=;
 b=Ks4y5CShZpih8b/HQQgztGlS8esNGb/K6xx905es/AqabBMUBqeRSzaz6+vADywn/z
 X+jiRS5j+Ux0LbfsSz7YqUjLr5n6Slwz7Iju5gxW57WSVbVneR54PJHCCmzki8zZmOjL
 ejADBxVFWuESj6kmPxifhA+FaW5KCtQDTBWM/unKAl5IzUHYIy0NF1VxkwoRj/9mI+oU
 Aj2MpaYyYYKE70xAJ2an7mkbY2VfaHCUBeil5Pjhi25y4qgEnvq27CTvVGx5wf/8E96a
 1Jmmsxg/8eedYKdIh9gg//TeLl4yMgkSlwVC/T9P6h+0lvqiOCHYjjFRy+o/S1zvzaK4
 DTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787109796; x=1787714596;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WMn4KDAVUjL6Npw8d2s3fwierN1LEzAdACDXXftH5SI=;
 b=D6WVlgzuCHIv/ZTFdYHlsFpiuv55kvHLXOO/q7lr6GiFbIYc94zNtdc2yXpaf8h3vz
 jLW2ohKJr6HZrsFaGAT0cDAvYCk8o2kwy9bYLhUMwN6bzqVUlIMSygHgmgpzTYljhN+o
 htZXF6KoEMj2Usz+grIqsJxwATZ8WJIcUEQz9yM1o1vBqixuce4VZmXDw5rxVVBr70mp
 MAOfsx/P4omDcehm6Qo7XIMCzt+7kG4/dmOxaRlvWH1DClK16UZdvYAaOMte2KPP1vMz
 rGXgeJA5HT71BK/MGZgiVuQmwp/UZEE+IPxesW/6+GAcjE7FaktGpgF/MtrX3JkFGev8
 RfjQ==
X-Gm-Message-State: AOJu0YxHa7qcV3eTLTjPaJcVKtfx7GH/X4cWJZaDFYKJanpFJVfVPr/Z
 P2oREg42xJ+vADUemeBAq2c7XyuCUSccMJpf6XZ++g2VF831nbsMZV/Drr1HZvRS
X-Gm-Gg: AR+sD10Cdk6T9VX84ylWhTbXNR46g8KCH/4c1Gii2svVV2Eoedbkx+E1PpUiVrnr2mR
 MKoZDF2RG3nv/BYw903oNfBQA/T7NfNkXMyKxFdh1DcE1E4wo+9aCn7L6cJqyw/hduviNFoMz7R
 pnMAhWMO4s1U5fP3qydHSfMBOXjjxKVc+dRwyLpm6eAoGgrgFPyCg997Qgdk9csdvsj+OdII1tV
 OnUOauaWARsNd2+D6+sFfC3cDG20CsgtAUrty9rLDBKNbRm1RJhrGhiIl+ffSNNEWed4juIlVq3
 u0LZYVPdSPcXq9BP2h03VsJgttUP/QFETmDp4W8YPBUxUHcbj6h3J8g84mtoZU+TBVXa1AyqduP
 5QXJ+VrRIWe65W6gSVlAERmPD6s+0RQQYZLqbJIqQPep8ui9iKDbx0k28o+AY+OEORknvjsmHcS
 bTP0d2hM6U7/mnHnc5Wjnkwbzfergr2rf8zoN7BZqZUlHwSCvtfX11USPXJwc0Bw/m4CCXJBG6
X-Received: by 2002:a05:600c:4e47:b0:499:a0f3:9d5c with SMTP id
 5b1f17b1804b1-499aa14a711mr28196235e9.3.1787109795577; 
 Tue, 18 Aug 2026 20:23:15 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9ddee1esm17011775e9.2.2026.08.18.20.23.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 20:23:15 -0700 (PDT)
Message-ID: <6a8521a3.73de60af.30607.2119@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 19 Aug 2026 03:23:14 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-18
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

Autobuild statistics for 2026-08-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 27  |  0  | 40  |
  2026.05.x  |  3  | 10  |  0  | 13  |
    master   | 29  | 86  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

        edk2-edk2-stable202602 | 5 
               libgpiod2-2.3.1 | 4 
               linux-pam-1.7.2 | 4 
                       unknown | 4 
  gobject-introspection-1.86.0 | 3 
     linux-5.10.254-cip72-rt32 | 3 
                           gdb | 2 
                     gzip-1.14 | 2 
            host-go-src-1.26.6 | 2 
                ipmiutil-3.1.9 | 2 
              jpeg-turbo-3.2.0 | 2 
                   linux-7.1.8 | 2 
          lua-lunix-20220331-1 | 2 
   openvmtools-11.3.5-18557794 | 2 
uhttpd-15346de8d3ba42200249... | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    attr-2.6.0 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  delve-1.22.1 | 1 
              e2fsprogs-1.47.4 | 1 
                enscript-1.6.6 | 1 
                    flex-2.6.4 | 1 
               freeipmi-1.6.18 | 1 
            gdk-pixbuf-2.42.12 | 1 
google-breakpad-f49c2f1a202... | 1 
                     grep-3.12 | 1 
          host-automake-1.16.5 | 1 
         host-gcc-final-14.4.0 | 1 
               host-parted-3.6 | 1 
              host-rust-1.97.1 | 1 
                 host-tar-1.35 | 1 
            igh-ethercat-1.6.8 | 1 
               libecoli-0.11.3 | 1 
               libepoxy-1.5.10 | 1 
                   libidn-1.43 | 1 
               libtasn1-4.21.0 | 1 
                  libva-2.24.1 | 1 
        linux-headers-5.15.215 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
                 nettle-3.10.2 | 1 
                  ntp-4.2.8p18 | 1 
          openfpgaloader-1.1.1 | 1 
                openssh-10.5p1 | 1 
                    opus-1.6.1 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.46.4 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
                 rtptools-1.22 | 1 
                 sysrepo-cpp-6 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 
                tinifier-4.1.0 | 1 
           uboot-tools-2026.07 | 1 
                 uclibc-1.0.59 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/09759311affd7f6392260134d9dd3ef7a5fa5ffb | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/12b97ffb7540e56a0260362ecc2aab36970d1135 |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/12015563f7321b7ced694dfddd70b26decbd2c1e |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7c7f163973cd866ce7a350fbc92f707b98f97045 |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/91a3439df37768043d74ccfd134b1acdf3210028 |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/62a4878cca55fe479eaa2b5ef01028e13f91ef25 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4421d5419e6d5b3ea42cba66a8e41b21927cb9cd |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/35077ce37cba5bfbf2a6cea88b9965cc43f459e8 |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d37d9cf7fbbf0d0da8980bf4ffecdfc1266f2ec5 |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c6780aff868d2775bb4274cf39fad5d7a7dd65a9 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6564d4fb9811da6c755a63985e8a64296daba178 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/42d2a52611fb4b6fef8c9c0c85f1d700c6b1b2b7 | ORPH
    i586     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/f6e78bd0a508099600f61c1d15c94466dc73b4b2 | ORPH
    i586     |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/ba1ff3a2254a8093eb3c168e6233d8430dd69710 |     
   x86_64    |              gdb               | NOK | https://autobuild.buildroot.org/results/1ccef4447a95e2dbd95e6c1223f481c88135ad12 |     
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/cc78b469a3d54de834a055e3c0ee4eded9455ba9 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4a4a85e2f247ac8b1a1dbfe1d50654996fd9ab1c | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7500e2cf2678be26c39730834805f03681d25048 | ORPH
   x86_64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/1ca5e233478e45dd18de93f03018b93c976071b5 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/a814a1c9c75688ada6f90ee06809c385bbe6f90d | ORPH
    i686     | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/ef8664a67441a2dd909b08539aa539c524db554a |     
    i686     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/38106d6dba111342ed7372e9b8e757fac7bfd7b7 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/634a910ea94ef37880a8c154ff00637e914f95f1 | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/65034955c207c562f84888bd1a209037ddb3d60d | ORPH
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/131384325ef2e20557f433cec1824416d00f6eab | ORPH
    i686     |     host-gcc-final-14.4.0      | NOK | https://autobuild.buildroot.org/results/7613538e0847a10eb3e2a7e40f3ae76386ac015b |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/f8e030aa987126db53dcd36791e838e47adedd87 |     
  riscv64    |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/072cf59774846e5ee7ed5556d9125bce782d232e |     
    or1k     |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/4804b40c8b5ebe6a359135e78ae6cff2253a1e6b |     
  aarch64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/0e2f4b7c4db36edbfab8752f2a56ee59346c297e |     
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/81c0492057e274a380827a3c3e5e2a46ea618e9e | ORPH
    i686     |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/9b270904b2f7cf9eaa661c98370c582a61ff2342 |     
    i686     |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/18a6278470dfb98b6e2da3ace28e2a091cd40fd8 | ORPH
    i686     |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/b283db0c0ba4df670be5e01fef31464fcffd5b8c | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/2c5f438ae1278b0a75419fe88f460935cead01ce |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/cdc26628b9048b10965ec95f4c82e40b87360caa |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/1e59d4564c52ce3ff8cf036d54336c7316c3e7b3 |     
  mips64el   |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/668fcebbb29159c0475934b802dcbe03717496b9 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/d1c19ffa0c599bd2ba9be965a98fc8f778d6e366 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/c6b3c9311d628bdb4ea103431767493fab9a3668 |     
  aarch64    |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/8e799050c5779c680ff5e5136571f57d29239f2f |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/d6d8833acfe00559579defbbf3ca34c0edbe7869 |     
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/2c8b8aea96273413573975c2e9f22f75a01a5348 |     
    i686     |        libtasn1-4.21.0         | NOK | https://autobuild.buildroot.org/results/ecd1c1b25bf72769e2bb4c503eba2840d0f87c81 | ORPH
  mips64el   |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/4a3ebacdd27a36e91c347fa076e68c8f09f76ba5 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/f5a3b40d4b28c9750d3a508b62d6e742292b6e8d | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/26bcb9b74b4e3d9329e1d38e13d3aead2eff4c67 | ORPH
  aarch64    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/4d87c1e697a02b29688edf3738dc026802084856 | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/1486b8d971459a583ac92f674e5eac41f4bfc446 | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/cb2118c21ba1335a549715d4c81ff050dc33c4b3 | ORPH
    i686     |     linux-headers-5.15.215     | NOK | https://autobuild.buildroot.org/results/7538ba69fc6e38bf890508d311ad90ec973cf7e1 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c24def7b22509dd4f860206bb4903a2931dbd8c5 | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/444f2919fd02b6ac973ef53b424c0cbe716ef82c | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1ecf0d3016d842eadb28f7c2e17d354139915792 | ORPH
  riscv64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4e45c59c87cde6a1c5c09f05b06a62f3310cc710 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/73ad12dfd404bc46b01a3f69c9de76de1ea4cb21 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/f222608b3ee24e04a84854cf921dc5792cc3ffb9 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/bc3ec9a5b67a8b256d5010f0d56b20eeb8df3759 |     
  aarch64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/b504621e6f5d8f591f1732de1f0edc621e95737b |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/6bc89bdf2809636d1723f4d3edf800233ee1259c | ORPH
    i686     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/1954d8c2608f30680ae926ed7afb80eebc9973e6 | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d0e8f187bf5ab9e8ee1fd40a43a25529e49d5efe |     
    i686     |      openfpgaloader-1.1.1      | NOK | https://autobuild.buildroot.org/results/59cb9d4d9d41fe7fec4905b9901b09c06d811086 |     
   mips64    |         openssh-10.5p1         | NOK | https://autobuild.buildroot.org/results/70faf843c13303c59c2b8aec2795d079bb75a954 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/379ebd9e1b7012c9a1be563720073bc6bf43e70a |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/64307b30124dfbff617c1b5f3308b2a47ba8bb9c |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/7a18d1155d25591db73567a5c560ff7a833eb017 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/fc35f283f7fbf5ba9fc35169b90ba2d755e9bae7 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/712b55da3ed17a534a1070c8e4cb75da78176164 | ORPH
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/6139f7935261b95534b7d20f04709d599aeae134 | ORPH
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/4c676859e0b7ebf0204b9ff4f25546b4d64fe8ea |     
  riscv64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a328f779341638809b66066ee9830ab71fce52e8 | ORPH
    i686     |         sysrepo-cpp-6          | NOK | https://autobuild.buildroot.org/results/6b10b2a329b7ac22465d0219af3fe744c38285d6 |     
    i586     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c19c1246959ba1ee1c87378472d621048617f9c9 |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/20d7d079782a88a022bdabb6640ae0c3201c44a2 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8e017f6fa6703c92949e18bdb05c9ba548611593 |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/5b3dfe67d9a7262c850075198924008b4aecd668 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/6af3e558f60c2be6f3631342c537de48e6a5dbd9 | ORPH
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/a60737adf3fdd26e8d0ae3310bef5c48716889dc |     
   x86_64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/abb95c49cbece992141b3cbe1e51c77632a12193 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/63bb6f12c321b1ae4162e9368d0ac5ab24a60daa | ORPH
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/d6aacc1f0a88ed5eaa08e83d61f9f9ca42d9cd36 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7a87cac94842f0b042916bc23ab779197396020c |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6f8dbe289a39385ba34aa15f8b04b89c1fe910ee |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4bc03737a4d7029399cbdbdb61ffe16e22fa1b49 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/37619578ae7e4882fa5df787265a725b93a0e4df |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

  distribution-registry-v3.0.0 | 1 
              e2fsprogs-1.47.4 | 1 
                haproxy-2.6.27 | 1 
               libsigsegv-2.14 | 1 
                   linux-tools | 1 
                openssh-10.4p1 | 1 
                 sudo-1.9.17p2 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/95ab26989ab2cd8a26dcb0a5191ae4d197244495 | ORPH
 aarch64_be  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/8dd31b368cc19c91fa983c33f7a4dafdeeece955 | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/579294d4d7584471513066dcf5447063d5856dba |     
    i686     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/47dcf8ea2284d05c7c2e6b7dd6a8ea6e187f6904 |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7c0efdedb119c053f23b48c37a9809af98247f5a | ORPH
    i686     |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/3243c7588641b2afc3b9bf5496a3d121cb4dbc18 | ORPH
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/acdd80faf2425de0e23e80efcf7e9bb1b53f7b4f | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8b9bbdda3e9bf9ae8de516bb9dd7bcb5ca1eaaa9 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b7c3d9082822671c3b37fae2a254d6ac2c0b459a | ORPH
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/83252e00f58ba73aaf4b9d3340b92a8f0561f2ce | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 5 
                       unknown | 4 
package/linux-headers/linux... | 3 
libsvgtiny-ea9d99fc8b231c22... | 2 
                  bcusdk-0.0.5 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                diffutils-3.10 | 1 
                  ffmpeg-6.1.5 | 1 
       host-gcc-initial-13.4.0 | 1 
            igd2-for-linux-2.2 | 1 
        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
                memtest86-7.20 | 1 
            nodejs-src-22.22.0 | 1 
               pcsc-lite-2.1.0 | 1 
                  stunnel-5.80 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d100360fbce77027d00f3d2501b1f4d902729d7b |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2a33035144107fab13995401e782b9a98ca61a6c | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a112a6d92cc34ce86a8db1cc864d919c391d1b48 | ORPH
    i686     |         diffutils-3.10         | NOK | https://autobuild.buildroot.org/results/cf1ff56c3a1a79002f3380520626c38f1cef5342 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/e3773ab3471c73e2e676a813a273226e8c98afff |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/32ac5077531b35003d8cbab19313b8b582150c3f |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/8b0d9305599a1c1fbfdefc2990a0787af1a4efcc |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/2cacf061c8d185fd8235fdbce874c907db4602e0 |     
  mips64el   |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/2f4924f4cb5ed1b245b7a81780f3cc479f87f4d8 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/a98287968f5095014411db13f1fef0abef7924ac |     
powerpc64le  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/5873fef393e0a97f7085ef624551d3fa5037e78b |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/fe82cb9cf1cd1666701b538afb0961e3674f7f22 |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8616662fd4d0f4c8dda6ad2b2f8868854da2bbfc |     
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/0562e0b609d81aa185744a96d5c8825b75ef662f |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/46a77206fa7fb2b2449e02a1f0684698161e99dc |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/109670014d0f3ebe101d14edd739192f87d1dc85 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/36a06e50c7bc4c2bdb5f7e26f2c20b1d47c650fe |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/cbdd2b04b85284dd91123f5ccfa35cc5860c50c2 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ea0e2756b238cb58f7357cf0e9e8d0cba1a8e6d1 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ad0fca3106d2f4f0214b55f77c80b3d9a796886b |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3c0c990fdcc371337ee3b810cc74843a134b5862 |     
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/bfb2b34c550ca58cdafc675d89084bb53ef76e56 | ORPH
    i686     |          stunnel-5.80          | NOK | https://autobuild.buildroot.org/results/166e5f78df6dd5b10f70f1f084217cbc72551a09 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/712f68aba60d806af8e57f903c820d2e1c29312c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/cf72d3b0a732374bcf298cd5a1a4b4ac8f033283 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/670035e3e35e4ce900f6a74deeba32214da0a36b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b9893f46b87f2e384ca7d4d3a896c57bb299c1dc |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
