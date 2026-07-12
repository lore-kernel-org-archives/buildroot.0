Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F60C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 03:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C0D81E00;
	Sun, 12 Jul 2026 03:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 488WArQaLmqp; Sun, 12 Jul 2026 03:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D0081E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783826756;
	bh=dl0m29KlZuK3ZtMl5iJtmuL/gBUlC/03GmahIasJiAM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iucVxJD6X6dSaPO3uWJQXUUwng15fYkSCEbQvKpGwFVF4Asl1r47Y5Jh3cjcX8oMm
	 KqCbPsdxJC188FGH/fzYIV6I1mFOQ00Wk99Qgc94+sPq7F1pVtFAFccGIm9aqHtrsB
	 Jc9ms7zNikBlKKdDz5SIjmZ9CQ/CjRx7lcq72wYWih2QXgc/4PQPB46mdKkM2FxFrO
	 xtzJCAH7GDDZzI5fP+hz1GdiXEvDvKZ8G/Obsj/bxeaPjXF6X0Rc7n3G2Q1dQ1k3/e
	 N91fAY9KeloCtyBq1t86rtM9rbWRVecVkwC2EDepvn8fHlcnHb/j3yAhHQExUChimA
	 lRC0RSu1Ig5jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D0081E3F;
	Sun, 12 Jul 2026 03:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 437EC372
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 03:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 351BF60744
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 03:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kT9xRdb2wxL4 for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 03:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DFAEE6073F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFAEE6073F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFAEE6073F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 03:25:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493bfe9f886so10216545e9.0
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 20:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783826751; x=1784431551;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Bbdp3FukCd7kaojfJiW9C2CfbhvTVbkI/51AA4+WKu0=;
 b=X68fRvxKL8jPGwJWuIP1E107ZJgOQNjWxnQOifom/f7hWBJDkeeV0xi57W6Cqjvwdi
 ggi8W0udmHfjm7eoy4QnuyF0H2oxwgMnaARKuaUJsw9LMEvSSDCTcQ1LCFVPPk/bzFBm
 1vd7CQPEYNOP9oHXYGTn/z4GJXmI1NJN1CJb0P2V1XgJ0T6PVtpc4WxUGUzhpFY0rvJO
 YQOvfBqLcxKyGQAwQASjQafn1jl+ufZHHvEWCgX6Ob6QhRU54gib8HVs3uHloEjjIy+b
 53khqpOlQekbhC1o4C8XprSuJ/JVTw5Y4UrcMlSzcj4+pvIkZbfkuP0fCpXlbEhNqQLm
 YcrQ==
X-Gm-Message-State: AOJu0YyLA/vf70rVwCeBLpPKiFTkR/HJqUmeWLM93NE2Vcx3NF9Nl+JB
 1enCJC5S99B1Hd1Vd1clDKlhwd/ZjhZjI73ZdIwUOutGvDcdgoD21d6xEY+Jr+Xe
X-Gm-Gg: AfdE7cnxZ2O7GFMPGKx9ir+oz96BM3XTrfnDuoTLE/pdzfjS5BdMoh4hFMzsm6tSgn7
 c4joSDuPh//arq2ewvjle5ucYUQTrs5onTVJjOuZGTJR/1K2flTcRDM//yQCYT56rY7VuxOR7QC
 PrDp5rtr0U9qijb5JfGJof5ulBDx4vMoNyJJ2sJ9QQeGUM+wc3MxgRwYwfIZ4zG25aNQMNPdFIP
 WcBIswKxCI7b5z+wzqN1vb8Ngaqoh/oY0MX8zDjZaaAumxQfiQlJfg3kDr7bVI9SwJauDI9fGVB
 OdHAGBiwa0XXmYpdwNzqVQ6aeJ7EKLIQYP5zS7yiQYSqUHtKVgD6GM+CJ4D0Ps4v/1qyMM1i/Vt
 ClqR+dsOT4b/b7PFjXXPMaGS4bpyHEdmBCzH1ZAslW7SvDLWrW3ECL4z5S8yXdN7MOCv028Ui33
 OKedXcMbZN+Gd0Xhc=
