Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FF2C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 16:11:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C5961074
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 16:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6C5961074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 414C1401D6;
	Thu,  7 Oct 2021 16:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eugFABf7TzYH; Thu,  7 Oct 2021 16:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69FB340196;
	Thu,  7 Oct 2021 16:11:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 284941BF354
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 16:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2478760686
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 16:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSoSvCwM2mOP for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 16:11:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1DF160675
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 16:11:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v17so20672441wrv.9
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkPBaxS+iOZn1c0jsTfxHLkTU2NVGwlxM0TdzOkmiFI=;
 b=TNdUqymqckRl3idAXGYutIIwleal2BqCtp7OP9rTULTcoKIp0xVUaUFhdp7rOwbg/N
 WsWQuRLJ7PmOwJ02DMGM7bJvln2DLCKBAsPq2JYDTPNkNnS2V9FWVlxxMnr7YwpjK272
 9yewKlP7q8EIwTAMftFzOxa4e3QE8MlWGPWIAkcm6OrC75GyUyCwhJEILJ5WyVUDTZly
 rjDGC4JvpYBzr+80unsFEOA1GHgoI6TVylNYHhFto4hJem+oBmjwrm8YKOkTt8cRv6hN
 YDjcIA9bzNAi4aqF5RizSuijv72NA0xUceHLHh4o3deqIgmY5HJgwrcXggYwULochczt
 cYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkPBaxS+iOZn1c0jsTfxHLkTU2NVGwlxM0TdzOkmiFI=;
 b=fIpnOLKdVdv7cCe+xsw4zU/Eu5seNZHgYTXLw+N5RmMQCaW0WoRsrfQXUeszZ+T37s
 WP0OsSZIy145DIbsEl7oyA7Zxgw0yxTGQmNMuMKyf8VN8AKObGA8WkdrfZ+d8+Ikhm7n
 IWEsi+K3x5CBJHu0ltYlUBzZlGl6ZZOyPKoENFtdFhQMOYjmnKqt/yB0jgB/37zzmyJY
 oTxVqKjMB6M0NkNVvYCN0yngiVBJPQ8AUnmMsjxD3dzpzY4wqxSGXNYBybE9F809N6N+
 J0ZXF11UpU9lXqcIQLdtsNKDa8gSNE+Z/fur2nkyeJf3R/RKWvr8WeNwQtsTSWL21caE
 TQaA==
X-Gm-Message-State: AOAM532pbdygValbE9GWoEt+z19g04Qbz6Mc8gn2pTqb1SfMlixA+502
 SydmI/OtlZojbE7pKMp24txGGawj578=
X-Google-Smtp-Source: ABdhPJyK+14dpYwn0BzWIl3dDHzVhTBw4DISHGYdiG8MfoEjBUFLCQL2orCUDhItNqlvBrSmSBMg5Q==
X-Received: by 2002:a1c:2543:: with SMTP id l64mr17391281wml.9.1633623078717; 
 Thu, 07 Oct 2021 09:11:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id c204sm9491490wme.11.2021.10.07.09.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:11:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 18:09:57 +0200
Message-Id: <20211007160957.3469451-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-decorator: python3 is also
 needed for host
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 7bfe142e0d84400e386286347afd6e26f90b8aae forgot to set
HOST_PYTHON_DECORATOR_NEEDS_HOST_PYTHON

Fixes:
 - http://autobuild.buildroot.org/results/d11433a8076798d6088f92716608ebbe1c6aee9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-decorator/python-decorator.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index a61f045e2a..a7e338bdc0 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -12,6 +12,7 @@ PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
 PYTHON_DECORATOR_CPE_ID_PRODUCT = decorator
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
+HOST_PYTHON_DECORATOR_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
