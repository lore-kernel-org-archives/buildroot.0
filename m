Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB941C61DFD
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 03:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04AEA80B49;
	Tue,  1 Sep 2026 03:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yd3RukcuGTSE; Tue,  1 Sep 2026 03:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788233017;
	bh=lpf7rWlhDOa4qcnnlyssxuGDSewrpGB6ZmzLoH5B4l8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nTdMvMnyLn1xVAKvNKA92pssEd2HP30+21ixTppomf+FkiBNjfaBTnYeh1qce2PgL
	 KlQr59CvWUyF9Iq4py5kjRdOdLm2kZ9efYdFeu1qk2ApmFhgbYYJNovRGrWIn+DnPZ
	 2WP8HTwnIxxRT9uyeo9IueRMVXjA1YbzHjJEEJLt9PRDyV8eUciJZh0lvIQfi9nHBP
	 /oCdOf85EyuUqUtYdqRD7g8srgsre9YKv9GGMg6SMMLKqkBGVEqOyET4EY02qbFLaJ
	 sEkXGbnfozdLU2Icz7aZ5dYAeMs/QeBdJ2Zn+KyYGuF9ZuleoVslSxcpKCgZPO+Xm0
	 uPUkXug9yLYEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54BB580B34;
	Tue,  1 Sep 2026 03:23:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9035377
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 03:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C251D80B34
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 03:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zavBIN-ZkJ8Y for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 03:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=i/xmzkO1
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BB0980B2E
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 03:23:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-484415c8cb1so512798f8f.2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788233012; x=1788837812; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hrgZElD20QAbVgMKQSl0GOAFQKdLJD+ddxKWdxpcBvk=;
 b=i/xmzkO15gRLjlypNV2kvY2SQldo7zgZBbz6jIt+YeHEnL1YV/0Ic37EWbg+VK1oxy
 8DU0o44KRMgbbagSYWSDRoMpa5uAJuaMmQuVWkLQU23/ez9fGh84XWF4mZx9CXiN3jln
 xRy6JE2rAbaKqhHELFb02Ps51RNbBWZapU6/HkcE+cSc6c3s4RQ7egNtxcRFEKL0ys+K
 sJ+zvRGe9uWRW/OXSU+2bshl2TFdtfJ/Z2TteabpChQF4X/HONzZLx72KgHVtzbbBPa2
 O2jlT21NfVd6XoJRI5DNeMZJ+a5CXA6ZzERLlxvRpmSFvE06EsWaozDjuHA7/crK0kcL
 4RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788233012; x=1788837812;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hrgZElD20QAbVgMKQSl0GOAFQKdLJD+ddxKWdxpcBvk=;
 b=iAUU8U1QQGMWFbS4d3jhq2GUils9k5av8Es/Xkklk0hbgZ2k9wrrotDR32cbOCGviS
 A2V1Euwepj/S/dZXYwJwwUIvaWD7YZmnLYs71lbkUpPFEUrrstoncXSYobdkkuE2Q+gq
 rEhuXcQEk4de964ugGGqs/jQQKu67Tiv4WCTf06Im8t6b1G3WBrwFuMU9DQ8U7ii+y9T
 tIOe2qO4nkbWchNIv9lA2y/WRpYlxabAj9F1dnsNR9CBWCtDbpD3FxaVRLOJopGA6DWW
 eBlBfSyn3b0V3gDF9CtDA7VFS7Um3rV1YFuaV2fSGdsu4c43Subk60pTawhGpdYBl/wi
 t+YA==
X-Gm-Message-State: AFuF++nQDQC2yv/3fSqnq5sN8zU+C2NPgCEATIrvkZoSnhlA16yyCL9S
 fkg9vE1PVGY9h8FV7L3nWu9aGt1Fu56YU9JLOuPZsPHCTn8C90LilPRjlFmmq+DESiw=
X-Gm-Gg: AYBFou1eTZF9Miw0QM3UAUOueiXIMPFN++kFS/puCRp6/VSRs0AinJPJenuuqdAIrF3
 /ZcQdoWLwMd4aKZXkZEXB8R5sj3VPqNGEK+PqFM6CYXhpPiEIYMk8oC3Xe0NW1vvvQh2Aivqbm9
 AkXJIBQS55i8A3UfK20cGF4G7YPQ5YiUanM6AxfdFgw6bOeFCmqgbEqlZuqa6NDChPyIOvuC/4r
 /IXN89eCBYIP6a5wx4zl7kZ0BA22xWab8F8iCfZSIjJTJ+zZOSe8ObfZg+xJE531S2k91DYPnXx
 zL8um9wllL1ooNA4XgkcVdnuY0/E4knTL87yzwJVpVVdDYhwV3v+BPZ9DN2jvtrqlETTEAcF6mc
 XFwvPitVAqBHLXejRDSb8EgX9HfqjaJIj5fLDzy4dRVzeMVDWN2U1UX85cOXP29Zvb54bQ768ij
 zZhcOvrLJUnSoQy4GgmsAOUXVLwgXyj6sCM2W0wjxBESkrR0Hn/cmhjDOFggzu6b0=
