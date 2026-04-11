Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36017F45A1D
	for <buildroot@archiver.kernel.org>; Sat, 11 Apr 2026 03:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D849C41119;
	Sat, 11 Apr 2026 03:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfnY2IrAaP05; Sat, 11 Apr 2026 03:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BDF4111A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775878032;
	bh=dTeOgd7EEBzgLzmFkMPZ/nIycmrVZ3kjHdj+xOkLci0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sF1+BuwdWdP926tCVumXK7ArNrbnHHu6CPTKUXpSHu8RhKTzRZCOmBWjVA7g7IGPy
	 31aEKI0OsMdsOAM7bBnQGIO9/Ymt/nnlvcocwee0XMgltLrPki2RzfneehSuDoEMF9
	 yfOYF2qoqpekVdNIgheW8rbMas4S8h4A3K4TgvClq0ADSHSrYL+y9UaoM3y6BYJ/Um
	 Q5wLaCWwVY2xiFJ+fuqlYrMBaSZ9YLWS9eicdzua0dYPTLfXN1SL03Pboi2NOT+uQ6
	 0X8mR3PsHBvz1O05WOggHKYy8sK/jNpDJFNdlXCrr/Q+iD8w8jvb0aaitPgOr2DvGy
	 2jm/oDEfD+Uqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40BDF4111A;
	Sat, 11 Apr 2026 03:27:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A85194
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 03:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B52261298
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 03:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGfmJNLyH1A2 for <buildroot@buildroot.org>;
 Sat, 11 Apr 2026 03:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7BDC61297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7BDC61297
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7BDC61297
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 03:27:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso31398125e9.2
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 20:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775878027; x=1776482827;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkjyotxQJUfXj2u1CsykouSUsCm1WRPYupi2p/pKd4s=;
 b=c/ktaerHRyVLlxMQhXjrF+HvT9VadjzGdtLXirqvjq90K6Zaw0TRtPokJg1bPR1/mP
 HuL2IDZDavaePbhekJWVRWdfnU8+wOhF+9uJrzXPxj8IEc/1AigomCY99IQvQr8osBxj
 35qNmRd5DRpqhBh038uVVIpm0ipASXfapNKGtRenuzSm7zU8o2wV8AIuuPow4+fUgygv
 DfqWRc443trsiLXqVuq+llyw/41wA53gIzGl8yrRIoQzRUQJNvEA5BtDPyWb7YxvkIcT
 f9EEFB0yhcZA1Tn1jl6/R8ZPemH2VGQBA7yAaa54cxerXXFgt3WBiNpmUdCjhhoeRUIB
 5/Nw==
X-Gm-Message-State: AOJu0YwwT8DP1ELvQRnTpW/5yFbGLxP9IdBcJ+Hm4W1waXjKl9uLxebJ
 4/xLnpBZ2JbrU42MpyX3DM54MZRvOnDAwRzSSbNYoIRo/5a4G+VCuJFtioRtdcG+
X-Gm-Gg: AeBDietoY5FL79qPyFfdqnHMJ2R2e0OUeWRGoIOoDaEKLWaZvfYJCElfRmPw67bYD6x
 vZs7Ck1EvzUNXmSWEF4J4GVjmZWK27nbexkYX3usSuMqufWdmjF7ad+SPvEKFO2zrnNCEDVUZpt
 5nnGhicLe5RE1vUyhn0DOa4Q4f4ZyZqFUogOLyARFJxDtXiHHDBJvUXoJhvXg1uKSaGddjp/VNE
 2QZGvjrVe/jHCw8D3b8/DQFchRWKlBEsA0FtottZp4FrZb4k+IEcZ5EejUIigf/FIqNLslH2Gpf
 GZNMRLofHo0VQQXkygT6gYQ0ehmDhgTHc+btTOudhacM4pR3MeH4Fqqcu+AhjXQKMRhygkUiqTN
 vymnYyOANag93oGPBji8rhVvj/zqNS+Ky1ZjL34V8StQYpyjvVLFOzidNNirrD5UbTiZDTES3Iv
 d+cG3gpB+9PSYbw++o4fHf9rwP20ZrTQpOw1/Hn2Jw
