Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB01D3E1A8
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 03:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E410780D1A;
	Sat, 19 Oct 2024 03:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EWUyXuSjAfN; Sat, 19 Oct 2024 03:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D9E80D0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D9E80D0F;
	Sat, 19 Oct 2024 03:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB8F27F9
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 03:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C52D80D0D
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 03:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6okp3YbRZQSn for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 03:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9610F80D0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9610F80D0A
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9610F80D0A
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 03:17:30 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so182679866b.0
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 20:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729307848; x=1729912648;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2eDlhtf8iLdUJWuOjLouwouPzVN+bzBcAX+7Q2pnCv0=;
 b=vFnRMGSfoRzXM5vWhixPrI6fh/IF4lhS8cKxTe5OnZ5yFAW5xxG/8BflZ0R1DEX2g/
 7TtTxgJUOBcGUrJBZ19law/O+O37ydfhLWeKVIFJgr6PPLNzyF/j6z5k9gRyIlDe5dxJ
 D1kzDtcw+pyI6vtwAbKmD5l7nS4k10xSiGD6Y2IOB8jc+13V4c1axlTO6gmG+o91XYqa
 GQtwikLAIXXOQnqylhBA2AIRbFhtAPgb0TxqLduPiytrK5TZex3UPw1orRTQ2nBbTeBR
 +ecTiilfdkWSXhJWj/n9Ih0vFylT+RhsOvSaN5i+vKXhUqQsyxPQyK7rM8jenZIrdxLU
 uSxg==
X-Gm-Message-State: AOJu0Yy60PKJp3RxsPkYlsTf/8thgsgx7jYzAPqmaqR+YfPkedsgAQZo
 x9FCWnGvrULv9QLkh04HAcfDdX5rSZrUbIKRrOmsTViM99WBgL3rBsjP9A==
X-Google-Smtp-Source: AGHT+IGBrT5uBI/l4Gs8pDj7BIGnLaYODPeSTz2XcMjqw0Tztg4kmk4CLzrCqy+wQrmVjbtIduRW0g==
X-Received: by 2002:a17:907:728b:b0:a8d:4631:83b0 with SMTP id
 a640c23a62f3a-a9a69969af5mr445511266b.5.1729307848268; 
 Fri, 18 Oct 2024 20:17:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68c2e751sm161823366b.213.2024.10.18.20.17.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 20:17:28 -0700 (PDT)
Message-ID: <671324c8.170a0220.708dd.5250@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 19 Oct 2024 03:17:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729307848; x=1729912648; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2eDlhtf8iLdUJWuOjLouwouPzVN+bzBcAX+7Q2pnCv0=;
 b=ghc5LG6O0dE0MD1kShkxJG7dq8LLKFncjdIEQKRSfhQJ8JDARprSE0P0KD05w8zuzu
 6Cg/kl8pUnKa+Ar9ypbVn0ZayfdVvR6gy+FE5D5aIU48jiLlRYtYtCqPdZWZ/ICXbqK+
 6GpFXxiJ9mXoccUWO45HvfvaIEZLsFD03uaFSquyRj4APKDNFu6Lzjcxy35cFHtNjLPA
 S5eKjq3B18YQ0aDss5hKkkXDQUve1Tyqrno1SOGOskknsTGjGbVi590IpdCV3YZ3NaYd
 iRDf0+ejgXexJvm/Fmu3u0W0o9DjOA7jTWLDQMYf4asMYw5Fika2/lm5HSq2U56MvkNp
 ENYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ghc5LG6O
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-18
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

Autobuild statistics for 2024-10-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.05.x  | 16  | 23  |  1  | 40  |
  2024.08.x  |  3  |  5  |  1  |  9  |
    master   | 10  | 77  |  2  | 89  |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.10.1 | 8 
                 linux-6.10.10 | 6 
               procps-ng-4.0.4 | 6 
           host-librsvg-2.50.9 | 4 
