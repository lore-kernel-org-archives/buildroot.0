Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724B1CD6E5D
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 03:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 084E64243F;
	Wed,  3 Jun 2026 03:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Bff6wxL6Mx1; Wed,  3 Jun 2026 03:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DBB44243B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780456734;
	bh=ZCbEbXsGq8JrrRsgpt8+QFIo7CKB8D3oT6UdFI9QTZE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SBHpnWhrmSbRPKF5emA/rXZHVIdPpqs69y6m680HrLavtABbQoQJ/Scf91AmQizWv
	 WOqINyaKXACRwY3IM8QFsj4KBphrjSa31szr8dzVh+vYlEJIuZQ66rJclSEL6vujsW
	 9+YbrJXSW02ikU7ptdH7jGwgc6IrcjSq2Pbzhte8aGpoFtaYA4OWdKom3dPdlCjgw+
	 AjdXtdNxrQWNIMMAfY9lHxi0gCYhfVdAXeV5K4Ms0PK5EfrSsXDx5U44BsvaKSbAGu
	 149TBaAqHJYuHzP2bEzgxGPUjTLzGNbgxg1Wvgu3Ut7baGE0WujMmQXIo18nPCOg6j
	 bLEEgDLLnh+Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DBB44243B;
	Wed,  3 Jun 2026 03:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05553D3
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 03:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0217B4243B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 03:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGe38g8xQrex for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 03:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DB0942439
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB0942439
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DB0942439
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 03:18:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so2788290f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 20:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780456729; x=1781061529;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8bvGtrqQgVE1GWFPRfRc77Q/NBgZy4uSPkmaK96Aec=;
 b=LNrwigYd4oH2TAWbmy8PiTBTP9Lsz2z/fX/j7rXLCQHdNOlgctyoyUfxpBp3y1iPxB
 Oii07tWUEEXcu0ozOgmxKihUSOi/EDM10ipXXNZutFLrJ6gWVh4p5//5j+vvW60UXctn
 0ozA1qR3hL3rLBpaJvjMX7MezTuQhPsJnlUMTkIn3oBCURSFeEroaKO5bJnmuZJfpmSE
 7s1jOvla53QhAY1+yaTzUs30io1VrA2pmPjbdpRryh+++MTqyOb5ZT2nALLJYBeo0wNY
 uiFg24ZU5pzdGiRDIb0ehf3O9c3ZI1zFV3iXp8r/n2g9+cFpgv6/DjBNLjoMX2lziHm1
 0v/A==
X-Gm-Message-State: AOJu0Yy5nUUdCXFZmCQ6wMHyFZ7kSONRREJtwFHu4qtfJFJ6ShVgNTb7
 QNDJI5CFvuzSms6ZdUv0Azzp/pTI5LstZfFZdUn4yx54KTxcYDO/ixpJzB7X7tlB
X-Gm-Gg: Acq92OGxpzn3fQ8Dw7obFEvduKhSdYcHz5213VlfsmQYxnWno8vQyz1smGeyYU1DN2q
 ONMf0M7EwFcAhwXq3ptMjp8lPaSeNU7ot1sXsy75EFbeXCI7gTe7zWU0Ha3L/nEyIuHfhJa9NGq
 WhE4P3sY2/XETB7pQFGhKWHbNTBOS9PjOvCkXcSUS5Ofdj4xrP9iYfiqv8TQxFoh7+RVnxI57D4
 os5a1azVdOiAXF4sVvIWA9Dgy4qoTg7D+LCGmPmHXHQdD2zQJCmq311rw7zDMtsLlZzVOr55ycI
 xM7sOUJg6o8nOp4SHPlzxYJJWNWm2vM8rw6JIcJ2+6wpEYvG9s9WDYPMCvy0OrZGlliLJiApbrc
 wu9As+bX2FVOhb0OpjrL5XcZCHDuft9L5f5xXa3qktL+g+MBYAMQ20pBr9kkrvA+b0r6tJmCmMx
 EtMb7t5pFzUuhsOlm3BwpMHsrixCj8/t2TOFRI
