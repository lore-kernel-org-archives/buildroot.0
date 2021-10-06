Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F044C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 07:00:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7AC9610C9
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 07:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7AC9610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9F160E65;
	Wed,  6 Oct 2021 07:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AT14D1X96TXx; Wed,  6 Oct 2021 07:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184A160E61;
	Wed,  6 Oct 2021 07:00:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1807C1BF33D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 07:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13BA760E61
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 07:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFvvXBB57Hq5 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 07:00:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21A52606BB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 07:00:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e12so5569233wra.4
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBfeGKkt1T+waLz5t/HsLLwXxp/cnirIRpZ4fCBXils=;
 b=Z7Nj5IAO++KxZs501pdBEqp9qCH8kCLihtpju3/pDWQJeN7C+BOhdKdciEfKMAUna3
 CWKZXd5NnFP/7p9cOPhBeCNfqtaGeIPmWihpxlavKJ9gC8BZBzDT/8Jb+cSoThAHfguj
 25kaUmnmX9+wwgqGLwbt/m82EnXApmzTXrYgP4GaAupqQPlV1xAh5TxIDkCcGijm9FA9
 RutT6F+ck2t4OEL4A4X+7m9dizGcg/5Y37voKBqpAzp/KAhYFgv7ZDt3go2zypzX+jNY
 5Il8r9m58W3vTfLIJR7B0Rwaz6OxIgQVXuHfCueDYlzaoC6Dn2mjhVG8hzV23zYorTDe
 JBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBfeGKkt1T+waLz5t/HsLLwXxp/cnirIRpZ4fCBXils=;
 b=76QE4vOMimQ7BnxjyVVOyXcNf5sz3LPsjiU/fEquwNQ0IlXpeO5GiE6ClxQnMrozr0
 vy8Ndto9VzluNUFmTW4SMayIgku+Angoa24S1UfP4sYqWp90+1hMTSxdqOg0Arg4CIgY
 uznkEvkp1i+8eomx4Cay358VrpViTvIIzZgeIA7wCxWrHuaSqiuJ7Ajc3pRS2riJEIDL
 KlevUe12Krw4c+Z9cqTaEf4j1Q8h1r07Q87CnJO9oQqx7lThX6IYXHFYcTWpc8SOvpC7
 MdZqEyAjj85m9xhYT2LS666zAJ6nrCiTSRFApWZrRozn6v5RQZZJaYIY8fqSVWMNwIZP
 DkbA==
X-Gm-Message-State: AOAM532Eo4r65hJyBWlEG5FvDUCmrv/lNW6DnQ3mUhISfbUVw0MIA97i
 y0friAGTePWmj3fxzwgX3dDFphjAiyk=
X-Google-Smtp-Source: ABdhPJwuJ7sygVrwzWOXe5feRARYWkeUK42EXlxwLtKT9BXBr7cuSf6OHlt/XNOl4AaP2hiRH87Tfw==
X-Received: by 2002:adf:a3d9:: with SMTP id m25mr26911144wrb.27.1633503638758; 
 Wed, 06 Oct 2021 00:00:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id l21sm4163486wmh.31.2021.10.06.00.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 00:00:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 08:57:58 +0200
Message-Id: <20211006065758.1639585-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pathvalidate: fix typo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following error raised since bump to version 2.5.0 in commit
036185d87ef7f77463dbdcefb13d071c58c13c41:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PATHVALIDATE
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYHON3
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_SIMPLESQLITE [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pathvalidate/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
index 564c3a0913..f8658e6165 100644
--- a/package/python-pathvalidate/Config.in
+++ b/package/python-pathvalidate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PATHVALIDATE
 	bool "python-pathvalidate"
-	depends on BR2_PACKAGE_PYHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  pathvalidate is a python library to validate/sanitize a string
 	  such as filename/variable-name.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