X-Received: by 2002:a5d:518c:0:b0:484:3310:710c with SMTP id
 ffacd0b85a97d-4844102655bmr7340275f8f.24.1788233011446; 
 Mon, 31 Aug 2026 20:23:31 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442c42492sm2253927f8f.1.2026.08.31.20.23.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 20:23:31 -0700 (PDT)
Message-ID: <6a964533.b2781ae3.218311.48c9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 01 Sep 2026 03:23:30 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-31
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

Autobuild statistics for 2026-08-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 26  |  0  | 35  |
  2026.05.x  |  2  |  5  |  0  |  7  |
    master   | 34  | 78  |  0  | 112 |
     next    |  4  |  4  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

              host-perl-5.42.3 | 9 
  gobject-introspection-1.86.0 | 6 
               pulseaudio-17.0 | 3 
             alsa-lib-1.2.16.1 | 2 
        edk2-edk2-stable202602 | 2 
            gdk-pixbuf-2.42.12 | 2 
    host-mender-artifact-4.4.1 | 2 
                  linux-7.1.12 | 2 
        ltp-testsuite-20260529 | 2 
                 openmpi-4.1.8 | 2 
   openvmtools-11.3.5-18557794 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
               tcf-agent-1.8.0 | 2 
                       unknown | 2 
          usb_modeswitch-2.6.2 | 2 
                 aichat-0.30.0 | 1 
                    ccid-1.5.2 | 1 
          cloudflared-2026.6.1 | 1 
                  davfs2-1.7.3 | 1 
                 dmidecode-3.7 | 1 
      docker-cli-buildx-0.25.0 | 1 
              erlang-26.2.5.15 | 1 
                      fio-3.42 | 1 
               freetype-2.14.3 | 1 
                 glibmm-2.76.0 | 1 
                haveged-1.9.21 | 1 
                 host-gdb-17.1 | 1 
              host-rust-1.97.1 | 1 
                host-wine-11.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
               libecoli-0.11.3 | 1 
               libepoxy-1.5.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.4 | 1 
           libplacebo-v7.360.1 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
                     mtd-2.3.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               pax-utils-1.3.7 | 1 
                   perl-5.42.3 | 1 
                  prboom-2.5.0 | 1 
                   qemu-11.0.0 | 1 
                 rtptools-1.22 | 1 
                    sbctl-0.18 | 1 
           uboot-tools-2026.07 | 1 
                 uclibc-1.0.59 | 1 
               valgrind-3.26.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/c398212a1a827df0055a90c77d7e5a30e77546af |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/8ac0bdb341480b782cb8c2653fd8257e0c7f3342 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/f09beb0d8532954c096ec575448c773423ef3d2f |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/7f25e70c61164d3457d89adcc2646f8a4438abc2 | ORPH
   x86_64    |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/b34ff4ed5823fc5c169f1510bf7f1c1760fdbbae |     
    i686     |          davfs2-1.7.3          | NOK | https://autobuild.buildroot.org/results/29cf9f88e371be765a7380686238fbdffdf0f9a5 | ORPH
    i686     |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/d22bbb870bc77279a07612f02bfdae25d5d141fa |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/cfe78acc446997f389db986c73ca675c4c56bcbf | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4a54ae2c495228d91aca58ca7f8738d2e8ee1c09 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/94d6ebdbb5258db539a17f5059a527ddcfafabfc |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/d4c69af84ab0bd4abd47b7bccd96c0679f4ac51a |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/3962242a67f7b254e34f20bf1243b0938a12d4ab |     
    i686     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/5b268308e71b32fb2cbd06b8ba845c7f8b85d248 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/46fb9f6a09a84bc1bfeca3b76f87de17ebe9c38a | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fb3a60969aac095ff39e466bf19ba259137a37d6 | ORPH
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a1ff34dfc3dce22c2812d1cf3f2a640a32bb9879 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7a1e92bb1aebbc73d18c42b927696e284edd307f | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/e6c5de1dc6d2ba8872d91aed350e0c28d0206424 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/64f5fba72e5dcc27f63991063d1f60712ed310d4 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/c6a7794e3be297c85ebf378fc5004e68377ca8c8 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/c918c23bbccd16d5cccae4f8c1038980596d79d4 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7dc5b93fef8601f0a0ed0287e2acefc582146efa | ORPH
    arm      |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/ae9b7c35bc89e665d47d59caaba061602c0684d9 |     
    i586     |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/fa797bf6488d7026260c1ac7bf3948ff282243d0 | ORPH
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/f5dd258dbd107a8a56d1d5851d75bdda89c0bb19 |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/798c5008608749b76f2d0ee296c484e36b5fe414 |     
    mips     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/b355a2202f81af1cee5c9110211b843c1b06b532 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/3c014123eb148525555282e0a8f80c3904292134 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/36024ef5731c838b10b0af1941a967efdb0c3737 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/f964c2a41bb5fccf86ae6bf3982baa5857300211 |     
  mips64el   |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/bbf7b353de70e7d62024fd2110d9ed444e43c37f |     
  sparc64    |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/57d791906d936ac75635e24573a5dcce11595641 |     
  sparc64    |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/23cefaa657efc4d138508cdcbd3a7759cd03cbb9 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/9d24e63e91909c4ac83dcc5313d8149310877395 |     
    arm      |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/a2b2509714958c4caa13ce22cd3e6282cc6395f8 |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/84558c5dd6f2b646d5965b7a031d68948bed3db0 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/4e786e4b147d2fa521a3e98d1bc767c76f13bc52 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/6440550f6f61443e4df53ac43978558731fe4b3d | ORPH
  aarch64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/1f1d3c3bf62d77a459697f497774a9161c85dccd |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/d088d1d1bed61216aeab77c21393ed3e87c48e74 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/4bd0f8afec5aaf52f2822f356dd4beb2f862a336 | ORPH
  riscv64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/3577d12b14333e1c277010b47581f33839f60639 | ORPH
  riscv64    |        libopenssl-3.6.4        | NOK | https://autobuild.buildroot.org/results/e51d288329a63394c38aacf624aaaecd20fef815 | ORPH
    i686     |      libplacebo-v7.360.1       | NOK | https://autobuild.buildroot.org/results/5153daed51a0d61c3fec549955dfb87edad6b00a |     
   x86_64    |          linux-7.1.12          | NOK | https://autobuild.buildroot.org/results/15e5ef3ef8389ff6cce2f9d0bddf2287bae2be64 | ORPH
    i686     |          linux-7.1.12          | NOK | https://autobuild.buildroot.org/results/471bf51a08f09c4bd39233774c7b6ff0e914ea05 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ad147fff2243f605d595f2aa87662b573d1883fc | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/bf335f779167d8e7ce8172ba463b6eecfbdb58bd | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/80952d53e777483054e39a753977d7c06060cfb0 |     
   x86_64    |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/e46d8ec9409a4e4f96507282a0062f79e0f0b0c1 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/d36cd1c3eb2edcd850a67b2d417c089b01bb3b84 |     
   armeb     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/cf454045d4327ce08bf237ac8b080af02abfe90d |     
    i586     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/08848eedefbe504edd1c7fb6e6739818f02eab2e |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/dc8632d9316e66f9a4a867b150944af1738ee242 |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/4e52240b2df114484138ffb6eac880af5fd4fbbb |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1a3b02f996e711abbea638603d7e549ef4c4bc04 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1f727a2a271675243436653fb71a161cbdd9d02d |     
    i686     |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/9dc463d5b697cff9bddea259fa278a3be363744f | ORPH
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/a26181680d123770f35141995b43b9bdc04ee1a5 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/b73936b3d0f683574b7251719ac894f2f7f3c695 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2f34b91b1a07c7cba6234336ec541c99d169eb48 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7503ffed654103d6fc8321326e0ac8c573bdea23 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c1849c913cb85c31932fb673591483938bc4d764 | ORPH
  aarch64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/f9014396f76fa05b25c2fa016dd9cabd760abf52 |     
  sparc64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/032685dd46f56621485f6ca0a6dc1732db7c84c8 |     
