Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF53AFF8850
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 03:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53DCE81E27;
	Sat, 25 Apr 2026 03:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uM__F-tufmOW; Sat, 25 Apr 2026 03:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA63A81E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777087113;
	bh=iZoBaswda+o4yeVRPyODJP1Tj2u5VknNEUhW1fA0TlM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aNvg2cIZGLNOXdoykxFFDveHMSo8ajfrJ/bKLudQ9YjGtPQJHODswqzOyqA+CgaHJ
	 YXXJC/DzDopzRuwdJjy3H5Uyoc3H3EmSO399erJYlclTaB1TWtSqjg1ZJRjGequ4ZH
	 zbA5+eMI8mEeC/pLf2ApAcFVr3JOGRPQK8ukMjqk64FjACYcz974P3oBFoBs991nfi
	 SHOGxWX/JAPBHDkE89y9Ee4ER0Gre53uDelz61+2OpMcy0mqKcMM8GV8fveEG4LGuE
	 mqNkAIHxC9kWxl/lghtRzhlmjnwOG/IhIZc9ODtaYJQH4qHxvJmcWIg+rs31Ywy0CB
	 KcymR2/0wR5nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA63A81E1C;
	Sat, 25 Apr 2026 03:18:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36677194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 03:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B7D881E13
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 03:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAgjFWLb1WM7 for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 03:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8788281E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8788281E1C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8788281E1C
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 03:18:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso54943585e9.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777087108; x=1777691908;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZHZu6Gc8toBd9DjjuBMVJiA6GGFpQC1F/7BPkQtVO1Y=;
 b=oTXml7OMZkUILO/41TMth+6atKYQjxvu5ypO2qlFfs7G2XMOuoEsfFCFnSgM/eskGC
 qATEfh1scPTbHXVUnoqHIMC4MvWdQ9aordNECnpIpJKwmH1P+e7YEmxo9q4WipTqdQRY
 BmybUIYxpLYiF6HY3KbrxwNrLk0fh4YFoi4LWXvlj2WVdRKETo/+5sv9f0LnL5FJl9g5
 LoorDFeUJD9uKAxSEAWA/intHbAHEfdWIMwHzqcDItVd2Vd+YT3HVQtVbX15n1doKKoM
 T8DhfeNv6PUHpmwmezPYQyvsfLoKZV+tvUItg5BosXAAZkQYo9g5zRWGHwdS+GFJLsQr
 cgQQ==
X-Gm-Message-State: AOJu0YzPNsGX08rSRvIMSs+wvNBYWe92YHsM/aNvHQF4IzX3n4OqocbJ
 8rZlHtmQlDlrH/4RIdVFvlyfm7KRhB2rv3cIZvCCzTGnWY0MMFNHjRIDbhn+Y/7S
X-Gm-Gg: AeBDieuu5wSOAKjAiH0ZoT2BxdykfP+DnpKlaBcPnalsMfOGjbz6eyY9YBNqotPx1Xg
 Ct9XB/2dlylAMlHep+SNwx3nxXCd6RYL6dcXcmFrdn5o/wGCxayI0zpANsF+b0RFPbCoMdAhQPA
 ttEwjbvAy96WfERAuFKJ97nK4yw7IoOeFqceTCWu2pgGe97q/jY3Lp71JU29dtoMN4gO0lcX/69
 GTkv5su0Vek9WefkKhD0bVVwznyxDvuYoe/5H6ytDmoYOARXh4/pa58UeZKZrOnQzLukDNeS71U
 PxFOVCzwBW7hMhIdpr8Ge2hgpp6//RLj6qMAq6EVajd4c+iRvY/j5qiPZYt9HjtKyX6eXv3AexA
 X8pjfqfFcP6aTXKTksC0q5JUC03rJZZsQLsnrUo2LRLLBDrtxvtsYWmcfeSpcw28/kbct78aJyf
 bdNVLP1GTuOVHuS7eSdOFaI5f99iMEFLsD9+bFXrKS
X-Received: by 2002:a05:600d:8454:b0:48a:5970:2003 with SMTP id
 5b1f17b1804b1-48a59702216mr158153485e9.3.1777087108076; 
 Fri, 24 Apr 2026 20:18:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a06f3sm229911225e9.22.2026.04.24.20.18.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 20:18:27 -0700 (PDT)
