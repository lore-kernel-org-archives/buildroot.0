Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A013D59D99
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29082409D8;
	Mon, 15 Dec 2025 11:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfFy1GqBK70l; Mon, 15 Dec 2025 11:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4461140994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765799012;
	bh=jAPp26Hxc7hs7XzykFV8T3d2r0YKCmD/LFBnA5EaOy4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GpZ1m5LClAYcaoAMpJlBbjeLoBFlh78v06svVtovm/YJt/lvU7PjzB+lO3fU7eAC9
	 lQmJZNy+1e0M0ZxXwRkxcMiNz3MM/ML6eYWiRbGBZa1356uD2LAA4vIFvpGMVpR/HW
	 9VXnurD6yUy8IVe8MpGLbJ2GBQ3od2tJqaFIcWmWNRFlNQCyMXQQ1UPLvsAF0JkHA2
	 JGzDD5SYslR9NePGH+IX7Wycyw7k3oXPdJBh+gARMflKinRThtYt3YO0I9Qx8dsr+U
	 Bf13Cm921jRAD0fC7YLJhE/Aeml4uSsMc12QzlI4Fsjv1ba+HylCol0P5AGBs4EFkL
	 QgvvSzewPgH6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4461140994;
	Mon, 15 Dec 2025 11:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DB1C118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44517605E6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-__HIhxIEu0 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39C62605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C62605C9
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39C62605C9
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so2054902f8f.3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799003; x=1766403803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mAZRhJrDFs4vBCyWJrKUn5N9lvnDjxqtAQ70FD1E79g=;
 b=pBrmW24eLAaw9WiW19MS0dCnViXruN/6tyg0tqs7pzoXdapZpTZ8V9RPXiNyXZACmn
 stV65JCxpl/gxgJUVWBJb7VsvnfzN1uWr0WLJN2Zi0M6xNMxRUGfMRsOnrGBeCxCSuo9
 LPJ/NXRqvgTkRkO0m0P9IzFZsPihFfcNoCh3LxRz+/KlqVd3Rs74YvHmaBCO5hjIfrtV
 WtBStPdLvbwAVudASTvuVZ9fT3kISOZSZHpg0TYjToWdLzbQiCiOVvUFg6t6jnCZP0H4
 90XHM1sVebroz0qjJPZdXkaQCS9zarEHzzEQimmql4fn5wIxZUbv/rWy+NXENqRk4rWX
 /QeQ==
X-Gm-Message-State: AOJu0YxZ9Na9emWIh9wiU4xn1LtHa3SidSQZt9NbzBRVTW/pkP6mW6yp
 0u26WiXBjAZ8IeNTEghn9x8Ti1/99X+GBPP4sU+exvRg0d98p7RlMu7VfsEIeA==
X-Gm-Gg: AY/fxX7xOGLkHE8JK5Z0Lx8FIbPqIi9WBu/QnUgRsX7k5HbEnIpZHtL0XjySs8Ab7CD
 +MX6v4Z5odQpx3EAsiKSTaPlJRG3J7KiBWc+Rwc+tlGY+KMoYTS+lwwpz6NMWRT65eOKgph22IO
 EtWFJC8YYISwZENuO7/h2FsFW3Dh031Ag6xnvgOwi1nOkK2+BkL0T7+MFRhlFcYglkhhqY5wI4S
 WG4baN3zoXdg67j4HUciHqhTCurDSpKLv5QRvIU4hx8ki/oGqb6Ghi2DYeQVTUP2x5FidAVxgaj
 PI/7kAS3ioUsxwCZIXZNcglULGcOlmcHKzjC89bU6Gq9nn/vbn1pEO1JFNaIIESWeN2R6TKAsnO
 PqgCkM90lN2X6TJbrnu0GjAUSovcJPGH9FHIDOCZxDn6mNeiQIkRCoQg6LEoUfJi3qVgeMo2tnS
 t21ns=
X-Google-Smtp-Source: AGHT+IG8CFe/73PVznDDM0MoRGGgQbmtrzkBzipsQU0oOG1DJTE9hRibgx7D1XKGVH8K1W6NTD5IPg==
X-Received: by 2002:a05:6000:2881:b0:429:d6dc:ae10 with SMTP id
 ffacd0b85a97d-42fb46e2cf5mr11407569f8f.29.1765799003220; 
 Mon, 15 Dec 2025 03:43:23 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:22 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:43:01 +0100
Message-ID: <20251215114302.32596-7-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765799003; x=1766403803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAZRhJrDFs4vBCyWJrKUn5N9lvnDjxqtAQ70FD1E79g=;
 b=N1HIa4xaTZdJmiHBhZBJx/Fs3Yo0fLvnlYeGRGprP6eYuROoPC1nlF79qKJed0wMev
 Qba7jBhe5lN2U1boWPF/jgP9RRs0pbEHKOHJJg9dJO161gEvxVunssGk0YmVhpKTmktj
 P+Rs65Ba6DGiD3PWMeEikgJrcF9yRyl2Bg7KQlojr/VnpSYu5BtwCXdnLZ0EMBPioDRJ
 sSNYlggSy+pOm2+g9FlGGTCZUEwP88ztSAZaXWltK3ESb1e/V5G3jEsBsJ78vLxlDzxp
 FAE04Q1eiw+RqlYHT2gBHcj0sC/1Kchxiy+ycI5xtJBOcIpkEZ95xNF+G3IuCQ05sSM4
 VALQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N1HIa4xa
Subject: [Buildroot] [PATCH v2 6/7] package/grout: link against DPDK static
 libraries
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

DPDK always builds both shared and static libraries, regardless of the
default_library setting. That option only affects how applications are
linked, not what DPDK itself produces.

In Buildroot, Meson libraries are built as shared by default, and fully
static linking with glibc is not supported globally. However, linking
grout against the static DPDK libraries provides better performance.

A new Meson option has been added to force static linking against DPDK.
Use it in the Buildroot package.

Link: https://github.com/DPDK/grout/commit/ec9bf5a12
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/grout.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 7b0fbac4cf..eb20ee52e9 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -11,6 +11,8 @@ GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
 
 # Avoid using buildroot commit hash
 GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
+# Link grout statically against DPDK for better performance
+GROUT_CONF_OPTS = -Ddpdk_static=true
 
 GROUT_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
