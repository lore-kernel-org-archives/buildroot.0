Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F243EC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 20:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75CBF6067D;
	Fri,  7 Aug 2026 20:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx-mbajUy0rc; Fri,  7 Aug 2026 20:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D5A0607EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786134328;
	bh=TnIcJQetaPu7YrNoCZf5PbbAr8sczQJp56kEe4XxH9c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RM1J9ViTcRdI7kIj3tHSc/SmvuyVQDgNlJbJXOXyAR+Xzk1/lOZfCXP/+7amLtxPO
	 pPzDVs8hHsKPEdVakNTD5n17Of+6IpMYZXu2EhJ4DCZmsy1MqRrspuLQZNFv11kQId
	 cUJMZJxaLbd41F6mU6dYGbCbDxLi1/dEZQBGV7ht+xj3ZRz7ELf/MJiB+fAfDj5Vm0
	 N21WrCMcQsfoNd3wvYeBfodxMscpbIawjqGShGn4KQ9vo/3g0LAYiJVUf/+7+WVqcg
	 KfiOchs4UbPNuaTh7ZjS+JJocYoCNDbgxaAdqDZ5mwixIjnaAh3QQA+gQVbDOAysPa
	 4wocTv6iRD5Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D5A0607EC;
	Fri,  7 Aug 2026 20:25:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68CD62F5
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E983812E4
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 20:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFNC1mkY8JT9 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 20:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96BAB812A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96BAB812A5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96BAB812A5
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 20:25:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulqN-1x9xqb0OtH-016nVR; Fri, 07
 Aug 2026 22:25:22 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Fri,  7 Aug 2026 22:24:57 +0200
Message-ID: <20260807202457.394955-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KqzgGIsjsEV8UheolMJRSIZ6JBKVxs5MvUI2xMeHO0OAFf3rp3N
 1FBMr9whBeZ/NYPL7nUeVtJ9EPs+NW+AV3n2GdbTf9+ViSZmOw/u0cpdT25tQ0wDS5GiBuB
 wZZJXmFvSk8imIAnoyaSlOGrDFqwq7njARwNEFA6+gsdC7nrg/HyNzqEP2+PqzdyZ6gcqTQ
 6/mKpKQIPoywsCQdpaM2A==
UI-OutboundReport: notjunk:1;M01:P0:6RLLmJsgui0=;RWyY1l3CUYUkQVrYKCbmpcnQ5HA
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786134322; x=1786739122; i=fiona.klute@gmx.de;
 bh=zdS2AJvFJJOf8+A4av7ZC6udoCQ1D/Z08VH15QF47g4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eK3OogH3aTyAl1MAqG02ApMi4uAcVNE2o1hrMwB9Kbk4mn3/J9JeSUoAk2rl7r18
 FPiqKZKcJaxO/LlsBmbt2P5vu8g6A8Q4AGWd0SqH5geyYYu4IXSNChRkMtZCeCCJh
 9WQHCIrepdqmbZtL3mbc9Au3NmmbNGnmfUnwVN2c3NSHyNgDgoNy4BfWFmROlm/dM
 tlzWAERaBitcRyotN/jK2QedwA7ZZYcAbTv/ZatFWlA2CPuQVNIhejPaG2T1GVNO9
 rVTTPsp0CgfTTQnEJYevyzM1K8shy5xuexFMSPrXP7hJVMAWphU5VEbTWwKVF99V+
 edmLmXK7dxLsofPFjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=eK3OogH3
Subject: [Buildroot] [PATCH 1/1] docs/manual/contribute.adoc: mention
 license file changes in commit message
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It has been good practice for a while to describe the kind of change
in the commit message of any patch that changes license file
hashes. This is important so any substantial changes don't go
unnoticed. However it wasn't explicitly stated in the manual, fix
that.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 docs/manual/contribute.adoc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index f22164991f..310fe80585 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -283,16 +283,18 @@ the commit message body.
 When you bump a package to a new version, you should also submit a
 separate patch for each package. Don't forget to update the +.hash+
 file, or add it if it doesn't exist yet. Also don't forget to check if
-the +_LICENSE+ and +_LICENSE_FILES+ are still valid. The summary line
-should be something like +<packagename>: bump to version <new
-version>+. If the new version only contains security updates compared
-to the existing one, the summary should be +<packagename>: security
-bump to version <new version>+ and the commit message body should show
-the CVE numbers that are fixed. If some package patches can be removed
-in the new version, it should be explained explicitly why they can be
-removed, preferably with the upstream commit ID. Also any other
-required changes should be explained explicitly, like configure
-options that no longer exist or are no longer needed.
+the +_LICENSE+ and +_LICENSE_FILES+ are still valid. If the hash of a
+license file changed, please include a note in the commit message
+about what changed, ideally with a link to the upstream commit. The
+summary line should be something like +<packagename>: bump to version
+<new version>+. If the new version only contains security updates
+compared to the existing one, the summary should be +<packagename>:
+security bump to version <new version>+ and the commit message body
+should show the CVE numbers that are fixed. If some package patches
+can be removed in the new version, it should be explained explicitly
+why they can be removed, preferably with the upstream commit ID. Also
+any other required changes should be explained explicitly, like
+configure options that no longer exist or are no longer needed.
 
 If you are interested in getting notified of build failures and of
 further changes in the packages you added or modified, please add
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
