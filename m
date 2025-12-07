Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF43D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 04:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B2E760B42;
	Sun,  7 Dec 2025 04:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Du-NBzT-dTu; Sun,  7 Dec 2025 04:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94E760B9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765081571;
	bh=ys7r4a6kkGliyAJO00eC0y5JDeUXvlC22fIBHxwUHqI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Myo65IwMvAgWs3a/WRvc0mPw+K9+gX36a5iKSob3Ga63UP68GQAMY2o1h4i0ie+u7
	 iAG53xB7CwG8JZ2udARXx5w4/Up2wAmT2hzWpnvvD4Pgv54JrVBJV/cbd3bAJzlcsO
	 njMyqB3MC/1MRWAMmC8+DuVnq/eI1aLJre5Z4j9WfPJwEG9ajOExAE7aie1IzQPzQ0
	 w9PKKPfGlaXJ3ZJ+hnJzRfR39UfHBghVZwY440A9ebW3klfCOpNwH2J53fcmKasVB9
	 BIsk0kMiWIa8bE/3DEMJ+sQSn9IHy5aoWA1wAXfCCDYS95bnijCxbOa+Ob9xU2f8hf
	 vM65/o7IHM+nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94E760B9C;
	Sun,  7 Dec 2025 04:26:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B67BFE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 04:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A87EE82566
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 04:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3ue2UjqGe9w for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 04:26:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E548824DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E548824DD
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E548824DD
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 04:26:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477a219db05so23768345e9.2
 for <buildroot@buildroot.org>; Sat, 06 Dec 2025 20:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765081567; x=1765686367;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bx0zNun99fTKqSOdpMETMIJz3aMN8SeXVCr2oK3dEt8=;
 b=b9WxJHks3mm8GdVg9aEqt9Ib76t5SIAYyCFxoNkd96p/WJoUB2iCKjWLAk59V0bJtZ
 mmFeyvWyKMJGj0Vq9x3t9Hu1451NtUJvdqiNKbJ4vtHPG2TPgngV7P0xHO0q3K3avp7T
 jwfDPWNJYppIIKC63FvObDv+gwvsMsXWIOxZu18x4A92Vd4WddPNQzwNlO6ux2HZeWgy
 k0jnDmye9LQ5vPN8H7Qb8vEa/1FmDbo8Yv4yg5GAa6XZJpNdYYRUlntcCxnbQ2kMHv2j
 3/iIzt0Ohe7sx9humNc0nzJdRkAyOyC3ulyWHcaNB37pBdNuznS9WTinfYygviY1Ok9A
 mN/Q==
X-Gm-Message-State: AOJu0YymTK/RwVnHe9FF4l4aAEkBNjLBzuwgsNaz3dw8qJn0I3J2NT82
 QzUF6lR7FGN+kj+oseTPgOCxJaE1AFpey8KSVtWyOnY/S4413PEyDGYx9/9CRA==
X-Gm-Gg: ASbGncuvyRQDjr+g5HLnloqafHtXCC5GWHY2pTGnf//xNXzpp6kVJm952nKQPO406yP
 UgqBbp+X0R4X8VvObcgNLU2OOYBMy+EYnHmE5ZUi1LMPNxWt1zgpAIN1afuBEbnG4qaFM4VAOUt
 Wy6mAZMdp2hisgKpCv2y7/mo8hX7SDKIgyniA7yzJIFh6QhD0MxsfYKnNg9C4HVlHieR/XBBo7y
 cWC0FHgSS9l2qDfkT1g6PFxm23zUhjor23MgKz1nFEDEE+K8foLVYy8623fyyt2uT6sNoudnMcv
 Y0vCA5L2bUV2BU/Vsa/8cHvqtFxW4rlHcnDMgyzeB7QFl+PtR/5dB/L1pzW2mOZn/DsLjQ2zClK
 Qe3G2hycNnlfulgBQNjQB/ibMtd27/iLnXKws97eLi5U9KA+4aaQRaBSI1Uq/Ep7SnL8WnaxYhP
 hSwPgF3cFlotM0Q069bg==
X-Google-Smtp-Source: AGHT+IFXrG9sSNErp71W5nKcYxY0lGq4NXSQbzR8XON7Svy82JKuEepm39EVdU/wyynfaJ268Fzacw==
X-Received: by 2002:a05:6000:2284:b0:42b:2e1c:6341 with SMTP id
 ffacd0b85a97d-42f89f0ab32mr3894914f8f.9.1765081566598; 
 Sat, 06 Dec 2025 20:26:06 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9032sm16748889f8f.1.2025.12.06.20.26.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 20:26:06 -0800 (PST)
