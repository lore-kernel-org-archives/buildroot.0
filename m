Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65856C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 22:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD73684633;
	Thu, 30 Jun 2022 22:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD73684633
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cflXFzBz-JiR; Thu, 30 Jun 2022 22:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFA184514;
	Thu, 30 Jun 2022 22:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AFA184514
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF8E1BF27C
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04CF140B51
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04CF140B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxkBZGI3xjkB for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 22:04:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1914D40B49
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1914D40B49
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 22:04:44 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b26so537110wrc.2
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 15:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5xuCB4jY12Nc6AMh6ksgh2a2aSZduPxssxRzD1bspbU=;
 b=YQMgiTdxKE6jbbvntubN/NI3CfKhpZfkqgNl14b1bw59dAXYNNOZu7dqS3KSxF9zm6
 iZO6PjBYx+vDWdTQ7KJ3mt+qXLFCh/r1mavR4L2Cefoj6KzhC8+T2VZTMHtsGE9eXYdF
 gMcl6qWtHMc96AuIo0VjsoplNUr45VOOPGo9yhuostOEfDUU0yULJOLXNykJA52a8Ogv
 /v2qtIEw9wp6HkFmHJh6nsadR1vbeKiTJwNuSkzZlDv9kja92x1p6UNPAbUwHDEugQXj
 MFMAnODxgOLBkJcHPkDx8+sE7WQGfWZk04QX2tLVfevETkG4r+tzfB5/53yDn9ZeEttL
 mRyA==
X-Gm-Message-State: AJIora8lmeTZWJHUXFWy/tMQLMWEbYlb3i/eQOC29TNlHYUw6cWR6KGO
 u3Yo6/aGe2+G/aeyOdNjquWhdKjg9+w=
X-Google-Smtp-Source: AGRyM1uWMdCxWtJfqJYQddqQrGRB8YRf2+B+RpbS2/k9mKrsidTThMXAv6W8rboK5rslNmQEHiVSdQ==
X-Received: by 2002:a5d:6888:0:b0:21b:b983:de53 with SMTP id
 h8-20020a5d6888000000b0021bb983de53mr10834591wru.0.1656626683177; 
 Thu, 30 Jun 2022 15:04:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bn24-20020a056000061800b0020fe35aec4bsm19610969wrb.70.2022.06.30.15.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 15:04:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Jul 2022 00:01:53 +0200
Message-Id: <20220630220153.707462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5xuCB4jY12Nc6AMh6ksgh2a2aSZduPxssxRzD1bspbU=;
 b=UbCBSaUg/ujwvpNrjKUbxzHUMu9d611cUESp9TsmlhIhA+Rb4usZ+EPuPTvbfvUlGM
 eSc0MDmdWJDzJQ1uwn469MkjQfKhJcoQOP/lnwQxWrhLtzgAhtXm/sQEQZVHWcEBGPVC
 L4U+jOvVD/NrDGxPmvNOjGxbHxpqUyS+72cySt6dW0IK40a8OLNkvXhMR/0G+SbGmFt+
 7y+TWMYnuvFS905cwvPOnALDrUMmACaEzbZfEQQM1WO8yBpM4oRfNhG/h9OJ5Y99hhlX
 NAnIWhkP0sBO+/mAjGXUoPuuaTXmFHactbghUKU/qzQvLwNVyhcWrX85kEZhFh/OQ6EE
 MQNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UbCBSaUg
Subject: [Buildroot] [PATCH 1/1] package/keyutils: add KEYUTILS_CPE_ID_VENDOR
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:keyutils_project:keyutils is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeyutils_project%3Akeyutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keyutils/keyutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index cba57cf199..5af5c4e92c 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -8,6 +8,7 @@ KEYUTILS_VERSION = 1.6.3
 KEYUTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot
 KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
+KEYUTILS_CPE_ID_VENDOR = keyutils_project
 KEYUTILS_INSTALL_STAGING = YES
 
 KEYUTILS_MAKE_PARAMS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
