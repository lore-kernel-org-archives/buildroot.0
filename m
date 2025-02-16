Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672DEC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 04:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B899D60BD6;
	Sun, 16 Feb 2025 04:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 851HoebCW114; Sun, 16 Feb 2025 04:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 012B660BCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 012B660BCC;
	Sun, 16 Feb 2025 04:22:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D238D6
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 04:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C28960BD8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 04:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgwQRpIIGOyy for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 04:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21DAA60BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21DAA60BCC
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21DAA60BCC
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 04:22:05 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so623939566b.1
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739679723; x=1740284523;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeIknhIj4WmPGRkIfOm+WCwiqAzGs+mwSNXq1lhkT4A=;
 b=duGrEbioiEKX0DLgPRq5unHFwPx7nrFUM+CwHM3TPdKzZ8njJHjYnBb4FK/A2NDR2z
 BrmmAxcEti31YrF5S8LLVnh56kYpiYfwbsy8/QBK7EBB2rjuALCr8CkgUztlewm8dsqn
 t6x2QdUEil0Fp/t5noqiDyDmnqGyRIUO45LpjwvxShh8iyD0lV38+E/4aBD+DwdUlNMT
 E7FYKRiuT3eMDtnpfajUpXG7FeA0o5gFGurrSA9om8Oym8TGJN/U6Y+xl3I+Eg3Z4SX9
 TVcVDvqUUvbu/hycQGUGXrcYNzD6YY93eO5Nq3Nol2AG+KtFVNJXdokv+w6ioXFdk7Ze
 ppvg==
X-Gm-Message-State: AOJu0YwaViGVmAJrXi2GRhEvE70WZfbCj4C/dt3HnudCV/iVIjcS8DHu
 O3uqTby1y/EV4ZwyxkUwGqIB9QnoAcc39ESBK4UKnMQHsTz+9t7sBGkGyw==
X-Gm-Gg: ASbGncv4R55AL0QIhvdrZ9vedUb4XIrD22jdyCXpvKiUK3IJpXRg/MBNQp1Z4oRsYka
 jIwQu6RPQgzzh5acy2BcI8eqHNI/oJz68DvPlT54bXfKVk0hFSZP3xvKQjbJ8014QFuEMYNhUPp
 LYrjlCICokeXFkRiuzcQBMaLQe447Vvcm+d/tt4Q+m7r1Jh+TLMlBGdCqLz72FSg+wAuaPtesM4
 8XCF38zW1byfVmEoQxoIO0LzGI9djpra/A2s+qWU9qakQCQpGQtavgP/2aNARrQX29+lUX4ZxEI
 hYNHU4UT72VVZv1V6RE=
X-Google-Smtp-Source: AGHT+IGOm0s3XHpI2npSjWDKEPpyPssOmqcQmVGrRTIYhRUVtmbVg5Xck0Cax4cjl9Y90AS0uD5bGg==
X-Received: by 2002:a17:907:c388:b0:abb:61b0:faa5 with SMTP id
 a640c23a62f3a-abb61b0fe40mr571489666b.4.1739679722621; 
 Sat, 15 Feb 2025 20:22:02 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bdde7sm634484066b.168.2025.02.15.20.22.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 20:22:02 -0800 (PST)
Message-ID: <67b167ea.170a0220.65663.e54d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 16 Feb 2025 04:22:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739679723; x=1740284523; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EeIknhIj4WmPGRkIfOm+WCwiqAzGs+mwSNXq1lhkT4A=;
 b=dftKFx+Oje5PfUoOzWStxqPANi7tj2I5Mv1raOTHCLSYDWBBItktwCggPbo8mw62/A
 ZREMOAkWBoX2oW++vblbjIeayEcI043eWLWS7oOfEn6Wsrg1hVgHiDIq1xUO2vsI1xeG
 LESrP20FwpdLU5V4TTe5g5pWgRJAsMZI9+uaU14Bi20B7iV2teSGKNVtahZbdOjJgTJZ
 AWxrfbS+peINvNRew0HYISmVk2weMc7woPyz8/K1/nFsyVvVCXsbV/leDmU/ZX1eZUhd
 w35tH1beq5/TT4VcC4pTMmTPeauh4NWioRwGMuIQ5NnFpTqfmlHOwmUITRhAuVh5x4S3
 LIJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dftKFx+O
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-15
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

Autobuild statistics for 2025-02-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  7  |  0  |  9  |
  2024.11.x  |  3  |  6  |  0  |  9  |
    master   |  9  | 377 |  0  | 386 |

