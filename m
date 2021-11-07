Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD91CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:58:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E60E6137A
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E60E6137A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78496066A;
	Sun,  7 Nov 2021 09:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbbrwFr1zW3F; Sun,  7 Nov 2021 09:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34424605C6;
	Sun,  7 Nov 2021 09:58:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8823C1BF317
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77BC3605C6
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdQ6rj8GCpVM for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 09:58:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8785E605C5
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 09:58:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t30so21374809wra.10
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 01:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QACATrTqozTfrgoa2DRvY0XrNE4Tz3FyfCSwPHcz6qw=;
 b=jTKo7lUFfYizXEZGn3ZtjbypbuZY0dVkXNMeO0vUy/ISj6w95REitUgAYrmtPRTl1F
 RF92V+qTrCl/6Zt/ESH8qdiuhGcmBFNUeDZsm5ECS08OV44K9RN7qOGp7dWhnPwxM6A4
 G82Kl7OgYzg2wAIneiMZGszUeEwwQlOQXEqTbivSIbCOM7FKaH4ugZDiL2bCuArksNHv
 q8wNsTD7w5hOBqzFLs/bTu541g/8e2j9xLiWzAS270OnYBfMHZq1lG8dHr7jvSyi7zbD
 i5dp/tXIdNZnE2sDrdqI93G9g6ixhFfWOxdiGLvTfsyrrvnAuRglY/yto9y3zMKw41Jh
 zOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QACATrTqozTfrgoa2DRvY0XrNE4Tz3FyfCSwPHcz6qw=;
 b=UmzV5UeeD2N1NVRdCx4VNZP/KTZ3DYElxSnA0QYMp9kmEhTCkrnKmOJY/I6rC9ChCD
 pRKPAoAML8trUj9B8q4QMbOQFm3BFV4c4GoeTdoOJO0UM2fVYrrHLNN0rspZNHZ/YU6o
 rgCRwoxSqxh8PRUq+ypO4LfO/UrQ5u764Z2t+iFpgQ7q3g9VhtHn+BOwvby8pRWqtpPx
 XINKPpuZMpS9sI7RaF1kMjNxHShdnvqTmM0wa+UkqL+6+tSc93OnNocClpyNh3uu8TLi
 y01lkGbQ8yes3rZwEXYbNwcjKPxNeuwncv7iZUOAYE+kePAUIJVmefFZVuY52VV9pyOa
 5vCQ==
X-Gm-Message-State: AOAM532v1RozAbTKPitTvefKXY4vQSvA5Sq9f74waecXMqs27/9BJ++L
 djfT+u5MBa4OrydIpSOQwF7Or7f9kEk=
X-Google-Smtp-Source: ABdhPJzDTz1agdpMk7R/VWEdBBtzNxwa3eoZyCRRDOv7IvG8wUVZKZe8bfjBKoNX84I3LnWjynN4HQ==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr34257636wri.382.1636279100478; 
 Sun, 07 Nov 2021 01:58:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id a134sm13545757wmd.9.2021.11.07.01.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 01:58:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 10:56:26 +0100
Message-Id: <20211107095626.3503408-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/suricata: add SURICATA_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:oisf:suricata is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoisf%3Asuricata

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index ebeaa68d34..e7067acdc1 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -8,6 +8,7 @@ SURICATA_VERSION = 6.0.3
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
+SURICATA_CPE_ID_VENDOR = oisf
 # 0001-python-ensure-proper-shabang-on-python-scripts.patch
 # 0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 SURICATA_AUTORECONF = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
