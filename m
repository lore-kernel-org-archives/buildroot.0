Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E764BC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 19:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DF37606C0;
	Sun, 24 Dec 2023 19:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DF37606C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0-_5ha1kDES; Sun, 24 Dec 2023 19:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B877560B46;
	Sun, 24 Dec 2023 19:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B877560B46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40C121BF38D
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 19:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27534415FE
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 19:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27534415FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlzW--1qrwaA for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 19:18:23 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C782415FD
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 19:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C782415FD
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3e6c86868so26738075ad.1
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 11:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703445502; x=1704050302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vef0qUzz19LWZTU96dV3WHylXq9prGfZgCRL8vjPT7I=;
 b=TJzaWQ80WZ0zJcnPxl8Ea4a3tHTGcTV8APt40hD7XkIuwiTgeM/JHPfToFws3VZvXj
 Y02p0IUT+S47594LnUeflJ1d367g4WEfVADXRVtTg51EPj+rIIG2KI4ssV0+6bbX3RIq
 pNY6mTlkLa4L8ri76tPinKFXT1P9PYZGwQtBnmgKFGit2JfU1SAUfk3fXR1eaBO1Scn5
 c/lZN0X5YXKhwB+kf8oJ8A3qBt7ZWRbjuVLNG1GL2gpp0waGKWmIymwYFGOGDZumtyJE
 Z4+HJ1lOXfa3kQK/jWz6Klpdgczu5Gmn+b9XX6xc/4F4V+nBQQnFUgFuUPtmPRGgRLk3
 syZw==
X-Gm-Message-State: AOJu0YzvAlAIPWW9wVgie7vhe5/U+IU5ycvVIQb3VUFX3S0Rqm14WnFO
 DON/tR/4v1q+9B3e5j3a45vaFCih69Gp3IsfwmKVAjMQ1Z8=
X-Google-Smtp-Source: AGHT+IFO4vL38o1RzG10DuUjvj341B9EpyTfGRqGOzliB9gj/Fe/eSGTDZo8JMXNM9CCJYvDFE2EBA==
X-Received: by 2002:a17:902:fc47:b0:1d4:1327:bd15 with SMTP id
 me7-20020a170902fc4700b001d41327bd15mr6711328plb.32.1703445502122; 
 Sun, 24 Dec 2023 11:18:22 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 s2-20020a170902c64200b001d075e847d5sm6876730pls.44.2023.12.24.11.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Dec 2023 11:18:21 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 12:18:17 -0700
Message-ID: <20231224191817.9599-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231224191817.9599-1-adam.duskett@amarulasolutions.com>
References: <20231224191817.9599-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703445502; x=1704050302;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vef0qUzz19LWZTU96dV3WHylXq9prGfZgCRL8vjPT7I=;
 b=LohlQwJpXJScnnAXSFygq7XxyWkcnNYG1Dui8FqhybJ0J8otoN/0ipwBRGdHzfqHiO
 DepC6gu0JOrmpXjk3qaNtApGGK/yqbxv0zM7hEC2lWCuCNGV8JJrvwn0L8aTJPj+JhpD
 ZaAT+0F+/H7lT9rIKSjZoW6Cfwf01/YJRCjuM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LohlQwJp
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: Remove
 adam.duskett@amarulasolutions non-flutter related packages
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I will only be supporting Flutter and other packages needed by Amarula Solution
in a professional related capacity from now on.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7a00b6c2da..1d505ba146 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,10 +35,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/libutempter/
-F:	package/python-kmod/
-F:	package/python-versioneer/
 F:	package/tllist/
-F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
