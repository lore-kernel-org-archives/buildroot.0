Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BB5EB28CC
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 06:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AECE160EE6;
	Fri,  6 Feb 2026 06:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDFqBIrXFGxD; Fri,  6 Feb 2026 06:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E11260F9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770357607;
	bh=DjlMPB0H9doCAykl0FvYKRYjb4F1hbOs5UE06umN+wI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dC/Q7Sp8Uhdl02jo2NBCqLv3PElPsjG1RQiotJFpgBsruFVvb5dwsjKp3JFDrSKul
	 X0BwmM02E4kGa4QO1jTEdql3l59nCIXpht7RkkUp4hQK5QDJBly9D4GklyZpdFVOKn
	 XeU1M3jUTIqCnbi2rFr+Gz3lppHuJ3AxA5E4+pnrR7OidmZ3QErh4RuKaI2+u7nPxI
	 VQcG/BzirNTFDCanaV/JvfxDSdmzLXOC7NcPK3v8GuWegCyk+NWNzbj1qIhkE8DpjK
	 RJFjEhfbGdd0nBKqgIRhuCMmlfSznv1EvF+J9s3MYdvU8CcK2Ieo+WB42RIgAgQVoy
	 CwmSzuEJnWOkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E11260F9F;
	Fri,  6 Feb 2026 06:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A452EB
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 06:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D173160EE6
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 06:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrzljOe4jc6Z for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 06:00:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B90C460F9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90C460F9F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B90C460F9F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 06:00:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43629377370so425483f8f.3
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 22:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770357601; x=1770962401;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TanOD/f70eV2PFWCPdcjszrEAEajl0pOCIxJC0uVaE=;
 b=SnDrxR1XAgsI2LYhG1V0ryUvinTV/tpric7CMMR1jkHckkrIF/7qFP+PfKusKq+4jY
 R9LQ1AcucHfO6qtJ6WZPzqxGyV8vPOYflkXZL3J0rnVQu/bJMjnMjSq9sCcovU4kHRER
 JlBMMG/Ft730Oi5lxs/GZRG+ymjeqBJeNkHheY9N90jteN8pz4eFZg2JckT0Si6gJ02z
 xlD4/nfFuVTlo+uFGtXPXFYtOxiJ+rjBwmNa+JuKlVzouS/HiTd9eyZSLGsEx+aB1YE6
 lxbq8TClzMdDF9BxB2eaT/DIylmhYARyAzRveTxJVi35GbtFGBwd3NUme8WST1++MeVq
 NE2Q==
X-Gm-Message-State: AOJu0YwrH5hcq4BGkq8Kvvx0mACUh7IFzsGU64vuTVe/IfMDmRA7+yER
 J6ruwLmYY+F08pSaQh8bltwsCLqeuPB7klyKe+gM1FRdhEe+InNum4fBngkRKw==
X-Gm-Gg: AZuq6aLgLk+KqcelnUUAOAdonWPPwsR0zJy5S+EqtBnFsTF4KfewY9Z8Oy8OJ374Os4
 ll8SxGsBbjMxyia66HP2F3+9TXU1o0BQ1dEynSu2HlspeTqNWwm1EWxMXVAhctO8WAolBgW7XiN
 mTR7AfKcNo4i9v/1pDjZwwC1j7oNlLfH49FO45S+P2GY6DtCMoqyr4EV9h6KNrJXHQffllB1ny3
 kDZyYGwVuN+XUyawDU1SJQyGoQKs65ch7f4JAWuupsVws/dvJE1+w55x+TmjGz8ehrdAPX8s22p
 6QLX/HANzV//KzRMIeR/tJE0ayhMr0N2Ft94eHXOlxEhEdLGrSEdCSKL1O2YktqQBMpY9B3PQgL
 xJBOh2UWBdrux/pz/Hw2fwb7y6Dpqq7pVbdeYEPbhwpIatYSw643vqrL74TRV0+rxT+NUTrPE+R
 Nuu6tlZPNnFt2RNCb7qgQZBMNJE1Xi
X-Received: by 2002:a05:600c:1388:b0:47b:da85:b9ef with SMTP id
 5b1f17b1804b1-483201e4cf8mr19978045e9.16.1770351470385; 
 Thu, 05 Feb 2026 20:17:50 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320983f18sm11652955e9.8.2026.02.05.20.17.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:17:50 -0800 (PST)
