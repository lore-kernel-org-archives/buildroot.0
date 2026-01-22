Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749B4C44536
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 04:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA82B84F05;
	Thu, 22 Jan 2026 04:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1us2SSgWqweB; Thu, 22 Jan 2026 04:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD8184F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769055636;
	bh=dEo7X7PKGLnCdgXSnAx4OOeK8sLuX9Px6YtY4OKRhUc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PTbmZaytuQidRsU6A8VY6fv92A/4MM0lYFH8wh3pq7+hI6+jgKl+Xx5EnlB8KZhBE
	 R2BoThfQevss3iOBKA/vTOxPsGcfpwAhuGHnE0HSwhK9sO9a1B2BSDT/WVHPImHGDP
	 M6JmJbTPc/JCLF83q0QQCni8AuVCM3nHhNFjYSc1hqmG6qsC+fl3csxSM1a52ADmL/
	 gWfa1l1D1owg2RVEf2E5/Oclh50W4v2J2or9/WECugxX/0Mj0BjnG7do9xj39Hzm70
	 IiGUUbmTc8aLnCylMisqLRdCjDPTBiYNsW3YP1+8SO9OWcxIMvsW+9OQTyRyxLQZeS
	 LzVEeTy7gK2aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD8184F06;
	Thu, 22 Jan 2026 04:20:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78EE824D
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 04:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D2EC42186
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 04:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fadNbBvyk6-5 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 04:20:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E68940A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E68940A99
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E68940A99
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 04:20:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4801c731d0aso3892515e9.1
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769055631; x=1769660431;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOwyXQAsLFa3486gEGuvdik5Pg+OWwl+T/VcoYoYvbs=;
 b=vJuYktz/JWTwk9h2TNbJ58eCNtJTADahKZQMVEz5NCvjdLfCDY8pmQ0QVrIANoQHDu
 LQC1bYQBWnHAIVhblHHm/UiJhWI1bRc5QXseC3f7vw5q4kHBkFn/8qOzVSJu0yLcphql
 dZkYa7FQkGu2aVy/M+n5rNPeescjtHI1naU59qvB8yYJtUHrMaXR903EUc0Yle0QmFWu
 eaKbtpsyYMZNsFm9DgXaNC8q1jHEF9wg6eyEN6wAAkSrK/0lTElgf+MhaXU4kU40Opmf
 LrUq/PZm+/sAq4GSyXurqVAh9SyUMxP7GccTquglEyQq6r/GtZ6Pep8XYBKYH6RZu08Q
 Oq0A==
X-Gm-Message-State: AOJu0YxzsuF1u0j9J6C5XkLJMQYzVhMad4G5byO9UfzXVw5rNDGuJE1e
 s8IKcmsWEC/MndTjOTKy0AoFL2R9P1kpiREJlrB3rD+zZ8MQf93/2oW3tC85Iw==
X-Gm-Gg: AZuq6aJUDtHtF53xZ7BNNGehK9PHbReniYbwxp4sbdjLBwiq5xplXEMV0daSoQpKa46
 l3Iw3kQUykElC3hLP1qeYXPITgG222GD+ci6e6PlT0OoConKijdGizp9SwIbCls3ee54p8vEpmP
 pcaN9OWrzg/BzdBTM0JwdpfB0D96hFIc+/7oSx0yp7ECXXs5fTeERvuMy7g3e6dZGU/QUIbUR+I
 DPfEH1bjvFlMkxFH/hxdrGeOnrXc0fWR+ozCJMu20Yis4nyPaYUZ/7My5tCvRszs6BRRZjxXbi2
 wZoLswSFshvRLMO7VpNNo4N76GLW1/zzzve5ETJgBYYz+IY0Q3MV0DGJVwvkBf+rsfD8wBURyRr
 ws8fB+AaAh0AGX/pfaiZvNJ2sgeDwVSq43DbzjMltFJVptC9iTcwcQgA8KYgadrQpmZyE5GeitV
 hRqhfSkv+uayy/voKMNw==
X-Received: by 2002:a05:600c:19cd:b0:479:3a89:121d with SMTP id
 5b1f17b1804b1-4801e359031mr287926585e9.36.1769055630990; 
 Wed, 21 Jan 2026 20:20:30 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804704087asm33829535e9.6.2026.01.21.20.20.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 20:20:30 -0800 (PST)