X-Received: by 2002:a05:600c:a415:b0:485:419c:4eba with SMTP id
 5b1f17b1804b1-488d67bf7abmr54907995e9.1.1775878026368; 
 Fri, 10 Apr 2026 20:27:06 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d683c902sm36278875e9.22.2026.04.10.20.27.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 20:27:06 -0700 (PDT)
Message-ID: <69d9bf8a.050a0220.1e9186.e0d2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 11 Apr 2026 03:27:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775878027; x=1776482827; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KkjyotxQJUfXj2u1CsykouSUsCm1WRPYupi2p/pKd4s=;
 b=YMWPh2iX17BZhWa6vVnU46Niab96/3K84zPL2nBV0xZFBWqn8t+fJxmWCB6NClHbXy
 vuOjPNRojv9Abu7sk/ISgy/W00wMLI1PsYDheDFAZBSl3OqzkEJHia8SYJU9SAd8QO8o
 aMWtCsNDP8PTw/ns3O+jnAuSC4tlAuWxR8r6Jg4isE4ILRbvWvUC1WZm8JgMWMAKHcqL
 12Kl1RU/zWiBOtDZ7j0bxzJpt6Uv/ZD7Cil75yb53oD+7ff80qICkKM6tomtOVAbRlm7
 Sbtcir3qqRJnPDsI7X/aMOLiZ1Pn++69FHD1M2QfwY/dbU1DskNgSqaD/KHEF/fFQuXd
 5Llw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YMWPh2iX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-10
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

Autobuild statistics for 2026-04-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 19  | 20  |  0  | 39  |
  2025.11.x  |  3  |  6  |  0  |  9  |
    master   | 47  | 104 |  2  | 153 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.84.0 | 7 
odhcp6c-f19dd37fb467c9cf10c... | 5 
                  libnfs-6.0.2 | 4 
       shadowsocks-libev-3.3.5 | 4 
glibc-2.43-17-gdd9945c0ba40... | 3 
                  libnss-3.122 | 3 
                       unknown | 3 
                 c-icap-0.5.10 | 2 
             dahdi-linux-3.3.0 | 2 
                    gawk-5.4.0 | 2 
           ghostscript-10.06.0 | 2 
    host-mender-artifact-4.2.0 | 2 
               host-runc-1.3.0 | 2 
libdill-32d0e8b733416208e04... | 2 
                 linux-headers | 2 
               nushell-0.108.0 | 2 
           oath-toolkit-2.6.14 | 2 
