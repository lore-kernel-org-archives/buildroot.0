Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4C2C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CF0419C6;
	Thu, 29 Aug 2024 14:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pu5ZSESjBhNj; Thu, 29 Aug 2024 14:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE22419BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE22419BD;
	Thu, 29 Aug 2024 14:50:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7994C1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67430606A8
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tph_UfP-QHQM for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9192A6069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9192A6069B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9192A6069B
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37182eee02dso511551f8f.1
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943011; x=1725547811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dASxbdH3CPB+C5B+oV6wjCDNSzbV2vr2f1ZdKJvU2B0=;
 b=tgv26VfCwnOLHxJpvLYTUqL1zNfrvTjTzfjY5PaiRnRxIb49x8r3T4ckIRO7MbPRcy
 QkhzyzJBfJDxEF4o8l/AoHycHfqAsCx6fCpjcSkEyo2x+JHQz955GI55/rBB8ewLRfnJ
 hMnTaF4KuFmkCQJEu0lL5XdaOWg3Ts3JMXE42GqTJOfaWqME4FhfavpCaCLwpvr+NdR+
 prBxfaDbXwX732biiFGI26KwuMFMX6lvm2hvB+0RhwgKjDJHc/XxkRflz46Z3Vs5OZuW
 DDT8qMMjxWd+Lnf7rRDYjc/02QM+DSQREPqaiJ6b0jx8ZNRc2f13kGPiJCGQ7wbFMa9N
 LSaQ==
X-Gm-Message-State: AOJu0Yz/RPVPYNW2TvrnhnNJhimjVkxhyc9668zQoTD8jVGjUsZp2Z94
 tGDhPUOLGcfDRYyDQE9Jx4CCOIR1jKKNAAMVONHoKWojGkWpxW0iwB6yog==
X-Google-Smtp-Source: AGHT+IHbmlz5k/3H71WkvBDBrblEOnnWNPwIls/jE5ET1UkTRUMHpN5jw2+W7naJPkUvGdRC1c5yMg==
X-Received: by 2002:adf:f6cb:0:b0:36b:ea3c:5c00 with SMTP id
 ffacd0b85a97d-3749c1b8353mr1383146f8f.9.1724943011314; 
 Thu, 29 Aug 2024 07:50:11 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:09 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:20 +0200
Message-Id: <20240829144940.209964-5-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943011; x=1725547811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dASxbdH3CPB+C5B+oV6wjCDNSzbV2vr2f1ZdKJvU2B0=;
 b=LNP38UOIx1k1avqg0URg68xJVnTp5ZTv2+2xMt0K9nqRKeA9kSq7Eh5NZKc7sfmbWl
 +cUagqaurDTBhUYTY81vfV2koLBK/8x/65/8QKc64k8gsJEoKcj2/fncQ0qqghk9kDPG
 3v9JaPIMgZciePD72ZOht/qui1nyG1dhffev5vRksNvkjP1R2Cp7CiVaZpcKjebRqfMF
 CJQAkcMIooCjfIhE3bu7VMkoVRBMODW9QFY6RQ/uifk9YcGvNmckvlVVxYF0bGQ7A3sz
 3cTAqhsGHPwszUC05u6hqqcw292cD4Xj/Zrd/RcwsXmKmydS9exBWdXWtyCthe7a56wT
 3Pgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LNP38UOI
Subject: [Buildroot] [PATCH v2 04/23] package/erlang-fast-xml: bump version
 to 1.1.52
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
 package/erlang-fast-xml/erlang-fast-xml.hash | 2 +-
 package/erlang-fast-xml/erlang-fast-xml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-fast-xml/erlang-fast-xml.hash b/package/erlang-fast-xml/erlang-fast-xml.hash
index 6592e282d6..df5557080c 100644
--- a/package/erlang-fast-xml/erlang-fast-xml.hash
+++ b/package/erlang-fast-xml/erlang-fast-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-fast-xml-1.1.49.tar.gz
+sha256  2f705191a029ca7df7e62a6cd8622701da59a9e221f8514d2c2b1a5c1d23c739  erlang-fast-xml-1.1.52.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-xml/erlang-fast-xml.mk b/package/erlang-fast-xml/erlang-fast-xml.mk
index c2b6205914..a04e3f5e09 100644
--- a/package/erlang-fast-xml/erlang-fast-xml.mk
+++ b/package/erlang-fast-xml/erlang-fast-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_FAST_XML_VERSION = 1.1.49
+ERLANG_FAST_XML_VERSION = 1.1.52
 ERLANG_FAST_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_FAST_XML_VERSION))
 ERLANG_FAST_XML_LICENSE = Apache-2.0
 ERLANG_FAST_XML_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