Message-ID: <6971a58e.050a0220.233dc1.86fb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 22 Jan 2026 04:20:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769055631; x=1769660431; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vOwyXQAsLFa3486gEGuvdik5Pg+OWwl+T/VcoYoYvbs=;
 b=bihy0Lblf75RDT51nay9yOFSxzsySdFoyRBP9D6TAecg2aRDZqoXYuqDAf/N5SZDBF
 Im2+7MOermNEBUrvXTEw6QLyFhgbvxD34mW4HCWm84aoJhabXuGnWBekGJ9huZRYcDd/
 fN6aLNfDpo8CD8ITvOMKNKuAIGw4wAe7MatiHkZWQTe4y4B/K48W3eEQCiQgsu2wfyY6
 z6mOkTSimxJ+RAujst7pSCMxfa3VoQPO1ZSNZk+8Rt7x018NsDTieGeFOjECAMJpUtYi
 ljoNWBVLpVXn1qQylMr3MN4GDltKtyNaOuS+0ZkLtk9sRIBPP3cOm15EXO6NaUE6G1y6
 1tBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bihy0Lbl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-21
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

Autobuild statistics for 2026-01-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 10  |  0  | 14  |
  2025.11.x  |  1  |  7  |  0  |  8  |
    master   | 29  | 58  |  1  | 88  |

Classification of failures by reason for master
-----------------------------------------------

                  cairo-1.18.4 | 3 
                   dash-0.5.13 | 3 
  gobject-introspection-1.84.0 | 3 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
                 jasper-2.0.33 | 2 
              libopenssl-3.6.0 | 2 
               linux-pam-1.6.1 | 2 
               pulseaudio-17.0 | 2 
                 aichat-0.30.0 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             berkeleydb-5.3.28 | 1 
             bmap-writer-1.0.2 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
  distribution-registry-v3.0.0 | 1 
              erlang-26.2.5.15 | 1 
                     fd-10.3.0 | 1 
                        ffmpeg | 1 
                      fio-3.41 | 1 
flashbench-2e30b1968a661474... | 1 
                    frr-10.5.0 | 1 
                    gawk-5.3.2 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                 host-gdb-15.2 | 1 
              host-grpc-1.66.1 | 1 
              host-guile-3.0.9 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.9 | 1 
             libucontext-1.3.3 | 1 
                  libva-2.23.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
                openobex-1.7.2 | 1 
                 pixman-0.46.4 | 1 
                 procs-0.14.10 | 1 
           python-brotli-1.2.0 | 1 
                   qemu-10.1.0 | 1 
       riemann-c-client-1.10.5 | 1 
                 samba4-4.23.4 | 1 
              skalibs-2.14.3.0 | 1 
                  snort-2.9.20 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/335c91dca47234c438b7dac8f6fb77b691aba2fa |     
 aarch64_be  |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/acc968e68c1e8fe1313c76bb9b38631d7a8462cf |     
   s390x     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/33333a64133ce57b23dd5668df18f2e6c206e4e6 |     
  riscv32    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/09f1044cdedcd5a880378ae98d8af20946fb278b | ORPH
   s390x     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/d1e54dba3d639311f6d9272f1b87b467e2d54cca |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/ebe3e187b8bc707668c50b1108a6f0d608da634e |     
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/db7a2f47adec2ecfe23e0e99adc97152b5fb4233 | ORPH
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/bdb1eeaf7c671c5592a7c975cbe02269eb9d1e18 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/62b2fd0c482d8b0f8eda2630ffb5dd7f30858cd8 |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/bde275e806f799d5790ffb6ec02dd766072cb98c |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fa9d1b77b046f8b291d4814a86158b61564c08b5 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a23fdc591895b583d3f30671a06cfd99886024ae | ORPH
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/7b4602d4b2a809b0b8b221012923779575eb553c |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/73c2cb19883fcc641267399248f54b6d3e46f41f |     
 aarch64_be  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/c9c4e1f24adc929edcfd14da1648784a1d100614 |     
    i586     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/681f52e77207c06d2ab42db57233e6bd359f909b | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/b805b7d205f466977f5feb9b0fecef1587881d62 |     
  aarch64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/9a0c58d42be29f4131014470e60346eed7028e71 |     
  riscv64    |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/52a8be8dd19cc76658721f40d09bbaad9d09593e |     
   s390x     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e1522c020946736f375920455c08bd7adacafd49 |     
   mips64    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/aab190e73a6d65fa2edde63dee19230c7bbc966f | ORPH
    arc      |           frr-10.5.0           | NOK | https://autobuild.buildroot.org/results/804ab94d1ba946f9607efd73b64bfd5e293c5024 |     
