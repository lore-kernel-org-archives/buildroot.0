Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC3FC3DA78
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 19:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF8E821C3;
	Fri, 13 Jan 2023 19:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF8E821C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVeZ9vuVwIc2; Fri, 13 Jan 2023 19:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A06182022;
	Fri, 13 Jan 2023 19:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A06182022
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3F9B1BF3EC
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 19:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FFA140571
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 19:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FFA140571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLzvSG_Hy3Ie for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 19:03:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14EB2400CB
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14EB2400CB
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 19:03:08 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m21so32411796edc.3
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 11:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJ+mfHDb8ejEabSZPZ4CgX9pv7x5AKR60N22usKpoyY=;
 b=elStDjtiM7MbczmP9DL9NI40EGDGKicKEiql2oA3wEkyqdf0sEb/WKYR9yjgda8g2H
 MRqUPoSCbcRigqvQcv7WL8pbryOvAdY5cXHSPJ6te7Mes3Q7n7lqM0bNPFxPfUhKuTmh
 33iFMxEYxjVTXpkushkuox78Zv6HxewHPH6AmAoNN9MX1eZ9jppie9efKdj2pF5vghTZ
 IlL93ac/QrofQTCHI/h+YQLnTzs7kFPIvitme+Q4sjduL4LxSQz281FsUQ25JewLyTcy
 aG8KOXWsfxJazC1H+BQtz1li3em6qH1zrDFB5abnZrz0/Dspd//OiKLpWLLPIjy3zz4a
 d47A==
X-Gm-Message-State: AFqh2koQUm5AGoMHLoW5laLSISDVWezI87FUH6w59ipdFzIoiS56Yz1r
 3gZ5IINZqPwelwka04I6pSg07J+4Mn54WnUjlac=
X-Google-Smtp-Source: AMrXdXt0nbAmmirX/SSTO0+Spf3KYyJlhiHsmv1UCOHw4ZRLzuCvDTLrJqD11TlGhTn7TphdKixAfg==
X-Received: by 2002:a50:fe86:0:b0:48c:bd9b:1fa4 with SMTP id
 d6-20020a50fe86000000b0048cbd9b1fa4mr47151530edt.10.1673636586934; 
 Fri, 13 Jan 2023 11:03:06 -0800 (PST)
Received: from localhost.localdomain (24-212-229-25.cable.teksavvy.com.
 [24.212.229.25]) by smtp.gmail.com with ESMTPSA id
 p21-20020a056402045500b0048aff8b5b70sm8419566edw.67.2023.01.13.11.03.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 11:03:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 14:02:42 -0500
Message-Id: <20230113190244.53572-1-kyle@balena.io>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=balena.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tJ+mfHDb8ejEabSZPZ4CgX9pv7x5AKR60N22usKpoyY=;
 b=lGalz7PLN5Afv9RlJSjHdmkJkNn+G0zilKEeslH9s8odzA34cqLGpcBmEevPgfiX7h
 uk8i+XmUL7OyPDmxtDPZy+KqMt6tVUCPRBKFhcMp6Kd9jTnQupkMYcvqRGJLfhx3WbKl
 qo86KMbwoEDl1gVApEe8k0IiVm7+3+gWDE5m4ablzYUm93VKHZYTF1YL6O6+JH6yiGmq
 BfqLcxDhH+8kpO9jRFUN65i5oSKKuMMYc4KmtwzsZYiQ4tYnuAVX5jDEaFJCT0w9OYBa
 zhNbjCyTBuVEReIwnPYBNhdQ+UiG1XMmrvTy3EiGeyRD0ndNSyJC877jO7E1k6X8Djjg
 bWUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=balena.io header.i=@balena.io
 header.a=rsa-sha256 header.s=google header.b=lGalz7PL
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.17.1
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 147ac7b13a..91e1d82dd2 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.17.0.tar.gz.sha256
-sha256  dcbc95d7891d9f910c66e4edc9f1f2fde4dea2eec18e3af9f75aed44a02f1341  unbound-1.17.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.17.1.tar.gz.sha256
+sha256  ee4085cecce12584e600f3d814a28fa822dfaacec1f94c84bfd67f8a5571a5f4  unbound-1.17.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 7b62522727..fa7884e937 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.17.0
+UNBOUND_VERSION = 1.17.1
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
