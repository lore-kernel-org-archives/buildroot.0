Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C66CC27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 16:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D78544A94;
	Fri, 21 Jun 2024 16:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ugr0AhqQST9o; Fri, 21 Jun 2024 16:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F201344942
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F201344942;
	Fri, 21 Jun 2024 16:11:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 585211BF232
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 533CB60663
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p22hO02v7pVQ for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 16:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 740996060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 740996060E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 740996060E
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 16:11:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4218008c613so18931515e9.2
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 09:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718986259; x=1719591059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNhDZhgJEa/RfSu56xm+dH3Tnq4jy47wN+ZAi63hJrI=;
 b=QePQiC7Mt4Bnv8fYhsw7z+xCnZtn9Cyi+ANBZvAcNZnAu32ToBt1DOnug9lnKwhcOj
 iKiDaRgBQN1OSG0r7dNu5rgBeLOeIIdQLfAgDDMbnVj8suK/PXx8/+NrDgr2J8qcmP+7
 lu2jUixQNw4q6wNda6k89coYwKT49RqXWDFvsVvbUIkKobcfYYSSWJjsyXbIoaQTzTzI
 CtGAsKgADmL/eHaEabRX/X8L67jq+lSpcpQByj6V3/mvFqiXd5FemJYohwWgU/ZMIUoH
 7kDsFD+FZantPW2ri7s/Xcdrs15yY7BOW6RNiRonwU4025zC626IguVnT8/KjwKNvXe+
 DbZg==
X-Gm-Message-State: AOJu0YyCih08TS62+trSkEcRRAdtjfcSisV2MrqKuHtIwh/e73KO3MDQ
 e+DsqNTU3df3ZVzgng2G1wNQhoB1u3cOuJtct6S44VYn2BARhrh2hK6tzwejxeSfRJ5LJz85pf0
 E
X-Google-Smtp-Source: AGHT+IForS0I6Y3/7Ve7uiOUsvHz3gq9dDxHfipUzrcvgNp1xwBoXGOBh1BeDYaM/lahluF5ysl6Mw==
X-Received: by 2002:a05:600c:3ba6:b0:421:7c6b:4003 with SMTP id
 5b1f17b1804b1-4247529d3ebmr66364895e9.38.1718986259352; 
 Fri, 21 Jun 2024 09:10:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8922sm2185522f8f.28.2024.06.21.09.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:10:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 18:10:45 +0200
Message-ID: <20240621161049.4085310-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718986259; x=1719591059;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNhDZhgJEa/RfSu56xm+dH3Tnq4jy47wN+ZAi63hJrI=;
 b=NJDqSyya2nA2L/XJv6G1NnX4TY+sBkgR6ybsTrvhEpRda4YXu78BFzfoO/eOOg+Tmf
 Lg0N7hDYpMW+BoVppSCspNgybo/2DxhdoPwC1IpRV7fOdOjNX+nDObZIGx0gS3H69+WK
 vBAjc/X31E5iwKf6c7spK0eCs/P2XqsvGdENg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=NJDqSyya
Subject: [Buildroot] [PATCH 2/6] package/libopenssl: replace engines-1.1 to
 engines-3
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bump to version 3.0.9 and all subsequent updates forgot to change
the directory name, which remained that of version 1.1. The patch
fixes the directory name to be consistent with the version.

In the case the library was not built with engine support, this resulted
in the presence of files in the root file system that should have been
removed.

Fixes: 3c66f65a6a54 ("package/libopenssl: bump version to 3.0.9")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 88debf114a3b..14313a80fe74 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -166,7 +166,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-1.1
+	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-3
 endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