powerpc64le  |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/1ae4cabfdb16a3281c60fc255da038aed31733ec |     
   x86_64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ac615f7b69addc8befba5f8b1a0011973449b148 | ORPH
   mips64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/a1c94629b12ee8c893f7a9ed6af6546212e75872 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c7a8b2be794b67f9bbfa029a3f97521c558ad756 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c79711de7f9386afa13d621c9fa40f57e4a822a0 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/336a64a019b2172bdbf1c9ea360f1e4fad4d4672 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/41a019bb173024b4130832617bac8f3a322996f0 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/aaf11ba705988d9a12c2d15ebc4d4dc476d605ff |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2a7d27ef8a839cb386689efbffbd4abcf7d1f97d |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/58a25a289f313b4eab1d031170f75532dc0d29f9 | ORPH
  aarch64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/9893d887f81a1cb65cdec3aa7a9ebe75d20dcbd1 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/79b691a1c9f66245792535bd8c6782e054af9bd1 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/3ea101ca83f30681e988c4ba61cb543294484cb4 |     


Classification of failures by reason for next
---------------------------------------------

             alsa-lib-1.2.16.1 | 1 
                 apitrace-13.0 | 1 
          lua-lunix-20220331-1 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/7dda51d86aa18a19fce62f21bc0853f5f2b36d02 |     
    i686     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/e990d4e3f007462a3ec40b6907c2f55f8b420d92 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/336e489879eecfcb3161f3bf9478b0e01be04d52 |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/9833d9e18df28b26d4bae22216a5a8f01815e23e | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                   k3conf-v0.4 | 1 
                  linux-7.0.14 | 1 
        ltp-testsuite-20260130 | 1 
                  pdmenu-1.3.6 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/24c8d15e14aba25c9a3cc00391a6773a16e42297 | ORPH
  aarch64    |          k3conf-v0.4           | NOK | https://autobuild.buildroot.org/results/e8f1e39160da2edb53ff378de33c72ca81d31085 |     
    m68k     |          linux-7.0.14          | NOK | https://autobuild.buildroot.org/results/bd039eec07c61aadc08b3098904ebb7ae98ed805 | ORPH
    i686     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/6d459deb8190ef20e212dd79a027e871228cb8bb |     
    arc      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/0d29b4c95de101cec395da10aa527c722e7352b0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            host-libtool-2.4.6 | 3 
                       unknown | 3 
