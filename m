Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9140FC72C2
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 11:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A898483E4B;
	Sun, 22 Mar 2026 11:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKqHQDqhADbg; Sun, 22 Mar 2026 11:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2104840E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774178492;
	bh=0JMbPMA2IImS54sqUvv+8eHeDVe4E7NtzMYtSax8qk8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LopQB7WTsM33RMegc+0V6UuOlo4/FZYwhRbJSmLQCNk32QoshVZVtn6vY9cSqGRdC
	 93qV2JaXg5ed9AsDtxQ+0l/CBA5S+6BYd3lOMdL9vVt6+J/DbQLNQo4MhRn7bpbXMt
	 SZG5M7MUMnvI/KD6CUpOda6/sjiUEMZecFjjrb2OE07ujjkaAPR7hMwx3TNojokaC/
	 uCyg687lpX8sVFX7JkEbzq6H/zEKTVwRMwS85s4BDsL6EaK+8DaFxe8uAistiwe6zF
	 XJAUlj4dA3A7va4In/3stmKPgywSTym3HAvFO3/vc0X2QtLNA4IeLNiKZE6PvPdaN4
	 MkS66HJDg3EbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2104840E3;
	Sun, 22 Mar 2026 11:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C10D2CC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D9B660B0E
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8JVJ8riSt4Z for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 11:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 497EE60ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 497EE60ACE
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 497EE60ACE
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:21:27 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 4Gs0wNUjEwf0D4Gs0wjHgA; Sun, 22 Mar 2026 12:21:25 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 12:21:23 +0100
Message-ID: <20260322112123.3295134-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNlL3Tl5UJ229WHZ6WF6E/L1yiIbtmsP04omNhVhwZB9qPmKsNqvHAvFIgL9qqbQkMGsSwcjGigy20zo0tgttIOdOgsgX7nIMgfEMyN41clNl4pqpWfF
 dOBvCJlnbM/Q+tKiKYF9X/lqcAT05iJ4ttFkuYyJW54oqUYDiKu8j+0qCoWxn8q3TzHZuNUO4nRiiZkMDAK3LKDciFKZ8NOdONvcBU9EXwXtsLeJc52PHqx9
 o3k8+h05wXHEFse9gO6TXCgI4l0sEvRHZZHh6i7HiwxaCeb5vug857RCqYq2V28bNFlA7tk8ZE5rokXx5GE59w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774178485; bh=dMYH//pYdf9F/0o57jAx/tpP+J6aBQIMeBJCnYgEfLc=;
 h=From:To:Subject:Date:MIME-Version;
 b=QExUnjnWzGwyIRtX2EAc6oKeTG0L2twTaEIiS5AR6VUQNjrEX/cU6ohQhDFNVJrHe
 0z97lFNDxmDGw25ywWWAdEyKqdl59NbaV+DkDDenQrqKhI2oJ/3DfFIjdBjw55ZyHM
 FxabrBts5bpoVy6sefat6hs0KsChhnRKYRsA89tA8BxcnPlLTYfUjwKHlF4ZLCDRaR
 u9fuAMuzTrv0OYrxffYvJhnUZCrVHAajUZIZhrjaY3ncEvr8q4S3rTLfWduEAAn4zx
 RwgU4aI+yBEeFMJfcnXPuvUVmYa7oM3RCEBoNCl7ARoyt1xoKqPR9FILAtHpX9MM11
 WK2kPFw9lBPFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=QExUnjnW
Subject: [Buildroot] [PATCH v2] package/dash: bump to version 0.5.13.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=b308564a1ff6530f9fd3e7dd7b19aabae32ed375

Let's also drop useless comment in hash file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* drop useless comment as pointed by Baruch Siach
---
 package/dash/dash.hash | 8 +++-----
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 85f8f3bf82..aa41d10af6 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,7 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
-# After checking pgp signature
-# using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
-sha512  6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d  dash-0.5.13.1.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.2.tar.gz.sha512sum
+sha512  7e9a06409eec925fc83c81192cab420a76ec25821f0a4cec8db4a93b00e51d343438b8cfe56069b4d7fb185f529d1b5171a7603525de00a7852298425b2f433f  dash-0.5.13.2.tar.gz
 # Locally calculated
-sha256  d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370  dash-0.5.13.1.tar.gz
+sha256  e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe  dash-0.5.13.2.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 143972f01a..547fe8c9b0 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.1
+DASH_VERSION = 0.5.13.2
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