Classification of failures by reason for master
-----------------------------------------------

                 sqlite-3.49.0 | 232
                       unknown | 11
                   perl-5.40.1 | 7 
           at-spi2-core-2.50.0 | 6 
                 linux-6.12.12 | 6 
                  ntp-4.2.8p18 | 6 
  gobject-introspection-1.82.0 | 5 
                  libsepol-3.7 | 5 
                  bcusdk-0.0.5 | 4 
            gdk-pixbuf-2.42.12 | 4 
           libfreeimage-3.18.0 | 4 
       riemann-c-client-1.10.5 | 4 
cegui-00b4e1fe174da53b7ed72... | 3 
                elfutils-0.192 | 3 
glibc-2.41-5-gcb7f206537240... | 3 
                 libv4l-1.28.1 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                opencv3-3.4.19 | 3 
             bmap-writer-1.0.2 | 2 
                  boost-1.83.0 | 2 
                   botan-3.5.0 | 2 
                 c-ares-1.34.2 | 2 
                cryptopp-8.9.0 | 2 
                   foot-1.16.2 | 2 
              host-rust-1.82.0 | 2 
                  jack2-1.9.22 | 2 
               mariadb-10.11.6 | 2 
               procps-ng-4.0.5 | 2 
                 apitrace-10.0 | 1 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                 coreutils-9.5 | 1 
           crucible-2023.11.02 | 1 
                 dc3dd-7.2.641 | 1 
                 enchant-2.3.3 | 1 
                    fcft-3.1.8 | 1 
             fontconfig-2.16.0 | 1 
                    gdal-3.8.2 | 1 
                 gerbera-2.4.1 | 1 
        gmrender-resurrect-0.1 | 1 
               harfbuzz-10.2.0 | 1 
    host-mender-artifact-4.0.0 | 1 
    host-python-greenlet-3.1.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
             libapparmor-3.1.7 | 1 
                libdnet-1.18.0 | 1 
               libglib2-2.82.4 | 1 
               libgtk2-2.24.33 | 1 
        liblog4c-localtime-1.0 | 1 
                liboauth-1.0.3 | 1 
             libopenh264-2.4.1 | 1 
                libressl-3.9.2 | 1 
              libunistring-1.3 | 1 
               libunwind-1.8.1 | 1 
               linknx-0.0.1.38 | 1 
                   linux-tools | 1 
                 mesa3d-24.0.9 | 1 
                  mupdf-1.23.9 | 1 
                nushell-0.96.1 | 1 
               openblas-0.3.29 | 1 
                 openssh-9.9p1 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.44.2 | 1 
               pulseaudio-17.0 | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
        s6-linux-utils-2.6.2.0 | 1 
toolchain-external-bootlin-... | 1 
        util-linux-libs-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/53358a5ebf539a01707d8cbf6b45fcdde2fd2d70 |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/206703af21f83cb0ce0ab46dcfea6d160f307fb5 |     
  powerpc    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/85ca3db2a78da949d581c05d49f405b20f763186 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/bae5d9da5c9c04516ca28dd3eb79a89df0b455f1 |     
    i686     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4cebd232a1decbc3b2e62976030dad41837e0da5 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/183bd7325d76d2b7ab4f4754a03a8647656e5133 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fa4825ff3761f153453924f0a03a12ee8246e7fa |     
powerpc64le  |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/4e4d0c8940dd6b0dd5d1273604c49d44759eb225 |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/61ea3260b400ebf7ae7f7aab3901a1f545695c0f |     
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ef6a7b2bf6c527be9564014ba5638d75649528cb |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/85d66b51bfb93a233f6e4dbef3c4f6f04a5acd3b |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/fcaaeec414ba27c46dedac8daf4b7498d6977238 |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/f7a79413b084e872b25e6918fb404ac4a26ff476 | ORPH
 aarch64_be  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/cac17d96724a16eaf02aa61699ec5466655c7c31 |     
   s390x     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/a52c80f00e53fb9d2adb23f410248e29af18a68c |     
powerpc64le  |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/8cd63f7f79914d483c6d744f68fc42d01914a926 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/36d45b84ed1d7819f06c90da35224695f8c1751f |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/6e8cdaa571896b863ca0fd9bbae95f2afad0dcb4 |     
    mips     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/96843eda7d391619be3080619fa444648a23eb44 | ORPH
    mips     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/405e5e8a3bd984cf839685a6d81af1be4628c47c | ORPH
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ec022035d6f59356bc1c3154706a0f7250bd0cb6 |     
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/687f4824da1f17f762a312ee10ab0cb2ddf2902b | ORPH
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/19dc98a8b5d463f230c1ab9397b3f03ac7796acd | ORPH
   mips64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/64980caed915e4d993cef81225d8914c4363a2e2 | ORPH
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/2391d8c8058d996cd6f3eb30ecf0560f65569a70 | ORPH
    sh4a     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/2b6510d0e1acb1a75c30b93f6dfa7c08be4e0870 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/eac3bada3c8d96c4ea1c1ca7b1cabaf0aded7a65 | ORPH
