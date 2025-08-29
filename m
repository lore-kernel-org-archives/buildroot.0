Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8616CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D54661594;
	Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsuuKdgigMdf; Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82D1F615B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D1F615B9;
	Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD75BD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A40ED6159D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jU-xIBu9Nyu for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACC6061545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC6061545
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACC6061545
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:47 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso286259466b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463625; x=1757068425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PttWZ9a7eAVsJzqD00V0UJTLJHztQ5FUbB397j7IxTU=;
 b=WWdUqZuBIlY0bbeofYu4f6qJiA9s34boEGFr5kCTybTplxTYOMKdyeZD9vYjb36BmB
 xIpGXUUoJ3HqmTThq6Ny5xlJ5bsOv0461uQC0pluv98JFVUhqwU1+HTD6W/+3pcE94zV
 8JKsdQorTvIvWJjRCrbqRW1+Py4lYNWQRthEYSL7pnwV51QeXVsSFZbwnlY7Vu/FW8eY
 qCA6JoxnZg8NOrsxwI2TGhwVPLQMlRjdU0/nH9D/EsRh3djlNXXveAg5hWl+mwH2/wR/
 9+Yz0gWUcwnYzXM0s58hAsNfrTqa/vav4BX2kMpljap15z7n6IQvbMSoAoa1PkvFgRYL
 3Sbw==
X-Gm-Message-State: AOJu0YyTiy+6fP0lu5olTYhNIcs8m+eLau15R9vilQTvjXQuQnfGHm6J
 RlqNcLaODvAsAr2gE5nNYbcEG80h7hDDTaKwzuxrp4p7Q7F4CenzX00qLj88+UaIU0yjKjg6n0U
 kFZ4uKXY=
X-Gm-Gg: ASbGncstk78pegQmozp2hWgxcvaXq4v4hSwpqh/3TmhogQNIx3g3H5m7pPJFEEQZXVn
 SrgqStiVzsgQC//GFkEZZQWN8DVeIJQmL2ZIMqvTbdm/Mur8Zh1aHGe4aq3qpNHiE2U2cbWTRb9
 vB37nov0u3y1868q4xYNNvoM/TYPCb8bx/kvV6kNKnMoXOUIt42g2RAGzF9k0id9sZJgKO9vNdT
 7Ijj4odMu1pNfyG/L52PD2ADB8rG8YWW8KDh/u8+bqcBSopBnjUCGK+WsxUZiGSHbCNreHdif7A
 d31WXK4nKs4/l/MXtzjNNZQMgpHdqqtofxfuWk3dkH/zTG9+u8/9ZcIz9fTQ1qrzSbJsxVCdqm3
 aiZu8af2W/3kX8ULDm0Skr2+AB9NRVzCHvUv/VvT7kUGjJZMHaOyIvLEWWccDOQ==
X-Google-Smtp-Source: AGHT+IFhneDZVAMBFym03kuGP18yYSssd/IdrzSVvzsNXJ7dq09cw8h9Wki2TYyjYGRC1t7ObDXJZg==
X-Received: by 2002:a17:907:3ccc:b0:afe:f651:118e with SMTP id
 a640c23a62f3a-afef6511206mr364651066b.49.1756463625299; 
 Fri, 29 Aug 2025 03:33:45 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:30 +0200
Message-ID: <20250829103340.158873-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463625; x=1757068425; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PttWZ9a7eAVsJzqD00V0UJTLJHztQ5FUbB397j7IxTU=;
 b=IgHmP70tH/4B7pjLG5P6BE11ESAtVBhtDZouz2SchuDW6dVpYcp0Tqej6cMq9xNIG0
 1dIjHlHX9LH7sKr17ghsjX6oh5TWh8F3Kv3NWTkwgFcnjcS27O/075Yfkh6a9cyAyCX0
 dn+enJjRBn5oCAkdmbWxQTgI9OaZFU1WchDuuRpfFekLM3SB2UhdMYNj/1iG8dMRj0jj
 09lBuWsERBZC3UwhSXKo789MSUlgEd5vBwFYdUG0jrugzDRvihpRgUZLw/0qvQmX2DWY
 Ans2gInYTL1c6gpEW+8LgcIuTOPk2ZFMavLGhZ3Mior0KK/i6RbWfk/geA72i0jvvTMu
 MdCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IgHmP70t
Subject: [Buildroot] [PATCH 05/15] package/explorercanvas: remove package
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Simon Dawson <spdawson@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                           |  6 ++++++
 package/Config.in                          |  1 -
 package/explorercanvas/Config.in           | 10 ----------
 package/explorercanvas/explorercanvas.hash |  3 ---
 package/explorercanvas/explorercanvas.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 package/explorercanvas/Config.in
 delete mode 100644 package/explorercanvas/explorercanvas.hash
 delete mode 100644 package/explorercanvas/explorercanvas.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c64b986a15..c55961facb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_EXPLORERCANVAS
+	bool "explorercanvas has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_DATATABLES_RESPONSIVE
 	bool "datatables-responsive has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index f0b11d2f18..3211776e08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1892,7 +1892,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
diff --git a/package/explorercanvas/Config.in b/package/explorercanvas/Config.in
deleted file mode 100644
index 9714a580ce..0000000000
--- a/package/explorercanvas/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_EXPLORERCANVAS
-	bool "explorercanvas"
-	help
-	  Modern browsers like Firefox, Safari, Chrome and Opera
-	  support the HTML5 canvas tag to allow 2D command-based
-	  drawing. ExplorerCanvas brings the same functionality to
-	  Internet Explorer (<v9). To use, web developers only need to
-	  include a single script tag in their existing web pages.
-
-	  http://excanvas.sf.net/
diff --git a/package/explorercanvas/explorercanvas.hash b/package/explorercanvas/explorercanvas.hash
deleted file mode 100644
index e47367a21a..0000000000
--- a/package/explorercanvas/explorercanvas.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  7b8f597b5d3a2f71e87aac413e12e03d852df3dd3ac39f70e1615c9c850217ec  explorercanvas-aa989ea9d9bac748638f7c66b0fc88e619715da6.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
deleted file mode 100644
index 57ebfcf13c..0000000000
--- a/package/explorercanvas/explorercanvas.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# explorercanvas
-#
-################################################################################
-
-EXPLORERCANVAS_VERSION = aa989ea9d9bac748638f7c66b0fc88e619715da6
-EXPLORERCANVAS_SITE = $(call github,arv,ExplorerCanvas,$(EXPLORERCANVAS_VERSION))
-EXPLORERCANVAS_LICENSE = Apache-2.0
-EXPLORERCANVAS_LICENSE_FILES = COPYING
-
-define EXPLORERCANVAS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/excanvas.js $(TARGET_DIR)/var/www/excanvas.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