Message-ID: <69ec3283.050a0220.3b11c9.1a6c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 25 Apr 2026 03:18:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777087108; x=1777691908; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZHZu6Gc8toBd9DjjuBMVJiA6GGFpQC1F/7BPkQtVO1Y=;
 b=qi/WsHTC8ZcPs8pPiPrE8O+1Its4PxQ9t2eSwuJ4GfpRnSgF1bEcm3RO/xufhB32rv
 WSbJdbaMG+G9C5M+zcI8+Y48F619wVLPUVFLRgGdWxUmqmHt42ywkBowd91VDiCLFBYY
 oubb3aBm5zwe5PoYCKxMDx0bpWzen1FC05J1yfGu6Jdpj/k0YiFucQqL/uVtuJaqW1lg
 7f1Ir3gWb0mdRcgeCVH08dnmSf5N/zYWX/ynt7uZ51cLW3lBEpdSicDT7IEtUr3Sds0Z
 an6hx+v0sbHz6aiRABlD7czlx5sH2HsT1XmzNeGh9JQcFY8k0KNb5NJwj6hAbu/Y8Cta
 Z0tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qi/WsHTC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-24
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

Autobuild statistics for 2026-04-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 11  |  0  | 18  |
  2026.02.x  |  4  |  3  |  0  |  7  |
    master   | 43  | 84  |  1  | 128 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.43-17-gdd9945c0ba40... | 5 
                       unknown | 5 
             util-linux-2.41.4 | 5 
  gobject-introspection-1.84.0 | 4 
phidgetwebservice-2.1.9.201... | 4 
              host-guile-3.0.9 | 3 
firmware-utils-c42a3bc53da8... | 2 
                 gnupg2-2.5.18 | 2 
    host-mender-artifact-4.2.0 | 2 
             libgphoto2-2.5.33 | 2 
                   linux-7.0.1 | 2 
                       mrp-1.2 | 2 
             parsec-tool-0.7.0 | 2 
                   perl-5.42.2 | 2 
      shadowsocks-libev-v3.3.6 | 2 
                 systemd-258.7 | 2 
               tcf-agent-1.8.0 | 2 
ustream-ssl-5a81c108d20e247... | 2 
amazon-ecr-credential-helpe... | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
              containerd-2.0.7 | 1 
                   dante-1.4.4 | 1 
        edk2-edk2-stable202602 | 1 
                    fcft-3.3.2 | 1 
                      fio-3.41 | 1 
              fluent-bit-4.2.0 | 1 
                    gawk-5.4.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
          host-xfsprogs-6.19.0 | 1 
         libhdhomerun-20210624 | 1 
           libmicrohttpd-1.0.5 | 1 
                  libnfs-6.0.2 | 1 
           libwebsockets-4.5.8 | 1 
                 libwpe-1.16.3 | 1 
                 linux-headers | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.14 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                    olsr-0.9.8 | 1 
                openssh-10.3p1 | 1 
      passt-2025_06_11.0293c6f | 1 
               pulseaudio-17.0 | 1 
            python-iwlib-1.7.0 | 1 
            python-numpy-2.4.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
              skalibs-2.14.3.0 | 1 
                    szip-2.1.1 | 1 
           uboot-tools-2026.01 | 1 
               valgrind-3.26.0 | 1 
                wolftpm-3.10.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a26274464ef7f668e070305a9cdad45858460e77 | ORPH
   mips64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/9c9d29bcc6ac9dfcdee495470641fa66d8b30165 |     
  aarch64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/d29e23e5d23b29cc0df5e1046d8e1a3ce841db27 |     
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/62677f7c1caa526dc7582ee75716a42bea5f21bd | ORPH
  aarch64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/976f9a095dcebf5eb4d3e09da8b4fa7f7a12eb60 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/884e98dc0e00fdf37945d0a6ffbb70ea9d797b02 | ORPH
