Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A93C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 13:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD8584037E;
	Sat, 10 Dec 2022 13:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD8584037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwNdTfVnbk3p; Sat, 10 Dec 2022 13:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B479402D4;
	Sat, 10 Dec 2022 13:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B479402D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 586E31BF859
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3197281D24
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3197281D24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnFmtzXxjA24 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 13:17:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7080181D3D
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7080181D3D
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:17:48 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v8so6776344edi.3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 05:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R76xbls/AHIWJeWfX1X20jDHVkoSibjyz/YjqcBqMLo=;
 b=RdNPbdX5zy7ZTHpDBjdWf3r70ZaWtGNipdc8g+lMD5LxL7LcCUeq/eRrfiiw5BJZZn
 GjZk6AkAJMA3bhjRINy9AgT1upshQ2Jl4p3KLIKmWoMRkscgoUDTTWRD94orQl8ZFkVd
 Yv3m1PwGcp2BU0FsnKycl/haOMWBnd6UWiKIk6r5tADseIBmohCqzkRERRts7nnfbgxe
 i8eVKlyZOQJaaX2wtMMpnzyBPaygIHAeSSSL3GMThyF8+OSpX+/ZVfnbytDYc0coPN29
 +NP85OxMrHoYqoe1A5TQMTvQ/TKpKYEMOSPDNPXEM5rZoYLy1kPEHbTOeenIB8jMBr1l
 rWZw==
X-Gm-Message-State: ANoB5pkXuPxc2C+xeaVkQKfSQ7Ix311+VxDEOGLyn/r9HChvt/+aLkry
 n2ZGvW4LbT/dySC7b9BlFw9xKNLIiNk=
X-Google-Smtp-Source: AA0mqf6TmEmxG/UomwMFZC0pBCbNyUclwjxIgssrmHOaWKsAUBZja7t1csS2ncI8CdG7GocFW++m9Q==
X-Received: by 2002:a05:6402:20f:b0:469:15eb:16fa with SMTP id
 t15-20020a056402020f00b0046915eb16famr7923688edv.13.1670678266551; 
 Sat, 10 Dec 2022 05:17:46 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056402050600b0046c5baa1f58sm1674765edv.97.2022.12.10.05.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 05:17:46 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:17:36 +0100
Message-Id: <20221210131737.274925-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R76xbls/AHIWJeWfX1X20jDHVkoSibjyz/YjqcBqMLo=;
 b=aHEEUsU2mxply0m1fnYvyeIWUSsLivZHiu8lv833BmYN4cpSyMDBh2AJT/pGS/1fZL
 bC8crH1Sq8ELRdSNVXD1MZraQxCyD3wTe54GpPxwLD+WZ5K1eX8aGNK0oR0bUeOq5Lq/
 YD3tlPcYsKxbxsl54SsbpWsLtJ3Bdd7tjapLosCNV7Gm9UqG54M5ZL51xY0reREaVKDd
 1SwTK6HEEii7QMgM57k8qFvSsvtwpbiXN1aXP9CnGuYww0wZPijf5rkaz8HqZ6WD4UId
 Z/wzen0sn0RVgulI+RRCDUDizQqc+YinEbGU2bg3Wy81X3n5FRmlJjRrjWLB9+pm122Y
 1p3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aHEEUsU2
Subject: [Buildroot] [PATCH] package/polkit: fix file permissions to match
 upstream
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
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The permissions are now in sync with meson_post_install.py,
and debian.

Most importantly, polkit-agent-helper-1 is now setuid root,
but also the rules.d directories rather than their parents
are owned by polkitd.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/polkit/polkit.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 205d6aff4c..dab5d542eb 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -52,9 +52,10 @@ define POLKIT_USERS
 endef
 
 define POLKIT_PERMISSIONS
-	/etc/polkit-1 r 750 root polkitd - - - - -
-	/usr/share/polkit-1 r 750 root polkitd - - - - -
+	/etc/polkit-1/rules.d d 700 polkitd root - - - - -
+	/usr/share/polkit-1/rules.d d 700 polkitd root - - - - -
 	/usr/bin/pkexec f 4755 root root - - - - -
+	/usr/lib/polkit-1/polkit-agent-helper-1 f 4755 root root - - - - -
 endef
 
 define POLKIT_INSTALL_INIT_SYSTEMD
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
