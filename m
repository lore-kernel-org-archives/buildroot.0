Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933EFC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 21:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 279CE4046B;
	Thu, 22 Dec 2022 21:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 279CE4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GakmYwE0Knr8; Thu, 22 Dec 2022 21:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ADBF403C8;
	Thu, 22 Dec 2022 21:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ADBF403C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D55831BF2BE
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B012F8186B
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B012F8186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aytXLW0Upg_Q for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 21:27:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B81AE81842
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B81AE81842
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 21:27:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z10so2881853wrh.10
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 13:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sVEgq7jHydOS11xaPdsqsYsBlmHj4v7szxJqIwzQFUc=;
 b=AQd+YP0wTW+vWTrSIDno+nopK2OarKWawQhsdt8RrDUdqfVstFSxIv56vNX6zOmWno
 kPjUJ2NAV7cvm7L8ok++bUricsDxgvYElVNEEyQRYAtMDptQSfL6/bFzMGsO/IZZLrnC
 CykxEIWmbkNZ68RifZgyS6LntFsqKJFclBz7QGk2XS8sL+cyI33Q5BqSeq7KF570slZJ
 cPEOzsyejQfb6GcmqL0iauxpJz9t72SWPZIX49Nw3QkuBYJiMrUX9zZ8cCmucbpnECKQ
 iZcrsymb9i/tmttRH9rd1il3JqurTZR98E+C0Oitok7YTiBz03BgKXKoEmQMnPRDQxmR
 YNrw==
X-Gm-Message-State: AFqh2kr/Xlcs/v5igeJacOHa3DXIG3ZfqY23LP5C+Lv2zciR/aTHoOd/
 5+eSekOPa/vzfT623ShJ3xkpqdpr9Wk=
X-Google-Smtp-Source: AMrXdXvyLJq+OoL+f6JeBrcColTi/TnQHMQp/L4k9Sl5WXPAqwtAkBhXJXQEgJwor2dkioyCsvuevA==
X-Received: by 2002:adf:f84a:0:b0:26f:63ec:eb82 with SMTP id
 d10-20020adff84a000000b0026f63eceb82mr2621726wrq.19.1671744444492; 
 Thu, 22 Dec 2022 13:27:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f6-20020adff446000000b002425504ae7dsm1388497wrp.80.2022.12.22.13.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 13:27:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 22:27:20 +0100
Message-Id: <20221222212720.5180-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sVEgq7jHydOS11xaPdsqsYsBlmHj4v7szxJqIwzQFUc=;
 b=T/JRDdkpd7iqPW+Yke55SxuvW4eeHS42w9y3z7w2bC3kIGma8bhTpqsi0VoE94qb2S
 moAWWDFVUU+OXJtXkSBl2rIrmvI4dwGOpuFJ9iWuL4B1Y7YTR9R61tfzknHWtCW8rp75
 1E8Pe6sybj1Bn3ABUNH7J1W4r0xCC1oQpK5HnNrefwMDq5Hlo3/w1C2x9k7drtB7NFmO
 DwalZ0TUsLqizZbpmiRwJOJEnQXjSib0hy+mW6mELtjDdMiiPGysD7cD0zHe20/Q5os+
 tyY/ASuHypvYk7gbRETVI5TytoA0M0eQSiEryZo51RYQXVhSB0XEMW4KU9QfWOpr0BXg
 YCiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T/JRDdkp
Subject: [Buildroot] [PATCH v2,1/1] package/exfat-utils: add CPE variables
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

cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexfat_project%3Aexfat

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Fix variable names

 package/exfat-utils/exfat-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index d13ec6bab8..fa471952f2 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -8,6 +8,8 @@ EXFAT_UTILS_VERSION = 1.3.0
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPL-2.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
+EXFAT_UTILS_CPE_ID_VENDOR = exfat_project
+EXFAT_UTILS_CPE_ID_PRODUCT = exfat
 
 EXFAT_UTILS_CONF_OPTS += --exec-prefix=/
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
