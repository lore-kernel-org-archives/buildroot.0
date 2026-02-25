Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD7AFD45F1
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FBDC41950;
	Wed, 25 Feb 2026 20:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3dmGZTHkge7; Wed, 25 Feb 2026 20:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A30541D86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772051334;
	bh=tRMIIiyj2Ng3S4Tx8Ci5eG9kGBjqoC39d1wD/9Siw2c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sK/3RTd0PiE5RcUvzXsVWIjH8FNvXIHeAH/0M8d7RfvBpsh0+13qgaY/+ug25Un81
	 i6r5pAlVZADgbwJ5rbUO787tV501Q3lqd2RnA3FK57mjc6i9Pr4IwndfoDnbFbQcij
	 A1znxPWWsizRyyWSMRfTga6BEHFFigHySVE+gnbC+gxH9Mbw9ExdPBwiEOKzt1ONpA
	 nuX6KG0iUGHp97VayWsjqw3Y86SzwOBpypH83mjA5zHnp/mLykCeBDHnEivarz56H9
	 uCYaqxXg0yCp18wnYrFsHAe+ryhf4nF4L55MymgLGTuGvwybFV0YrohyaA4b4HxQdT
	 BJcMXnMhRlT9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A30541D86;
	Wed, 25 Feb 2026 20:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 175B724E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F170141950
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niqcZQnFwq3H for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:28:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C3684194F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C3684194F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C3684194F
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:28:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso2128165e9.1
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772051329; x=1772656129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Q/iqDrq8zzr/sAE+U5gRv+pWooH6JR2q88VyBQYMB4=;
 b=VARf5SNcBYIz4FlTwPGSgatKJZdbC6UnrooJpevyftHPMC8BKUNCesiEC3QE7Esq9/
 Xucni7nQgoGtJfiBwQ+lCBWrJRV5y+a6PGe77GTSqxlWDxn4dqEk88pb+HWjvl8bD1J3
 jYpgp2VFpxmR3G3EQbKcaYW/qiaZEXLArMJeD/mPTBmlhZlbUCcvIQDKGxgxAO891Rwh
 wBRawXHZSkPmd7W3adLH8UZAmAM5uJ+BIwuOjdNW36uuYdzxTGBJSO+9lRKKQcY6Tewr
 aGb2q0chpykaW8INHaa9psLB3zU73KHudX301bC1E2yoUBxE/F8IhsupmM0mwlqJlnHe
 Ub/Q==
X-Gm-Message-State: AOJu0YyngzAMNIetfXzSID4j6i0Ain13Uo7L+nORkoSQeTzEn9Svotxh
 PbYPA1kUVPb5WJMPr3kn9crK5XMwZj+lhnEKzsRL66fGSTj4eV9JbBNxSpZdKe6NQoB6V+3vyoi
 wVl30
X-Gm-Gg: ATEYQzwdQKRCF1Vcp2bTsMhCJujrp6DAXxlVvwY9geYHksr8D1wpkvyfzPZv5QPB64W
 owKNL5H5WcGHTKRr7NS2bVeRALFkAuhkLo+I3w7o2ZhVrdDnOuBnkT4h6U7RKYyBvDUQfEx/iGr
 CgRtdEEi3n5272Ti+pYj5KgewmnIKt5vibIi/oHbEJx/1mo6J95uUtIhb2BlPf7ugIngp+6936H
 t4jH2Dr3ojGZcwyfULR9wUgZISUcVEKE8y3nCZ9/nSQNt7PZE4oMNXIJFsmyS898McsAMK5QlL9
 SQGuD/JYAQvy5ECk0TZOwP5JHs2RIk+dcQ1K9XiGwmcxCMLOXQiGZa7bwgBDfXLQMWFYtDtHUO5
 eqig4Pj0qrZJOO2dNAiulAQXxc9vhJbTa8K4EBgzh6gE7OUs1zi+DiQBkeGNvU8Ks/ctUrTivrO
 0yMpCQTTyPLYA9utk=
X-Received: by 2002:a05:600c:4fc6:b0:480:4a90:1afe with SMTP id
 5b1f17b1804b1-483a963de54mr294403515e9.34.1772051328635; 
 Wed, 25 Feb 2026 12:28:48 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7030b9sm76543845e9.4.2026.02.25.12.28.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 12:28:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 21:28:47 +0100
