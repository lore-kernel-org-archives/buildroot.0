Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FFCF9D0CF
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D8A61CD4;
	Tue, 14 Apr 2026 13:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQ_ayxePpDEt; Tue, 14 Apr 2026 13:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF4661CE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776173028;
	bh=Rmg9gjzuwBUrToiR40HVeP4oLcok6n62VSElXUXI2JE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Pc6tvdQSN62onsAw40hqrDy/xmpYuJFR87CrNqNrPvp+bovH+Q8uwy88LDqlpvDTx
	 McJmOW8iQDYvYI5TQyxYOmagWNkAeEh9HMRQsTaFUlpFnEbqc59+zQBJsyRdVLy+gA
	 0oQgOMY1NjoNPp9yFymZSLrfCQkVX8Pe7VQ3snlOmESHFOx/WhCvwOg696ZfBOF26w
	 btKKJFncuUmW4ib5eDYtHLe9Ew2e/vkPvEnXZHzjLLgdcZ6SinyFJZxiq/6wmUPUBM
	 lt1jAZwbh50rRcPrQFW0mi8qDdMnKDtxsVVnNyrJIxcs/XTFjsAFUyrjO6z7r960it
	 4nJBui1R14CEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF4661CE1;
	Tue, 14 Apr 2026 13:23:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A5E4237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5121842A34
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7-vGQY-41jy for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 13:23:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A888042A33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A888042A33
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A888042A33
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:23:43 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5969F2C88C79;
 Tue, 14 Apr 2026 15:23:40 +0200 (CEST)
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>
Date: Tue, 14 Apr 2026 15:20:51 +0200
Message-ID: <20260414132055.3263118-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776173020; bh=U7gqm4Tsb6POmTs0xgd1yO+lJfdBNAMjYH20oKMDRf4=;
 h=From:To:Cc:Subject:Date;
 b=H2QSAoqc5k3obCWZCDYiULMvj5jttUlPA4dMY62tpdUXWSzhcpYI7tmRemzaP1iYr
 20gMUpaR2CqCbTjldDUWGv9hZkTfjbUoosylI0brtIqt/zfEJBx0v3o8CEXYo7J4Zb
 Eo2Zu66/zKZ0yeN03du21VDmerwttqzXhV7Z8n06b+R91/nclqL7jXxV9U6DWb8erY
 DDyhbapKrz+42RC1Dm/K0qxLz5oZyj//j713R8Xbf0O70JsU8qyZcjbsbLHxk0he89
 a9edZQQj/nmMtF1POtQdGFUk0+dl6+q+sF1OThLM+OKP96b1odpbN2kXcr++lcgf98
 VhE1PfwEUndtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=H2QSAoqc
Subject: [Buildroot] [PATCH 1/2] package/bat: remove no longer needed patch
 for gcc15 compat
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bat 0.26.0 already depends on a newer version of the onig_sys crate,
so the problem that patch is fixing was no already no longer present.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...ig-by-regex-fancy-in-minimal-applica.patch | 47 -------------------
 1 file changed, 47 deletions(-)
 delete mode 100644 package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch

diff --git a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
deleted file mode 100644
index de6a3fc70c..0000000000
--- a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9b6727df25e45222b3863dbe5f5bc58237b68ab9 Mon Sep 17 00:00:00 2001
-From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
-Date: Tue, 2 Sep 2025 14:02:11 +0200
-Subject: [PATCH] Replace regex-onig by regex-fancy in minimal-application
-
-The default "application" feature enables "minimal-application", which
-in turn pulls in the "regex-onig" feature of syntect. This brings in the
-onig crate (version 6.4.0) and its dependency onig_sys, which fail to
-build with GCC 15 due to C23 keyword conflicts.
-
-It is not possible to simply update the onig crate from bat itself,
-since its version is pinned indirectly by syntect. To avoid this
-dependency and fix the build, replace "regex-onig" with "regex-fancy" in
-"minimal-application". This makes bat use the pure-Rust fancy-regex
-engine instead of Oniguruma, removing the need for onig_sys and allowing
-the package to build with GCC 15.
-
-There is an an ongoing discussion about removing Oniguruma from bat
-since Oniguruma has been declared archived:
-
-see https://github.com/sharkdp/bat/issues/3285
-
-The Upstream project for now is refusing to use fancy-regex as default.
-
-Upstream: not submitted
-
-Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
----
- Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index 80d19321..93a07a1d 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -29,7 +29,7 @@ minimal-application = [
-     "clap",
-     "etcetera",
-     "paging",
--    "regex-onig",
-+    "regex-fancy",
-     "wild",
- ]
- git = ["git2"] # Support indicating git modifications
--- 
-2.43.0
-
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
