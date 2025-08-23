Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33549CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 10:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D562061274;
	Sat, 23 Aug 2025 10:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 402oQi8NVQlL; Sat, 23 Aug 2025 10:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF9B61277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF9B61277;
	Sat, 23 Aug 2025 10:55:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF7BE4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 10:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 057D7413DF
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 10:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRE1GzLliviI for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 10:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C848541375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C848541375
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C848541375
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 10:55:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1234B60136;
 Sat, 23 Aug 2025 12:55:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@smile.fr>
Date: Sat, 23 Aug 2025 12:54:56 +0200
Message-ID: <20250823105456.28057-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755946511;
 bh=Q+kICG04dB4hK1kTo22S3gIi9YvF0w4cL/Jthj4/mg8=;
 h=From:To:Cc:Subject:Date:From;
 b=Eg2V+Sx3Ek1IvhaQTFAVGXE4OWdoDvrQC6qrTQ42ao+nSLrJO1mx0e/+pfJGjiLVu
 TKPotCpAoi0NsAqSF3CE9s6RVNBJbQHER6i9O+vfvZr3TKFt3O1j7CqFngj9uw1vTW
 kFYDHLpblGQ0wajT9O1vFI6OjKeXnKjV2GI97xtUej0r380rUdBuqSYPH1svQwGw09
 LdLzgELwK67oPVzzWQfs17bIbZ5pXmM1RuEofxM3ArbN9qGH0k+WFMdm8V6ccLl/6W
 CV1sPTfeVjJZMJCYONIR+71EVO4psLpcngADkkJVzpSa7lk9xg/jT823ENJsmLPJyj
 v8yy60wCATZNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Eg2V+Sx3
Subject: [Buildroot] [PATCH 1/1] support/misc/gitlab-ci.yml.in: check
 legal-info in test-pkg
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The script "utils/test-pkg" is systematically checking legal-info.
See [1]. This is useful to check all license hashes are up to date.

The Buildroot Gitlab CI integration has an identical testing
capability. It is faster because it can run all supported toolchain
test builds in parallel. See [2].

It was observed in [3] that the Gitlab CI test-pkg variant does not
check legal-info.

This commit align the Gitlab CI test-pkg behavior to the
"utils/test-pkg" script by adding a "make legal-info" command.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/utils/test-pkg#L195
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/misc/gitlab-ci.yml.in#L129
[3] https://lore.kernel.org/buildroot/75e688887d95948c57a11416de3047b5@free.fr/

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/misc/gitlab-ci.yml.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index db206432aa..2358f573c8 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -135,6 +135,7 @@ before_script:
         - make O=${OUTPUT_DIR} savedefconfig
         - echo 'Build buildroot'
         - *run_make
+        - make O=${OUTPUT_DIR} legal-info
     needs:
         - pipeline: $PARENT_PIPELINE_ID
           job: generate-gitlab-ci-yml
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
