Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E249C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 22:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DF940761;
	Mon, 31 Jan 2022 22:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKH3BDsar6mf; Mon, 31 Jan 2022 22:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1552A404CC;
	Mon, 31 Jan 2022 22:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 701B21BF2A3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BDB760A9B
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDK51vFrZf1j for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 22:04:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 839D6605B5
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 22:04:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e2so28221995wra.2
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 14:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9WCJP/HJGlqRv1sDrpUzJgKMk0T/afhPM1xEBT0mjE=;
 b=grb0HGgOwPZxFm4HQxt468nOVOn9LSxnt2kqHGYdhaXI+HTcZzNKudGG708f4Sleol
 GjbDuGRlvX/rEL0HU+h6yJbw2vBbbAyWg52UK+/MWxDJ8s0Ev8HQ1VqtT2hWM5zYzkB7
 ZzVoYZsYsa3Ha/I3bOeh2eTcUFwSPsNISM0vPRUHbi405kt/r4Aged04ApHPQkkhFBAr
 1E/i87RwBSSjbfFNfTf+prrK6zthbb0tYSedNrc2Ir+Dn06xtDkj4LaKbAzRbpRDypMP
 LuzujWkEZ2utpNUa1p6+BbSiBHyTrMR5u1UCqWdRHYgvdn1ea/nqG/2/MfzrEkJa1LSo
 m1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9WCJP/HJGlqRv1sDrpUzJgKMk0T/afhPM1xEBT0mjE=;
 b=BNyl/ow3DGO4yIQEk77zsFUXnDuJRqWThDEjKGYcID3ZW1Z+fQZ+mj9v4puy/Mx3ZC
 gTGUvOLUrOYI1tUUhyN+6OG1kpfvHm8GcEAFjQtN0YA2Oo1nPJaF2lJcPZAx6TKwQrLJ
 KAr+lIeGQnoHk3/DPlFIzDO8GSQqPaxrOuPlZKGtt0M66Y085jbOP0W+CSbDdeIa8eOP
 gnpNKo6BenjcrqWaz5o1f/IAjo1O9XnKGh713UX7MMhdZZnDpjldPeKMX6gO/7XNUKpM
 6gk2YwUZi+FNzYOGinQ0yViHVtxHVSLGOW7ydSWFhSWnILhewIuw9wJT6R6ahvy8xpoh
 KO3A==
X-Gm-Message-State: AOAM531JAblfW4Dp8ZGn8ks/OqSX4w9s5dZABq1GsjomM00KkmtljvD/
 mhz285ivW4zov7RjDUsnEDxpOLiW3ao=
X-Google-Smtp-Source: ABdhPJxjojsMAWlqbNgPLcYqXYI2oWScQ/996cavWKiQToBaf+Lii1WX/puiVXFVuVqbeFbyTnPAuA==
X-Received: by 2002:a05:6000:1707:: with SMTP id
 n7mr19016159wrc.662.1643666678547; 
 Mon, 31 Jan 2022 14:04:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n8sm437294wmq.42.2022.01.31.14.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 14:04:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 23:02:40 +0100
Message-Id: <20220131220240.127249-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cgilua: add CGILUA_CPE_ID_VENDOR
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

cpe:2.3:a:keplerproject:cgilua is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeplerproject%3Acgilua

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cgilua/cgilua.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 7471be3da0..8061eaf3a6 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -8,5 +8,6 @@ CGILUA_VERSION = 6.0.2-0
 CGILUA_SUBDIR = cgilua
 CGILUA_LICENSE = MIT
 CGILUA_LICENSE_FILES = $(CGILUA_SUBDIR)/doc/us/license.html
+CGILUA_CPE_ID_VENDOR = keplerproject
 
 $(eval $(luarocks-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
