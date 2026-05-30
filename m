Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D289CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9486F5E4;
	Sat, 30 May 2026 20:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjCB_GZCfzKd; Sat, 30 May 2026 20:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0056F5D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173358;
	bh=rsrQaI+XQEP6iJdb+7g8dI3OvotVUqTShqlttXEKVeI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Yghhw3jxSb6DctCpO00+NDXpEdOmq7g5rGLlo8mxKiS2qpouxAy5rEnBCw8jWQIDo
	 CkSwk9lYSyiBymyt3vD86CX+OKqCJ74yUV8wZDniN4oH0mj2ABvv/jAyQrg1Bq/Vo4
	 QM0N9wMSBVam8vMLN2TsqfgUfeQmj0ul+9NN+xys/TrvbFore/P5oAW/viy184M5GD
	 LE1u2/87GGYSfwh5n47v9xAJHzB1mFF3TtGbqYWsFJp2pKNVEzT9ALA4M7XGU/qXmv
	 cL04trnh6gVFJS6PAIfCmFxk+3z8vnhRZdSlzJrpu7RSLJ1zf6ckEBCStIPWUBYbiU
	 BTy9DeBkdETdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0056F5D8;
	Sat, 30 May 2026 20:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70C5D12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 624976F5D7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dR_aWCWkv9cJ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:35:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FDF16F5CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FDF16F5CB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FDF16F5CB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 463FBB97C716; Sat, 30 May 2026 22:35:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sat, 30 May 2026 22:35:44 +0200
Message-ID: <20260530203544.1383862-1-arnout@rnout.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780173353; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ptCVbmzSBAUHxkQ9sX2cpCPhAfjERH/7ZHAzOwS9dJU=;
 b=Jpf0Za7OssFcCfFXqLcnmrsQb3z1mL7ZNCBZAdAfAAWSi65IXNvfisf9DN8Wq14SLbQWo4
 QjcK6ZKgB7wuzx5FjHxzy/cJAC3NpuE+dFeIHJIaSvvE/O01us+wPlw+ow+lNUS3oaABbx
 SQsaqlev6AE/uy18HPSo4vAXTFdG/d0j4akjWBiZdtPEAIqJIsox/SFsvcb5ydb9ch8GmB
 unCTvKNkgxcPjV6n5E+9+j5Om3z8VKRFl3jn89EyJ9teOlwTnPjX5ngxSzAIep6GDE5YPA
 7e61zMDYx2mQ0LTVNpAZAyLI81DfXXwUTPOs64LNBVEdFkBU0ZRFT2+O9kuacA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Jpf0Za7O
Subject: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml: use
 large runners for defconfigs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

defconfigs are very unlikely to successfully build on a small runner
because they build a kernel (and often a toolchain). They're also likely
to benefit a lot from the additional parallelism on larger runners.

For now, always build them on large runners. There may be some for which
even the large runners don't have sufficient disk space or memory, but
we'll solve that when it happens.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2a8c9be5f5..00ca826228 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -120,7 +120,7 @@ gen_tests() {
 
     if ${do_basics:-false}; then
         for tst in "${basics[@]}"; do
-            printf 'check-%s: { extends: .check-%s_base }\n' "${tst}" "${tst}"
+            printf 'check-%s: { extends: [ .check-%s_base, .runner-large ] }\n' "${tst}" "${tst}"
         done
     fi
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