loongarch64  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/83d31f6df79c68fda5e860a684092cbc5d7cfe5a |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d069db9bfefa7b469152819d341a6d203aba83eb |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/46708ade2be95723472d40fe7701d1960fd4a720 |     
    or1k     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/5752c060bb50547ae69784f557ae4fd93b1a5a04 |     
 aarch64_be  |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/0d2669183da8a48365fa48dadce82db6b7f5d40b | ORPH
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/75f395e64fbeca9c888afcae1b118a8e26aa02a3 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/31c7e4ec984d60635fbff29c2a82400d56db95c0 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/78a173402adf9e8dd4610f805d3d6c7842ba26e6 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/c6c5c8e98c9b82fa1dcc155d29d767462f94c24f |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/9e6f20a79b34b04963cb3124d8f36e9f06812f9e |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/11ea68bf3f14ac1c4915e621f9612bb9d51aa9b0 |     
    or1k     |         gnupg2-2.5.18          | NOK | https://autobuild.buildroot.org/results/568de1718d335ed81968fba1a2513400cf7e85de |     
    mips     |         gnupg2-2.5.18          | NOK | https://autobuild.buildroot.org/results/4b203b73fcfa9bbc468ac9087e6e7a36ae6c00e6 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/72ff10f89be189189d417de20e4cf8d0f738ec43 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7e7ef8cdeea5dc4960eed2587748bae9d36e8eac | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c5ce1ea84bab6feb7255de18ce19108ab2aca84c | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8202b45a80644ac24d0022618e0f8be9fc6057e1 | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a4bbd37b9b8b78802e7885a2e5e9ea6ba30591c5 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/59a76b59ec344e6caa519284fe6b1efabb60e148 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/68add37a788b723b08eaabf9ec927ce6e61341ae | ORPH
  riscv64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/683f27e70becd635742476c219afaba063819f1e |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f852ac12867a146904095c5fce6e31014b25d812 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/af7d4e218cade9a6fc9005f2a6e560991fc8546d |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/4788d483a44e1396308dcdd87e3ebb89f9f1d15e |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/206aa57175d039836896137d8f722f580ec2ab52 |     
  riscv64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/03811e9379fea269b07c00e8108f025616677e9a | ORPH
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/c3696eded05b57822247c95281db55456e9f00c0 |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/941b9c83e03c9a887c16de2f440743ec85efe662 |     
  mips64el   |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/7ca14c5981caeef68fe464baa563b403460668f9 |     
    hppa     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/c1c0dec12b1fb3a4764892025ad48a26074c3026 |     
    sh4a     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b08dd8f8ca4cedcce6c90d172bdbe60df7a6abff | ORPH
   xtensa    |      libwebsockets-4.5.8       | NOK | https://autobuild.buildroot.org/results/300411f960321dd84772b764cb2fa3713381e307 |     
powerpc64le  |         libwpe-1.16.3          | NOK | https://autobuild.buildroot.org/results/0c14eab28c6452afe1f72b7d0af0637765ecae3d |     
   xtensa    |          linux-7.0.1           | NOK | https://autobuild.buildroot.org/results/b0c2dd1bf51db8f5df2826de3a1d5ee2621b10bc | ORPH
  powerpc    |          linux-7.0.1           | NOK | https://autobuild.buildroot.org/results/a10b73b45ad4b268f132e07fc49cdea496eceafa | ORPH
    hppa     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/85ec311e13ea31f41b3dc560b7562b5bb88c0ca5 |     
powerpc64le  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/4a42d991545ac039f8aef3c5c6872cc9d7f88fda |     
  sparc64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/da80466483ed2795a971996fa109ffea93eef653 |     
   mips64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/e11e2520060996f1285b30bb2352eccf2983c7d3 |     
   mipsel    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/2bc4cd03f7436e086d60904cc309b41d307ceea2 |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2a7ded7bd9547db73b63f8ff3aad9779d3320890 |     
   s390x     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/0a07bdad422d9253b13b49d7d74a30f7934e7e2a | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/20a80712aa4fe6d275ca3db725555848a46b14d9 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/8ffe8185617c02e59f5570e6b7ae7f8a308353a8 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/7e52241a1a35598e1643587f7b0344fabb6aabbd |     
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9bcfbbe337b69ef0133a6e5debd8715187fac3dc | ORPH
  powerpc    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/21f2c967c9ef7f310188c7c991208c64c21926f3 |     