android-tools-4.2.2+git2013... | 3 
                 gnuplot-6.0.1 | 3 
                    azmq-1.0.3 | 2 
             dahdi-linux-3.3.0 | 2 
                    git-2.47.0 | 2 
         gobject-introspection | 2 
    host-python-greenlet-3.1.1 | 2 
                 libv4l-1.28.1 | 2 
                  libva-2.22.0 | 2 
                memtest86-6.20 | 2 
               pulseaudio-17.0 | 2 
                   sdl2-2.30.7 | 2 
                       unknown | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
                 apache-2.4.62 | 1 
                  bcusdk-0.0.5 | 1 
                  bind-9.18.28 | 1 
                   eza-0.18.22 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giblib-1.2.4 | 1 
glibc-2.40-18-g564178076272... | 1 
  gobject-introspection-1.76.1 | 1 
                 hddtemp-0.4.3 | 1 
   host-mender-artifact-3.11.2 | 1 
              host-rust-1.80.1 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
          libcamera-apps-1.5.0 | 1 
               libglib2-2.76.1 | 1 
               libgtk2-2.24.33 | 1 
                  libnss-3.104 | 1 
                libxml2-2.13.3 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  nginx-1.26.2 | 1 
                   perl-5.38.2 | 1 
               postgresql-16.4 | 1 
                   s6-2.13.0.0 | 1 
           v4l2loopback-0.12.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/2c4263f5a3cda2d85ab319a8c39580ce8602af6c | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/0d38677b32a3ed7987ceb7004fba4f87199bc8cb |     
    i586     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c20a6a7b12c8d7836064efdbb0674b7161a2326e |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/cf2d91014e76448d7ed4fac98acbbf79f410caf2 |     
   armeb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/e1948359ebfc12a06343c8176877ead6fd8c8dbc |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/4852fec5d8b8d9288d3c831cfad4b6c4c9b839d5 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/268182c63dd1f17622cc7bb20e47c226076b9eb4 |     
    i686     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/21ccbbe8ce947a5f52c43d6ed52e2a34e04e5099 |     
    sh4      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/3791e84301993051b4c87ecddded3a8de122ea96 |     
  sparc64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/283af7bc1a9fef26f4a2f8665b076cb4c6dffcd6 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3571160d2abb39d0a139ba8a3ddccc4db49c40c7 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1d5174fe7c41fdec6af004e997f9990465415919 |     
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/c6f83904206fde0640b0c37e7c64e0d7715f12b1 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d76a9ec66086ef8e0e9d219655a47b2a601cea1d |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/1ab5389e90a25a1b2baec73b4d69edaa282fcc31 | ORPH
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/54fad3ed12e5fcdd835e2fcc3f928dbf797a61ac | ORPH
  aarch64    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/6ec8f1e9e29e96a7bca28a651a4e6e65ab0a72a1 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/45a1bd9a34c4b0945a07c22338b201908cf45d8c |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/aa5757be5136784209625a6f4e263e57184deacd |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/c600e6a3a82474f7419280b3844677314d8bfdcc |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/d838c34db759150cbf768bac51fcfb7591f61114 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/36bb4c6b71cd0968e9609898a7c8f9df68b152ab |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/ebc6ddb146492ce1cf6bfc28a8cbfdbf2a04d437 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/e90853f4dda9f03eaa0bedf9bd3f3521cd0afe2c |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/3ba939ad9270b6d94e51fb664d9c4a14e458be7a |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/76549a95177e611926535ed66c931b0af0524b79 | ORPH
   nios2     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/6337c5f2f926ab206cc6d959e3eeca5519b235bc |     
  mips64el   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/c50b0b5e10b4663b743c058acaf52e25dde7e6e0 |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/94ad20944e0368310a4ea5a67f2c4735a05ae982 |     
  mips64el   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/5d3a58dcf0f66f5d20a4c60ba6c87f04eaf336c3 |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/8d7b5da5d4ee84cfa4bd222038a81c4c963637ff |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/5cf3b5465f77ef6ac59240321a571c2f0b91de0d |     
  aarch64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/15b5fe975050ec3adf69436ef1fd1b8a25f37a25 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/eff6039b97f49f03611f24c77097c218c0b4cf9d |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/de840b78e9717711ef319234b8c6922b652dd069 |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/98c2d415d86b56187b5d777e895812398b8f8a02 |     
  aarch64    |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/c0fe075c3d8a49e60fe188a6b6ffac6b78e58d6d |     
   xtensa    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/dda43ed2cd8b55af5b9dfbf7c6fe1db466c72d7f |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8f38fade2b1e5b5ddfa5b49c8d329ab479e67731 |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f4088545144c3ebd75a342dc85b19b68e0b5e2fa |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8c819a53cd385d63a6a6a710461be30ab789623b |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3edc84a149330df236095fb65bdacf1b4979cdfd |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f7bd8a8d7ca3edde34cc7b044c3f48b53af11bbd |     
  riscv32    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f74b2ca714aa6456418d120e4cd38fd7880082e8 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e068f7cf6fe030d498a9cef65baf273bfb6c55cc |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/1e7d3f1c39f4f4b68d0122ef02b894b4e8ea49da |     
    m68k     |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/b28d22fcef45141c3d46a7695796e1fd0cb150bf |     
    i686     |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/360aa7176d8f99961887bee7e66f9b9be6be3012 |     
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/89f84248a2054acd8eef2f83995d25bc6224f679 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/97a0c7adbbdc9cc487df25c166cf5bdc2eac4673 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/15b5c6bb7355f293561d4cbbd5f114cd901b3ae8 |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/f81f6bef65a15ec0b0a0712971558ff1e5abbfa1 |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/53b1c9d337d29ed242b2db0bca02c5da2f9e23b5 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/79e8f609dbccf55d19622bbf8e18d45eef4aa151 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f40bbedd30d9022175ac5c5fecf7c9695e2752c3 | ORPH
   armeb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/fffea987b5dfe1ee0f95adb600ec40a09fb61b44 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/65dc5075f189591f78e999007bfccf531cb4a3c6 | ORPH
   armeb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/037229945a3740bfac089f497ac67c27fd8a9932 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/01d1f1e497dcec3c544084044edaaa3550061dfa | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a82aa10c724fefd516383869d16bc68b2e32eecb | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/1ba110d56887324beefcb8eebcfb7c9ff868e94c |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/932d6b6f699d0a4ac778c9e83b07236e9f222cdc |     
  riscv32    |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/943928c031f58f38b7c30cf6683dbd3c4ab16fd9 | ORPH
   s390x     |          perl-5.38.2           | NOK | https://autobuild.buildroot.org/results/0cdb617a20a6f821f6e00f189b0a5a7f07fd9655 |     
  mips64el   |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/f55d9e660fdf809a1a9e5a030e8f1283f54ec902 |     
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/70c695de5efdda0b3c4b11a1bea4ea46d5262fac | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d05f03238f4c2aad93b69c39921f56e4e3990ca0 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/353f988e1a45ca8fe614e9316242d57842ef89f3 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a19500322413b39000b49c574d98aedc8e25b68f | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e6756fb822e15c477c64a6c968fd1d5bc9ecf210 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bf63e4c1e36e1b7f36a4a331d93bdb617b2d37b9 | ORPH
 aarch64_be  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e75f05fe48d7cf6dfa5e8995cffd1cfba34cf1b2 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/431953ef6fa67d5663a7d13d9cdd143a7fb02634 | ORPH
   mipsel    |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/745a569c932edc6ae173abed5e630b729afd2a63 |     
   mips64    |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/bf5b41dfd06c88c3282075d98851ab76ff635895 |     
