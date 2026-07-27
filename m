Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D756DC531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 12:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 615C680DEC;
	Mon, 27 Jul 2026 12:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcrJbggFIdmp; Mon, 27 Jul 2026 12:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A2FF80DFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785156916;
	bh=8uTrragQC9WdO+fTmkrbXHVHHqDXBPnAgKOqN7v7rbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=nMelT8QZOMkGwL/ANOCTB9ilbTQgqh2UwIThoEOV9LmQl0wGMkiWiWhPMc+JQh/8h
	 EYihyBi6pZIRQpFlRChecChfwDjo84l/SK6xLzdgRMsXkRI76ncT8X8SFqt3dmE7iV
	 05MPMmyRRNBB4XCCzfSjMVqoBAsY7F3TJVEF948JWKKusnFvjhvXipOHBQYAlePSUa
	 p2Qd4Po4zgPENabJg234emRrRELbkOFwIT1j9TtdNdr5/GATcoxwl/aT7wf+Tz4hY9
	 tYY6g3wdU4m43DxAnv7kNxeruKr2/xX/yq14upCihyJBbCzSQr21DBWPcJ016hZWkM
	 mmNZXCxrwfKHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A2FF80DFC;
	Mon, 27 Jul 2026 12:55:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F081350
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7436640689
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYCpyVP5gcYo for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 12:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5900D4057B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5900D4057B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5900D4057B
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:55:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47f97d310caso1854812f8f.2
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 05:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785156911; x=1785761711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Nwjs7FbfrLorukxAZiEjquZvm9O5Sfpi994W1DgJs7U=;
 b=gPA2TIF7yVDFN4AdWTe44JQwR+OexPnC+6YEINiAunDvrRhX6uDueev4j88uuCSQQU
 j7AZLUbzYp9DUbFLBbTqtr4SubdaGidbSz3izCk1OCgozfkwL6N8bxu9Y388oOGJuM6C
 LnA50pZIXBOJA54NzJpd+4YGHt8hBgZMNuh9twPJ6jtZ5z5kst3M/W6iIGbipw+SBjYB
 ekeLSe/5OuMlCZVsIO1NR5l2GdSj5e6tDIOh4Q+Kv1oZU8bjSEY7EbRYgRaAre8kIDtR
 H1BwHM6MLzaW2uPf4qA6yb3maaUchg0iJOyMdZQP7u5TzmzZqKLEnmOXXZuTiKqL4Eka
 kcgw==
X-Gm-Message-State: AOJu0YxB1KwO4E2GzoCp+tCTLYQLyZJ10eLsQLaKXAnve/70J3UEjbK1
 44OEIIIj/0DqODAXyx65GJeKbkQ+THje+GPkowrgeSYEAm6xrVTNxkluK8PMSbjsPTpzwE8Y+8c
 1V6YN
X-Gm-Gg: AR+sD13VWlj+ynRv9Nt+l0k3OSln4c81jDK8/vVYWqaDNgevGE8i4VbPdiIhXiYDzZ2
 bTzBPz+5kwzZ9NeJiiRlFro483ExgPH2jMhqaw1OgqQqWrkgJFeAB704K2xXRBdBknqkuy6AnMP
 23H7d6+AxrfmC3lzAnUEck0oDhUpg058GeqLrJKnBD8GZSjuNzDpPxb9E8ZYcpQVN8jT84YfbRo
 IiF4/62+nWp0HE2WHMFuc3sZu92vHbyrAfG3+H9FcCdvo89lbP0zwHcdhGpnnZPd9M1pqTka+WO
 ecdcV0/QdrYmlQd6WtZ3ngz8LvKeo5un7CrlCXG9EEPPhvVdXpNc9KtQWRiCjJ+es8GW/YDTiMk
 EySHNgnz4gsSThFFEI+YcVG7j+sfw1I5Be6E2KYNY510te48TCaYlx4Uu8vi8nfmXflg60BkDO5
 gtUm4sO8aYJrL+JDTYCMxeijf8UTqbubw1XKejtVk=
X-Received: by 2002:a05:6000:2c07:b0:47f:48d4:3f0a with SMTP id
 ffacd0b85a97d-47f9fea71c3mr10312770f8f.45.1785156911045; 
 Mon, 27 Jul 2026 05:55:11 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c7880dsm49112101f8f.37.2026.07.27.05.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 05:55:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Jul 2026 14:55:10 +0200
Message-ID: <20260727125510.381611-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785156911; x=1785761711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Nwjs7FbfrLorukxAZiEjquZvm9O5Sfpi994W1DgJs7U=;
 b=F+5IQ2S06vkEghh+nQKk7/NTo7t7WxMrxtxKaCgy9XHOGt0mYobkiBzcDV4+2AFIUH
 +PbzHQfm3rwxvbtv3yVHJfxcG0Hoo7zENGIorh286UReuRqfw/+D2yNF2MaizhoKhT09
 fJ/1hUsmHtkXCztPG1LCBEP42zEh1I6na9gAZx6oxIlYteeW4shH54M0y/31zFRa+OhS
 8mgN8NnmD/sebHegVz3/EdnJ/2i14/LNPeSLUzBHoFpmECQceg5nKStq5YOwli5D0Lsi
 X7bmyIBfG7vkXCFA3xE+BHFFSNd8zETddokfG1oC2W/aOnIjEny2zChWovhKkrSYnfYC
 UCZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F+5IQ2S0
Subject: [Buildroot] [PATCH v2] docs/manual: update 'releases' to reflect
 LTS changes
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
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Fiona Klute <fiona.klute@gmx.de>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the release of 2025.02, LTS releases are now made every two years
with a 3-year support.

This reflect the table showed at https://lts.buildroot.org/#releases.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/release-engineering.adoc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/manual/release-engineering.adoc b/docs/manual/release-engineering.adoc
index 0cf38183f9..ca64bd18b3 100644
--- a/docs/manual/release-engineering.adoc
+++ b/docs/manual/release-engineering.adoc
@@ -5,19 +5,21 @@
 == Release Engineering
 === Releases
 
-The Buildroot project makes quarterly releases with monthly bugfix
-releases.  The first release of each year is a long term support
-release, LTS.
+The Buildroot project makes quarterly releases with monthly bugfix releases.
+Starting with 2025.02, the first release of every odd-numbered year is a long-term
+support (LTS) release supported for three years.
 
- - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
- - Bugfix releases: 2020.02.1, 2020.02.2, ...
- - LTS releases: 2020.02, 2021.02, ...
+ - LTS releases: 2025.02, 2027.02, 2029.02 ...
+ - Stable releases: 2025.05, 2025.08, 2025.11, 2026.02, ...
+ - Bugfix releases: 2025.02.1, 2025.02.2, ...
 
-Releases are supported until the first bugfix release of the next
-release, e.g., 2020.05.x is EOL when 2020.08.1 is released.
+LTS releases are supported for three years, with a one-year overlap with the
+next LTS release, e.g., 2025.02.x is EOL when 2028.02 is released.
 
-LTS releases are supported until the first bugfix release of the next
-LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.
+Stable releases are supported until the next release, e.g., 2025.05.x is EOL
+when 2025.08 is released.
+
+See the table at https://lts.buildroot.org/#releases[lts.buildroot.org].
 
 === Development
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
