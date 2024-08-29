Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A029BC83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5901041D81;
	Thu, 29 Aug 2024 14:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkyC4Ana35X6; Thu, 29 Aug 2024 14:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CB041D84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43CB041D84;
	Thu, 29 Aug 2024 14:50:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F4441BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB288186A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0t3d-euQ04L for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B201E80F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B201E80F05
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B201E80F05
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-371941bbfb0so466432f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943042; x=1725547842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgTW0Yi1uY0QDCnaOeLb269i/CW7nPyFHnwLPteuyXI=;
 b=CJzCm6+a83IYn/+O1iVx5GdCoqeVu9CKh922sAaOU7puRfVJ1HAY/PICvqzi0xiIBr
 dYdZWuyCBkbyy/MQTYDmNTfR1hKdQsZsYSPesLwDerisQlzrDqhTYiHeGLD7DP16iA7U
 iOnYf9YlJg04m4vcAV/IEbYC/alAd2eAXcHzDz5d4498fwENtiA7eZ8VooSHVs1c1H/A
 ESnA1Uw9C6F3/MpxHOhfLQuocJBMnutbsPrMbWbr/5XLDIVtS23EFppPPLhgHJoWmlTW
 DOx8iCctx7qvMn+YP5lsquFsI9ddV2X6VXc9qWup+jOeX+HP3HOdaOtn2tHuGwFEDiC5
 8LTw==
X-Gm-Message-State: AOJu0YyX+II6YbIP0R0+3GSbjT59/SnT0DCjzmMj5MdDzwxZJeMEgOr+
 09aWkxOvwluq0R1uYZW6kveqM5ZIQH6jJ0thXZfcJE9PUwQdnyi9xN9WOA==
X-Google-Smtp-Source: AGHT+IE+EfxTTN3ltlbasDBTXuatd7xgEjOuL7F0gGGnv1Ng7WPDDOFsgS2BEs9ktYfbKc+Ga4yZ4w==
X-Received: by 2002:adf:9b89:0:b0:371:9366:6d8d with SMTP id
 ffacd0b85a97d-3749b5495abmr2292089f8f.19.1724943042290; 
 Thu, 29 Aug 2024 07:50:42 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:42 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:31 +0200
Message-Id: <20240829144940.209964-16-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943042; x=1725547842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LgTW0Yi1uY0QDCnaOeLb269i/CW7nPyFHnwLPteuyXI=;
 b=bxIUurjCxe2u+3O/sytMZSlbJIZGu/BySrxSkA31WUYzvslE56MSyKDRQ9CfSeNlxV
 VPZTWjsj2Fu3JVl2yUxMQUkhwNaSZ7Z8YV0XmuEHx/05Q23PkhZQv4Qy4gxzI0KwWKGQ
 R0SSN3u+6W9IPJVnSfdIDMVyiqspPm4rRmj2V+spX7V5J7iE8zjsCTMS6818p/wKaR8P
 1c9hR+Qf7WKYu0sIcwIeVYszce6mePQpSz6n8dZ9hNbK2E+z0J9+YDFt/uWQ8uRLfQKk
 72sFHAeec7nWH3gFQdQuPFNnu5YFUK0viJ/JsC0P2xNa/tpsgew39fI40cciODYKplvE
 Zw6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bxIUurjC
Subject: [Buildroot] [PATCH v2 15/23] package/erlang-p1-pkix: bump version
 to 1.0.10
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-pkix/erlang-p1-pkix.hash | 2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index 2b9c4cc93f..a1fdad63e0 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9adf7d16494c1a1b572b46fc9ee1d28996b3d4bcb7a433395dfe120cee0c0ae  erlang-p1-pkix-1.0.9.tar.gz
+sha256  da6279d3f8ee31ef04de2b82fb0d42ce8dcd72cedb9a8e6ae7b18e42590cb108  erlang-p1-pkix-1.0.10.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
index 90c4122184..ba3d88a30a 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.mk
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_PKIX_VERSION = 1.0.9
+ERLANG_P1_PKIX_VERSION = 1.0.10
 ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
 ERLANG_P1_PKIX_LICENSE = Apache-2.0
 ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