Message-ID: <20260225202847.385468-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772051329; x=1772656129; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Q/iqDrq8zzr/sAE+U5gRv+pWooH6JR2q88VyBQYMB4=;
 b=BIPOP4oU8Q7zmuMAE1AqklpOzhBoZOv68CqWkyDUxFUSW4JSa9Epydq+OAsI4EEjr5
 G8ZjgFBYNz6Zg9OE2fc8351PB5Yrn4B0DmBUksnvGuxmL1RkqxgqNQ7OjlZBfD2vt3F5
 F2BSAZXV88ieKN7/dMEBVuo+226qnkcCPF/R8QSHsJ13OdRmlXxsJR07fcssvB31RXai
 P+N70A/Tt0gbu6K6bGpGaCX8PkxPmVS45c5A4x+cbPSAVokcgdwDSd9NIrFdQzMWq8BI
 y7MTlY0C45nGhkF1ge3weBFlPVBUnyBeq9LNd86q2nv7uoy6fCCAsmjP7GDFD8qr+yue
 mh2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BIPOP4oU
Subject: [Buildroot] [PATCH] package/patch: add patches for CVE-2018-6952 &
 CVE-2019-20633
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerabilities:

- CVE-2018-6952:
    A double free exists in the another_hunk function in pch.c in GNU
    patch through 2.7.6.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2018-6952
  - https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300

- CVE-2019-20633:
    GNU patch through 2.7.6 contains a free(p_line[p_end]) Double Free
    vulnerability in the function another_hunk in pch.c that can cause a
    denial of service via a crafted patch file. NOTE: this issue exists
    because of an incomplete fix for CVE-2018-6952.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2019-20633
  - https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-Fix-swapping-fake-lines-in-pch-swap.patch | 33 +++++++++++++++++++
 ...emory-access-in-context-format-diffs.patch | 30 +++++++++++++++++
 package/patch/patch.mk                        |  6 ++++
 3 files changed, 69 insertions(+)
 create mode 100644 package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
 create mode 100644 package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch

diff --git a/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch b/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
new file mode 100644
index 0000000000..6fd63dff53
--- /dev/null
+++ b/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
@@ -0,0 +1,33 @@
+From 9c986353e420ead6e706262bf204d6e03322c300 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 17 Aug 2018 13:35:40 +0200
+Subject: Fix swapping fake lines in pch_swap
+
+* src/pch.c (pch_swap): Fix swapping p_bfake and p_efake when there is a
+blank line in the middle of a context-diff hunk: that empty line stays
+in the middle of the hunk and isn't swapped.
+
+Fixes: https://savannah.gnu.org/bugs/index.php?53133
+CVE: CVE-2018-6952
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/pch.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index e92bc64..a500ad9 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2115,7 +2115,7 @@ pch_swap (void)
+     }
+     if (p_efake >= 0) {			/* fix non-freeable ptr range */
+ 	if (p_efake <= i)
+-	    n = p_end - i + 1;
++	    n = p_end - p_ptrn_lines;
+ 	else
+ 	    n = -i;
+ 	p_efake += n;
+-- 
+cgit v1.2.3
+
diff --git a/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch b/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
new file mode 100644
index 0000000000..5ffe3699ef
--- /dev/null
+++ b/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
@@ -0,0 +1,30 @@
+From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 15 Jul 2019 19:10:02 +0200
+Subject: Avoid invalid memory access in context format diffs
+
+* src/pch.c (another_hunk): Avoid invalid memory access in context format
+diffs.
+
+CVE: CVE-2019-20633
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/pch.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pch.c b/src/pch.c
+index a500ad9..cb54e03 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1327,6 +1327,7 @@ another_hunk (enum diff difftype, bool rev)
+ 		  ptrn_prefix_context = context;
+ 		ptrn_suffix_context = context;
+ 		if (repl_beginning
++		    || p_end <= 0
+ 		    || (p_end
+ 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
+ 		  {
+-- 
+cgit v1.2.3
+
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 6f83d2418c..9272449159 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -23,6 +23,12 @@ PATCH_IGNORE_CVES += CVE-2018-20969 CVE-2019-13638
 # 0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
 PATCH_IGNORE_CVES += CVE-2019-13636
 
+# 0006-Fix-swapping-fake-lines-in-pch-swap.patch
+PATCH_IGNORE_CVES += CVE-2018-6952
+
+# 0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
+PATCH_IGNORE_CVES += CVE-2019-20633
+
 ifeq ($(BR2_PACKAGE_ATTR),y)
 PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