X-Received: by 2002:a05:6000:400a:b0:47f:25b1:e7b6 with SMTP id
 ffacd0b85a97d-47f2dcec940mr4312556f8f.30.1783826751360; 
 Sat, 11 Jul 2026 20:25:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0960af0sm68457752f8f.30.2026.07.11.20.25.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 20:25:50 -0700 (PDT)
Message-ID: <6a53093e.d5b2c389.98a4e.55aa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 12 Jul 2026 03:25:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783826751; x=1784431551; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Bbdp3FukCd7kaojfJiW9C2CfbhvTVbkI/51AA4+WKu0=;
 b=KPqY6YQ3zk9Uhg7ygrfeUFUDOVc3DumO/dFIXaD5dLTaYJB/bAFsB0V2lu6Kom7g7P
 u+h5DEOmKgYV68AVyUU1KMf2oW1oUB9a0nuKrJmFVPaZROAUdkqvPtCHMAgFZBuGSdXz
 myDOGHIMes2HqC6jofU593Sj8B/y433RofHvRSGbww/AbKaaDQGnqGLJ/rCIXBv705T6
 rwKRJLZJ14UI4PBErd1sq46oVD9NoHzYRXbfbI8WWPEH4px7qKx/s82Map0y4lSEIJ3U
 jk3MdyMRkqHxHSFyrIhPnj7LxdFjNHCJ42At0BWgGitEpHXyVbVJQ/iPxKEUV3MJAbwd
 EL7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KPqY6YQ3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-11
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

Autobuild statistics for 2026-07-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  5  |  0  |  5  |
  2026.02.x  |  0  |  3  |  0  |  3  |
    master   | 21  | 53  |  0  | 74  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
                enscript-1.6.6 | 2 
              execline-2.9.6.1 | 2 
                    frr-10.5.4 | 2 
              host-guile-3.0.9 | 2 
host-vboot-utils-7dfa482d6a... | 2 
                   linux-7.1.3 | 2 
                   perl-5.42.2 | 2 
             alsa-lib-1.2.16.1 | 1 
amazon-ecr-credential-helpe... | 1 
                bpftool-v7.5.0 | 1 
               bpftrace-0.24.2 | 1 
                   ccrypt-1.11 | 1 
              containerd-2.0.7 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
              erlang-26.2.5.15 | 1 
                   gvfs-1.57.2 | 1 
          host-binutils-2.45.1 | 1 
               host-gawk-5.4.0 | 1 
       host-gcc-initial-15.3.0 | 1 
                host-waf-2.1.9 | 1 
                  iodine-0.8.0 | 1 
      libabseil-cpp-20260107.1 | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
     linux-5.10.254-cip72-rt32 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.14 | 1 
   openvmtools-11.3.5-18557794 | 1 
                  prboom-2.5.0 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
        riemann-c-client-2.2.2 | 1 
                rocksdb-11.0.4 | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                 rtl_433-25.02 | 1 
         s6-linux-init-1.1.2.1 | 1 
                  stunnel-5.78 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.58 | 1 
uhttpd-15346de8d3ba42200249... | 1 
wilc-driver-2fe5db970acc0c0... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/4f72982fa4292dc70cfc21673f9e090e49af0c1f |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/795e1963c4755d1db4678e25c59bfa4b9ae1a302 | ORPH
    i686     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/5e7ebea4d94594e22b1d5e4b5ba87994042294e8 |     
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/660c44c251afe4d8e9ed5bfd036e61a93d9a69ad |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d2d2f5cf294542af5f4c998b646cb852c167da57 | ORPH
    arm      |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/eeffb94388afd7e67b139f6210b87a966cf5fe67 |     
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/130c9bc4e575dadbd70bd34e1a825aaa64ef7563 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/426d6b2432ed346a3979cd5907cddb63d231b04a |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/bf46914379c06cb4f0ef48d8e57f501ffd5e1eff | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/1b1cafefd34e4a707051257be90415fca3aa4730 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/aa57f2e3f9cd396dd23171b0a3d1b02273450184 |     
  aarch64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/115322fdacc7eae7d15c7c638f219c4369d5f407 |     
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/f24a0cda9639b9eaa3411ecfd42a85c7445b5ab0 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/4048da710a285d659111076247b6063b287fe3de |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/698b7efd908140c59d12f2e665821a0baa5aed6f |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/8364ca18075d1bc667e5960eddab1ecd47bef436 | ORPH
  aarch64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/a71a4ef56d011f158746ffa6621d59c3439227e6 |     
    i686     |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/16429705f1bd23a97b5150fafa286a76d2f07f9a | ORPH
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/12835af79ad21f85edb059666d114cc4f55e5030 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2979a0d3afaeaa95fba51df1b186857f1f778893 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8ab8d6fe74d87d44e73cb884aa693d683f99f457 |     
   mips64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/68142698e052ad80ed809e7ee8841d2d7863b7d1 |     
  riscv64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/bcb83868a35ce7a4b4a7969e198d3bdc7b46769d |     
    i686     |         host-waf-2.1.9         | NOK | https://autobuild.buildroot.org/results/69e5d3802c0073ea863d821592c671cd2443228a |     
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/301bdd3a6278805615710ff616f0da015cc53984 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/eb787fbe39b4b9717a7855febeceac56e8876fbf |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/2a63d01265010eddce24ffd1155d2aa800bb0603 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f1b57ec6e8a9097c783dd14620d3ef7ebc203c54 |     
    arm      |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/5c23b479a3786c862e2bf7519f8f11c2caecc13c | ORPH
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/90efe710b79720abb220198ee6066b2a0c57cf9b | ORPH
    i586     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/f775946b5afd4d31edaec3d699899ea459d84c0c | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9d41f3d246620d4c36a5638ec1a674fe0efa305e |     