phidgetwebservice-2.1.9.201... | 2 
        s6-linux-utils-2.6.2.1 | 2 
                 s6-rc-0.5.5.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.3 | 2 
                  bitcoin-30.2 | 1 
          cloudflared-2025.8.1 | 1 
              containerd-2.0.7 | 1 
 docker-credential-gcr-v2.1.30 | 1 
              e2fsprogs-1.47.4 | 1 
                  ffmpeg-6.1.4 | 1 
                flashrom-1.7.0 | 1 
                 fwts-25.11.00 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
      gst1-plugins-bad-1.24.13 | 1 
                   guile-3.0.9 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.88.0 | 1 
          host-xfsprogs-6.18.0 | 1 
                   i2pd-2.59.0 | 1 
                   iotools-1.8 | 1 
               iproute2-6.17.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 lapack-3.12.1 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
         libhdhomerun-20210624 | 1 
           libmicrohttpd-1.0.3 | 1 
                libmpeg2-0.5.1 | 1 
                  libsepol-3.9 | 1 
                 linux-6.19.11 | 1 
                    lua-ev-1.5 | 1 
                 mdevd-0.1.6.5 | 1 
                       mrp-1.2 | 1 
             ntfs-3g-2022.10.3 | 1 
                opencv4-4.13.0 | 1 
              openjdk-21.0.4+7 | 1 
      passt-2025_06_11.0293c6f | 1 
          pkcs11-helper-1.30.0 | 1 
           python-html5lib-1.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
              python-xlib-0.33 | 1 
           python-zlmdb-23.1.1 | 1 
                   s6-2.13.1.0 | 1 
              skalibs-2.14.3.0 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-4.1.3 | 1 
        util-linux-libs-2.41.3 | 1 
            vorbis-tools-1.4.3 | 1 
                    webp-1.6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          bitcoin-30.2          | NOK | https://autobuild.buildroot.org/results/28d8e1520860fd2e621c444985a2bfcf19d60ec9 |     
    sh4a     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/81d803eee4b554ce7b464d28db1f9171a75eb0f4 | ORPH
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/cb0026442669d0ea8468865a00493e7907f0514c | ORPH
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/78481b1585ac2c5b623c3215b3ce084cf06291de |     
powerpc64le  |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/9eda1abe80b6a53ff15ab42123bc88c9e1d3745e |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d4ba13ed49dc7fd55db0a16846170370f293fd39 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0f30d057eefa7a410d634fed7ba9f9e1d0112742 | ORPH
   x86_64    | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/e55f78d957950f1c43f9d0dab6d7a6412f5f19f2 | ORPH
   mipsel    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/6157d3def31f6a55f9fb602207d928fceacef391 | ORPH
   s390x     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/ef95498014d8854c8d56c0b25079ec7060709577 |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/391952f15eaa2b572d0556607896b7cc365c33e1 |     
    arm      |         fwts-25.11.00          | NOK | https://autobuild.buildroot.org/results/859390dbd2a1d7b3bf43588a461a2ff7dc66f92b | ORPH
   armeb     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/64095e94154bf3ef695afe85979db4a012cc2e8c | ORPH
  mips64el   |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/518c4c37d046b7fd0750e8166b9f50c5f36cf6f1 | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b617db05e754ed54b3b1e3a533faf808bb303a22 | ORPH
 microblaze  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/73b3f27b66a9c1bfb611d3dbecd197bbf3fd2027 | ORPH
    m68k     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/97d5b569e77c8f56bd565f3f2a42ec704ab218cf |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ef06373de56a170ac7495579e3c8a2de02434f37 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/e4e1b6327cacb6c681b84a02195e1be85c2eb2f0 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/bdd8f09cc380828423edd6e4283220e5833ce9a9 |     
   mips64    | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d744babac4d3b6cd6098b5a0bf9d073498dfafde |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8fc5ef79fbcde4fff8b0594711a061619807e4a4 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/32bf0dcdc2e7a9e8d89a99fee92eea3de8018ac3 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0cf6cbd4037f9f926566483a4e38f3d87ed57029 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8d0c789c458a11e3c93f8f82e579c39fc8b86e2b | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/046a8d1f849901b8008f0ee505cd6b4bb0b4dfa9 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/133be6cefed0624647d603b799dd13ef1c035ca2 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/57543e008602af215de0f3211c9be344f6475413 | ORPH
microblazeel |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/07c5c13ef04acb2531d781a8d1fa1b377a7a1c91 | ORPH
   sparc     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/f67f2aa5a9516becc8ed79c9e34fdad58302d2b0 |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/24b8c786be3366c4aee7b78ccdc0a0206f1621ff | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/980606d046272261b94a9a6f831ed291537b0c98 |     
powerpc64le  |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/490af14d525fdfe9a9f688f1b71a5d23a93a1bd6 |     
  powerpc    |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/b34070a54f5301dba7821b24f01c25118707859d |     
microblazeel |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/732335a399dab40193a45bb24f0c692cdf9a40cf |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/80e5bec7212f7e5a56b4604c4823c41d4e1304ef |     
  mips64el   |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/97789305b7b7b0bcf93699bee79277e12cefeedf | ORPH
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/21946369168b069a485bc78127cf11a8e69361be |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/c2b241c12a616706dd4f270ce9d80ac873a7a21f |     
   mips64    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/21e012f938b951fe347f4762bfb0eee811aca207 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/72184d67821c9e806f9e2738dd3bd7dfe85f4107 | ORPH
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/2ee97a98d8f9227369c0164827d71c1ac33f7c07 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/8d466d82862e088ec28cf1d38b0c051c17960556 |     
 powerpc64   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/792882339644b3b3b3c11d20539aeea24bea7902 |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/d6935c89bec274718fdf843ccbdc940d421b1628 |     
   armeb     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/cde5508c3e2ea355ec4f0126f9d87990acf3d26d |     
  riscv32    |      libmicrohttpd-1.0.3       | NOK | https://autobuild.buildroot.org/results/12808e4a13dc234646af3a704734706b08511c44 |     
  powerpc    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/29f95e00973a5a7624fe4bf116d8cf797ffffd4c | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/33e4987076ebfc711245c4a5565439bdbab0d78e | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/cd25e7871255fa2837920c5ab5f16d83f0f531c4 | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f954a09e236a10c90022f0ba8475ca4e41ba7fec | ORPH
    hppa     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/bb77a0ba59319f4281f7c7dbf44f48204d2e45c5 | ORPH
 microblaze  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/5be4b3917a9e85a52efdaae6de607c01582aa72e |     
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/1027f176ef9a625bf38a0aaf7685ed32d80068e3 |     
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/6fbe1012e02d7046ef9b8d7901e9081e65862797 |     
   mipsel    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/ac79c3ab4f940a19693b84d496e19d1e858bad73 |     