Message-ID: <69856b6e.7b0a0220.13c5f1.5d72@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 06 Feb 2026 04:17:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770357601; x=1770962401; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7TanOD/f70eV2PFWCPdcjszrEAEajl0pOCIxJC0uVaE=;
 b=mxSudesnel6GzOky5NTbFju2QxMRzTfs0cMmZjk3YISRo2jPKRbe6yvK8fy834e+M3
 NcLbXYot+CFcWKV4ynJCgxpeW3BK+3iwiVW6saEIqniRVKLxv+mHYzagbaOlq4tfw8bD
 HJaqwLgyBZP/7ZgOuFDIFKCM8Mj2zCvwXANmAazfLWfc20Fjqp9F+XboBtS/BwKQZQAL
 KBoaofYKwsnQUgzpHyWb8pVxiaDubf52PufRGi1v7MxS/p/uLdkSArkXMqwUrdojn4yv
 kY1U/ShJaWErMTIed8zd53cV/wJj37OROrovSPsO/WVxgJvUmIZUngtKHgVUX7hYIE3s
 Vn7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mxSudesn
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-05
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

Autobuild statistics for 2026-02-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 31  |  0  | 42  |
  2025.11.x  |  4  |  6  |  0  | 10  |
    master   | 59  | 102 |  1  | 162 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
              libopenssl-3.6.1 | 4 
     libphidget-2.1.9.20190409 | 3 
                  libva-2.23.0 | 3 
                   perl-5.42.0 | 3 
                     php-8.5.2 | 3 
              skalibs-2.14.3.0 | 3 
           uboot-tools-2025.10 | 3 
uhttpd-15346de8d3ba42200249... | 3 
                 c-icap-0.5.10 | 2 
  gobject-introspection-1.84.0 | 2 
libdill-32d0e8b733416208e04... | 2 
             libgphoto2-2.5.33 | 2 
                  linux-6.18.8 | 2 
               linux-pam-1.6.1 | 2 
                   linux-tools | 2 
            lua-sdl2-2.0.5-6.0 | 2 
                memtest86-7.20 | 2 
      passt-2025_06_11.0293c6f | 2 
python-remi-2022.7.27-37-g1... | 2 
ustream-ssl-5a81c108d20e247... | 2 
          aardvark-dns-v1.17.0 | 1 
                 aichat-0.30.0 | 1 
amazon-ecr-credential-helpe... | 1 
                  broot-1.54.0 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
  distribution-registry-v3.0.0 | 1 
              e2fsprogs-1.47.3 | 1 
        edk2-edk2-stable202508 | 1 
                    fcft-3.3.2 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
                   flann-1.9.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
               graphene-1.10.8 | 1 
          host-intltool-0.51.0 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
          host-tipidee-0.0.5.1 | 1 
                   i2pd-2.58.0 | 1 
                  iozone-3.508 | 1 
           janus-gateway-1.1.2 | 1 
                  jasper-4.2.8 | 1 
                     kbd-2.9.0 | 1 
                  libenca-1.19 | 1 
                  libnss-3.120 | 1 
                libressl-3.9.2 | 1 
                linux-firmware | 1 
                    lua-ev-1.5 | 1 
                       mrp-1.2 | 1 
                    ne10-1.2.1 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                    opus-1.6.1 | 1 
                  pdmenu-1.3.6 | 1 
               pistache-0.4.26 | 1 
                 rtl_433-25.02 | 1 
          sane-airscan-0.99.33 | 1 
           sane-backends-1.1.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                   strace-6.18 | 1 
              tailscale-1.78.1 | 1 
ulog-0389d243352255f6182326... | 1 
           xtables-addons-3.24 | 1 
                     yq-4.49.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/f8cf133322fe2020f5b88eb036bc0a3f142b0329 | ORPH
    i686     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/b4956a540853b2ce4dcfaaf68fbe9c63b783bfd4 |     
    i486     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/1145f5c22a1f9f6200bd8525a5874f45c64f886f | ORPH
   armeb     |          broot-1.54.0          | NOK | https://autobuild.buildroot.org/results/ebf54be1e13a094257cba268424aeb79373492d7 |     
   armeb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/279e698ff7773810876b1c3ac47130714ee68db8 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e14f4cb5e0225b00f669416900aef1e044409ec4 | ORPH
