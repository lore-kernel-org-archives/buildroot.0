Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9BED0BB49
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8552F608A0;
	Thu, 24 Oct 2024 04:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fxFiZWC1w5m; Thu, 24 Oct 2024 04:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98FBE608A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98FBE608A7;
	Thu, 24 Oct 2024 04:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80CDD972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 620798122D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CMKFjANWjcJ for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:37:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F36F8122B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F36F8122B
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F36F8122B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:37:54 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83ab694ebe5so19606239f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729744673; x=1730349473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hTBFLNWtcageujjNITWLob3+ZK4UJrXLG7F8MDwFs/0=;
 b=XS3jpR7Lm4+XpjBwO5cHq7JCn0FkjVrvR8ze8jehkLzdgwhn/QuKoyjByjgDR7HWGe
 gCGYznpw0E5suITmTIu1UnP7bK4binhgQMWtmUzjEueOySDBTLKgT/4IMIQ4NXueHiAE
 pk9vDV7/Mp7oqOnGhtYgeqeU9DPcYStWddITVYYRrCnYSdQjjbTphMmHP40g29j6OtZQ
 r/dHWu4XIKUOpWaTJqWwPjBnHHTlV8RpN6gs2GZ5vMtYniaQFc9nm/2PdT3HZvY5lFVs
 DCmSMXYIwbAWOC5j5GNpUGaOjq9iCKsflvv8BnQ6jIsIGQu1pC1hxDEb+OGUukS/l3Xk
 JxeQ==
X-Gm-Message-State: AOJu0YyvBDJhvvhzBLlub7pPfLnBX2M0xjSIlfkrgzh96znGhzrPVvDq
 SSocRreTuVyV9G7kWkzxD2/9aDHnYK/jC9P5suZaPKcZ4H4z2dFLgXDMpQ==
X-Google-Smtp-Source: AGHT+IFVCJnaGXozXRJwI/6WvUkW859nVLpLxKjV9xpGvvS/eI7oTjNk3E4s+XQ7porivF+eTWtfUQ==
X-Received: by 2002:a05:6602:14c6:b0:82a:2a67:9429 with SMTP id
 ca18e2360f4ac-83b0401bc85mr94020239f.5.1729744673077; 
 Wed, 23 Oct 2024 21:37:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a60947bsm2485345173.116.2024.10.23.21.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:37:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:37:46 -0600
Message-Id: <20241024043746.3367067-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729744673; x=1730349473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hTBFLNWtcageujjNITWLob3+ZK4UJrXLG7F8MDwFs/0=;
 b=iDLQ2bdi3t26p3vVUeDr4NMspKoXU00i3gCNOvZZqwhbF570aVHq8Xx+ExKl3Py1nU
 yIrEPgvcPRMQkckQTQijgMqBYUkUSvI/bf7x9DgOl8PAXR0Dd3N2pZsySGl9PQ56N6IN
 EUgLx8ixy8HEbmkUNaEVi7Yn2yM5S0b47WtmSX5SGkBh8d1POBbc5hcfUF5qSrjAV1aU
 YJ0w38FyNi1XSdgefDR9XzFbdzRqD7DlLjL5JKi+H3zBN4akNmvftgxHOMnSFyZt5fXc
 ZPy+XvCegCNW0AqZG4lAA94bZ/TsNfvrQKWAQ2mWdpM7U6nH9bFKe6rEVWStbyHs7cOh
 lX8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iDLQ2bdi
Subject: [Buildroot] [PATCH 1/1] package/python-dnspython: use hatch setup
 type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dnspython/python-dnspython.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 700c75de25..2d3622110c 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -9,9 +9,7 @@ PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
 PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/b5/4a/263763cb2ba3816dd94b08ad3a33d5fdae34ecb856678773cc40a3605829
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
-PYTHON_DNSPYTHON_SETUP_TYPE = pep517
-PYTHON_DNSPYTHON_DEPENDENCIES = host-python-hatchling
-HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-hatchling
+PYTHON_DNSPYTHON_SETUP_TYPE = hatch
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