powerpc64le  |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/b3afce445e5c5f43869c58749530afac7bfd63df |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/d29fb5e96cb457bd152d68da86a9dee4b97d0942 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/dc7b092654a5f6ecee3a528d6fe146fef6f1a87d |     
microblazeel |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/0a91b5c9dfdc861fb480c85022f6301d1a676634 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

             gstreamer1-1.22.9 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/b6d70f0c84669055be70891d62e5dae1f777a2a1 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/48d98b70c55ce2fd5f50e028a14b692751c96155 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 3 
                  ffmpeg-6.1.2 | 2 
                       unknown | 2 
                 c-icap-0.5.10 | 1 
                  cairo-1.17.4 | 1 
                 coreutils-9.3 | 1 
                  eudev-3.2.14 | 1 
           ghostscript-10.03.1 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
         gobject-introspection | 1 
                host-go-1.22.5 | 1 
         host-libxcrypt-4.4.36 | 1 
      host-riscv-isa-sim-1.1.0 | 1 
      libabseil-cpp-20230802.1 | 1 
                libglvnd-1.4.0 | 1 
          linux-5.10.162-cip24 | 1 
           mediastreamer-4.4.8 | 1 
         python-remi-2022.7.27 | 1 
                   trinity-1.9 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b7541ee391384202e016ddadd3afb548c9fd17b3 | ORPH
   armeb     |          cairo-1.17.4          | NOK | https://autobuild.buildroot.org/results/0b3b3b9b93600c002c4f9a4a58d431d97f2d5be8 |     
    sh4      |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/2ebb2e012c7713013d4f3c2c2530474a8c6bca2b | ORPH
