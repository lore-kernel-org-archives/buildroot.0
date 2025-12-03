Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B414DD1BDD3
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D76E41B68;
	Wed,  3 Dec 2025 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEq0dY1hkK3v; Wed,  3 Dec 2025 19:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DC9341A2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764789261;
	bh=7CtvHrdbgk9B8ALHf1ygvCsmqhBgHJuDLceWEUwdkQc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UmpIu7CKxqsfZz8dQ8VPMPGQrQvNC0J9btDpZ9lqdG6neaufzZyxQwaDiOJDpleGo
	 gYlFGGYzgAmYrRl0JmeMWRXIOClww13gEOVGdIqUukfXYZ5c7rNfkQyNoFSLGdklHc
	 SqBfKoc5+IzCrD7WfB9zpFvqvu3RRQHTQ0v+HuFytP82oAG1CyWYANcoaPpM0HOi7v
	 xQxLqSTWm1QnWECbIk9lmgdCLgZHiR/QgaOdXU2UKEYR1t9oP3Xoyukv0mrSDqhSji
	 AxRbZ8Nq7neGues+prk4D919ZzFkXBe7XTObml+cRS2WhXrymPTZVIEStME+y0QZeS
	 4XmE41skJsA1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC9341A2B;
	Wed,  3 Dec 2025 19:14:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60A53E4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A8038118F
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whLFCy1-Ivl9 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 19:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C355480C81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C355480C81
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C355480C81
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:14:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1310546689; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Dec 2025 19:14:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vQsIk-0000000HBnU-2NjW;
 Wed, 03 Dec 2025 20:14:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 20:14:08 +0100
Message-ID: <20251203191409.4096911-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=eFjXB8qoEdYkivnF81BYQYusoTVZingEA7OytihS7szLwOW9ZVqikGZ6oQH8iC7MRDqTlhjrcbBama88xg4lA7ksozjEd7f10uzfSF5Fyyoi15hZ8sl+1EmCG59bfNKjyLKeymxjF/8PbapMDRciK8k1t7J9c8r2MnKWVvE5aJoRwmr3vYhi9Eetu90QZ7oBvsBKgDQ2CbP67wdQE1CmX8w3h4xPQO51zvLa5iOkEyBB40QLnmYsOphDyBj4ifhOfGQdBECSp5/FP6lqhMz/9jwJs82FXXH+O7840DAZk8Zk/+GwD+v4B24ttGf4isDCx1a2Bh+tYTPxLiEnXXR7sw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=maKKYG0G0qiEvjsSoMlssPmFy0rgh/P1bB09wDOV0mo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=eFjXB8qo
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: use an unique HTTP
 user-agent
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
Cc: Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As requested by the gnu.org admins:

"
Since August 2024, we've been under DDoS attacks from common command line
tools.

To fix this, we would need to change the user-agent from "Python/3.11
aiohttp/3.8.4" to "buildroot.org pkg-stats" instead.
"

It indeed probably makes sense to use an unique user-agent string, so rework
the script to do that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c659acb80e..7d9170e30f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -42,6 +42,8 @@ RM_API_STATUS_FOUND_BY_DISTRO = 2
 RM_API_STATUS_FOUND_BY_PATTERN = 3
 RM_API_STATUS_NOT_FOUND = 4
 
+HTTP_HEADERS = {'User-Agent': 'buildroot.org pkg-stats'}
+
 
 class Defconfig:
     def __init__(self, name, path):
@@ -469,7 +471,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
-        async with session.head(pkg.url) as resp:
+        async with session.head(pkg.url, headers=HTTP_HEADERS) as resp:
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
@@ -526,7 +528,7 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
 async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
     url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
     try:
-        async with session.get(url) as resp:
+        async with session.get(url, headers=HTTP_HEADERS) as resp:
             if resp.status != 200:
                 return False
 
@@ -553,7 +555,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
 async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
     url = "https://release-monitoring.org/api/projects/?pattern=%s" % pkg.name
     try:
-        async with session.get(url) as resp:
+        async with session.get(url, headers=HTTP_HEADERS) as resp:
             if resp.status != 200:
                 return False
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