Message-ID: <693501de.050a0220.2c92ea.1268@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 07 Dec 2025 04:26:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765081567; x=1765686367; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Bx0zNun99fTKqSOdpMETMIJz3aMN8SeXVCr2oK3dEt8=;
 b=ZQq41OdUqGcsMXjTRxagyV1rZ+qp2AyQCuxDd5Un+8wKGj/7T9pCxi4L4KEE/9V2mM
 e0O7klAW/+cpfD0CcbNQ5kJiIyOzt1xDpgnFiU/cNMogOZl9CLwZu1hdgmfw5F1D4Gp8
 Se1msjZCkQpG49/Scv/gYUBFg/b6/FP8CGPu2PQLkJ2f/7vxPjdMFQ032azldMc40010
 3ytEM6Gdcwndlj9XPh76Pn1sI3QjL9s70DQMj9lv5409uoUGri5sr70Vz+20eFxphroM
 ifWqGUfvwfcRSI0mUeLejkVx5s/2Ft9fA7kwLvU+ui2FYAzJFLrVRKuM2mo/OvFE8GNC
 ts3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZQq41OdU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-06
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

Autobuild statistics for 2025-12-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  |  9  |  0  | 22  |
  2025.05.x  |  2  |  1  |  0  |  3  |
  2025.08.x  |  0  |  3  |  0  |  3  |
    master   | 43  | 58  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 5 
                 linux-6.17.10 | 3 
glibc-2.42-3-gbc13db7393773... | 2 
libdill-32d0e8b733416208e04... | 2 
          linux-5.10.162-cip24 | 2 
                    mpir-3.0.0 | 2 
                   perl-5.40.2 | 2 
          aardvark-dns-v1.17.0 | 1 
amazon-ecr-credential-helpe... | 1 
             batman-adv-2025.4 | 1 
                   bird-2.15.1 | 1 
                bpftool-v7.5.0 | 1 
                  brotli-1.2.0 | 1 
                 cdrkit-1.1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    gcr-3.40.0 | 1 
                 glibmm-2.76.0 | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
            igh-ethercat-1.6.3 | 1 
                  iozone-3.508 | 1 
                  janet-1.39.1 | 1 
                libdrm-2.4.129 | 1 
             libgphoto2-2.5.33 | 1 
                  libnids-1.26 | 1 
              libopenssl-3.6.0 | 1 
           libpciaccess-0.18.1 | 1 
             libstrophe-0.13.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20250530 | 1 
                openswan-3.0.0 | 1 
                pipewire-1.2.8 | 1 
               python3-3.13.10 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 
           uboot-tools-2025.10 | 1 
                       unknown | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.1 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/4f663387ef563005c505feed5d188c2e8cc3f034 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/db6127208ea2fa5aaea1586efa6edc580db0ce0e | ORPH
    or1k     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/fe532177cabd6a110e8c84807763e161663acbbe |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d4cb7899f7c06de63a941b1b4d4b0b73a7662077 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/cdf41be7b6510d3e01519e1cd900e88186733aa9 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/3970cf4973c9701da9db234d33d87b90d221d51c |     
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/2f56cd11560912f0d1e55f5bc087be8a6340bc5d |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/54e760019fd3fdfc316c529da6e491a8ebc03617 | ORPH
    or1k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/215f25ffba384f9d94bb87f4a0c6fdfc3acf1caf | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/e5c89a19a05c2c3ba83c160881bbd23a31d554a3 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/7e43fe28ef17805889472e47f299a3fc3ee14682 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/de60b499b154650c26cba907104d7955ee3c7361 |     
    arm      |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/7071bb79eb65a567a111a34a09516dbfb5279510 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/ed508c1ccb94dc8d82ab128d1c873fadaf2a7b54 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/ebf55ed4f4243af24d6d87728f97ffc48fc1944e |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/0506bc5747ee62b3f46b28f911c88cd98b581a44 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5202927083bf3fa168a2d0532eb40589b53d3083 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/351ac6ded78b2db1c5f9893664103f50fb9e2b07 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/fdf4a57f0ba78a847322a91acf712333840ad4c6 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c6773ab53309425e8b0a81561e900bce778b91b2 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/40a672c90c1a5812248d866b41481225aa8c8b5e |     
   arceb     |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/52b5d33149145372af98ec1a523d7da00a68d9d8 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2419472e45e41c5c9a682b56dff8e530a3837a11 |     
   xtensa    |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/741f730980035054c1a420702519e4d4ef1a5d0f |     
   arceb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/63614c0e1f36313b996247a7d0acb6edbd4189d3 | ORPH
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/82a5ce6fd08024d0fad7ff6cf7934ecb0851f28d | ORPH
   s390x     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c3d411c80428109ecda8744256df8d68e97ea8eb | ORPH
   s390x     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/63cca0c2ca7e2b094f908d6c63cd3288c8187de6 | ORPH
