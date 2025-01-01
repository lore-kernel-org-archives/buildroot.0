Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475DAE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431BE81125;
	Wed,  1 Jan 2025 04:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3bUPyO3CJA2; Wed,  1 Jan 2025 04:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98FFB8111D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FFB8111D;
	Wed,  1 Jan 2025 04:14:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 789FEF24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 04:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59547400CE
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 04:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDro6ic2uu7U for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 04:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E71A4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E71A4018D
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E71A4018D
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 04:14:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so1018719566b.0
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 20:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735704869; x=1736309669;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t2gg6c3j9FKanCEJy7FxkhzoTy/2HxZGUwK7BJwNHMI=;
 b=WS1sTMXo70l4gGyBBL4eYnjZtiL3OxckWimwW1OuQF5PPpJywKDkRucSBeo+hK3qSu
 mhbuWztMfmjRmfg9Up+s2bZ5tYUWXo6P/TEv4sP4vblxaRI4yL3zmPe0SJ3+R772sTb8
 DUfw7WfIJLEGatJxvXH1Csuaa8IWuVnsP9uem2PpzDJHbk2KTmqZET96g3CzOiGxKDg0
 8AqtI38qrxRZqV0ly9tW7EezQfs8Cq55BH+UvejFk7orldnYOU52WBdf1+u5EbGIIVi0
 jqtfqoZs9YG909Mxwge7cmfRTOA7KJ3eOoncFoi6XIKJn5F+xgY/nvr6Lqmg7h2PAxC1
 /t1g==
X-Gm-Message-State: AOJu0Ywq4JhdN4imtg5gv6kgLDpqHISm5ntXnQGMlowTjA+lNXAs9nDC
 dng7ecnrrO7Q+avbflWS0xlXzr9fOLB1H8sw/HJU2a42HHN25A7ecQN96Q==
X-Gm-Gg: ASbGncumnuoRi14ya6MF2yfvaevf11MPhHmiiRwEC65fLZ/eYB98/r6Z90/hbPCk/l4
 V0XLh9NCII5nmVtdxhmhEHqB6ZTrZPmhtZfuRYNcTdxebR3UHx/mHNb/RllZQGF3A1EMgsEAd9v
 z/IMVDFqYCTr+lZe7VphbPKThlA8F4nc5FfGKBeDusYXNeFuR8/pNTuXkU+hCgvfRsGhc02MJrl
 kPKF/HB6DKWmOz+qp9VnnoOJsYSvK2gRDaIIFLzF04YizXjObeSg7yQJTeg
X-Google-Smtp-Source: AGHT+IHgpaU2lN3p35Dx9qxpnizc6FjtQAo+FuLAyCv6Ps8DpgVBVLLYU77C0ZGx1890St20YpRDuQ==
X-Received: by 2002:a17:906:c10d:b0:aa6:7881:1e84 with SMTP id
 a640c23a62f3a-aac2ad82cf6mr4521889466b.15.1735704868986; 
 Tue, 31 Dec 2024 20:14:28 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e895075sm1641992366b.51.2024.12.31.20.14.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 20:14:28 -0800 (PST)
Message-ID: <6774c124.170a0220.19118c.1cb7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 01 Jan 2025 04:14:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735704869; x=1736309669; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=t2gg6c3j9FKanCEJy7FxkhzoTy/2HxZGUwK7BJwNHMI=;
 b=gsvWCE6GDKQcgLxD2X+1ZnkgNjF9GpRk6NArqp9CGj6hXk+sNxRSDia6htBJ2mahRF
 BdQwzlPEKZjGtRw2NiT/S3kwEV/xnOEycCh52Xnr5GN/XhoR7fJIJfDPzQibNXZQAFjr
 9J9q4Vgqv0fClXzeTHRtZMegO340DHAuNe5JsNF+dM1LU5IkYeXvNkwwpJ1razuRLs/y
 ls/FZkJckNjyjxVQLgIuG1fqyi8Ud++s0J/DmQjDqObbPSBwWd1osgmgnN4YXszDmTbX
 SXq/fi5j24oOqy8FKmeGsz+fLP7hZO1QJmba0XeLySFbv/rsPwOtYK56EVJaymdy7SB1
 dN/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gsvWCE6G
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-31
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

Autobuild statistics for 2024-12-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  1  |  0  |  2  |
  2024.11.x  |  2  |  6  |  0  |  8  |
    master   | 12  | 55  |  0  | 67  |

Classification of failures by reason for master
-----------------------------------------------

             batman-adv-2024.2 | 3 
               host-php-8.3.15 | 3 
                   perl-5.40.0 | 3 
                       unknown | 3 
           v4l2loopback-0.13.2 | 3 
                elfutils-0.189 | 2 
            host-binutils-2.42 | 2 
    host-python-greenlet-3.1.1 | 2 
               linux-pam-1.6.1 | 2 
                   linux-tools | 2 
                 openssh-9.9p1 | 2 
                acpitool-0.5.1 | 1 
              asterisk-20.10.0 | 1 
  binutils-arc-2023.09-release | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
                  fwupd-1.9.20 | 1 
host-binutils-bare-metal-2.... | 1 
 host-softether-4.30-9700-beta | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
               libdeflate-1.22 | 1 
                libdrm-2.4.124 | 1 
           libfreeimage-3.18.0 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.12.7 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
              mosquitto-2.0.20 | 1 
                      opus-1.4 | 1 
                   s6-2.13.0.0 | 1 
                   swipl-9.2.8 | 1 
              tailscale-1.78.1 | 1 
                   trinity-1.9 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/8d1229033bad02a6168b74ea7e6d9810ce14b09f | ORPH
   x86_64    |        asterisk-20.10.0        | NOK | https://autobuild.buildroot.org/results/1cd30910a5ade7b099704f5bf2b74bc7f28a6750 |     
   xtensa    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/d50f6b936a55b8a0847af25b8ea8b856dd75c839 |     