X-Received: by 2002:a05:6000:ccb:b0:45e:f31a:7ae6 with SMTP id
 ffacd0b85a97d-4602184f188mr962810f8f.30.1780456728766; 
 Tue, 02 Jun 2026 20:18:48 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm4453666f8f.20.2026.06.02.20.18.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:18:48 -0700 (PDT)
Message-ID: <6a1f9d18.28f24b6f.17ad25.cfe7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 03 Jun 2026 03:18:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780456729; x=1781061529; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=t8bvGtrqQgVE1GWFPRfRc77Q/NBgZy4uSPkmaK96Aec=;
 b=Hg9UlidltGF90CQKo+ce3D8fNBWgMXb0RQGzST/cGC3pnl9bWcMZ+PtknwXfyvyAxy
 UzZEcSEE4vf9N5Yitg/neYAzyoe4UgrgNMU3vHCITrrFnt3d+Qlma/7yDpnlTUSvRlna
 LzWSIp/qr/A3t2ANbNyxftv2DlZfVn/cFV6D31DPkaANhSNtlKB1ukaHChY2/q6wsHUN
 RN0asGZA9fdXYEOT/lUYhPONdJAHpRc03NA6/1QUtI6I28x9OiG8IKRMKPVRmMJ/sYU5
 8aWYng4B/qO4xuRGaQLppjWGrM5hZZZxBju3J3vWs588kmE1ebRNV1oMOl4LJyiW9BaZ
 /yyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Hg9Ulidl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-02
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

Autobuild statistics for 2026-06-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 22  |  0  | 26  |
  2026.02.x  |  4  | 12  |  0  | 16  |
    master   | 47  | 90  |  0  | 137 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
                   dante-1.4.4 | 3 
    host-mender-artifact-4.2.0 | 3 
                  linux-7.0.11 | 3 
                   perl-5.42.2 | 3 
                 systemd-258.7 | 3 
uclibc-ng-test-132c6134d691... | 3 
        edk2-edk2-stable202602 | 2 
  gobject-introspection-1.84.0 | 2 
     linux-5.10.254-cip72-rt32 | 2 
               linux-pam-1.7.2 | 2 
                  ntp-4.2.8p18 | 2 
                openocd-0.12.0 | 2 
                openssh-10.3p1 | 2 
              tailscale-1.78.1 | 2 
               unixodbc-2.3.14 | 2 
           alsa-utils-1.2.15.2 | 1 
                 apache-2.4.67 | 1 
               asterisk-22.9.0 | 1 
                bpftool-v7.5.0 | 1 
                 c-icap-0.5.14 | 1 
                  cairo-1.18.4 | 1 
                 chicken-5.4.0 | 1 
          cloudflared-2025.8.1 | 1 
             dahdi-linux-3.3.0 | 1 
  distribution-registry-v3.0.0 | 1 
docker-credential-acr-env-0... | 1 
 docker-credential-gcr-v2.1.30 | 1 
                easydbus-0.1.0 | 1 
              esp-hosted-1.0.6 | 1 
              execline-2.9.6.1 | 1 
                    gawk-5.4.0 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
               gst1-imx-0.13.1 | 1 
                   guile-3.0.9 | 1 
                haveged-1.9.21 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
            host-go-src-1.26.3 | 1 
              host-guile-3.0.9 | 1 
              host-rust-1.96.0 | 1 
          host-xfsprogs-6.19.0 | 1 
                     kbd-2.9.0 | 1 
                      lft-3.91 | 1 
                 libavif-1.4.1 | 1 
                  libnfs-6.0.2 | 1 
                  libsepol-3.9 | 1 
                libsoup3-3.6.6 | 1 
               llama-cpp-b8117 | 1 
                    lua-ev-1.5 | 1 
                      ndctl-83 | 1 
            nodejs-src-22.22.0 | 1 
                    olsr-0.9.8 | 1 
                opencv4-4.13.0 | 1 
                 openmpi-4.1.8 | 1 
            optee-client-4.9.0 | 1 
                pipewire-1.2.8 | 1 
          pkcs11-helper-1.31.0 | 1 
    python-cryptography-47.0.0 | 1 
                  stunnel-5.78 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
             util-linux-2.41.4 | 1 
