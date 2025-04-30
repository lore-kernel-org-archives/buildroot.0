Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9932C369DC
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 03:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE93812C1;
	Wed, 30 Apr 2025 03:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPdeGxRk2wHi; Wed, 30 Apr 2025 03:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26F118127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F118127F;
	Wed, 30 Apr 2025 03:10:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B787FE4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 03:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D1CF60AFC
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 03:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4AFyWmS0YTQ for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 03:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 637EF60B6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 637EF60B6F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 637EF60B6F
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 03:10:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so3705750f8f.0
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745982606; x=1746587406;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVfUCaTcmPsKuITWvAezFc7Dur6ypkcjDB5HOKK3uH4=;
 b=utmFL1wAb3xJad50+5bZvhfT3JEu9ba2nR64IZSvE8j+IbtByH8eTLyL6pp2yPGjvG
 jjZDG0fAqkUskLgNqwpacMQZc0WgTPIOIRdt09UYtIhgOed06i6mSkkOGxj7X8e4mGOe
 9SqiYpLtFcg/0B3KGnJj/quX3G3KMAtxV6JshOVPZS6/pca/ua3dzdr9XTRecHq3NL2e
 qbvc2D2ajDHxBCTJmBFgWfJAUIid/pX8LiD+kd7/NFjeizZ7SrH4wQnb20pk0si1PANp
 KG/iVyKvSXQv4mwOMY/olMlSx21qkW4bPnSYLXYCPdzEAdShQPyYo+Xq0K+h19lWELki
 26Nw==
X-Gm-Message-State: AOJu0YwBCFLGeaZL+PUzrk7/g+lPQwVtZ9/+AxhQIxEoZyMF24wq4A/K
 oVpRTNTzAcDlFfM5NFNia6x9dZMYRvTLTETNonWteN2iWEiYcZInLBOfDQ==
X-Gm-Gg: ASbGnctK6nQu8XMYAECY5jj4Xr6sucYQ5KGYySVi4ZeMNMtzbZ9x+bn+nVnkXR4tCxX
 Jm9zZxeZb2DUA8BkjxRufo9iKv0ghhRl/D3uiFLmTn+9nu+O8lUV/sSLkKNMRBhTi8/2AiLKg7Z
 YSwquB3D5pdTQU1xtDFFQHVVNTK15xv5QEEbsyXOevJS9mOkdnsgSi6y+PkytceZsHxM20cKSka
 sUK4x/8FXt/KFhDLPNrUcHg/B6oiKwTcMdmjdOc9MS4xeDu0WuKHmA3TxlcV+KuhmkQyeVmhF11
 TyeZ3KdmRd9oIcGX4OZlywKDGYWs2MBabVm+I3/n5xJ8+IyCna3yt18=
X-Google-Smtp-Source: AGHT+IHnoEjgfK3pPfqZX4jYKmDuAdGUunWfvReUDYrCtBoaxGfijRCThEfv+CS8OXvUI++iEtnKBw==
X-Received: by 2002:a05:6000:2ad:b0:391:39fb:59c8 with SMTP id
 ffacd0b85a97d-3a08f7a2065mr1174199f8f.25.1745982606155; 
 Tue, 29 Apr 2025 20:10:06 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a07dbd6ea1sm11580810f8f.7.2025.04.29.20.10.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 20:10:06 -0700 (PDT)
Message-ID: <6811948e.5d0a0220.2fa4c4.5b3a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 30 Apr 2025 03:10:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745982606; x=1746587406; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mVfUCaTcmPsKuITWvAezFc7Dur6ypkcjDB5HOKK3uH4=;
 b=adP2RbmfUeDPQpel1WSoaN6ne4X0zEknnbKiLSFyAi8VtTN7YXCX4fpTMemzNbQMET
 h7SDP4HHLTAOwPj9ObAngHQ3E8NmHkiFP1Cb2zsLNPnyY9Lkj6IvzPUrywzSUC1DXZ4v
 SkQCeT3RUBfuSRjGJnEreeeWZ1ERebhHVpvNU4BEoEaDrSSdAnpFOunL8Wq8nv03fzJV
 7K6FL1SuNLBhNqJyWPGw8q5nMfr2NIgoDaUf1PspcVtAoHeR6qxiQZKmuF/dOlMXofst
 ZPadNjrbMNRNO3FZ/mPyFP3qcnRKUr2WiwNk8mopoCSFFfyug9tDe5CT5H9IgQW+Kejs
 f7mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=adP2Rbmf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-29
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

