Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A1FC8302B
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 15:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6473160ED5;
	Mon, 30 Jun 2025 15:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3BjGytwnB1B; Mon, 30 Jun 2025 15:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A4460E86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A4460E86;
	Mon, 30 Jun 2025 15:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9C2F1C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C728E41A6B
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdgjxSTskW42 for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 15:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92446406D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92446406D1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92446406D1
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:50:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so16513505e9.2
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 08:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298655; x=1751903455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uWMS3Hn7oXL8sOK5IcYZAQPS/roECWEgrJbBSqR6sSo=;
 b=OOdvIjdp83jJq6ablmIqDsPNJlubAZE5oDS50kYsAVoya/Q0axdgJ1uGUPF2Z+kKcp
 AVFFAr55RX1cYapGn/LoA4h4yw7bgbYL/WqGZXAN73f2cvkHQp20gBzmmkgFvEmSZVkc
 VEk/plO7ffIXT3Csr4IgfDbK4UVqmhy+Ssrha8BoFevE25j2MeeYfnZ0mAJ8hUdHdfEg
 n1aUjLxkJrSKIfQP3gSRXMd5tecEGiibTa8D8VtDry0tAMI3kojfO9jbUVLxWLfWmDHf
 9VYvQ7dYKbQ6cSUbV6DHGqj03dg/V26KVM63G67do89hFu3wQsMVZ0rfFi0sQB6NEWRa
 fuDA==
X-Gm-Message-State: AOJu0YzIb2PQMmgWdb7NtVDEP27d9OT0/uMqiEVgyCXM86liSpxs5H9M
 5sZgZyVTQrAsU/vTPrv4/h8itVRa8sDSc+7mi9hTVX4Qcd+zi8vc2asr+JKOIOECdAMkELYRt7i
 iGeef
X-Gm-Gg: ASbGnct6paWXqPweY6aG2YaZOgis9uMVfh6J+RPtgja79kIBWxrvkbKCtopGowyxp4k
 lOS9pfICiHxXR+hRlXITwab/LvPl5dysv2kXOPnB2yDSDZVAELkzEXDGFvKMi7tdNOZzVsh7xMq
 5gTETNVBAl0aAzpJcCklmjOvuEwLagtdEYMSqf7oSe1aAobvy3Bs8Hzo8njOfeWDBexKz26w1bR
 tgsbRDPegPjMymrN5XLdl1YuaPXxFL9uT+30d6gNH6XZMyJHgZtvGUS9dMG46HMRa8JfqS9KP52
 ef4Id6+zxt0R9ufCnAgEXmwqZ0oh4qm395GWAG0K53xL6pWi6pHpQQH/T5Y0OJNzjuTWf8C3hTk
 JuJzX00rt
X-Google-Smtp-Source: AGHT+IH5P239dF16+ruTvNmxml0y0BMbse2YvYRidVSwPd5+/+olhAvwro1GUntDAHsNkkKXG/3wJw==
X-Received: by 2002:a05:600c:314b:b0:453:5a04:b60e with SMTP id
 5b1f17b1804b1-4538ee6eb52mr110512975e9.26.1751298654942; 
 Mon, 30 Jun 2025 08:50:54 -0700 (PDT)
Received: from sah2lpt241.be.softathome.com ([149.6.134.59])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a4213f0sm140070595e9.36.2025.06.30.08.50.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:50:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 30 Jun 2025 17:50:33 +0200
Message-Id: <20250630155033.403089-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751298655; x=1751903455; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=uWMS3Hn7oXL8sOK5IcYZAQPS/roECWEgrJbBSqR6sSo=;
 b=KQ2XeM/dnOpPc9a4Wd4SGvE33d9KLWzmhdn15uxheJR2sEKE35bvoU0EdjZvaKGUTW
 CnmliHcNlSbWv9qMyTBzUzT6DUHzNkJHuGft39LISn78MCgRpmGvmgzORsrvw6KvoJY1
 +RMeZLNySof77X0F2fbbw2r8XsSyCYeEIBbrl8GrMU9ceTJfXiPNR97djXkp9mho6A5K
 jH4pu/B3BHzoyJt8A+I1+Q/xTfcsBc19TwCSVH/FSBOojd1Wbb6P80rRrSNEJUsjvrks
 Zc8MdNK83okMZs2cxK6LSXix2YXm4E3OJQ60RWHhn2r0z+jzghxM38TmvY03RI3dSZmb
 RiKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KQ2XeM/d
Subject: [Buildroot] [PATCH] package/gstreamer1/gstreamer1-editing-services:
 fix COPYING hash
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the version bump to v1.24.11 (see [1]) the license hash changed for
the gstreamer1-editing-services package (see [2]).

This patch update the hash accordingly.

Fixes: https://autobuild.buildroot.org/results/9e1/9e1807cf5ac7bb69ae9bbe7a6a71411eb500188c/build-end.log

[1] fd00502ee0 package/gstreamer1/gstreamer1-editing-services: bump version to 1.24.11
[2] https://salsa.debian.org/gstreamer-team/gstreamer-editing-services1.0/-/commit/2a56edb6af3409ebdca39a96f310b43e0d780be0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 584d235451..501ea22144 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -2,5 +2,5 @@
 sha256  85fd74dab259e137a95ab4427e009dd853f4ca82874500cb5493c33bcef1ef08  gst-editing-services-1.24.11.tar.xz
 
 # Hashes for license files:
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
