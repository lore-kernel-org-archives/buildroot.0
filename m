Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9154FC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 21:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40CCC60628;
	Mon,  3 Feb 2025 21:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-398cg2K3r2; Mon,  3 Feb 2025 21:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D246071F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D246071F;
	Mon,  3 Feb 2025 21:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6900512F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 585F54069F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 21:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEc8TU9GRVnY for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 21:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AB3D40695
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB3D40695
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AB3D40695
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 21:51:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 28CE8441AA;
 Mon,  3 Feb 2025 21:51:58 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Feb 2025 22:51:51 +0100
Message-ID: <20250203215155.1175999-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203215155.1175999-1-thomas.petazzoni@bootlin.com>
References: <20250203215155.1175999-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhtefgudefieejtddvgeeugfegvdfghfeuveeugfffhfelffdutddutddtveehvdenucffohhmrghinhepuggvsghirghnrdhorhhgnecukfhppeduleegrdejkedrvdduuddrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleegrdejkedrvdduuddrvddvtddphhgvlhhopeifihhnughsuhhrfhdrfihifhhighhuvghsthdrlhhotggrlhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738619518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMwHsnFYH00TKg3WVN8t20cK7mIKsPg6LPO8mjQcBv4=;
 b=bFmirT3q9L3L4Ac7nZTo6oNdyvjTois6B8LBrIBrp883JlZaWKKIjJoBDbxsuFStk8FzqW
 OSNxicA92w8pcPJW8mT8+4bte35ZnVYHldebu+uS8eq2tTrhhHgIjkq1dAymbqgY8JV1nD
 dfKs9VG1qQXznEtp9RcVBzEFXej4h97XCU4m3TSRZluQAEo/z0Sv/4oWbyT6FVgwhDTV/+
 ivO3Sz6pAE++MItc6StC/GosIHc2K9k7dUTy5AYuAj8OI7THmE/flpvSUHwo9XtfBdDMIT
 3DcfTQ/vhLRTMnh8a/BlHIyYUyqNDJkEy9oz69lkMbZ1wbc+EFqPF7/vfKhSlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bFmirT3q
Subject: [Buildroot] [PATCH 1/2] package/glibc: drop bogus IGNORE_CVES
 entries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped from 2.39 to 2.40 in commit
74cb378aff231c4f4605d7f479b9ae1a7a4e1fb6 ("package/{glibc, localdef}:
bump to version 2.40"), the IGNORE_CVES entries should have been
dropped, as they were applicable to the 2.39 branch. Drop them now.

We did verify the pkg-stats output, and those CVEs don't show up as
affecting glibc even after this change, as expected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e026c18762..25e28c7cf6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -24,18 +24,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.39-31-g31da30f23cddd36db29d5b6a1c7619361b271fb4
-GLIBC_IGNORE_CVES += CVE-2024-2961
-
-# Fixed by glibc-2.39-35-g1263d583d2e28afb8be53f8d6922f0842036f35d
-GLIBC_IGNORE_CVES += CVE-2024-33599
-
-# Fixed by glibc-2.39-37-gc99f886de54446cd4447db6b44be93dabbdc2f8b
-GLIBC_IGNORE_CVES += CVE-2024-33600
-
-# Fixed by glibc-2.39-38-ga9a8d3eebb145779a18d90e3966009a1daa63cd
-GLIBC_IGNORE_CVES += CVE-2024-33601 CVE-2024-33602
-
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