microblazeel |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a23cbd359cd1b9b72042fed54e41673da066c1e1 |     
powerpc64le  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/e0d94edfe3fd9e3699b9685b07b606e0c24c7a95 |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/9d75a83dbcaf06d389454c74d19a3ee67b8ecac5 |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/39f1174a3c7687f59424a8ae8bd4a1014a6f52c5 |     
   mips64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/5205c41aeca228b1a84ab442ff883046a3cf76fb |     
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1a844f7288dd89dea46f1c5f929dbc6f7ddfdbe8 | ORPH
   s390x     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/8cabf23f255139a399e02ff756c3e29d651bc28e |     
 powerpc64   |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/85d6e1eb13b1a1159f5b669ce917437c1f6e8647 |     
    arc      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/21f88ad3916d894d859e385b501cc0799a83fafd |     
   sh4eb     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/3ff0c9ea060783926bf512164d1cc1982f937d87 | ORPH
   mipsel    |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/47bc3362a6b62e9ae32f8e11f29b86fe993d0666 | ORPH
 powerpc64   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/aea4279106017b34cccbe299f03af6cedeb082d7 |     
   armeb     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/b07f619042530710ee983e02e0e038dcf86689c6 |     
   mipsel    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5faffcd1d70c117035a02e301097cedb8d933262 |     
    or1k     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/c9f235a456ccd24b05ea02063ab20e82d9eda76a |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/88d7a1624afa851a8cab5f59345050d81668bb84 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/bf5ee1e61456a0fe2d822e7cb622e52e96d05dda |     
  powerpc    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/8dda1dd8d66103f41032120c925df8628274ee65 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/78aca124b9e318e142e3799b4516642acacf86ad |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1f8687f4b2a55d2e49c965aba3b2d888dab635ba |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6cf81f0a4e62ae3feda20515ec1f29f8060a7463 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/725a1273a95a20e4bea2724f8fe0007c0c17bce2 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8160d8d0fc51d7db5bbc251992b379deb5b20623 |     
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/07d3fabc06659a7abe04d832d8a074166b51173d | ORPH
    sh4a     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/777f3bb122bc32a708005564296684d8740d28dc | ORPH
  mips64el   |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/ee2172b4761be1fc85be2934e6ae09204f5a330b |     
   mips64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/9a0ace6252d8baff16e59baa8891a460b1258153 |     
   x86_64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/c6defe7d7fbfec9fb56f26fcacbf07ddfb6a7123 |     
    sh4a     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/1339e59566d6b79bd014616cfabc5ed8856a0ea4 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/d37807dc022bca5282277256593523b9ac20574a |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/1e00e3cbddcc91f60ca1540ab286ad2a78f0143a | ORPH
   sparc     |         wolftpm-3.10.0         | NOK | https://autobuild.buildroot.org/results/cad490401aaaf76545605ad089c11e890faadca8 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                haveged-1.9.19 | 1 
libfutils-c326ce0cc2a735438... | 1 
                openssh-10.2p1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/00bcd9a06c5655f903cc4e6986183c80f06c6beb |     
  mips64el   | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/aa7c9047aac83bdc8649271cef57646570d65e0c |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/58a903ba56a1c6a9e6a1386a48bda703077b6260 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                espflash-3.2.0 | 1 
              fftw-quad-3.3.10 | 1 
  gobject-introspection-1.82.0 | 1 
        host-python-lxml-5.3.0 | 1 
              hyperfine-1.18.0 | 1 
               libgtk2-2.24.33 | 1 
                 linux-6.12.81 | 1 
        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
package/wine/wine.mk:347: w... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/027868ba7124a3d703d9a6548e836ece0aba3641 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/fb4c58d16528b28e1749ab40b986d40169b97406 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/742a2afa80e1802c556b19383276c73708b2be6e | ORPH
   xtensa    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9ef1b768e318c483d3862fb43dbf6931166ae8b5 |     
   armeb     |        hyperfine-1.18.0        | NOK | https://autobuild.buildroot.org/results/ca8dabaf4fef52a7b7229fe888efcf0b335da00e |     
powerpc64le  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/86bd54cc7e4b0cbe624bef31b9dbb274eba3002f |     
    sh4a     |         linux-6.12.81          | NOK | https://autobuild.buildroot.org/results/1d72c759934e691460d5bfa8fbb17cdfcacda566 | ORPH
    mips     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/257d1740df0cb8d32a0e50094b36b482f630912c |     
    mips     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/a4dd5c67e69899042a17faa5ca86a319cfc1e132 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/a8388cbf458ab088e5c1b602fb3ff05d0cd71802 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/0fb718721fd7f7efa8c8fd1e4e67a2f6e3dd75e6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