loongarch64  |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/8609b315cb5ec48c5499f3c991d9de41d8f915bc | ORPH
powerpc64le  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/a1d24186b07d5a2fcefc73d399af4c9fb82a90d5 |     
   mips64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f923481dc9085e99e555101363770a318e1c562a |     
  powerpc    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/85066797df4a2ca59da5f885048168f27a91f7e8 |     
    or1k     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/f1bbb3779257893c641c3da0f5418261c99961a3 |     
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/87d6555feb4ef3d3cc15655062f0a35fde0d7b6b |     
loongarch64  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/385eb6ee095af6034b2de87bae7ba693757353ee | ORPH
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/a09a94fc9b8e079c5df62bad37db84c7603c278a | ORPH
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/f8cb7d151af69acdf76311b17adbf151e7a53c5a | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/b140bd11ec0f696926ac05d2f3fe2190214178fe |     
  aarch64    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/122cd851f7ff0a10487376f25f370078ed4224b8 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/aed5fcd3c22315c521c3abef0a696436da1e15cf |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4a434f1b1cfe6dd7b4bd6a2b87295bb11e91e25c |     
  aarch64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/97a50de85b161f595b6a8f17a7ba64cd328aec2e |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/5ebe2128a3ccd674021da56411d2ed3ef97618d1 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/c829ec68cf716a4380e4e69821f1b2062d418379 |     
 aarch64_be  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/3f24dff8a4c3aea48517618a203460551f1f4d69 |     
    sh4      |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/99438e20a672aa3219edb01cd7152e63fa1b114a |     
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/868ca09baf74c095cb497b7a43b3e2a6ed587f5e | ORPH
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/20216534d317dc92c8905a18c0d6aff13bafdcfc |     
    sh4      | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/13967fc94850e27299d758ee3ed3537e840bd288 |     
   mips64    |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/a59bcf4d6a72e18663f9017a3c34c8d135de6ebb | ORPH
  aarch64    |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/394a6629d5a7610d3aa59550f20e53d024344f90 |     
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f8076d64a268ce9ff1867d8372508f1c176042dd |     
    arc      |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/dc77089f4820b7c4b31547dcca71532a59cbef32 |     
  aarch64    |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/2d16b4458b6555f6d2e57261191c060e4c0185e9 |     
   x86_64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/f64b25a74bfb33d009799115d7be944c4b80e59b |     
    or1k     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/7e965bae849eb662bb71695947bd169e5d0fb27f |     
    arc      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/7e701d07ce00c1fc01948a99c5d9fff3c880a384 |     
 microblaze  |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/ffeca70ff7fe1857d566a886d371c94c84edcde8 |     
