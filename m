Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BED4C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 14:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D1840016;
	Wed, 27 Mar 2024 14:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SW63T6yQ7iRZ; Wed, 27 Mar 2024 14:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAFC9403C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAFC9403C1;
	Wed, 27 Mar 2024 14:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBDCC1BF41D
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 14:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D570160672
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 14:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Teri05reaNA2 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 14:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=andreas.hilse@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D24B605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D24B605E0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D24B605E0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 14:01:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a4a39ab1a10so458219166b.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 07:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711548088; x=1712152888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/bqvFbmbZnD8nH5Y1IfXhQiNo1A44Zg7lkEMNcLAQyE=;
 b=E8Y5BT0kECaQ0+YeX0Z10YUIOmKbhJERhPyvqnbHys86bQR7cX7eH9gS5jgoDH/G0L
 tUOmBlhVdiGcjiujwna+wOBxn5etJxC+cnS9rk6ea0n3J9pFnv4TH295s3jdM/VZHtDL
 YaUCmndMwyg0kDTycDxgQcyTDsdNHzn6Mf3rQ/H8ceXuC0e52qHs4ZTjl9YkhBuLfmA7
 tP14q8pcyanoyGepzUfmeqhC+0R0/NspiytbIiaL9W7LZ5I3ilz+DZaoBXjywUE4qvkX
 ha1gt/kiOT4HtEe7i29im4lSrpm5H1Ysq4PrHUIMhD2Ko3Kt5vOKcLKYIvpL33r0uOJj
 YntQ==
X-Gm-Message-State: AOJu0Yx3sWnQWi1kvmgHikp+KwXjoQgDe8LMzQERy43ormD3UTMmc8KC
 QbZyftBruPiSpIhqBAAjd+1CdlhtwJ835jPK3R85vK6177I7qTZ7yWBfL/A2U9k=
X-Google-Smtp-Source: AGHT+IGPJ0ne9sfCUJB40NVj8eczssVl9MdZU6JMYd1TNBHd5B8X4GKdoIGLJ9SHIFezkTORwqd1Dw==
X-Received: by 2002:a17:906:614:b0:a47:3437:7fe7 with SMTP id
 s20-20020a170906061400b00a4734377fe7mr1801620ejb.56.1711548088215; 
 Wed, 27 Mar 2024 07:01:28 -0700 (PDT)
Received: from ubuntu.localdomain (p5b321c64.dip0.t-ipconnect.de.
 [91.50.28.100]) by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b00a473a28fa91sm5448756eje.0.2024.03.27.07.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 07:01:27 -0700 (PDT)
X-Google-Original-From: Andreas Hilse <andreas.hilse@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 15:01:25 +0100
Message-Id: <20240327140125.154985-1-andreas.hilse@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1711548088; x=1712152888; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/bqvFbmbZnD8nH5Y1IfXhQiNo1A44Zg7lkEMNcLAQyE=;
 b=j4prBH+99p9P0TfY/FWzHW+2f8/+RqAr7i0pwxlwSk2OsOtSdBVdOrGMrIK4PnZtzY
 Y/6kWTa+So5U5Qn1VIa0ZT7HN+4xFMIQgbeWESrgphZmD3ADNplH39HtsaPnqddMbSnA
 zzTnFv2R7VVrW+hKW343zc/l98bfMpvObjoRc/x9filxkZzQ5w8KQATAi2jnhvqLrh3R
 Ev/8A66aJvRi8FQqzS1yI1vdGUjWHlvZtXyEoRZ/0Ev+Xq2Ra29U9tU93uT5vof7mQBs
 Mg9Cn77bEfH5imCnMG68xOR7Y5pNdQOdvo+/aJfWZbU4yAKUO8nqdxEZjPx/9LSDulaB
 Hb9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j4prBH+9
Subject: [Buildroot] [PATCH] linux-pam: add patch for spurious password
 expires in 0 days warning
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
From: Andreas Hilse via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Hilse <andreas.hilse@googlemail.com>
Cc: Andreas Hilse <andreas.hilse@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot 2024.02 brings updated linux-pam 1.6.0 package which has a
regression, that warns users about their password expiring in 0 days
when logging in, even with password expiration not being active.
There is no newer version released yet.
Patch is working as intended, tested by me.

Patch taken from linux-pam PR: https://github.com/linux-pam/linux-pam/pull/744

Signed-off-by: Andreas Hilse <andreas.hilse@gmail.com>
---
 .../0002-do-not-warn-if-password-aging.patch  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/linux-pam/0002-do-not-warn-if-password-aging.patch

diff --git a/package/linux-pam/0002-do-not-warn-if-password-aging.patch b/package/linux-pam/0002-do-not-warn-if-password-aging.patch
new file mode 100644
index 0000000000..7df83bf058
--- /dev/null
+++ b/package/linux-pam/0002-do-not-warn-if-password-aging.patch
@@ -0,0 +1,27 @@
+From 470b5bdd8fd29d6b35e3a80f9a57bdd4b2438200 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Fri, 19 Jan 2024 10:09:00 +0100
+Subject: [PATCH] pam_unix: do not warn if password aging is disabled
+
+Later checks will print a warning if daysleft is 0. If password
+aging is disabled, leave daysleft at -1.
+
+Resolves: https://github.com/linux-pam/linux-pam/issues/743
+Fixes: 9ebc14085a3b ("pam_unix: allow disabled password aging")
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+---
+ modules/pam_unix/passverify.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/modules/pam_unix/passverify.c b/modules/pam_unix/passverify.c
+index 5c4f862e7..1bc98fa25 100644
+--- a/modules/pam_unix/passverify.c
++++ b/modules/pam_unix/passverify.c
+@@ -314,7 +314,6 @@ PAMH_ARG_DECL(int check_shadow_expiry,
+ 	}
+ 	if (spent->sp_lstchg < 0) {
+ 		D(("password aging disabled"));
+-		*daysleft = 0;
+ 		return PAM_SUCCESS;
+ 	}
+ 	if (curdays < spent->sp_lstchg) {
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
