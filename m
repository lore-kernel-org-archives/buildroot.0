Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DACC3DA7F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 03:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 360B8605AC;
	Tue,  6 Aug 2024 03:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrE_1X3ilSRG; Tue,  6 Aug 2024 03:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 478CE607AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478CE607AB;
	Tue,  6 Aug 2024 03:07:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 046ED1BF318
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 03:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C85401CA
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 03:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlcnE2Iu3S20 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 03:07:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D248D40188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D248D40188
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D248D40188
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 03:07:07 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2cb4e1dca7aso110618a91.0
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 20:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722913627; x=1723518427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9H6s4AxYzzFAUAEGW7cF1gEjjEnmYk131C4HYX8Mf7E=;
 b=rUedgIVOTblnb1OGHVf72dYZhK2MwTYGYQW8PCm3TBU53/hmTH3tBMR6M5dOehZxSW
 GXYODH+GFD5pUkFfqy3YiqGtyQ88avdLv8pN+0AYzlF/i22yfDR//oYhCCOuKq+kTOCc
 MXO3IBTXVWRWNLfUsgumcygH0dYSAy56/zfA8AP45Vna8uYw2I+xeolZlW+jpVoLuFQO
 4V8WMTKM5CvZzRxEEHdGMrpR35+n+ps7lciB8hTqey5suO056iQAeSYDK8LZztGp3WiI
 k3EFhZOappro5MZ4qTyr3/fN+zuACdVOHGHtmlf9KK4vV62ptfz+6dXlaa4VxGnb70xP
 KfLg==
X-Gm-Message-State: AOJu0YxcGpwgWsSwhkNitWzc0ETHlM0l5+1pID1jIfmPHpgDZzq/ihhF
 l1aPfoVj3Cm+0HmxUBGHWuL1oQmvqFo1549xYcib6tAYFVOt29e1Qm3Q7Db+Fw==
X-Google-Smtp-Source: AGHT+IEaWgB6EQt3fHCfRtAp8HC4kxSKCepqyDWFOwtnlsoQr17H5wLQvFU52Nb/mIrehIl3bZfRIg==
X-Received: by 2002:a05:6a20:8414:b0:1c6:89d3:5a59 with SMTP id
 adf61e73a8af0-1c6994053b1mr11684383637.0.1722913627233; 
 Mon, 05 Aug 2024 20:07:07 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f53435sm76306125ad.64.2024.08.05.20.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 20:07:06 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id B64691080; Mon,  5 Aug 2024 20:07:05 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Mon,  5 Aug 2024 20:06:59 -0700
Message-ID: <20240806030701.618378-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722913627; x=1723518427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9H6s4AxYzzFAUAEGW7cF1gEjjEnmYk131C4HYX8Mf7E=;
 b=aWzRn9bKeUaZvUmJw/eO8Jzx489/GQWZ2AfbdFdLxrk94K6Szht2hjeQ7Wh1Wh01N4
 FGdcJEQ3P+GJi05G5jyBm2OkydcFmvQKqGiRMkLA9ttM8WaZfmH4vxXnXhaMo2yAJeV6
 FiQA9sAZNsUNCxfvGZj9e+2YqZdF2yw7FE8mo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=aWzRn9bK
Subject: [Buildroot] [PATCH] package/xz: avoid cicular dependency on
 autoconf for host builds
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

autoconf has an implicit dependency on HOST_XZ due to extracting a
tar.xz archive. By enabling XZ_AUTORECONF we create a reverse dependency
for xz on autoconf. This is fine for target builds, but it won't work
for host builds, as the two packages now depend on each other.

This problem only occurs if host tools are being built by Buildroot. If
the build relies on host tools provided by the distro, there is no
circular dependency problem.

Fixes:
4703a7ae9176 package/xz: fix musl static build

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/xz/xz.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 9fb93ff4d6b5..028cd5bdf525 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -68,5 +68,12 @@ HOST_XZ_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
 	CXX="$(HOSTCXX_NOCCACHE)"
 
+# We need to prevent XZ_AUTORECONF for host builds or we end up with a circular
+# dependency. Since the autoconf build needs to extract a tar.xz archive,
+# autoconf has an implicit dependency on HOST_XZ. By enabling XZ_AUTORECONF we
+# also make host-xz depend on autoconf, which we can't do. It is also not
+# necessary.
+HOST_XZ_AUTORECONF = NO
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
