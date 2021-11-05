Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C7CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C70861159
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C70861159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE40A6F935;
	Fri,  5 Nov 2021 21:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FBZc5FkrpRGs; Fri,  5 Nov 2021 21:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BD1D616F4;
	Fri,  5 Nov 2021 21:33:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 523E41BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41BA2401BD
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftyyrIu1f8bZ for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:33:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60233401B9
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:33:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w29so4234391wra.12
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 14:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3XoNTKky8mF5LI/ulHDZoPZdUUgP6iO40+W4YHV65nE=;
 b=BifFphI/pt+wb7btDXX5KWAzRlxNtJtmlUGb7cLmHhlyuuj3X0y6ArClCX/5zXt22g
 zP7Fk6gC4bcI7Nw4h3+j7VwTRdlAPReMO+srom8MdXMu+OjzRNq/0awEtjX/8QswYKy2
 mFAl//DhzTJ+LxaXpmOAETfG2fsm23hYUF2sNpgBKuMH+kONF5j3aVv0KTZatwla8tPB
 ijVb6sJW3vKICAGw5iW0cTW47NvypxQuCH3TSbUQtY87jyxJIOD24F8Aq4Wo9DSlkeqJ
 RP0d8DVlqHIRNj295hD1t1n0Xy9Q0lLsc7vmcQvS5pmwqSgBC8yihPXrutufsmWQh7lQ
 PvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3XoNTKky8mF5LI/ulHDZoPZdUUgP6iO40+W4YHV65nE=;
 b=rjD8RjbyEPHe/1Qqle7DS3WPHtg1VlVPUtexMqMREMjbel2v1U4e8dXt8MpeQHxYnB
 mO59YBSF9dkNls+EcAL/wE8tgoucWQVuqHGrAmY3uOUaQz7HeE/zP3w+9U/bSMouECTT
 t7jsyv/eSqeWc4+hJfjO6fq38DxqBN2S//UAAV89uNixm62CggGy+cuiPiW0s7z7oxRw
 OIRDlHbUHCyeqNbVl70yR+nxdS48M77fJwK4iK8qFNTPlRbQn6QTtgfRb15NOdpZYHp4
 hD72ltB/prjppbwIf+SJYmJAIc4GmvfJIjEZiClF1sU6xQI/QkQ8wSgh/W8R4YJVoUGc
 qgsw==
X-Gm-Message-State: AOAM533nXcqdwSEwPtXYYoUJ2uhTVVUdZHxfzezG0fm6bGgifvdrOhP9
 1V+bTh7DTzOGnDY0iQ/zswSVOLvsiXQ=
X-Google-Smtp-Source: ABdhPJzQUzPpbEoVWJi0DJky20V/C2hSa997mLPXpGEMRKtmxlrPUkBLEsbttQfSHk6iQsMEdWWzYA==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr67292114wrh.51.1636147987297; 
 Fri, 05 Nov 2021 14:33:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q123sm11978690wma.30.2021.11.05.14.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 14:33:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 22:31:16 +0100
Message-Id: <20211105213116.2589815-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libteam: drop LIBTEAM_CPE_ID_VENDOR
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LIBTEAM_CPE_ID_VENDOR was wrongly set since the addition of the package
in commit 7485f5be0c460649e7406699cde82bb492aa23f1 as
cpe:2.3:a:libteam:libteam is not a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibteam%3Alibteam

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libteam/libteam.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libteam/libteam.mk b/package/libteam/libteam.mk
index 99454a03e5..8bd83aa20d 100644
--- a/package/libteam/libteam.mk
+++ b/package/libteam/libteam.mk
@@ -6,7 +6,6 @@
 
 LIBTEAM_VERSION = 1.31
 LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
-LIBTEAM_CPE_ID_VENDOR = libteam
 LIBTEAM_LICENSE = LGPL-2.1+
 LIBTEAM_LICENSE_FILES = COPYING
 LIBTEAM_DEPENDENCIES = host-pkgconf jansson libdaemon libnl
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