powerpc64le  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/c37fcd7885581c292da6ddbf2ae8ba026f447b26 | ORPH
    arc      |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/49f67addd5b447271bfd331fc4b9b908c2490350 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/12a917ad9f32c1311b84d3d5aa2204f86aa0421d | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/c874135e7d54af3cf79f4ac717e0038a1ead3e8a | ORPH
    mips     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/2a5f5eb0d16d5bac7c4cced2b53088633e0fdaba | ORPH
    i686     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/62d04beee5202a08f7b237097d79b46f16377828 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/431a16708585eaddf60d93972e5bb5cbbd4b5446 | ORPH
   s390x     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/dc449c698e0d83580bdd3bd135836e00cda5d603 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/b21a6a83a8f1a77ece21146d845c816649c36695 |     
   mips64    |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/b3569bff659f25101c5bdf939732cca00c0abb78 |     
powerpc64le  | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/3a0a2866ecfc97ac6296080ab37273d20f340a0c |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/df882e1b622eedefed04dcc05ca54a0d187b4089 |     
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/56230fe352db807e035c79eac3eadb733c061dff | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3f44a5f289d5287c0cdabb7ca08cb672569e22c1 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/29c3c087644758aebe388d1ed4002f25cd219132 | ORPH
 powerpc64   |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/0b307de9597b60b9fbf27cdcc95ba6fc1737445a |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/6bdcb89d753429b92b406ef0470ac932fa5b503b |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/2ae2a7c880b916e93b61c90da00b5d6e4b3bd545 |     
   sparc     |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/c64118fe3b653c156c9cfe5024de12e64ea330e4 |     
 microblaze  |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/c45a24f1479758a4229f45df8912a106fdbfc7e8 |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c6e42ab3b0307928ba63763dc751850681e1eec7 |     
    mips     |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/70b398004208de639df696146afd0e1fa53123d8 |     
  mips64el   |          jasper-4.2.8          | NOK | https://autobuild.buildroot.org/results/870d6adbac166b22cce217628d477b1bce538320 |     
 microblaze  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2b93d2307bfe3a680a96f5e39fcbe70fb7df8975 | ORPH
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/4c360fdb8005bfbd6610e18e5b845f80929545e6 |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/bbc9a49b47a4fe9c9d31e6d869d32e9d79807d03 |     
  aarch64    |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/c0aa7b3e3ae1bdc64805d465abd304aaddb09f5e | ORPH
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/349b91308048b05e5a3c8207547f3173c298102b |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/936a56cc58a94e2b3f0f6a183655011f00855364 |     
    m68k     |          libnss-3.120          | NOK | https://autobuild.buildroot.org/results/62097b886b31b7716d0f6a447993c8d63433d1f0 |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/990ddf365e897a74f377f890398926abf576cf93 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/21d2716bb66b8c39ad399b0d0f3989856b4beac7 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/1839acb0d0949abece4cf0cce2cc012cce292055 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/75a59cd23624d36c09e765c0b2559844f2e712ee | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4e1a2db22f6d48f1bcf566788cbfd597167c6eb9 |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/12cfe3bf26884a34d53a6bda836e3e9a1e6f9472 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5e6a68077eaddf5c375483c3df99b96a8f811ff8 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/f863d8219f437907b8d396da27965946eab35b54 | ORPH
   armeb     |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/e61c0a6213ab4f51540b5a1d004ccb991e29e145 |     
    or1k     |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/8832bed2ec5b98ffccea86e55aeaadd27bf638a3 |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/0bde73a57b0ec238d27b1de59bddf18792e95043 |     
  powerpc    |          linux-6.18.8          | NOK | https://autobuild.buildroot.org/results/ab3e8215a0037dfb98c642002f1b20a6c57fbc2c | ORPH
    sh4a     |          linux-6.18.8          | NOK | https://autobuild.buildroot.org/results/042fbebb30389530b2fc8abe8d79aa211cba02f4 | ORPH
