Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D8FC83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2073341D7E;
	Thu, 29 Aug 2024 14:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OaxJl1W2ya6a; Thu, 29 Aug 2024 14:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D220341C5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D220341C5E;
	Thu, 29 Aug 2024 14:50:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54A5B1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2499740210
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1t8ln2iWbC9 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27F8B40132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27F8B40132
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27F8B40132
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bac9469e8so6751015e9.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943039; x=1725547839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkgG5FVSNOu8fIqhzjSMX/lC6z2zrJCiefQcxDcHI+c=;
 b=blynEl92cj0HKP8O59us0TVqJHt+/xAM1/iLVCYGdiQE+m5ANzdIPmZWKrjrTYW8EY
 BL9PUmfJ+Nz6WJnUTTW3SHrmKp4tZwO3KnYvLkADXnQoeQTg4Fg/8uy1HCI9ALqPnP8Y
 oNOuz0qnTrlCoKIMj2K5jIVctENm35Ur57Zwdr42YJkKO9iaFdDsvQ3s2N1FNNeMkolt
 urMFVuqBZAz5i5jYyZEUzrC5CkKD0IdlM8fMOmX89iuidrdFTC/rS8sYB+F5Dg3agPY+
 sVXf2dTA6jUYn7zRlCv2p0GJvAfg8TR3kODbNs0ZlNK78fDqi9/bgDt2vIPOLVMOZztC
 xHlA==
X-Gm-Message-State: AOJu0YxOQylgu9sJvQP8wn3R9+5gDhbV1Svta4mGRGWwpu7Ot011S3QF
 Fk8b/5IjUCM+8UxaOcK0T7xfxhPV9f8LjnboM5Bts1uozWX4fi5oTN9XBA==
X-Google-Smtp-Source: AGHT+IFnjEmurQTKMZn3AYMArm4IfysbS/JHEOLPl5nsWb/qcIjN+Wyr3h1TPk95Om9EZwIdT7kCHQ==
X-Received: by 2002:a05:600c:3145:b0:426:6667:bbbe with SMTP id
 5b1f17b1804b1-42bb0257a2fmr28320295e9.9.1724943038676; 
 Thu, 29 Aug 2024 07:50:38 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:38 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:29 +0200
Message-Id: <20240829144940.209964-14-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943039; x=1725547839; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkgG5FVSNOu8fIqhzjSMX/lC6z2zrJCiefQcxDcHI+c=;
 b=caUlUZVvjepg5IC9jelWWq5rbvrB2wwBV9Q2i71I/Gvwaz5DdutyFjxEb/NJANqx8W
 mASp5kMz6pHEjKT3n5yschc4YqKEXr6P5RaG+U+S0xMbAg+wejg4mIipt2DnEMbQdFqc
 UNRzx4DFLFhsUQFJSq143zfAnDteVDNEUir5YxAlNZ+lkC8PHnlmAwYQDbN59xT0gWRG
 rqYyjBFa5D65vD+/GfltwLlpMQnOGjnyiRAnVMUCciT5GffGemkcVcySHVJyA4jAOwSr
 jLeqRaOrArg1m3TeKZYaTtP9gmxkmcGUZZjMH/FB2wPamo8jGEd/6PZ1udhYSIg3On4j
 cNDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=caUlUZVv
Subject: [Buildroot] [PATCH v2 13/23] package/erlang-p1-yconf: bump version
 to 1.0.16
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
 package/erlang-p1-yconf/erlang-p1-yconf.hash | 2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.hash b/package/erlang-p1-yconf/erlang-p1-yconf.hash
index 25d873b58a..dc2ac9937e 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.hash
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0280358c868977105104cfffa7b1fa2c5bf7856243cee9b7df974dc54904e4da  erlang-p1-yconf-1.0.15.tar.gz
+sha256  0f33a381cc580dc43284581e61e531293d1d358e35a32e51b8b4fda7b462eba1  erlang-p1-yconf-1.0.16.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
index bc72f282a9..297ab20bb2 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.mk
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YCONF_VERSION = 1.0.15
+ERLANG_P1_YCONF_VERSION = 1.0.16
 ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
 ERLANG_P1_YCONF_LICENSE = Apache-2.0
 ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