wilink-bt-firmware-43fca73c... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/d71b11466a9959578fe50841df94cf6c143998b9 |     
loongarch64  |         apache-2.4.67          | NOK | https://autobuild.buildroot.org/results/cd72cc7ee5effb26a464d65bcef8f31c11fd61a7 |     
  aarch64    |        asterisk-22.9.0         | NOK | https://autobuild.buildroot.org/results/4275b918500a3a261706e335f5305607acfa0734 |     
    i686     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/7f708daffa96a9a9728767635badfa8b6540f54c |     
  powerpc    |         c-icap-0.5.14          | NOK | https://autobuild.buildroot.org/results/be695540953fc946ecf05659adcdce51153a8564 | ORPH
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/056b8af3430e3391667a6645807da6c8852bbd57 |     
   s390x     |         chicken-5.4.0          | NOK | https://autobuild.buildroot.org/results/61eba91c144862809a4342aee1bc950f9313fcff |     
   s390x     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/61931f88f31ff8e1b6f780a1e5153ae4dcdcefc9 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9d417eeb5ccf1cf6f55178795af1fb64cc751664 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/56eebac72164e941826f9345f2f900681e51ed7c | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a3346c7629fe5541c2359446658d2747a11a0d88 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0cc10e63c0c95e60b14fb084ae2cede1e34c2c34 | ORPH
  riscv64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/99846162897c2b4b89e34e85218ee1fa9d0b2cee | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/cd3245ca5b8e32892c7ed36722c428a46052cd93 | ORPH
   x86_64    | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/f7e909785eb598d25e7fbe90965694d9602559f7 | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/64ad7d9ec88dcd79a6de1319fddc757a39b049fb |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/dd3e1b69b04a29fbfb4b60adbbe5c04f05127cd2 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b02bc2c8bea1f214182511a25c98fe5b1b792de5 |     
    i686     |        esp-hosted-1.0.6        | NOK | https://autobuild.buildroot.org/results/df3763e74de4071331a41140fb5528523af9e374 |     
  sparc64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/184f42f784ec0d757c24dcd6967e2e4c158d59b6 |     
    mips     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/07ae8cd814c6e3efb60b6471f724b53a75512a91 | ORPH
    i686     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/8e66d944dab17964887f6c33b83e164d17905cfb | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/d19d518d17c2e68ccf637ebddd753ce35035c1e0 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/aed43e62b900f55af4d5ec4b09ebb4e99dbe3a23 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1f6bf469dbaab3d2533f0e9409c2d558257b0450 | ORPH
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/4e72f5ff53e6b8b3297f52e13a0902f4052f0563 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/779c0be5d7e4265e7a757c4190b32714dc294723 |     
  aarch64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/82269e0d7ea3eb4f3eefa83848c70846f127d121 |     
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4d28caa176f2070c7e4b619bdc42cba67af0dd64 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/34f87e464f60eeb693898565f9404478fe68e211 | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/bdfeb727ade055d692fb9f6a5b16eb224f1afe34 |     
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/810d0008c60563573e66e79a76f72622a1cefbb4 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/ce631383e8b210686ca6baa50c639d3dd7f23c08 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/9a4658a9064a46c089bc4c69dbf6ca040aaa5b4a |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/3ff3854ffd3708a0f4ee4db5159282d765e6d87e |     
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/1fb9e37f9d1a5e5034685fdef064b5ae9fd43cdc |     
  powerpc    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/6a8c5b54b2e92397ab4be280f78ad3c36c16f083 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d0b071db3be250740c7de043a0cc9219e9766944 | ORPH
