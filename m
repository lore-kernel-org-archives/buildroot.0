Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9887CA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 09:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0CD74027F;
	Wed,  4 Sep 2024 09:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Apk3w28BxGcg; Wed,  4 Sep 2024 09:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763E040284
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763E040284;
	Wed,  4 Sep 2024 09:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4651BF577
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 09:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D11D607FC
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 09:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbHsuuESYV9f for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 09:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB29E606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB29E606C0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB29E606C0
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 09:54:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42bbd0a40faso43601675e9.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 02:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725443669; x=1726048469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7MLjey8NpWlvctzm2KTRpuvDSMGezDlHNykR4Gb/FE=;
 b=Z5KUK1i6+aCWkgZCmvuZ02MruA4QRMxMA2uUt/v2uQF5Dpm56RowYDxcxZxP5YCSvO
 Jmcn5ARQBSOxueKkbqHyI31Ke9l/fshUkPoaGpcj/9X8bHHvtJitVnIZwleMLUZeRLt8
 YmPpH5/Y28qRehIRAsircWppcgX+K5UW7iy9xxxjmgws5IHTTdLTLuF+cb3ynAvuanDP
 8GaAk18MMpt6p9NubP/O1q324eYauz+2I7oqTRcyPGt4m7AUHPKWvB7kAdoV+ih9O8f/
 Nh1GrcfeEexMI3Gp+zTAT8zKP86fa3tGxof+dDRUeJMRZioyZAlFkFu42RMQLK6R5V8a
 Ph6Q==
X-Gm-Message-State: AOJu0Ywl0Mg/P9osCNaYKLiCbJqeF09CsO4tp7oLpCh1lY52CgiQVrPG
 Tlnt9g7gHGwnqkQpZiph2k6HoR5kIJaYhdj+Mp9nknz2/JkYopX7yDHKww==
X-Google-Smtp-Source: AGHT+IEHe4VFLnJ9j3aOp803pmdmt/gbHUj2/IQaQlYcr0A1PBKF6ZCq8M4gUCVX3tHSH3Dhnd6s5g==
X-Received: by 2002:a05:600c:4687:b0:428:f79:1836 with SMTP id
 5b1f17b1804b1-42c8810318emr47334025e9.26.1725443669103; 
 Wed, 04 Sep 2024 02:54:29 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e33d83sm199635645e9.44.2024.09.04.02.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:54:28 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 11:54:28 +0200
Message-ID: <20240904095428.3616567-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725443669; x=1726048469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=p7MLjey8NpWlvctzm2KTRpuvDSMGezDlHNykR4Gb/FE=;
 b=GSlRuevC52w7qAP1UZzhuCQfore54ekJkiFB1gwTs1W3Gvdy/85GogJrAulgZsSC2V
 oFKRAsyNVZ9KSjqbF0sTLqiCp8BOmPmYzxMaNwg4lxL32K1cCaZlpByJvkMD8w5w/Pjt
 JKwH9HHEtIJfZ92Ww/8mGMWmNINLum91bwgqIg0iHTHm4OsIeSzB92esGzDwIdTNEL2R
 7PNZ/+VzNwY9pLjj5c4NLXqP7hD9JapKjq+RMgVxkCy9chbXpmguB6NQUbxQSqj4I3kv
 a0IzlynXiTRTb6a4nIK1q4zO5GBea6y9k9HJV7HseiEvM6pXipZiUim6+dDwd/DYG+n5
 yhAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GSlRuevC
Subject: [Buildroot] [PATCH] docs/manausl: use space-separated list for
 BR2_EXTERNAL
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <Brandon.Maier@collins.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Specifying a list of br2-external trees is poorly documented, and the
only example uses a colon to spearate the br2-external paths.

Adding the support for colon-separated list is the biggest mistake that
was made when introducing support for multiple br2-external. Indeed,
both space and colon can be used to separate entries in the list, and it
is also possible to mix the two. However, internally, the list is stored
as a sapce-separated list, and all the code will split on spaces.

So, using colons is odd.

Change the documentation to only mention using a space-separated list.

Of course, for backward compatibility, we keep the code as-is to accept
a colon-separated list, but we just do not advertise it.

Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reported-by: Brandon Maier <Brandon.Maier@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/customize-outside-br.adoc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 5e653f1603..081d302e42 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -58,10 +58,11 @@ We can switch to another br2-external tree at any time:
 buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
 ----
 
-We can also use multiple br2-external trees:
+We can also use multiple br2-external trees, by specifying a space-separated
+list of paths to use:
 
 ----
-buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
+buildroot/ $ make BR2_EXTERNAL="/path/to/foo /where/we/have/bar" menuconfig
 ----
 
 Or disable the usage of any br2-external tree:
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