powerpc64le  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/164610404c25cea7652253e4637b57d5eac164e5 | ORPH
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/173ee058e36107df770e9c904bfa8c2f19f18194 |     
 powerpc64   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ab83754d346fe8fdd5e029ad6b39e2bf0f1c294f |     
   sparc     |         libdrm-2.4.129         | NOK | https://autobuild.buildroot.org/results/4230177e03bc3201daa36735f55a87bd765915ff |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/e2ab274023ddbf7641c83c7632809febf7670014 |     
   x86_64    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/fd9872896c49f89eefcb477869724b0fdbedc361 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/01e16a9b736c1978d3f4b7c87853050e4519136c | ORPH
   mipsel    |      libpciaccess-0.18.1       | NOK | https://autobuild.buildroot.org/results/67c115b9ab20793404c0a94c54e4c06feee9091d |     
    or1k     |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/16bfbf1d603f0b6ff66d93bc8703c15248e506ab |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1d0a1e3cbada15070aa4c8550f32504cd54a008d | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6bfb8a43f2c56c819e07b5286ee5c0c03e42fb45 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2e51e4746440076266990fc74553bb22c04ff6fd | ORPH
    i686     |         linux-6.17.10          | NOK | https://autobuild.buildroot.org/results/94730b8cb470193b96e52c16c70c4e5c225213fb | ORPH
   sh4eb     |         linux-6.17.10          | NOK | https://autobuild.buildroot.org/results/bf70e50d63de44c0d6646350f3e3903962bc0e1e | ORPH
   mips64    |         linux-6.17.10          | NOK | https://autobuild.buildroot.org/results/a5057cf2c341a5fb2e2334f12164976fb85e4d98 | ORPH
powerpc64le  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/51ebb49e9018b56103eabddc2be183624454ac99 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/990a0c4d7338f9cc6bda8f640bd27cb27c31bb8d |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4f4e82fec45acc953d57e4bfab036895cb26c0d7 |     
    arm      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/a779b5fa1f8fd14400bef8fcd609106bff7de791 | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f802e3ee1ca9a1afd80ef76f2f9c500d3ea719b7 |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5b5d5403655f2ef9af6e13ae77afd6e0176b3811 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/2a5bfc026b5ea10f7d5eefe5ebf47c916c6515eb |     
  sparc64    |        python3-3.13.10         | NOK | https://autobuild.buildroot.org/results/e7d951b06e9338e622fe96b0fb02823b1ef5235c |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/60166868c8fb60fe439aeead1d95c7e67a2c6744 |     
    arm      |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/8b75ca3dd04f29f5d59c8cc627eeb8b59d79b30b |     
   mips64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/92d58c4bfd7b57f19b1a511e453a7613fa54a944 | ORPH
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/65718d145ab669ec6204e0a2e5fe87a3a820cf8c |     
  powerpc    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/9e79698458706b91af90567d876496ea5509e3cb |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/644c0ca20b12e49846db40e528a80d7b051cce2b | ORPH
   arceb     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/27bf319f071f8652a32d87e67a3571b1cf6a2d87 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 linux-6.16.12 | 2 
           dmraid-1.0.0.rc16-3 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/ec9d6e0660bae8d059f7d5e91f7078311de97929 | ORPH
   xtensa    |         linux-6.16.12          | NOK | https://autobuild.buildroot.org/results/f8df6d9df2eb91ae28b75fb9861d122f50ca1ec4 | ORPH
   armeb     |         linux-6.16.12          | NOK | https://autobuild.buildroot.org/results/a459f6470d75f09d406d6bb80b9cdf43f6ee9046 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

dbus-triggerd-ba3dbec805cb7... | 1 
             fontconfig-2.16.0 | 1 
              json-glib-1.10.6 | 1 
                 openssh-9.9p2 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.40.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
            quickjs-2024-01-13 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/b7e69a301b30ff84666892a59b0864381792afc8 | ORPH
  sparc64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e15dfaf6fd532f687b5a6c61f50c086786400664 | ORPH
    or1k     |        json-glib-1.10.6        | NOK | https://autobuild.buildroot.org/results/8ce297fa7dae0aa1f7a7bbabcbb50b380333008c | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/7eb2f946d96eecf4585052987f5134d0c0204982 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/cb27ee1472088e77555bb6d4942d24eb34db3c82 |     
   sh4eb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/799dcc3365eb91f20bd5297327ee5d48b8945773 |     
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0ad9f84070b78c34ccd22151a04111e863aa459a |     
   armeb     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/bb454f287e87a9d28922b2ad88735aac676700bc |     
    mips     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/fd880df6e3f1ec00e4b835e4115596d7613d9e9c |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   cvs-1.12.13 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ae104ea51eae03c1365168c7fcdac30fde293154 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