Autobuild statistics for 2025-04-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  1  |  0  |  7  |
    master   | 11  | 30  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
               graphene-1.10.8 | 2 
                 hddtemp-0.4.3 | 2 
                   perl-5.40.2 | 2 
          sane-airscan-0.99.33 | 2 
amazon-ecr-credential-helpe... | 1 
                  bcusdk-0.0.5 | 1 
             bluez5_utils-5.79 | 1 
                  dlib-19.24.6 | 1 
                elfutils-0.192 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
  gobject-introspection-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  janet-1.35.2 | 1 
                  libbpf-1.5.0 | 1 
                  mbpfan-2.4.0 | 1 
                 openssh-9.9p2 | 1 
package/gstreamer1/gstreame... | 1 
          perl-net-ssleay-1.94 | 1 
               procps-ng-4.0.5 | 1 
         python-remi-2022.7.27 | 1 
                setserial-2.17 | 1 
               syslog-ng-4.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f221c5568c61d0a0e482fef205d3fd1a5d059f20 | ORPH
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/43aca7ee84e2ba03c4dcc96d665069829ff44cc3 |     
    or1k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/dcff19f6f36c7f6f9d3b8e144cf3c18977772222 |     
microblazeel |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/90a8b77fb2e0414d09972b5fc0a4e1feda9e729d |     
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c279c18888825b42c02061bd6dcfd0e259e6b89a | ORPH
 microblaze  | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/aa5ebb096fbcc0358ae1077ec6153666dd392c82 |     
    m68k     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/578770876fd9046cd9a046b1b564f8b1af52030d | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/3646ff88485222c099c05b7dd4a9fe1c096d6c0e |     
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b8bb52b34cd29252f1ab3a1071c60a71f2282278 |     
powerpc64le  |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/43ac22e44ace8c0ba011d6d79603977aa9a9beff |     
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/b06ff04f975a1b9a78450fd119fd26152c629be0 |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/025dd40a1bd437ea7277ecf0ed5ccd6eb867efd8 | ORPH
    m68k     |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/3183ac3defb2f950e427e86846875c27d1f0784d |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/121b907a0ba7d7258994553562c4a8ac97283d77 |     
   mipsel    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/a38094d6a04ee8b28b17c70f0870964331287335 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/5174f5ca6e31c780d0cf4ebc61f516feaf2e7b30 | ORPH
   s390x     | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/ee84867ed798f927871e9411aaa60dd10423bf2a |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0035da7223bcb38d9c634468868a61edfba9ec59 |     
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a82a948ce03ccc845a7eaa27cf62c1bd03906cea |     
    sh4a     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/3bf18cdb672d4d58420371de4a59da50c3ff38e8 |     
   arceb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/e7fc168e8348e3579a9f32602fea83bd4840fdd9 | ORPH
    mips     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/c950e67774c3541ab2fe8bae03181924561a600e |     
    mips     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/fda22488ffa82517e5c0e563faaf1250a06619b8 |     
  aarch64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/37f20f6029e9dc740f6705351e46605ddb0bc348 |     
  powerpc    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/de6c62818f6821364ec469381c112564e19be4e8 | ORPH
   sh4eb     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/805542400c199dd90cf18b95f8fff2385c12d18d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/300970fc55250c31fac91f00ff0889f49a418bb8 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/6d8fca3d0f7059a7dd03ea4214dad8d98943c8a6 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9ed16d50c07e6d7f59998e97f8789a43bda3aac1 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f05e8941d2b5ca582d94734b576a34799d14a816 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-rust-1.82.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d916e0587bf5f3181ce2e1ca9d1f600930f91d65 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