powerpc64le  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/291e843b1236d2a2c2fb255db1f4f60fd0559f42 |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/0583c2be8d805f280cebd0a1e0e75d309755d2fd |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/7f6d441b8a9220f6a5a5f59216a1c1ccb75ab848 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/af8f11944f5f44a90e05f0563ea42eda495333c9 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/d4c38155d0e88f8eca487dc34e5dc3e586ecd6d8 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/deac3504b9df687e5e7cca82ddca550ecb052d46 | ORPH
  powerpc    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/3761ad6f4da2445c287657d66f0e1b684f125194 | ORPH
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/832637cab49fabd1403d50f0f81fcc3014e89b82 | ORPH
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f398fae40ec91b3e4e714ba2d99fa61136c82af8 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e45310951a3fb4f4547ca6ee1fe7c83c86c0b14c |     
   nios2     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/23aa7979f8d5e18bb51244a5e1e78e7c25ad3e9c |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bc129cfa5ea7d81146b19284608644fbf3b7c85e |     
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a247e0c7266a7fdc498246b9487a1a1ad2be0422 |     
  mips64el   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/78bf01edbd463ba488165f68e9a65cfcfcd6b14e |     
   xtensa    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/ce56f1c74f5cf4593fd39f8b3d0691209bbf3d6d |     
microblazeel |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/c49b85a6c0a308c59dcca30b4185cc6ad4871f5c |     
   arceb     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/af38d441f1084fdd9b3f7677d6749cb104ed2968 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/11560715da383fc4b018d1f3388932dc5f37495a |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8ea284d7848ae603490c318292a88eba633d323d |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/cb23d80b7204695dc2d542bc0f573f6a8ec67fe6 | ORPH
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/97a8e4c8cd701b1ff7a04cdb4e389649edaf5271 |     
  aarch64    |        libdeflate-1.22         | NOK | https://autobuild.buildroot.org/results/63ae3577472779aa46498731d0621ec37b7fc3fb |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/1c7660a4a1d56b1cd4e7630a36ee230d0deed665 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/55a15e6a9cef462c32721a27e8e20347ccab2104 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/92149764d8e9a17545075237d81264435a094eb9 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/7d52afc6dec56f85e8165bd4f31fa5ef7f4983db |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6a70fb3f77851f778889b5821dbf65335cc848b7 | ORPH
  powerpc    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/e96d3124f87ddb6abd04e707c9894bf899572bda | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0a34e6403495c33f34c16fef211da5df2ac3437a | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d796c6e0823832718fe82e466e5382bada5f0f7a | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c31d83db196da878ea2d187796083d651086e7d2 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/53942b9020e3d52a849e312cd415e5cbf87e6218 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/8c383b94b372f1df5cff8cde6c9df9ab798c152b | ORPH
    i486     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/87c9e11f7ae504d58abf80c34f61f7926d9d5f47 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/4d32413ef6c9b43464b59355b89976b475308337 |     
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/e9bd39286ba1391b322aad472e310b3fc742b188 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/7f61ef0e19a6a59eaec2a9229ea9fe57a82b6136 | ORPH
    arc      |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/f717fffaba11cbf47e8a34f3359f5f75a8d44219 |     
    i586     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b95c58221375ac4146b5e98ff5b33769d3d102a8 |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/42eeffde31474b7b77a3a1e6d446ee2777a0bf9c |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/d5b929d5274febcfd7f7cb49cec472a744b0c694 |     
   x86_64    |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/434956d16cc7f7856667d6f5dd308c7e49cf3dd9 |     
  aarch64    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/87f54e0a8bbdbdf2f3932bc801dcdb9ab209dd1e |     
    i586     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/e1e21eb75aec28e788f19c1ac080f6e2cd3a8ce2 |     
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/ce4316c11e376c69cd4c2ea0839ae02812cabdff | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/91d59ddfcd4f20c8957556fde60c2927699695ca |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3690f61a2577431e4074246eca5a4fb95a2ed5ec |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/60886953079675b6b3f698ce62131d2987ed929a |     
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/259a01b3e74680caea2df50c5d6f318eb27f861a | ORPH
   sparc     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/b24c15d64841a7522c33f7a86ff2a3d5f872e095 |     
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/9e81246d5652c9253ff876be1bc46b96bdd38b2d |     
  sparc64    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/cff401d55d2c02508c16d5c22a8fc57dcd07f877 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/30a873a7dcac81e15277dbe1fda9266f4ca82bb6 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                    chrony-4.4 | 1 
              fluent-bit-3.1.3 | 1 
            host-binutils-2.42 | 1 
              host-rust-1.82.0 | 1 
                 linux-6.11.11 | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |           chrony-4.4           | NOK | https://autobuild.buildroot.org/results/4ba7961c90df36e80ab321a2d1eb746874444a6c | ORPH
    arm      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/8d696346bf32d72409fc81a04eb7ac30cdb76fef |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/54210fe48e94cfeade53adda9b3dcac8724da4c0 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b4c7fd38490588cbddc0e4e705f251d3e8be3365 |     
   mips64    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/4944d9be9652a0143563243b6929469d18bb13e5 | ORPH
microblazeel |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/6c6f0ca7cb19f82b676200014fabd39b83a95710 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