powerpc64le  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/94a3e5bc8f3cd13fdfd89c95c6fe5145dc408ce5 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/649254a908490d72bd98da73e4eff8d9067694ac |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/aaaad13e448edfdae6d266caee81fabc8aa89df4 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5e1ac06e8f1055bdbcadeacacd3c44283fcc873b |     
 powerpc64   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/e13d5b8a4477e9c80fa99852bcfcb93f20d9a9fe | ORPH
  aarch64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/72a2089e78c4920b2a3542df988610670d8059e1 | ORPH
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/055c9dadb0ed702651930ef972a58ddaa5038ee6 |     
    i686     |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/ca016cd99afb8aa54b8b2bfdfa80be3ab1560929 | ORPH
    i686     |         rocksdb-11.0.4         | NOK | https://autobuild.buildroot.org/results/0944c7e9e53015017c805cb09cfbe011a5749124 |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/a78425cc704aeb16b73c9e8909c9ad170af52c65 |     
   x86_64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/6a7b12798775302701e4f38cac8f390522356e40 |     
   xtensa    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/57475bbefb8bcfe58ef0b78ec02bf53b8e996a0a |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/984790dabf9b5a6245d9eb770099f46ad295703e |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a1d815681e047dd8c3e07b15052d3aca6056e1ef |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/5bfe0d8667f683ff75766c4382cecd176ac640cf |     
   x86_64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6b657e8fbd20ded6d4bb7b5f29c0f24043473526 | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/e2ecafeadcca7c8956910005ac5ef143dbabacb3 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/36162051e4742dbec02d2a5c04ec212b6e8235f5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1652c39f619acf7485160b2eb697e7f87cd0aba8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b20146e4efcf396ffe4032c3278d67817b7cc033 |     
  riscv64    | wilc-driver-2fe5db970acc0c0... | NOK | https://autobuild.buildroot.org/results/f737af10b53fff1c627556e2d587a976c287f445 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   dante-1.4.4 | 1 
                  iodine-0.8.0 | 1 
libdill-32d0e8b733416208e04... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a2c79b5f6ef27247c307ee3c556d063d2e7b05c3 | ORPH
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/d012baf9a9efbcc08486b0caefc77bd8a006bfc8 | ORPH
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/0dc36fb332710f23368d3c2b41e24a4738dd5bf4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 1 
            host-go-src-1.26.3 | 1 
                  linuxptp-4.4 | 1 
            lttng-tools-2.13.8 | 1 
                memtest86-7.20 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/717e87a905d7fa34e9927bc18360da5911569ce2 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/bcf5e2d601cc3fdc387cadf37ab2fd6bdc52aa49 |     
    i686     |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/4ea8dcbdedb7766e68fbceaaeeec485bfa03841b |     
  aarch64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/c6d0ac750568038a6e58fe5a1c2b9a50131dca52 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/baca8a12151315052c3c4e5933279d5fd96fb0ac |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
