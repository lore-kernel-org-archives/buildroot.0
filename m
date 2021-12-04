Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F7DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 09:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DE4D405C5;
	Sat,  4 Dec 2021 09:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQ99Dqe7PRST; Sat,  4 Dec 2021 09:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FB59405CB;
	Sat,  4 Dec 2021 09:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA23A1BF5DC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A920041BDD
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Ckhlt9P5je5 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 09:25:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABB8641295
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 09:25:33 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso6727447wms.2
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 01:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IugLAjlA4SlFsVrHzKpz93g+9eLVH8DQ56kTkvBHqzU=;
 b=TU4SGc9Hblgkk+CVVC3vGgTX4bMxYMW+8/K5HxE8NHl4Ja7raIzM4HdfLkDbj5YWC0
 Yg9N3EV7smc4KjqlFylVp/fiKa1prKaNSkAYYl8YltKow8/tMC1UkS+YS2GKtRyZ1Oi0
 hwYjl6ri0DHsV/bOnCchG6fn+b/UxmQT6gpoyOlqxUpBGFMw8ujEuLrjiUuDDClf+xYv
 JGgZISqlAQSY/9D3Vn3XYxaer4kzmNF9a8KgRm/kBE6H1IMx+DadFwxTvLZODqOuSUqA
 4eTlM2RJ4RdHSwo6VV22LgA+uFYg17vU3l1pQklZcqiK1x68gf+fdxh5rMuluXpfQl/4
 t6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IugLAjlA4SlFsVrHzKpz93g+9eLVH8DQ56kTkvBHqzU=;
 b=rcx84l6GdCfWWl8tuxWUMvtp8pvOerGyWIKBIQ4cqbJtpuhirVm2hrtcfnT5R/MUmY
 b7d0GBYvLaWQPdnprS3R0LI4513vlQvFAJucaqtuquZqG1vJ5W2Z14xx+oMFpsgyiUuu
 JLN0yVuXco22XyCSg2DxfG2NWssQMlG5EN8gwocsOykKAk0u7LK43lQKXyPVFqyST53H
 dP5GHAr0g+ToU4VfaxPgdHsHBDkcWYvYM/+H4zN/Zh8fVz3okwnKxjPubSdwr5Tbaei2
 YTRZfSYB2nC0gEyfNO7pG8c+biflP2ckFYk8pvYQ/jJ+AKZVUlnWsCYCmPfd1qHKRzMd
 Zw7w==
X-Gm-Message-State: AOAM5333YizbTvNjqEbDomgzhXepIzoDCzKHuT5WWGI6x0OpMX3p998V
 19LojDGNu2dBM0ZmJLNLvt2lejJ9a3ZCrQ==
X-Google-Smtp-Source: ABdhPJzoFE2LU/w5VQUZEq7VVgVe1TUMFt5+Ab1emaVNpiOmX3u8ZZFZdl0eW5JDS+bMFf+9dBgfNA==
X-Received: by 2002:a05:600c:2052:: with SMTP id
 p18mr22605184wmg.3.1638609931680; 
 Sat, 04 Dec 2021 01:25:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id a10sm7708769wmq.27.2021.12.04.01.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 01:25:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 10:25:10 +0100
Message-Id: <20211204092510.2016661-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mxml: add CPE variables
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:mini-xml_project:mini-xml is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amini-xml_project%3Amini-xml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mxml/mxml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 85930ab388..af48b86c6c 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -8,6 +8,8 @@ MXML_VERSION = 3.2
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
+MXML_CPE_ID_VENDOR = mini-xml_project
+MXML_CPE_ID_PRODUCT = mini-xml
 MXML_INSTALL_STAGING = YES
 
 MXML_INSTALL_STAGING_OPTS = DSTROOT=$(STAGING_DIR) install
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