powerpc64le  |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/c5f94d1029ce42648b7ac72e9122e2592f81f76b |     
   sh4eb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/ca3ae7ef4909b75d3c4101ba56aacb2e199831bf |     
   armeb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/f65909dc84bdf5fd485e75072343f35eea3a32e6 |     
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/73d411a7da00674c20c8639a13f1131e4388e406 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fe948296dbba9cca89165f88154b69aaa0c2d64f | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/231bf9b60d6fed1aa0df1ac7c2fe64dc8ead1803 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/692a94553fa8d1250cc7954741ca012e1ad6cfb6 | ORPH
   s390x     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/33d824d60792a73cb4d74a17585c9d245523eaaf |     
    arm      |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/da638356a80af1ee2316d21ea4d4741e5c58fb8d |     
 aarch64_be  |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e2342b1c697ebf436663cecfc87c845b2595ab36 | ORPH
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/59948cc536e4d71cc1872d9a4fbb7afc5d50e722 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/130ea2384cebbf1ff6407b9c60425ccc819b533c |     
   s390x     |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/af4a573d75084a6ca759f22396e762781e6437cc |     
    arc      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/65611075e266364fc73dcd931eae808bef67fc82 | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/77699ff0f3030984a28ee03a981d42e87a762f0a | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fb8e6822fcb9261d9e04353069e3cce43590ee25 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6b6b97d61a1d87256953dfc980c27e41301da91f | ORPH
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/d7f9a2951ae6b1abc7cfd705c35c5162eec7f4dc |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/6750ee6ad47b8e7c7a0e544988e59d4ff6d051a3 |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/dfeccdcf89d8b69589507a17efedd36b797ead07 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/2bf4f227e440ffa477916aa8b557844cc3ab0af8 |     
 aarch64_be  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/521d231a7ba2942e9a17c4d8c51fd2eade62d483 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/35a41b54ee2d19dd887aa902a6e83055a61af67a | ORPH
    sh4      |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/a17c07982bab570b8d7acd77e98541628c4f7025 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5188398184a4cfa447bbc8080023567fd8a68c67 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2eb9ab9bb88320cc5392b463c52940351e31ec61 | ORPH
   sh4eb     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9e3d5ed4c61b555522c656bd873341cfb635a751 | ORPH
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/5128f172001ef3cc182a6e54c35aef2a73ff798f |     
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/8973ad78b402e8fa2afa835de8c602b23a6e66cf |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7ace9965616ae62f10c97d9da97d71d25a906303 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4c3f5f2d9008d7196ed7a1d9bbe75ecd02e50554 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/67a227d4f1cc71d0acd14072c1ae31eb98294e45 |     
   s390x     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/fd224d22ed1ea95bbacbca9e3a9727c08facf373 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/fce0c702d6450939cb97a0fb6f59ae5116dc4df2 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/53fa14c5a50be25277ce562fa299221083f5e86b |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/78f2eb01541fdb0401da645ab972f8512f7b96e4 |     
   x86_64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/70db206af650640f87057d97832816db05e395d0 |     
   mipsel    |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/abb2409310e1e5fa71fa695f907e0dcd68a9c9ad | ORPH
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/408c9f1db74f8df4e10a6d2b89dca147404d3ecf |     
microblazeel |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/b78d5c04aa40a3fba716aa0c272b25f139da31a4 |     
  sparc64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/ebd15a92e501b3f772c35ccebf4fab3b1e548f01 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/1e3aaca4460df3d812c3a927926ed5b616e1cc9a |     
    arc      |        libglib2-2.82.4         | NOK | https://autobuild.buildroot.org/results/4e9eb1122ba1bafe6071905ad65d1577df7f7095 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/eead977a9223ba84bd2500c8f1b3801698ec38f0 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/04af83759f00e966ea4c199521598d0557c5de67 |     
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/1a07b02e2ecd436f3e7b362ead0a71b16c9ad66a | ORPH
    i586     |       libopenh264-2.4.1        | NOK | https://autobuild.buildroot.org/results/18f0426c27ca1e399d8c5b25d6b24149c057d6b1 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/22faa7995cd7e478c6ea54b04930106a2d764c59 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/94e086cf9bada72acd9675cd650a5cc37403a4c9 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/79124ee3944ad5c94a2f1ae1a198767562195eac |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/c0f3c09d217937a820becbfbc3a68b98657a554c |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/576988fdbc616a7080937a59175789c1b7227b94 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/9c25df2c010f287fc64d241e8f4fad8a618586ca |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/f5a833a3dcd7094290fcbc6b8989620749bc6316 |     
    m68k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/2322f3dc4254522ce56384bd95938303bd59b446 | ORPH
 microblaze  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/884dcd4bf8119a9e9b534ab2729a62c123604f82 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/313fb1a2710c5ad4c72702d41cc4d194bb5556bb |     
   sparc     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/4199a29255d540461d63fbc7f4bbf6a52f16d594 |     
 powerpc64   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/467fd36b11e60c0238e8ef39b8e60b18e48502cd | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/83e51181f8fec7ac8e38a8fabd61f018e8bf03c5 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3e805b8c46d33eb282b967b695ab276dc388cd73 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/03985dfb14afa79f83385d8245316b4c368abef2 | ORPH
   armeb     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/3255bbbc976efa9df0a47b86cfcb451fe3fe6ffb | ORPH
    i686     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/2fc47f3f801192afff384e252c0670fed2487e28 | ORPH
    m68k     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/71497cd0f33bc7609058cc49744ac793ed16df5a | ORPH
    sh4a     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/4b58f25f22112eeaee7a4938c47fcfef16b9bc4e | ORPH