microblazeel |          eudev-3.2.14          | NOK | https://autobuild.buildroot.org/results/cd0875e893b8acf551d4c61bf1c67b91e80df196 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/23bc1e6c3630c2df09f94ff39fa73446b903128c |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f2519d87c6a2a0f1a677199420d52ed0c9e14446 |     
    arm      |      ghostscript-10.03.1       | NOK | https://autobuild.buildroot.org/results/8e19505f93403e1662dcfa125d5df9c104aaa1df |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/f89d6b29f4c1cf60481131c5decba3c3327a9e84 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2635397b3d1e5118a4aa9dc17cc9367686f17a0c |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f35028bcbfdaeb17ef8ede2004f4f5f55fea416a | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b23fc9b0b0f86bd23ac97ec3a6598dd46b815dfe | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c4fa8deab9b61747ced9fd3b941738d72e3aee65 | ORPH
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/c53f43be9498311be6aa169348e65baf8871059f |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/715ae4f3c29fe55def3dbdc9c81e5f5e4d0bbab1 |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/d1b4ce3bd4d4dd23d169727e67b2865827281ee1 |     
  mips64el   |    libabseil-cpp-20230802.1    | NOK | https://autobuild.buildroot.org/results/2b53c8cf4a1898283329970980bb7b2d183acf08 |     
   xtensa    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/747836a6ae09ade70a600028ba60b4855d446685 | ORPH
 microblaze  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/83ba72d38766ba8c90aa5d4a9fb54b80058653ba | ORPH
   sparc     |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/aa5124ed7d770fb0b6846212d9582ead7f5b8c2a | ORPH
   sh4eb     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/571da00bb40363cd1a2090e2b88453498b570fba |     
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/bc1eb7acaa01bff6ef27da5a491da768463bbe59 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d2c1a732fa1b1a09027873d73d187db83f89fd7a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/3798af5113a18412182957964bc3ccb9b6d39652 |     
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/80597726b8d8e3aaa4db2a45994db3363a351f0b |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

         gobject-introspection | 1 
     host-moby-buildkit-0.11.6 | 1 
                libcurl-8.10.1 | 1 
              libopenssl-3.3.2 | 1 
               openblas-0.3.27 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/3819da6e3b4e2613bb4e28e48d149aac418e9d5b |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/56f2a749408730cb895a2f1d4cd8739c5f9645a9 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/64c6d467fa3525458494d418d30221045481726f |     
   arceb     |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/2a54e3ef217033770ac873649bd718e30dc89a5d | ORPH
  mips64el   |        openblas-0.3.27         | NOK | https://autobuild.buildroot.org/results/373b8c9f0cd378d9507afd7106bf2053381bd63f |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/436641144609b488b6db6beffb814a90e54a520a | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