microblazeel |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/9e79d9cf98cbff607c4df4e1be9337f5ebb07733 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d852b45bd2c7201d3cd9af894b579d471d7b38af | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/59c17e1bea27c3e56941bfe454b7c63528c50ea9 | ORPH
   sh4eb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/01ed3684a86b469392d9a1da9a4df936a1f75940 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/19f002509b764311a4a6279fa1a7a51bf0fdd90c | ORPH
    mips     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/118b981c34d5a1511d78f46b519ffbaf3508783a |     
   s390x     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/0fac25484e38eac6c8ad5b4cdf57e7d096977826 |     
   sparc     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/2d8406b4f4d660b77a1d5a8e1c9b655e559750af |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/7d3dbdcc6b2bb5d883e6baf77ca56652359b05d9 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/d6fe245d4c0fa01d1d3c0f392a0228cd02e97218 |     
    mips     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/b0b1cdf0efd3d1bf44907131869bb363f12b239a |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/d4f95c8130849544a4506db3a746b1f9a4acae61 |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/5ed6e101c2c5f995289e210a3b87b4d2b92dd3a4 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/932439f8d31891811e7b9339968b502bb967751c |     
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/cb9b155cf467dab34e934418a7a4873a48e92776 | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8c166f71f81f9b2b3437786430c0f0967107d0b1 | ORPH
    arm      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/4ba2a04ff7a55e071edddbc10f12298a68a350f9 |     
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/ce0ae9d2e5fe30fc3e2f5837b95d3f8c5c0e26c2 |     
microblazeel |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/1a74d7dccf43d288bbdd17ed853d2fdd27247861 |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/9f82e72ca271bbd29a9422e4acc7d296c4ba4c4d |     
 microblaze  |           php-8.5.2            | NOK | https://autobuild.buildroot.org/results/d000e73b52d8428c5f660c0552d42e2bbc3be602 |     
microblazeel |           php-8.5.2            | NOK | https://autobuild.buildroot.org/results/0d38f669d342f6b47ff20aa1ec3958a749daea72 |     
microblazeel |           php-8.5.2            | NOK | https://autobuild.buildroot.org/results/0e0045b4d349a9b5c18fc10187333790b50fc907 |     
loongarch64  |        pistache-0.4.26         | NOK | https://autobuild.buildroot.org/results/e07803006e91c492b42a137ec1b068d6d672aba5 | ORPH
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/068cd069a46a43cb54556a5de7c7f6529f1b4aca |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/02cebb93ad9386ca30dc292098321426d21d5550 |     
   s390x     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/30c12b668310a7603fa2755c1a8d5a78e12fcd9d |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/830374dcce8f29ad336cf8060bda552119c8377a |     
    arm      |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/bfbcf2087e2781b9a5a0705f9b66f787a8f3fd38 |     
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/d085190e4fbc3b68584e1fd2cf94435bd2e05a70 |     
powerpc64le  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/3b33e10ddcfe728c44bda51416e64c68ab188c15 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/b9111ced7da15586596671547abcbd9301bf6ec2 |     
   xtensa    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1f2a235c004a55e42df44ffbece824459a99f143 |     
    hppa     |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/918eb1439cf31fdb65465ae3f2239624983eefa1 |     
   x86_64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/cd37c877b3461062623f50222927a1955b366ea4 |     
   x86_64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/9c634435bc6e8dabde1b823a3a302382503e5dfc | ORPH
   xtensa    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/818197b4dd148dd78cbeb313ac22eefeacbe38f6 | ORPH
   sh4aeb    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/eadf459ff2847e483ca750aa9c3b5aeb52822f56 | ORPH
   sh4eb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cc265d34aed684b88032edd04ca0fc88186ec676 | ORPH