powerpc64le  |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/ab0f96e40c7ed7396fda9e1abb937996eadd59b5 | ORPH
 powerpc64   |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/5e006fc84f7c4eac36931c0638d1d8611d961a68 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/48f71ff4debaa218b0be02bcf8ad69de33f6d9ae | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/ccdec268bfe531370806124ee1a5bebbe7084f72 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/43157ee167485550a9f8a758341f6133d695b48c | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/2feec231f3f553fd680c06a430dbf9a3b979de9a |     
  sparc64    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/86333537813012b69dfe40f6b0b817c6f06350be |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/af07f1e8ef930ea48c1b12630f3af9fb220cc4a8 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/52b5116fd030c7adda33775a0131ce67dc35dd77 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7a4f7e67410798aa33857d81b67d8ae9a2d84953 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/76f9ab5a98571df3ac332c477fde1938088734fa |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/aa6a83e4bb028d02e3a3c26f7076bb8b5a07b929 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8e34cbc05221fb0338409a8630fd809877f58676 |     
  aarch64    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/51a0f162fd4cb78c98f1c3570439b7df65c73565 | ORPH
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/505271803e82b962046239fc8afb25ee5a2031f8 |     
powerpc64le  |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/bd50efeb5075e646fde31526e9f4c8bc1c5d3b62 | ORPH
powerpc64le  |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/09a94ef75afd05d5734d679e3681b1ee723ffe66 | ORPH
   s390x     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/d817fc0a0bfe655f677eb439197c0f174934bea6 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/d27aed419bafae9b29bad144dacd112e4b0d7caf | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/42dc34a58ccc96b63a40b6a77d786c3dfbe81c34 | ORPH
   armeb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/3462cf8647e8d488d106a3779b2b83f4ae76caf7 |     
    arm      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/fa5c3e9983ea93d894d4bbfa5875364b5cd3b52c |     
 microblaze  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/1d7b47f9c8bc69d6435496b754561f7e592654c2 |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/6322815fb40a09dc5e8e23dd75a90dee3814210d |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/0a0723468efeecdb939c5d785e9452cb42746ab4 |     
   xtensa    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/79be496cdecf77404dd7c12e8970e6f31d1db6dd |     
 aarch64_be  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/ed50c2b1b3928e4263cff73821b042e2196c3adc |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/a2005c84c313386527c47a05907b7c2cf918f2ff | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/4b0e437bbc08ad9b73a703253f8790c679ea07c8 | ORPH
   xtensa    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/eaeeb123d69a6465ea9783a730dbcc3a6a4b9ccb | ORPH
 aarch64_be  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/17f2a4b7f9b16a1c648cb8ed7e7f61a6cdff072c | ORPH
   x86_64    |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/369b27de7460bf9882c2a43225ebc765696d4a96 | ORPH
    sh4      |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/77acb7391d2cb4a3517658f36d04cf737b734f2b | ORPH
  sparc64    |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/74dd9c0e99a167682756dcfe5772dc002153a096 | ORPH
 microblaze  |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/a3ee2ca66f6569b4555adcbed7b83619436edbbe | ORPH
 powerpc64   | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/78ecf20fcb8ba0b9468e12d6fac0e2a3cdbabd03 |     
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/7acfc28652abec273945b883da8e71aa3151c5f5 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/81bb2d409c4ee255483f54544ac4dbdf45a37e74 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c6f77e266ec5a1f2f2802faa589540177d4f132d |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0a3cc3231f4b2a6edf03f5068627d3aef3c5277e |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ffdcb2f98c1b6a6e8d53dfacf38183ea8dba94fd |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ee7be7051c266df4e9f139724360c44ca08adc6 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/29e98f7f3e63e4968e96d9c2dd97aeecb79a0622 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/60a7429bf7483ae422b50daf8b9702f8af093d57 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c93b7309c58049b020d39bebc820a34baf730947 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8482bf4c0ee8019d8125332a0e4639c9ee77eb15 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c3771060a63b8b28ed76d3f29b7a5f469ef8e83f |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b052c3381337473b0361fab2b1884c0e1f748e75 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4ec83559db31ff8c73d39d40c35a6ffca9b3a5e |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/12008834d992120bfd0bc358e53f69078fd70084 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e1e2b0c29b57404e42fe2fe34b0b7336dc6003e8 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/97f2175d6d96636007146ff51845b0af8b22fb99 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e073698bdc6fcb450d3535fdcbd1d0be9591685f |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2750ffafdf88b084ba6a1194504972b8a0fda7ff |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/50379033d47fb34251f8cc85eabc49347c120dcb |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cbf0a047558bbc45c7241c3709376d5976f0217a |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c1f992ff43e92dbe745d35f9ad5d7146da6d92c5 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/480e6d0c863118ad8f03072d9d1573f6410f0a49 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/767cba26b2240a716ac609d8e1d133adf3c25fcf |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9329fe50bc53756b4dfdcf8e1311f986f8ef30ce |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d020a892c3bf5c443c3d23971629a8174c0c528a |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/09d278744b86782c364d851580207fd5da37a4d8 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ee7f86619541a2370dd7a9f8d40fb3341e3c870a |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/54fb6b51df8709abb5e193f2f17fdbfe0995dfe6 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/868a7193bd65d6e74d1c0ac50e3910e76b6e2d91 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8f85a9c0c6015cfabd982771cd760180a1ff376f |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3fdb1c9a985cf52d3211bcb797c3655ea2d54987 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8d0e026ade80f85fcebaeaa1529d0baf4c5c2280 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/03e4b8246b42dc25e43d54c977ed4fbb69670166 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e7a021ee650e8343a8771fe9bfbe903dcff71ee |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3113567ac55a0d3dfc8bb12e88b419dbe577a7f8 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ba48cc178875604afcf1de71e881f9cb526c1a65 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f89c85740c7cb79cefb2e014cd40d40b2fd77be6 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/32a8a5b186d024e6bd5a69881692d7fa04259c4e |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c7e1b9df72f9d336a2a14f50be9786745131ea3f |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cecf764333820cff011824fd54120c78bb71888f |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4c4f27a21933577ce0f15299335c8a4c58d18ba7 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c104d798b5b7f96cdd2d01c101fab5a99927167f |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/880f274a166a6f78f519ba0449e254b2591ac4f3 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a846fe024d45ced85ae9b2b22b597dbbe88fa4ad |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0ade1889adb445d06cd55efd6bbee2d3782d8294 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eeafe9145723c1864c55a7c2d31493ae67045923 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9cc96d083898d24dce694f73f1fe7eac71a397fb |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/46ff1d95e0c253505b5c48f57cd0ffba291fd562 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f310e284ff99136be85961fba5667f35eb21b2f3 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e6510d29d44419bbb395bc462fa1a66c27af1bb3 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b793a457a71f2288bdd105fa405eecef329b7f48 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bd3a2a94fe3ee31729f4c2b373f8ffc0bc118575 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/29dd9d49a6a149a0b747d3e592589a688168c7b0 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1a5bc7934d8412ac5d8a5c93ccb53b130b4d9547 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f3852d49d352f5caf7b0096b9c64382d9d173be1 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f755d0217f9a2236a340fc736d8c192b231f9915 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/03134bc44e0161fadaf576fc9b9de04b0e110762 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8d7282240ea6d0b2cdaebfc5997fef3e2d0572b3 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b4c1f0a6a9b5591905171209f89c7c2a401dcec1 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/da22b2eb4abc603af14c15d6835ead5c0eaff91c |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/57487f6c0676d526498d5d63f3756cd261afa055 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fd1feb2e1afa97493e3169a3e47ef0059278eae4 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6379be35b5d77e48dc3939bbd830b2280806e732 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ad7fad23001e2e07dacb05648f8c336756cef91f |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d7466481a34fb1edbe7606afe330ca046d0d487 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3c72db18c040027b062d3f9e088a2764fe63c492 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cdf20f782d1d93b4a80a1ba0321b9ace97b72b9c |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5d86103bbb09deaee81a500be5b9a0329ed1e4cb |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2a44ad43badb0083274330854a923c02887f992f |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f2ceb03610ec476d796f721b346dde37fd752809 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/281898b56983e34bef069faa06284ddfe2c518cf |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/49fe863a809817640813f373629b0432101215ac |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bfb880aea34e106833aebe0c1c8fd0141fa2c0a1 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7d47cd6eedc942b82536c6daca85e2b9c2d4c663 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4804f382223c9f2828e15808be4fb1dfc5079fb5 |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d862b077c69c51f578933b4550731938ee88421f |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ba05eb749baa8547f3fb84d69b8c7a809dd659c |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d3af08ef7cd929a74225c3c7b8ebdcd9fe241b01 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4bb634f3af2616956a32dc435a3596670decbd55 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8762da7c2bd36a7a92b8e1b041f569a4731ed27d |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e91bfe2e79dafa540946777b45f318259cb2fd04 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b7f298e19ca9d6a9da0f4eaa7da65e4f0c4b3230 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/63b56f39b4bbee823f391d86b1d5da273f65db56 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e9aa5362be628369d908d6fb293dab0ae7362085 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/85632941740b25b6a2872c87860d6d13cc866a23 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dea94661f0dffc70053a4ef82c35b87b14cc22ba |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fc123562d60c11ffab7d1d23d08fe40ebe5d6822 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7b17c1eceab47d8dd161e5b3004c1038de3c74d4 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f5fcdb4e3a8cc2bdd58328fbbadb7ba971ba04a1 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/61bb6dea371318191fe4b3fa26582ec29e7d19ba |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a2c7da9311bfe836588a17f29026480e3ce83065 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d1e70d214759273a9ae7ce4cc4e3a2ca6b093dc6 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a5bc180b490d37f603a56a6ef6dd251325582b5b |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9c7b5676c8e89ec87e2cba0165f7580527942961 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f933cdaf1c9db3f5becc69bfb59fa8ec10b6a0e0 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/74a7f16c7f4f3960219b361b790d3a1fedcee90b |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/679981a7dcccd4cece805a1fb59e95419a9818dd |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/830dc4c8c5c64e329b3f9b60f9c45150412984bd |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b1a2e0de99321f6e5fe866aca5435a2d736a77cd |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/72abb96fc380da3a00a15669d81beb1cae01bf41 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b5d31ec5e3b8fa6081f37937f8842da421e529f4 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/73155cbd980dadea984ecddbb033f6d8dea51415 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/550a05d7eee0b706fb21b3ecf02287563723a3f2 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/307a0f5462ed5616a6ebb5845149533e8a06f6ef |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/71e86dc23d0cfdfac585799ba7ea565ad3a88865 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c4b03f241986bf70b302c02f12b34040a3123f9f |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e5663d16d61ebccd7022b291211ce566ad9c1785 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/675703d487e6c397e3fb2ad9bf85a08ab16c68c9 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/09806e8af8eaed534affed9a0bf10946990dd46b |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8bfe9bbdcd723114568632a0153f79a8475b8dc5 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/139f7a0b69f7e6dbe9bf4058252946654eed7c81 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ba35bb767a2cd05e4c174fae87dd451209814764 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8919effcf1ac5b813a9c8234ffb27810e02bf9b2 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c1fe7dce1f8247102696b3b01414c9120b319f24 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c3bc3a8295825184962adf14f7316af72d7e43c6 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d5b7412ad66483d8f4ba1df9ff315da35f5242e7 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bf94b59ed60044cba6af71f9479460216717363b |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/51dd817a2fecc075e29e06b7ff7b7709d94e974a |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/45cdb95c1c9086e3ec87cb53e38f2cc670c07178 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4dcc46e76b39f9c4617258ca9f994f805f1932d |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/812debbd1ad152dc0b19858c5e9a3f646d50b13a |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/849999fd040073a5ee374bf5b3dbb00d07191031 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e0264ef00271cfaec3da62ca8e33b464877bfaed |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9bc14fb4a1d1dd7ff3fe770df9784c718d75556e |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6ce57e406e6ca48bb583204fdc43952f78d4891e |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a8992c0148de347477bd82a9cfb0868f9e3e7033 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/413c7f46a4a7d1807b5964996ce1971bd82b697f |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/89064e6dab4692ab0e064a5d54b04c18f4e8e163 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3d5f1679af967da1cd143f3256cb129c8a5371aa |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ed82acfe61225ec5b281b5be6d5f1a67c78282b6 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/34e34bba061e66495eb400cff1a0e3bd069f0fe7 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b561f089e8bc1a8b16d1987c4e2853e575bbb75f |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cebca93a466b6808ac1d5a4f6ca923ca7584f3cc |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d4ef418a1db17f180339be1f793ce8ad97a4fe4 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/96e7f62fad4644f6ba3d1d8045b7943c22c44372 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/47d00707804c78c082ab1f256ff7ae596ea8fd09 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9ab90e6f830e3c21e46575cdd12560344dbc21f6 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f8707de3461e8125d00efe0b86ad80a2898d32c1 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/30371d85cf115ab38c19cbebb8a7c9bf820b40b9 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ee6c6efae3772cd0fb1addecf7275623dc618e7 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1f290659076706b97affe4c3fbf181f89d3a5bca |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0151e2451f8047f792c7948d1de0c664dddbdadc |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/841790a1257193526daefdf861b8edbf7c9bf5f4 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4843048c154756ea6a9cab0ba800dc54e45f2e0 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6798c15e8d48a216331da31e9e9d63e227c11eca |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d653d316f6be5a611523eca0cb2e2b3eda3496f2 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7133f6905e548620d04230bff1a09fe6d6137e14 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/140318385225a9f6931864c3380194651aa189c8 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/65196d1e8eb646c4e6bfab98e1c44ce34e6e8af6 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e9849070fe0ae737d461f070660e3ae330d5ab6 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c6449949c4102fc156f6e5f724926477f615305e |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c081967a92b4228b2f3e39ddc3f647535260dd49 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e82764970eff3fe907eb0a9e6c8757a565f459f7 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0f373252b0d0f055a571f901904f02a955738e19 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c33db9d95e08341440c26484a4515031c7a63a83 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5a0f3220897491eebf9388d3d090c876dc46ea90 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4fdb96af89a9b25842c2cabae2ac59e3aec5ab3c |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/59a22d723d1033d888871a9216f68f9032b67d13 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/835bcda4ac23c242d084051e88c419e7f57b4ce4 |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eba82ab8f52cdbe729659b498e9dd635874f5f8e |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/69c12b116b506e257d9f0da264e349c1800e3990 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b3bb4f1801f36d3b76833c4173e92816e68da85a |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b59b002d03d3e50c9e7de15d1006f9198146b5a3 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8dd7814311927ab042e43a07689fbab8d4c3ca70 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/82467283de3207e998f6c5814ee794e8c9beb999 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8ab337751cfb557348178a6d631aecbff292215a |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e1405fc14ee082fe9253c085b8e7ab8c90a24af9 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/87d18db9da81b994319441f9aed43a786a8c8f8f |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f0b223366e32c648cb17c18f66f03ab2c261f11e |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e2195408543fad1f82cce3bd0909a58cc691d875 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f7363e1b5ef0857d9764092f497d0b4699517a62 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a948b96cc6150127f5718073e1933846b0073953 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2e2c058fc32ac5f34a96b2ccfba41d91e628d415 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ac6097ae4789ec29c85ceb758c927a5f47870603 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1aeb4a450a597546b0b25e219c112d1cd2c53042 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/478f6cf9aa260946512d12a33986964145593177 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/01e52ef1d644916d417db367becc8c9d39d173bd |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/60e31457afaa72c88ed6dd3c7d8389fc8704a553 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a8d2f09ea5078ae509d02ad58440fbd7c22cdf65 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f5ccb3736200fdd69beedbb8468364734e73c853 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2e6194cd0dc7865750d2ea1c26d0b63180d82cbb |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3d80545a157f0c53097c2a89487f6cc6139c6a52 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c60af0a5931c1900c09a52f3bad57484985b98e7 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/256b03cc84012a1ceeb46ef11f541487db78ad54 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a04e76133ba0c36ae0389097f7bc557d45607be6 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eea5b0026912d2e6093917baf25624f1b5c3bbce |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5f9631cbba57500e2edc01c791d80ee3b230961b |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4c5413bb5b20fb8ffe26d9a78b6e84c80446365a |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/736da6ca466c3e6f38ca88f4e70e4774a1ac2170 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7bd4045b355431b985b3355def0dba560779c0f3 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8a544eee0ce97f59408350845bc5aca5209aba11 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/db0768c258e4eebe55671d85d3aacb8aaba493a3 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/19a27cd24e9ffb82aa67d371b0046eea8d15f8d4 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6243b9ef2ee8c2e3364e87e12439b85bf9cba35b |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/57ccf1280af05f78ad86bc5fc8d7e9c26c6f3fbe |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dc30c7d3025328fc1be32aa9eecba0d9b4f42366 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4f012a3055ae0e1b963177dac785daa17d6db652 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/87b9b2e094f086b02cafd80f7b3518b7423665e5 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3145f13427288fc44e2f5e02f4e837c22b38bbf7 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b2c58abc0c90d0ad4d80a06e779b07754614e2e4 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/97cff948460c1dedfbf37011cc48d0503b9d2725 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/157eba4e06ae027fd0b5183203cf960be91d8136 |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/30d82d87c7203467f1ff750e6444b460c060ac2a |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4a49a47ba24b7e17c2fd1d23859852cda4bd598 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9ea9fa1261346fdea92a06ef9463d12d9ecc83e9 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6d985c9bfcaeb00d88d7372f728beaf03e4c7146 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9233440b9156a8fddf3089080acd604f9e837e46 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d76df75fd57251d9aeace9260e68d2134c62833f |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3a71ec82c92af562c66c446bd616d82d43d90aa7 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0d4b033014740a0db5768cac0d3a407eacd68bdb |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ef8b1a20f974b82701fd5e28b6afb70cf16212fb |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/398d4f022d25f2c2145632d804585a48c70b1c56 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/af69d1851a660a420dab161dafd909e479bb8667 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/02366cef9a26a13121cb955eec7b2a8663a0d318 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/db60cec0052408a1efd4de68ef08ab87e4458c8b |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b8b2939373542ff441f4f96eec97433f3ba2e427 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d8f54029bf87a0ec6e5d5b2cd04e15d7197a98c6 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/98a78f56d2c17f1b0d120f68fd34ce88c17befba |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bb44f213ac539a13699e7945161f04d41b4f0e77 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/baa19ea8bfc16ce9afd4f4b263cee000218e48c5 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2e3c4e1f71191e9a0f4d7bbe29420668eb1220e2 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2f0e788e7e2e1a92319c7c07ae67381770e3ad61 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8ba26b96623a94f5b25dd543f1e743fc43323869 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/70d7267cf0f5ffa17dfb3f1d114b0359178f1149 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ce682549e25f373db1755512046849244797fccf |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/88c1a6a442929e657b6bd778c57abc802d5a16a9 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/82642fdbe4ac34aba968504f03a305421a0af073 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a79a4764d33e592fd418ee146e52358fbb3001c2 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/13e4aebce188852b5186a9e39967713055a2b969 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/47937d81870eb28c53ffb8b9ec044450e2cc43fa |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5c336f8cba76381af437f4c8bbd8ea44e86a0aaa |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0b9e661d56c3797b0c0c804023b76b9bfa3f1bdb |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/24e7324a022bfbd3d7cbe0a234ffa012147b1f34 |     
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/b4add249a670d3f97d84dd3549434f2edd72639f | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/2bcc553ee1a2170e36eee69cd9fa3dea5bc6a775 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f193266eaeb1b4475ea8967f3009e01e09c39497 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/48fee876402d1fb5f4dfe06b2ac27b99563843a6 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/828d8511c418d81aaa6aff3027e7fa0220aacace |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/6bd93dc077836b63be4200bbadfc40362a07f94d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9560d360d5980b70f59fbbe32cd9327129a2b786 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/47ac5680548f654d0728c4bb17980c1d8f37ae0f |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/f68aa5cd291339bdc1641126045ff12902521288 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6d2fd3aab14130039ec362f9bd6d89094242b621 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/61c659f93c9e2fb37b0e416cc6619c65773439c7 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/f936dbed4040463f4ff3fa8e15682df2ebba61ba |     
  riscv64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/67adc0728d826c8b5aab7d371c45ef928cfce307 | ORPH
  sparc64    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/a6c8168871b03f4fa1dd5dfd44bae71fe09c13e6 |     
   x86_64    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/b0996f32c02853b1c9ec9eb85658d9b749981a93 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           ghostscript-10.04.0 | 1 
