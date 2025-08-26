Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DD8CA0FE9
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D25540740;
	Tue, 26 Aug 2025 19:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx2CzeLlJZgz; Tue, 26 Aug 2025 19:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E25406EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E25406EB;
	Tue, 26 Aug 2025 19:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3406EB8C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 19:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25C6640156
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 19:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKKB34xVM5vE for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 19:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4914400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4914400A0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4914400A0
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 19:59:24 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BC9D560128;
 Tue, 26 Aug 2025 21:59:18 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@smile.fr>
Date: Tue, 26 Aug 2025 21:59:10 +0200
Message-ID: <20250826195910.18480-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756238361;
 bh=+b1ZgScQiNFV+I6+ny2xj7qFweOyMW25H3cKC1nOiTU=;
 h=From:To:Cc:Subject:Date:From;
 b=jpZeXKx5z2fV5BixNxCVlIf1SQUIPbi+PAVmweCvpBoU8rXR2/nhohXK9LF1/IpwM
 CIA47UUYQcPYt7JkqTzgJ4S7bSuY2Et76xY5mM3ULPPs3CJrGobE5dzwVMrnduYxOb
 toU20xrbBVMl5VccRQ83MAD/QZvT+C4J5gvj7FnVdw1NfAHCf4Y2Qu+UwowzY3Xwf4
 7y1rInHyvWvf0b73p+vEdLHYBOZTuKcvOq0+F3jZyEu9vq4ugG1MGMvv0kA4A1o8Er
 uLqag+PsAqKar7oF0/TkLgRN9SBWTCcTppNQPep1+u2Yz+mdQR/4bMwtRGB0T6460n
 YhxB1sgdYHUXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jpZeXKx5
Subject: [Buildroot] [PATCH v2 1/1] support/misc/gitlab-ci.yml.in: check
 legal-info in run_make
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
"utils/test-pkg" script by adding legal-info in the run_make command
targets. Doing so checks legal-info in test-pkg cases, but also in
defconfigs (this was suggested by Arnout in [4]).

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/utils/test-pkg#L195
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/misc/gitlab-ci.yml.in#L129
[3] https://lore.kernel.org/buildroot/75e688887d95948c57a11416de3047b5@free.fr/
[4] https://lore.kernel.org/buildroot/614bec7e-0723-4bbd-8c3a-c801e91c29c3@rnout.be/T/#mcc803eeb38d09c1cc02b1333720845c54af86534

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- moved "legal-info" check from .test_pkg to run_make (Arnout)

v1: https://patchwork.ozlabs.org/project/buildroot/patch/20250823105456.28057-1-ju.o@free.fr/

Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/2005028829
---
 support/misc/gitlab-ci.yml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index db206432aa..ada36d0d60 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -45,7 +45,7 @@ before_script:
 
 .run_make: &run_make
     |
-      make O=${OUTPUT_DIR} > >(tee build.log |grep '>>>') 2>&1 || {
+      make O=${OUTPUT_DIR} world legal-info > >(tee build.log |grep '>>>') 2>&1 || {
           echo 'Failed build last output'
           tail -200 build.log
           exit 1
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
