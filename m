Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D53AC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 21:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACDFA60EAB;
	Sun, 19 Jun 2022 21:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACDFA60EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOVWq-uqwzMn; Sun, 19 Jun 2022 21:04:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2B760E9F;
	Sun, 19 Jun 2022 21:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2B760E9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5C71BF292
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469A7409E5
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 469A7409E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqbgLHjE2jRI for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 21:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB1D3408BE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB1D3408BE
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 21:04:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e25so8258806wrc.13
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 14:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6VTx+QzLYKrOOS0KPc6q7VltaXy2rnk+dxzB4BYDWI=;
 b=skYOOnQlaNW8mG76Lx2L4th6cHGjgeCX06+cREJMdtRr0ZZvDp4U5wIyOOf/ZRBWRt
 ZT7LSdMJtMmYnh7IqaJX+Hi4xBshVTWHyJflQvASLkNRDHQnzjmc6wav5QlPQb6THt9j
 21/BFsRpXuGqrFT0vB1YeOxhkX7xv1I3e3oc/ybP5kmeXNiFZ5xAVsTzYKwkT9GWh/8n
 YYlYyU19v4s8ygDBaL1JN98qxZLex4RdguGBpbqitD9EN8hvCikOi6WTmLYInTcfe0Ie
 3jPYje5In9ngf7dPb9AMdAnP90f7VAuOtBdqs/p3s9U88yoWaERGiZbrvQdcQL7UI2aP
 8gKA==
X-Gm-Message-State: AJIora91kPcr9vVZmJENCOQSjathFeNG4jxuf2tSHjx4HIjEA3H+brl5
 GNzmvZFhae9TTnoFAAWmSTCSKfJnBX0=
X-Google-Smtp-Source: AGRyM1uNO/0AwKZXSCqx2IT5leV/Zm9qB+a5UZciVy+ZxKtB1niq/+MIEwyQWmd3YmxzjSUly4ndyw==
X-Received: by 2002:a5d:4985:0:b0:21b:8d36:7669 with SMTP id
 r5-20020a5d4985000000b0021b8d367669mr3299305wrq.290.1655672649670; 
 Sun, 19 Jun 2022 14:04:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h81-20020a1c2154000000b0039c41686421sm15677994wmh.17.2022.06.19.14.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 14:04:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 23:01:01 +0200
Message-Id: <20220619210102.1021263-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619210102.1021263-1-fontaine.fabrice@gmail.com>
References: <20220619210102.1021263-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6VTx+QzLYKrOOS0KPc6q7VltaXy2rnk+dxzB4BYDWI=;
 b=FO9SWozqGB5kyeinaB72XoggN5XJ4MmPCQDq5P8EFUMtmYZjr129dsQFyC4NuHE2MF
 il+UVPAkLfw7Z1obP8jOzC7nVlk0pOseuyXq7cMa4YHkPNP0l4XtTKLxsI7DiM+JyS9/
 NAP2Rk+9HdrREuKw82cv7tBluMDj9vb/uwm+Hk7OS7suYEub23g6Ev+lX6zgpF/kS1hu
 XFXsCWlPkPKEKfHe/S611MP80TrtKdTy8xWnuxE8Dmp+nHBij8IT88gaZ8kZd9BWANl1
 9YMubbsQ3Jy6pacRKlrVGj73cRVN2JINFJRdJ74dTIKwzLY0kVJJR4NoyzVgOC+TvRRk
 YuJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FO9SWozq
Subject: [Buildroot] [PATCH 2/3] package/bind: disable cmocka
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

Disable cmocka (wich is enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0ce78d08cb..c84abe91a0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -31,6 +31,7 @@ BIND_CONF_ENV = \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
+	--without-cmocka \
 	--without-lmdb \
 	--with-json-c=no \
 	--enable-epoll \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
