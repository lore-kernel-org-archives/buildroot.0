Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9D9D3B7F8
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 15:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EE840CA8;
	Tue,  9 Dec 2025 15:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8LBbK2TWH0p; Tue,  9 Dec 2025 15:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FD940C93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765295374;
	bh=G/WMWId/2nxQOnmHVMJPt6rE1bOdR2KTA5IQq2ZAvDQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K5Fz3OCgIXs+d0Nf8aZz6cq6UO0maL2UTP3649kseP35b0/he/tyiWykvwmI/7orF
	 kPEUYS7naNoOOT4v1ReV490Qrf3w/9t17myG90KH164e+W2a61ATZ6qB9Y2+wbDTaH
	 +EoplkVMxRzhoIWxoXhYZ7T7wFYxmDcY6VxInl8dFlODdh5oUs0EU53olwoafitE+V
	 elJLp4hsYMg3ogxGvX6MSDz+VpdzNTUerOX328HICs/jWUwQQCu8Ulp1co37Rn8h2i
	 xdJSccXOCLXALraVE29OkKVKmvu0w2mW3Z4LVEtNTyPZH6XzymQLYCn4MM96H8dO5p
	 kPo8RzcDFO4uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50FD940C93;
	Tue,  9 Dec 2025 15:49:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C5C151
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 15:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1F2E400D1
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 15:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIdQGUitDV-Q for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 15:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.117.158.92;
 helo=sender-pp-o92.zoho.in; envelope-from=preyas17@zohomail.in;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4905940082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4905940082
Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4905940082
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 15:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765295364; cv=none; d=zohomail.in; s=zohoarc; 
 b=Ji/ihDBR3zNW+CPZAY1yZtecko7KwPsDH3X/wLmktIJVh5DSlgTr5kQEbzrZ4ONG5UfvUcBwnzEqGwT+46AdlF1glOkvoUf/t8DopbuBk9ZOR+TKRb34QzRO/yp2yTtEobv1C9Gi6glZdtzW7zac1PPQRYKu1a1jBTaYjmNLsvw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1765295364;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=q1mD+QbWjDbQt+qGaQZB0MnRaBNilmUfLuHvbU9JTHI=; 
 b=Yjyvyoaz+sxzfVOLFosrHhHzR+LURhY32Ur/LQsqjUliOA47wdNNASxIkShW61G7bavXda9OKZiBDN7rryiSu0az0/FIqriGuy+00Lx0dX7zFdsaWbTyh1kC2q1wy2thsajLaZi3DdHQpiVdWYN3bTuEO6p2omg5Vyt2bshg78k=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=zohomail.in;
 spf=pass  smtp.mailfrom=preyas17@zohomail.in;
 dmarc=pass header.from=<preyas17@zohomail.in>
Received: by mx.zoho.in with SMTPS id 1765295362764140.23475727204243;
 Tue, 9 Dec 2025 21:19:22 +0530 (IST)
To: buildroot@buildroot.org
Cc: Preyas <preyas17@zohomail.in>
Date: Tue,  9 Dec 2025 15:48:34 +0000
Message-ID: <20251209154834.5946-2-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209154834.5946-1-preyas17@zohomail.in>
References: <20251209154834.5946-1-preyas17@zohomail.in>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1765295364; 
 s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=q1mD+QbWjDbQt+qGaQZB0MnRaBNilmUfLuHvbU9JTHI=;
 b=M+bGScE/TWZ63EvbUdfYrgDumcDEBL/dTlah1XZOTAAqbGZlC3tJ93qY8c1DtJgd
 SC137w2+QKgRufh+NxaXwAsPWRgmi+PSA0REBXyyES1vJrl/aDAdtM3XF5V4NNpTJrE
 20IeQcE06KrbQ6NKq3zK+05M8B69vNnTTL6vjUOI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.in
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.in header.i=preyas17@zohomail.in
 header.a=rsa-sha256 header.s=zoho header.b=M+bGScE/
Subject: [Buildroot] [PATCH 2/2] pigz: switch site to HTTPS
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
From: Preyas via buildroot <buildroot@buildroot.org>
Reply-To: Preyas <preyas17@zohomail.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Prefer HTTPS for source downloads. No functional change; hashes unchanged. Align comment in .hash.

Signed-off-by: Preyas <preyas17@zohomail.in>
---
 package/pigz/pigz.hash | 2 +-
 package/pigz/pigz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index d09930b62b..d63c5a5717 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,4 +1,4 @@
-# From http://zlib.net/pigz
+# From https://zlib.net/pigz
 sha256  eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0  pigz-2.8.tar.gz
 
 # Locally calculated
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index e3273c71c1..0708882a15 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PIGZ_VERSION = 2.8
-PIGZ_SITE = http://zlib.net/pigz
+PIGZ_SITE = https://zlib.net/pigz
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