microblazeel |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/c7e51ea071c3e3470400a729c005913268b40ed2 |     
    i686     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/bb0246ef696950d46d8f34281a0fa6e9e559210a | ORPH
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/071923adfb776a3b3a3095bfb889a9e548003a7a | ORPH
    i686     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/4312ffd3a0e982beb717b906e1a008a0562a49f6 | ORPH
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/4d0d2f25bc568ca4839b7449156ef82f3ebfc954 | ORPH
powerpc64le  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0f51cfb6cf4a6cfb6935ab9ab3be48f5edc5b601 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/c66c53e94f1d546f37e3355cb6b817db240543ea | ORPH
  aarch64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/4517f2e64055b72256a9af73b7b20459adec22ea | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/05b8419b6eb05347c19bfe8224712ad096042cc1 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b54aee4ef77abbc90a09fca2dfe36b9eca0b7f8f | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/f37ab6a9f24785b8e88653c4cfc11f85147ffe9e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3b1b1d748f2201657883653203537d95d1311395 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/15cb1e62fe5e2cfbeb7a861e4cb88d37ba20fe66 |     
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/7688b282f6f7ff14f52b6d32ee1bc30052280b3f | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/379cb1382987bb51a80f9b53202a79c32f1fa5b1 | ORPH
    or1k     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/a61b8c9a4ad306df71d5e9bf873c828f67977efe |     
  aarch64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/34ab56db9a2a17ff43a464d82121e73823bdd954 |     
  powerpc    |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/3f6ab515f86f3677d20b763cc89d4a6d7508bff6 |     
   sparc     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/55fd38904a2a3e0a9d29b505cf7a321a6d21ffe6 | ORPH
  powerpc    |           webp-1.6.0           | NOK | https://autobuild.buildroot.org/results/150c7643d2e8d772655aa3df44c66323062be0f9 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   dante-1.4.4 | 1 
             libgphoto2-2.5.33 | 1 
package/linux-headers/linux... | 1 
             parsec-tool-0.7.0 | 1 
        perl-xml-libxml-2.0134 | 1 
                 protobuf-29.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e8fe5b6183e50757e82fc0ad9b8135cfc3c7ff41 | ORPH
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/2115fc8005ed56f81ac05f2487ec0e144024a055 |     
    arc      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5a8d8f64a58f040284c4fde1c1a8379a1182fe68 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/2c8a368857d09c296755e5a6515e9b9fbc2bc03b |     
    m68k     |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/cd54d1232dab24e7be770f4ccf48408effdd458d |     
   mipsel    |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/11cd2c2184a1fe4812dda189d21e3e4f98e1974a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
                       unknown | 2 
                    azmq-1.0.3 | 1 
                  giflib-5.2.2 | 1 
  gobject-introspection-1.82.0 | 1 
           host-go-src-1.23.12 | 1 
host-netsurf-buildsystem-75... | 1 
              host-rust-1.82.0 | 1 
                libcurl-8.19.0 | 1 
                libdnet-1.18.0 | 1 
                 libgee-0.20.6 | 1 
                   libks-2.0.5 | 1 
     libphidget-2.1.9.20190409 | 1 
              libsodium-1.0.18 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   perl-5.40.3 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ef049fb5526f0c8ed2a2f99f9d235e311a606a0f |     
   armeb     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/38bc1ca5b4104aa55b1aa7a3c1c38f3106f0505c |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/fd685eaca30de856dbd801a149407fbf1f2be99c | ORPH
    mips     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/7ccc16b12956c8d4bb64001e7fe6665c33cb121d |     
powerpc64le  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/1c55618ffb7f5b283693052316656684cc611557 | ORPH
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c209b5d6d83e8e4e9e410a9d31e82cdb0ac346fe |     
    m68k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/1ab22c1f522118c9e61a1141f975d778f02f0dec |     
microblazeel |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c2f684f0e125291ab929ce8067cae29d11af90fd |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0234f196e967d2b04a24722c408e201ba9624286 |     
   mipsel    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/a452cab34da48054f1baf115f631d7260a75282f |     
   s390x     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/b47158c6d15ca44d68ac9e37bbbdd1fe4b68882a | ORPH
    m68k     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/0c3c101d2d97fd208d8954c609c3974138674f77 |     
 aarch64_be  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/f53ecbf2af5f4ced4b1d9adc9efec066a9b9932a | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dfa3cc5fd4f800c234cac9504628313bcbb6dae6 |     
microblazeel |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/9aa54caa522800b8ed5250fdd8c8bb6a96c0a44f |     
microblazeel |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/0e7403475d3c018ab9cea860142d68cd749fbe7d | ORPH
  powerpc    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/890985e8d9621e083c762b5b186ebb213d8d3c27 |     
    m68k     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/6fe368c1ea330b0b6679b3f57a97eed75ebaf5dd |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6b91fa7274d2d3fb4f115f1fb65274d667a02176 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/d8ccfaa73cfe2f1d3150a7278697081bca8c9d92 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