powerpc64le  |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/ca53175f1d663b23048715ab0d7aa2aa42a0c38b | ORPH
    i686     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/1b2d624e3855794b863c840a86026295b54c850a |     
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d3e10cf907ef26b0e02b467a0f17e71049b5c792 | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/a3449954ebb3e93557b04f94f8a65c6821333c99 |     
 aarch64_be  |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/bb611bd387b4c5ccf35d204dbc82fd2ea81b36a8 |     
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/f95776f3c329d387ba12da3b5abe716a73a0e6a4 | ORPH
    hppa     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/7d034de1a4ae73e51d98c59697b660d3bb2de03d | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/510c761ac0fe4e9b904b55d535e7f7745d91ae1b | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/95bc10c1778b1b5a787eaf14e88c498dbd6db709 | ORPH
    mips     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/9d329ba921c12d521955eed728c9c4de9ba6d1bb | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/666a7ed1c9aac1e84199adaad7a052d584f1608b | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5cd5fbb87ada59b78fb1f55d8012eaff5adc71f4 | ORPH
    i686     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/c336cb24246ce1e2a3a7fa17a46b7c31732257f0 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/3978f955e54e2bcfe84d59f33bcaf86b687d7fc6 |     
  mips64el   |            ndctl-83            | NOK | https://autobuild.buildroot.org/results/5d6cf51bb87221f1e14d7aa5ee02c25dd6ced563 |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/68ce395efb2a431dad24e6a34998267ae790518d |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c090028c8bd328af493579b52c8b5ddfb0d80bbc |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/12c9b2719d834cd8687b50c87020c9ad739b7fe6 |     
  sparc64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/22ec79f1f537c73080d25a4383b206d5bf91f9f2 | ORPH
    i686     |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/9bb79581ffe2ed07ffc18ce529ea51808d039a06 |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/135e2c1eb818e8f1f8c597fbd14d8d37d1f0d8f5 |     
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/3e1ff02b4103de3bc21dfe89bb59bda25a755fee | ORPH
  riscv32    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/8fc26a47f35466ffa4eedfcc68bfbee1c79a8943 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/6655262170cead7b206ecc234f404e05596c8d52 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/e6baf98920d884bf951e638ecd9bd896e0f98fda | ORPH
   mipsel    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/f8517902214fde355367d9b07038cd7ce5ab4772 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/51d264cd61a593124c7305c7b696c479bf9259ee |     
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2309f00c702b850bf8f185cc7e47457d25ab2a1b |     
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5cad8d2f4238e1fb20755c1aeaa80c7ee9957a49 |     
    i686     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/8911c20a89f1a778f216ca27809d9e852d3292e5 |     
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/5bbc1ad00bb0b947107a9a237b38ceaadfb967b0 | ORPH
    i686     |   python-cryptography-47.0.0   | NOK | https://autobuild.buildroot.org/results/4a487b4d49d472fb4f2fa77889d7383959dc6a3e |     
   sparc     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/326affb42fbef2617054aa0f65f444cc463a0e32 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/0d39361c61025c0b4d1e183a8cf649f5bab6eaa0 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/1e6570e1d97931430226e61a3eeee6447bba39e0 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/a86f5b4c295bd47c3cc0fa64cacfb65e5a2b6af5 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/fd3e8fea4f13e55471c4619f36c71cf8023e2837 |     
   x86_64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/b59d7b73be21672a8b9e1d4b255500106d5a020d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/cfc874c6e9f9e8b66274b1d0e2cbfec948919f93 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/7758371d109e4c64da035748f163546220a19c8f |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/0a70dbb15ec76b412c50570a67ab3805dd833a22 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/9c28a04975246ae203f5f580162acc5c49925898 |     
  powerpc    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/29f4d506bb5e6ed862b56919b758ee010737a9c6 | ORPH
    i686     |        unixodbc-2.3.14         | NOK | https://autobuild.buildroot.org/results/9b36813db9988e2b0cddac957ac77f8f8d8f573e |     
loongarch64  |        unixodbc-2.3.14         | NOK | https://autobuild.buildroot.org/results/e5de1c915f18d957eca5ee1412d3ff599ee73b2a |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9caaa89a24e00e67c91409a88bd24c4c4f4df39e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/745634debcb85337e8af80b2e3364ede47a6486e |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e36b0098c18f0f4581929d552b71aa9fc18634c0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/597a5a44d1c970296df8f1a898a6bd9811bb0ce1 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/bfb45b5da4527e3e6398882a850525e7491dc6dd |     
    i686     | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/11890f36098998560f8926fa68cb9123a3d066d5 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/e97b20e364230da35179abf6b28848c12c3be3ff |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 2 
                 aichat-0.30.0 | 1 