host-prelink-cross-a853a5d7... | 1 
        host-python-lxml-5.1.0 | 1 
          libcamera-apps-1.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              mosquitto-2.0.20 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |      ghostscript-10.04.0       | NOK | https://autobuild.buildroot.org/results/be32ea7d520d362078dd0d940397a909d2ebc8cc |     
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/811f5113ff0cb79f91a683b2c700776b1c6fab54 |     
   arceb     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/16629968fbd49b2824721bdaaab9e63dee691132 |     
    i686     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/ac747be7c8fe884f8b9c95696df656ac4500777c |     
  riscv32    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/024e91c533050e097dce23433bfb95f5f6e6a6b0 | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/d8c40b08344add97c6e6f26a5b7ac75c9ad9e790 |     
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/e99db066f27f6f8a587ee9ed778b6fc688848bf2 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                  ffmpeg-6.1.2 | 1 
                freerdp-2.11.7 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240524 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/838dc7b2bb57a2decd198fa328d2e5d1564d715a | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3f293185aeb6cc39732f41f738963ae1598f26f1 |     
   nios2     |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/3b6359daddc7996d51d37e8a89082199899900d6 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9096be15d4ed8fe41fb9147faf2727fd1432d993 | ORPH
  aarch64    |     ltp-testsuite-20240524     | NOK | https://autobuild.buildroot.org/results/1d2180d68794197a5aad7db03f654d1453804b17 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/a8f58c971515bfc7097e3b42d36c8775a4a9c725 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
