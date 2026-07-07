Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955FEC44500
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 10:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D9C606A9;
	Tue,  7 Jul 2026 10:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CH8YYaoHotzb; Tue,  7 Jul 2026 10:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8311F60786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783418928;
	bh=QIjkfN9tlexjeMUbP85qZ1AunPdzwrWXyRoWA3iqKHs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B2c9wJMyCMDqxF4UIYGELg2Ltfj+jXr2yoq0LWKqa9yjymrBek7HulaZonbk4MYn7
	 NlD/wDKsMfMwgSLny0oNGp1qcC4rjEkw06/ywXawcN+eu2daHWWMs7l9BBbD3Ds5PE
	 YVhCuhb3juVuQtHF5julc7t+iEjk8MHUvB6iLF7N+3QIqcQcTNaWqz60ostxu0wGy6
	 8QbnKsDeqa8bQUsZpw6p4jBGYaYx4dUAVxZ8IKNJp/f5h6xwufCJ6QtmeZpaQrSfa7
	 MrqxsI1ONWyLs4ur7uMXhJ7TsA9w7QBNvN5GOcyRLgk1JPI+kivgDaxVxuHNNQqSsQ
	 WW0+gu5p9VGqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8311F60786;
	Tue,  7 Jul 2026 10:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A182A8
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F3D74071C
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrHSbW4WJHUm for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 10:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EA4C406FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EA4C406FE
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EA4C406FE
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so29720845e9.1
 for <buildroot@buildroot.org>; Tue, 07 Jul 2026 03:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783418924; x=1784023724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OZKO14WqQqjIVqIUNIvPyv1JFHVQHtrE+Vp3ps0V1IU=;
 b=UD4prpKyZ8yWgAIrZn7vk9LrohdTJ6LmBj9q1MQ6q2Vd2mxJccMB9czsw/pjwIWsjk
 15ZUI1xhWC4kMSY9JDuLt3r6V3iii/j0YL3Ke6R5IfCqqprTKPQQXU04JvJcN7lpbiTO
 38A76V9YIoU35UHsHMa84hgUANesPZKiVZzBciFR1kOZ7BP76/tupWPWXDi6BUeW05FR
 0wCz5i+zT1ty46st0YsSRehJrR5W0MRwn4S1kNZv36/tBc7c/yvZxE1oCTC09+8tcfTN
 WnTW75QoVurQWeQg4Nvn1b+Z8sK/k4uiXDhbP+wTRsiKptoOIX8TsBdiAEfv07BauuN8
 raDQ==
X-Gm-Message-State: AOJu0YweWTKL3fV6h25tcNxf6ZVr7JdPMn4/vW9VZ20EP5QoO82oEgl9
 A879pHBROkH7Y5Fw67yVjvH/drAuanvZ50XCXFn04gs8VAuDsKm8pDTK/T68Z/2UXjfC3+fAyVI
 obgtPgg8=
X-Gm-Gg: AfdE7cmWHJqT2yUyRVSSemvpk7ajr8XmhogVfodpnTvoxNmXFhxRKQoK22Ou0gKtybk
 x8PAHCS0eo9CocM1F6IqCM0SQJDh5oYnOTqa87FGyhiJrQaMLobT6LIeZ+4WFZ3UKOVagORoCWo
 ukacCQ8NArz5dAvEjSQgrH9mEbV9eQbg+QQkTErKkGx53OBBg1lDJ8JoR8OUGi4sTagVePZTsaJ
 OeebitV9mlIODjitzyaep5PgBAijkIakmPFXFazNNHe1V3yM/BQPswJKA7Shn1kAFmuzIlovYPY
 pgvFPH3hCZyqY05rjnr9iYreL6KRXyCoYoyFzjWrXZtZK4opLcRp1daYM1hMOA+0qJk8BKEp0aw
 oZjbGmJvB1nm5YottuXkeGE7hDG+OhBxslxJdBsOpi56Dhl9MbVc4v4ZzS6Ak79ZNHEGvpqA2vq
 CbjshEG5/ea/V2vm8Nn+BMR340lgnPfTG6Y/xgg1obJLpJEXuEKqMntX+8v5N7C3OMDGgWGcdZW
 LBi9tnaFA+QSftyMjhVJmnXheSRUb1xinP3aGGH2HKB
X-Received: by 2002:a05:600c:3150:b0:493:cce0:3724 with SMTP id
 5b1f17b1804b1-493df037956mr41253885e9.4.1783418924255; 
 Tue, 07 Jul 2026 03:08:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0fbb410sm45612475e9.12.2026.07.07.03.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 03:08:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  7 Jul 2026 12:08:36 +0200
Message-ID: <20260707100837.3332387-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707100837.3332387-1-dario.binacchi@amarulasolutions.com>
References: <20260707100837.3332387-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783418924; x=1784023724;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZKO14WqQqjIVqIUNIvPyv1JFHVQHtrE+Vp3ps0V1IU=;
 b=dXgWL0w7fs7mlYp2EMMf147h9jz7lCbJXvB1XFGaxoYyhviduZWlGtt7WFg63g7Qis
 B32596mNJ8axh8HZu+1iB79mmyEHKcYXbfaIIJqOyJWqWznL5biWJnvXhitjG0m58CBX
 x8hmXtKt2QacB/3XR7dxrUMzzSpxGx+Q5iPPs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dXgWL0w7
Subject: [Buildroot] [PATCH 2/3] package/gnutls: allow enabling host-p11-kit
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a new BR2_PACKAGE_HOST_GNUTLS_P11_KIT option to enable the
host-p11-kit dependency while preserving backward compatibility by
keeping p11-kit support disabled by default.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/gnutls/Config.in | 3 +++
 package/gnutls/gnutls.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 59af32bf1efb..93f2287bf80d 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -39,3 +39,6 @@ endif
 
 comment "gnutls needs a toolchain w/ wchar, dynamic library"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_HOST_GNUTLS_P11_KIT
+	bool
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 6411a7d62115..71d602825cf2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -64,10 +64,15 @@ HOST_GNUTLS_CONF_OPTS = \
 	--disable-openssl-compatibility \
 	--without-brotli \
 	--without-idn \
-	--without-p11-kit \
 	--without-zlib \
 	--without-zstd
 
+ifeq ($(BR2_PACKAGE_HOST_GNUTLS_P11_KIT),y)
+HOST_GNUTLS_DEPENDENCIES += host-p11-kit
+else
+HOST_GNUTLS_CONF_OPTS += --without-p11-kit
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