glibc-2.42-67-g4ebd33dd77ea... | 1 
                   guile-3.0.9 | 1 
                    lua-ev-1.5 | 1 
                memtest86-7.20 | 1 
               owl-linux-1.0.7 | 1 
          sphinxbase-5prealpha | 1 
           uboot-tools-2025.10 | 1 
                       unknown | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/b030ee9f3547ac627d8771640b398a95bfb9aa88 |     
   x86_64    | glibc-2.42-67-g4ebd33dd77ea... | NOK | https://autobuild.buildroot.org/results/c668afc73b144cde426aa7d5146936a8c7bc1352 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/33bc2678567772298160a7fc103fd4d4e050b4df | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0c42fad09565fdf33986a3ee4acbe7a14a75cf4b | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/7017c49821ac328d3d48c9f4200750706fd8034f |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/bf7e0553ab95b9060b007b66da37aca07f759e1a |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/88eff4e867540b53583b35e0216a3eb274a4d77f |     
    arm      |        owl-linux-1.0.7         | NOK | https://autobuild.buildroot.org/results/fdb93f0fcd26e08ccd49ca6436d92ae677d7e0f5 |     
    i686     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/9f0d2d65f0bd10a1dd2e826a48ce1d57892d644e |     
  riscv64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/67107a337eea4495406af24868d9c27f79e83437 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e1e3b75b025ad53c46d22a68d03d1fdbf09fbaef |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/008b78a8572b863893a9ca96984a2ceb8040b9ee | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-netsurf-buildsystem-75... | 2 
                  bcusdk-0.0.5 | 1 
                  dpdk-24.11.1 | 1 
                   exim-4.99.2 | 1 
               graphene-1.10.8 | 1 
        host-python-lxml-5.3.0 | 1 
              host-rust-1.82.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                 libgee-0.20.6 | 1 
              libmodbus-3.1.11 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
                  octave-9.3.0 | 1 
                 openmpi-4.1.5 | 1 
           openpowerlink-2.7.2 | 1 
package/linux-headers/linux... | 1 
                 rtptools-1.22 | 1 
                       unknown | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/77393c207d38c4d72318ab5152ea96acc03a5837 |     
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/07caa860b096a6f06aca58e22f27daf321ee1226 |     
    i686     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/1da51e2862f0af508262f3a4358e30dae47efd22 |     
    i686     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d3a6e2ff47abe5374c3b82645ed69c381ed1f41c | ORPH
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/7ebdce30b6cc0ec150b2378d31d4767528cfd955 | ORPH
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/0a4903934f8eec16d6f6bd6aa8415060efa9cf91 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b61ec0936f6e1b3ddd00eb77cc9eef7b4c73f291 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dc363e49b42833fe88ab4b6dac8b4736038add75 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1bf40efee7191c88adc4e7289ec36830078473e1 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e372cecc672499e3b5c2bacb5d5baece3ab3a0a7 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/73eaca5d393a310099f4ea2acad858e1151d1611 |     
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/483d027e0fc2d80aefe526b2d58a914f88fc388b |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e436b29c5855cbd4bf27b73f25bc465788904eb4 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a762accc65e9a219707fd7cf1c86080dc12e0152 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/ebcfc26a3f1707935a25a704c31d33e34fee9648 |     
powerpc64le  |          octave-9.3.0          | NOK | https://autobuild.buildroot.org/results/05947dffb743e18b0fda071a46f96048d2c444a9 |     
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/9724696061ce5294d07864e81018a62ce0ed81dc |     
    i686     |      openpowerlink-2.7.2       | NOK | https://autobuild.buildroot.org/results/3763014c76e0cdd66a577ae637e5fe373b7878e9 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/aa7b6ca6c524ca4ff77e98e23e910653e98ddd63 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ea98fd354fbbffe07c2ad57e3c462f17a1c8159d | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1ad6addcf117bae226737e7dd13844fc31ce1080 |     
  aarch64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/af78dc37ba359ff66f3f4e70d4dbf2e18b97f6ed | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