microblazeel | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/854f43bade3f0162f5bcb802866411d64f548c27 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ef8fb64b80766e1d4ca899cdad068edb0695b91b | ORPH
   s390x     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/2ed22139550e115a6d0a5c8f95eefbceb8d7ba7e |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/788bb9559ff6945e03e89354a84e6fc885bde025 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/a382419f591bbcfdc73fcd6d3648f280ba621a4f |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ed79c60009354f08f9827d52d2b69ff8e12c3098 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/386e8218be444f085244f2c58b028b2b9921c97d |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/48814b83fab04f73f7af5f23d1decf0510fa6572 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/e970b259912d07b00b979305248f5a013138e0f3 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ef201a7d04330463ce46b93e6d5702dfefc6ad6c |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/49227d8c7a6c0b2503bc67c10e331320b34ffde2 |     
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5723ed0657fdcb3973dae0b7457f979f6ae9134b | ORPH
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/7f417bf6b5e09abc4464218552ae0af72a86f66c | ORPH
    arm      |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/bb54642139302cece05b00674eb0b099456b3912 | ORPH
   s390x     |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/52ec88fdcfea00f32a4dffea5cebb901ecdbd1ad |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

              e2fsprogs-1.47.3 | 1 
           libmicrohttpd-1.0.2 | 1 
            libxkbcommon-1.9.2 | 1 
        ltp-testsuite-20250530 | 1 
                    mpir-3.0.0 | 1 
                openssh-10.2p1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/97e2dbd855a40b5de322b21f88674780c18667af | ORPH
   xtensa    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/967cb7dd264641e377398133ccf7e1cbea6c707a |     
    arm      |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/14b5c7d1fddb143a241dcc9089b5a9e60e642861 |     
 aarch64_be  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/7cd2c7ee247faa1b32b9d7b68c981698ccb5faae |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/89df277d8aa034d5302af6ba970f6f081afa4dc2 |     
   mipsel    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/0b5bcc4bd14448d2774cc2770f9043216729e462 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 8 
                libselinux-3.7 | 7 
              libopenssl-3.4.4 | 3 
              xmlstarlet-1.6.1 | 3 
                       unknown | 2 
               graphene-1.10.8 | 1 
 host-softether-4.30-9700-beta | 1 
         lttng-modules-2.13.22 | 1 
                 nethogs-0.8.8 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 
       riemann-c-client-1.10.5 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/37cb8f50ad91ee500e3ecd62f1dd018542aab929 | ORPH
   mipsel    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/0f67317ab01d091e111321101bbdb4ca3bca5043 |     
   mipsel    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/5a74f6a915532218818fe15acb084f07ac86a310 |     
 powerpc64   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/19f696becb8d3f99d6e43924382625518326a3db |     
microblazeel |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/842f30f60379dc2c546dfe93639d28d97ff021bf |     
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/63b3760d05977501e64641452bbe7ae604a3a5be |     
    i686     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f44e42282ef1cd6911359d16bb07ae39be84352f |     
    i686     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f71103ebe7d56a7aaabcb5b6488d947492146c95 |     
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f169fe93488ea026ecd553194d4e32110e99ba7d |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/83a70b785437f06330025cd1a48473bd51af43ae |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/6b7a5b0b68cf9f6b944d897b332018a05969111a | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/0351b6369d05f4922d32a4fe0769ec0efb7e4470 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/e29a7957eccfd56182f24afee376b90791f53552 | ORPH
  aarch64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/15a4b2359b40b4081b8f80a5a1c847411375158b |     
microblazeel |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/9a126e2310c7a0da54c7efba54bd0b112f019bc3 |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/33d984d27a5183721b14aba138f0e1509702bf9f |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/605c6af3a916b5a6c5e6c3a997fd8c68d6239005 |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/12e887d2f1b1f97d89ffd761849876b5c7ac96f6 |     
   sh4aeb    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/d5a98aa1fa1c2fd28dcb5a5d04f40b74cb5e52c4 |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/e6876c932a011c6e5f0e1fa61128063466d57a2a |     
 microblaze  |     lttng-modules-2.13.22      | NOK | https://autobuild.buildroot.org/results/f7c0686284aeac578d2f37a9f339bdfe13a8ead1 |     
   xtensa    |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/489e92cf7d1d1f7c29b452f09e06872cc61b9116 |     
microblazeel |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/b4e3d16c92d4ac453212afc746209c767eabd5fb |     
    i686     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/906a14b8c460fa59a85c9ff42f349ad448a85b63 |     
    i686     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/cdea37c444bfa4331106e2a0f21e48ada3e9c814 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/173d3213a129ba93fdc900cd256adeadf2dd4416 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/627c99e90a95ce52e443d5907ab57d91ee81bde9 |     
    mips     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/bbd001d40e9dd1afb1da868133c4a81231779631 |     
 aarch64_be  |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/f4d569ddd68ba05e1ec71f156326fd0495a21080 | ORPH
  aarch64    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/7283b010de15ba143eae528c4d69c515bcf36bee | ORPH
  riscv64    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/f8808c867839f9ad3b0ed4ba37b0a5f61325a4f3 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