loongarch64  |           gawk-5.3.2           | NOK | https://autobuild.buildroot.org/results/6adf4944001766341e48080ab08a745d2ad52188 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/721296dd728ede14d2ccfe434cedbc022b51b010 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0e12eb63f75b7822e470168271dc5e818194c9dc | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9751d6b901960037d2d92bab3b8bf1a22ae310e8 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1051ad66fab52f286025d4a227c6c03c992c1af2 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/8eb519876640ca518c7a83bfb1241332f41be59b | ORPH
  aarch64    |        host-grpc-1.66.1        | NOK | https://autobuild.buildroot.org/results/0b858094e2b73c33d3f4610f54621c2448834fb9 |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8a58faf16c20811c50eb4f8e53f60d687efaf0c1 |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/78c9e497c475f5cebd24e853a57c0de5c479115c |     
    m68k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/d6b3bd2afaa2bb8f244f71b5669e1b61af2747b5 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/6f381d9a99361116722833bfb4b0a77fe4e78ad7 | ORPH
 aarch64_be  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/cb227bcb7a15f7498c41cd7f15e9469fa373eb86 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/67d4e2dc77d17071c0f67639328c808b3946d64a | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/54a59b0a7471bbf03e23ecc1842935d1eb4f464e | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0803cef9612955b808cd8fa76c0e7bf5d981ea1a |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/62211a2ada593b0dd22c1e7d9a9990cab7e880ba |     
    sh4      |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/61184e6109b3320d703ff9ab8a466a6524a5f8aa |     
    arc      |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/233c05e70e27d5021a57474f1a1d07ac1f05d81b |     
    arm      |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/9b2ff43c352f50d210940e9a787b0478ad1ca456 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fc1f610f88d5203dd53e8a20c96b3677818572bc | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f0a46f21f1b25e259b750677a727d38d70a0410e | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3955eebd5cf5cb2f58b6e1b3540e2ec273791f73 | ORPH
   s390x     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/407afb831c20fb38f2675415c27c7cf0b3f0f1de | ORPH
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/92b9bd978be699fb4b9e1e10693260b8401a5772 | ORPH
    i686     |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/acb8f5660718560f646093f80c7c608ef7df046e |     
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a3daf58b7db0fa7b46170ba522d2d8baecf5cb67 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ac62f074eeb106876f0f98db7c39480b8f3aabe5 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/75aaa59d49aa6f1e2df50c3ca88064edba72dea6 |     
 powerpc64   |          qemu-10.1.0           | NOK | https://autobuild.buildroot.org/results/916a0c7752449f453d202a523344fa893e16af4d |     
 microblaze  |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/ea2862568b697ac88bfd71873c9fb4831bb3f9a4 | ORPH
    m68k     |         samba4-4.23.4          | NOK | https://autobuild.buildroot.org/results/b606da691bb462879d4f9769928b5a40b9170837 |     
 microblaze  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/8182551f991eee7c8f2f15fd97e81d4792646952 |     
 microblaze  |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/eff921674cf86057c17a54344776ff91547b2033 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/f4b236dd7b61ae324e0b1bf77bc595e0ac3400bc |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/2b36cebed2ab8b5200020bdcd988f64bcfe31768 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/d2f88d7a1937ebfacbe240c1947a7e25144dcf66 |     
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/c980b0d7653aa060b2ad312e15d22bf0829d229c | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

           at-spi2-core-2.58.1 | 1 
               dvdrw-tools-7.1 | 1 
                netdata-1.37.1 | 1 
                openssh-10.2p1 | 1 
                   swipl-9.2.9 | 1 
              udpcast-20230924 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/e5787211fbb69fd7d4da9c971e37f188ee60efaf |     
    or1k     |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/9d40d29fb688d61a2b1dec658819aeff397b5f4e |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9835a8a795880e20c8a80d2089254bde4f8e649f |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/799cc8940dea0e22bc425a27ebb2cd7910ad5b30 | ORPH
 aarch64_be  |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/5246197d9103b6f5536f56c623b58b558f1e9c44 |     
    m68k     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/18e67c50c67de47e057edfa4c4a83860a8d10ebd | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/186ddae0076b0a7f0bd62c88c0d992350cb38547 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 4 
           host-libselinux-3.7 | 3 
libsvgtiny-ea9d99fc8b231c22... | 1 
                pipewire-1.2.8 | 1 
                   swipl-9.2.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/64af0f847b662d29438c1aca085ba706cffd4045 |     
microblazeel |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/48358f484e8670731c9d1d5ff9b8c4ca96ca2e79 |     
powerpc64le  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/ef7af9979a3d2ee5c13bb88b4b002280cfd2b05f |     
   sparc     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/d3635e6034c2e390bdbd9ce42a290b0bfa88b5bb |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/c5037abd32bba254c3747fdbb7a7fedc22b66f77 |     
  mips64el   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/a599d20423a523b0b26615dfa2767c3f700e4b46 |     
 aarch64_be  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/4c29605e195a4f26c1213cd0674d84073173d3bd |     
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/887d9efbf2186ade92a81e0530af247502e760d7 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/afcb7ff3001e485798103eddf728e0b6b3cb8a02 |     
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/b0c5f364fba64036f7bb38f13d5a9f881eaeea02 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
