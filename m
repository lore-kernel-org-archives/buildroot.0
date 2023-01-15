Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E961C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA9DC408EC;
	Sun, 15 Jan 2023 12:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA9DC408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qND4hbFGDvdm; Sun, 15 Jan 2023 12:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0C11408E9;
	Sun, 15 Jan 2023 12:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C11408E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFE161BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D82B660D9D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D82B660D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUHxJxA9-GVu for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 12:53:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7797360B3A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7797360B3A
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 12:53:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hw16so50422008ejc.10
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 04:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5iHuBGd/dZiQJacPmXoxfXM/nymKu3F8Am2ewxivs6M=;
 b=bWun3K7hHln2XB8GdHZwlvYPCjt6t+RhVv82e7vlH31QVPlYDRDRxuJaLh5daIfpCG
 lM0L4wJGr7KOYEQHvuejorLgKZocYgfMBd/zLd5W2oZ6EX70YLoA7BYs673ZKU8l0ANA
 P5RnT1M9lmVcLUqOPuCPK4NvH68x82WtkBuTCT8ky2iofoHDqXmn2BA5KKpvV3LHfnFF
 vjpoEs22Tg1ppiZXEFK3663NEKopyfZQ+9gkqHQZV/l6mfkPxNjYtKT8PrSr+AqsEr0J
 +p4YTVnjhDEMBbtNMzRrsB1DSQlhGeBbSMayZEpls9O9vGsdKReU8vdW5CUvAbDCnkYQ
 doPw==
X-Gm-Message-State: AFqh2kpKl2HCxQotvATv+jzFN5t4+VneW2fL9GQsyS+K2sN9YKqQdApz
 nGsGA4EOXAeCERMLNpi0+Ya42bEHyW0=
X-Google-Smtp-Source: AMrXdXuVKvpvYwFoa6/LWBY2m0Rb9A2Gg7FjNfOWI7rLTfenSxayrJlw+tpzLpp0VSAMLtLWjdRZ/w==
X-Received: by 2002:a17:907:a709:b0:86e:d375:1f0c with SMTP id
 vw9-20020a170907a70900b0086ed3751f0cmr3703749ejc.37.1673787183429; 
 Sun, 15 Jan 2023 04:53:03 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0084cd08e5cb5sm10581673ejg.159.2023.01.15.04.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:53:02 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:52:45 +0100
Message-Id: <20230115125253.280257-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5iHuBGd/dZiQJacPmXoxfXM/nymKu3F8Am2ewxivs6M=;
 b=GirOfz3mjAIeRm3CGNc7+ruq9EEpVXKpCqolBIcEwvD/84RPA/i4/NTxMRzx3ZLsbm
 lLY3Q7SgtD2pwFhYNoz7bsJO9Fw1Njx6U926pcEcaKhPt15om+OUDwA0nY4Pdy3XzSwn
 RTSjJqlHd8zu/0/YLAQMC9CAcpWMt6RPkJQJy+cIElsUqYQ4hwLCd8ABvU/fopTDAGoz
 tWSXXvWdS8IchROUpjffI5EON306J6PI5GWfP0wzXuTg2Lg0Py4FwPlJwozlQQlCXtK6
 OrFX7R9KFdtyl7zQs3cQQEdwmeOOvkkhCdSZlDLDXPDxin64DwSeWfc5z0TReT7jh4kN
 1/7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GirOfz3m
Subject: [Buildroot] [PATCH 0/7] Extent options for read-only /var handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is based on the work of Yann to allow variants
for handling /var in respect to a read-only rootfs.

It contains a new version to use an overlayfs,
a version using a systemd-generator,
and a few more patches to improve the situation under a read-only root.

Further it tries to establish some buildroot runtime directories,
namely /run/.br and /tmp/.br.
The /run/.br should used for any runtime directories/files that
are specific tu buildroot. Since /run is expected to only contain
a modest amount of content, /tmp/.br is also available for "fatter"
stuff.

Those patches are tested to solve the /var issue while behaving
nicely within systemd and not requiring special processing or
modification of the rootfs. 

The patches further allow systemd and its services to boot without
errors, even if /var is plainly read-only.

Norbert Lange (6):
  system: add overlayfs option for ro /var
  package/skeleton-init-systemd: force permissions for buildroot runtime
    dirs
  system: add systemd generator for /var
  package/skeleton-init-systemd: fix var.mount options
  package/systemd: handle creation of /var/log/journal
  package/systemd: create the /boot directory

Yann E. MORIN (1):
  system: introduce a choice for /var management

 .../skeleton-init-systemd/00-buildroot.conf   |  7 +++
 .../generator/br-mount-generator              | 19 ++++++++
 .../overlayfs/br-bindmount-run@.service       | 26 ++++++++++
 .../overlayfs/br-overlay-prepare@.service     | 26 ++++++++++
 .../overlayfs/overlay.mount.in                | 16 +++++++
 .../skeleton-init-systemd.mk                  | 26 ++++++++++
 package/skeleton-init-systemd/var.mount       |  2 +-
 package/systemd/systemd.mk                    |  8 ++++
 system/Config.in                              | 48 +++++++++++++++++--
 9 files changed, 174 insertions(+), 4 deletions(-)
 create mode 100644 package/skeleton-init-systemd/00-buildroot.conf
 create mode 100755 package/skeleton-init-systemd/generator/br-mount-generator
 create mode 100644 package/skeleton-init-systemd/overlayfs/br-bindmount-run@.service
 create mode 100644 package/skeleton-init-systemd/overlayfs/br-overlay-prepare@.service
 create mode 100644 package/skeleton-init-systemd/overlayfs/overlay.mount.in

-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
