Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F31DC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E09FA60E61;
	Tue, 15 Apr 2025 19:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StQzS8V64E81; Tue, 15 Apr 2025 19:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A47461180
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A47461180;
	Tue, 15 Apr 2025 19:56:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22860109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4C9183704
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kxgyg5Mt10vB for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D135835F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D135835F2
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D135835F2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so52576165e9.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746977; x=1745351777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Ab6Pk+2iYBoMWkxTrWGXO00FBgRvYrUZAA/kwIC6NE=;
 b=dQGG2lrPsujudXEYgOyZQpRAxRtCtPcYBpTk4YRGBibxdj/y92XO6j+duBsLj3T9mH
 cNs/5u9CC5B4aDHAOTf4h7Hg0rUNGle2P0+N+X8LQMIcnOYwc2D4kI9fZg/nLUS0TtN5
 y3jupwV/JHEtvvpwDXFxsM4Hve2HPmZQKotJe88luErqRfEOlwpE3V+jiYT1gkTfOmCL
 NRkFSpdjnhiPaacBgkm77Qe6MeBTwzLh5dbJJSq7MfXugR9pi/hv/xjfNsRHdgSkQoFh
 D7rwaNegUqNm+BAbfDtVn/JGaz13Y1YnZcQgBc1fgHbRsNqZbSqXo1BbSnQmpS7rTDzD
 Jinw==
X-Gm-Message-State: AOJu0YxLyFEvfZQvvUdWI5rq+mCBgqSKNtURSbQHlD0VAXpdJJQTWVG7
 wprkMqsGWSJupYC7/tvJA5wsSB9Kh3mtFOaLJndHgfXyyBX5iFENgaNe8abZ0FxfP2+sP78dRuo
 P
X-Gm-Gg: ASbGncunQaH8zA7/ruAgp7gfghIc0bqRfzOCMlfXUetkhYAYAn2lrAGw/1k7V5kJ/Dt
 VAy1uv1rXKiVpXeSAt6hxzf/IYN5clp54f80kviGBnSOTqxi49PmeG4m5k9d6xNyQSltc0soAGf
 YnKUSkLyC3isxZQ5PUmZQArc5+U4onDztD7eQEBf4ox+DDItZfMHnZbxuiGXRhBFCQ95AFHLtdA
 EbEDJfMfqaAwZzNQdF8TrVLK8oJ3AUUhGke1KBJcGEDEZOxmmhrO+uXXnHzPk17lEibXDRGSkXI
 KP43XNAnQLJuz0ulR5FkXfYUgDfZHvlnmSywYY6x5D7qSIXlgWeVSH0=
X-Google-Smtp-Source: AGHT+IH9pL76FE4qCMeBFC1y5eY+LxJNtIG2OoOIe7pXSiuRYeog4NO7ULjin2bQzYqg6rIvNwZC+A==
X-Received: by 2002:a05:600c:1f88:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-44059ffc7d1mr3800925e9.3.1744746976980; 
 Tue, 15 Apr 2025 12:56:16 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:41 +0200
Message-ID: <20250415195547.199428-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746977; x=1745351777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ab6Pk+2iYBoMWkxTrWGXO00FBgRvYrUZAA/kwIC6NE=;
 b=LfBx5kGuc3iXHrzo0mOou7fK0EXG9rsLwiFPeyK3SuwB/Ilt6yd90LHxNoe+g2e6q5
 XywEIDHQpK90CWHRJEBHhC9Tqx+DTNjleT6EAPoKqVGoojrzw7sq4aqaR+as7LVG9Qvz
 f/aFE/0m0qTKqG+2vbiYQxQkv7mPuBsrl+Cp2QCZ6RATwpI1uEa7+4zFc8usx4xv81Em
 lV7T976ns+roceBoHW/fElUx9q9cD1zaj2LC2J8WExNV9PhUwvVeRJSnqb5iazrfWKoU
 eVDdQ1KqkhFVZ6RGMTyNqF+fLJ4qZfICXIoopr3JTPlP4x3oGHtYqAcz9sLHwY/oohsQ
 hyvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LfBx5kGu
Subject: [Buildroot] [PATCH 7/7] package/pkg-utils: add PURL to show-info
 output
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch add a "purl" entry to packages that have an associated valid
PURL.

This patch update the `generate-cyclonedx` script as well to reflect the
change in the `show-info` output.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-utils.mk     | 3 +++
 utils/generate-cyclonedx | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0266f66b42..5fdd9dcfe1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -145,6 +145,9 @@ define _json-info-pkg
 	$(if $($(1)_CPE_ID_VALID), \
 		$(comma) "cpe-id": $(call mk-json-str,$($(1)_CPE_ID)) \
 	)
+	$(if $($(1)_PURL), \
+		$(comma) "purl": $(call mk-json-str,$($(1)_PURL)) \
+	)
 	$(if $($(1)_IGNORE_CVES),
 		$(comma) "ignore_cves": [
 			$(call make-comma-list, \
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 46f68ac63d..f5f80c59d3 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -185,6 +185,9 @@ def cyclonedx_component(name, comp):
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
+        **({
+            "purl": comp["purl"],
+        } if "purl" in comp else {}),
         **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
         "properties": [{
             "name": "BR_TYPE",
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