ulog-0389d243352255f6182326... | 2 
                 coreutils-9.5 | 1 
             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.82.0 | 1 
                host-gzip-1.13 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                 libgee-0.20.6 | 1 
               libnpupnp-4.2.2 | 1 
             libopenh264-2.5.1 | 1 
                linux-6.12.106 | 1 
                memtest86-7.20 | 1 
                     nvme-1.12 | 1 
                   openrc-0.56 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.40.5 | 1 
                  readline-8.2 | 1 
                 rtptools-1.22 | 1 
             stress-ng-0.18.05 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/cdd3b8c05f5ef32a44d1831434387a6ce83bbfb1 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/febce64029aed396418898674d1505a05a962bf8 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8d17175d3224bf728e0fc329b1f7402ad7473f03 | ORPH
    i686     |         host-gzip-1.13         | NOK | https://autobuild.buildroot.org/results/b55197d219731b8648063971194f005aa13add91 | ORPH
    arm      |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/55abb8ac20a9ddb98682293c354acf97d4d8fcec | ORPH
    i686     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/10f88ed475f3409459024d6fc848973a10c6cb4b | ORPH
    i686     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/f49f39fddc51d0d8c1f775f4cc0cb78e94c9d544 | ORPH
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c66dcabac13fb28dcd7a8b8a64b0d282b72d38c8 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2da1d906eb49d2b43e30d83c4b00c907504e6ac0 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/3f1c01486bf49b1b10ea2da7863e14eded335d1f |     
    i686     |        libnpupnp-4.2.2         | NOK | https://autobuild.buildroot.org/results/83fe565855984ce247716e75522f100bb3c00acb |     
    i686     |       libopenh264-2.5.1        | NOK | https://autobuild.buildroot.org/results/fd293f4212fc611b7d7d710f7494aff1f2f0cd9e |     
   x86_64    |         linux-6.12.106         | NOK | https://autobuild.buildroot.org/results/7aa3fb890fb1700a96a5436fb916a964447d29a4 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/89b1b898343794b1767bf70a7ef9e375c4a9856b |     
    i686     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/c8d19541a6a852ca64122dc767845e7a946cfccd | ORPH
    i686     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/f34eab57caf071de63a26704aa04c881f867d4af |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/84da5cf90d340361dda950d2a56b39e704da64c8 |     
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/ab8d8a572c6092e4ce26fd7028b0c1b249b42404 |     
  riscv64    |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/c4570bb1c4fdd06e5edd531caf4d832a1f7011dc | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/0ad484003ffbaa2de9724c6bf5da6d2b5d798faf | ORPH
powerpc64le  |       stress-ng-0.18.05        | NOK | https://autobuild.buildroot.org/results/a781327d8d8605331b2271a714b0470ed099d6e6 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/dc2d7d5db751dfa52c2d95a4219d9318cb81d668 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/80ebf4731cd1c21e7621068ce7a8b42a1c32a717 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/831e5792f8ee079ae1225ca57fb3bd8e61c1899d |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f09619c8868874b46c742b82ca3ed68c3c2e030 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9612b8035041efa58bba1ceb3edc7ad1ef73abf3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
