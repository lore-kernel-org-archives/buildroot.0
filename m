Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55988D277C1
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 15:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F9581EB1;
	Sat, 10 Jan 2026 15:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUx1FP0DJs37; Sat, 10 Jan 2026 15:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 497B781EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768060505;
	bh=Qs1C+DKWqfWf1a28uxQbmzgOGBBMJpZAtbxW2Bqmwco=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jAnawi0IY8E+ffgGUj9jgBBf5AW1eCuyYI5O8+ZapTBYutMzkXs7ppKJcknUUIDF8
	 8rrageQot6FgGjudjum0xEFMZcVUftM+WvagoUWeap26Y/YNM3rK6tGh7mouk9sH4r
	 HgaPZUhuZM6gVxYFCb/AugmTcVBx8e2qjag5urutOd7/w5s7YcqYRXIopl9cJAu25r
	 me1RTCYoF403kbFZwiomitijFO/cLimTNv/guZ7Oyl30DIFDl1xvnSjipg2h9KX1ti
	 I7k8suAUoDdNxCZ6fJackTduJZBajFwak/5lYhxuzMbCff42SG3AHz00OyK+fGUNMj
	 Flul5JZEAsHdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 497B781EBA;
	Sat, 10 Jan 2026 15:55:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5726C18D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 15:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DBB840248
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 15:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MddQzmOPDxyt for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 15:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.117.158.92;
 helo=sender-pp-o92.zoho.in; envelope-from=preyas17@zohomail.in;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B2844006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B2844006B
Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B2844006B
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 15:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768060494; cv=none; d=zohomail.in; s=zohoarc; 
 b=G1ZcwIpD6Ul0vA88SboxdPnqcIf8uRO7TIobxY4cdb+5JfAgESLDVepQHSsJPsO0dGxzZaUYd7C/J+TtHyAagFV6hQtZXxtp8TnQFILxviY6weVBxHXNOYKucsjlatnhTZHRleBiqVFQpFDxb3aZCIqYpG/PLEDXeeXXrQHMKRg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1768060494;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Egq4qxXS/INh3xFVSHBHdTD/D0HyJwyw1fdZrUwrdPw=; 
 b=Iy4OoWujPlCKDucE/zMR4DatoHGf1f5Fa7bp6XPG26OcYqPworATZwpUvYELVIOQpDP7Xfr1v9piaG63pNOEEW5nraE0RjBNo1zgc9OmAbUm6bzg/5kyjAzC+tQbXJEuAb4jfoJ/ACoNOZvj3oNrVwxFQECcMXYK93YyvrRO3yU=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=zohomail.in;
 spf=pass  smtp.mailfrom=preyas17@zohomail.in;
 dmarc=pass header.from=<preyas17@zohomail.in>
Received: by mx.zoho.in with SMTPS id 1768060493884254.82336662458886;
 Sat, 10 Jan 2026 21:24:53 +0530 (IST)
To: buildroot@buildroot.org
Cc: Preyas Sharma <preyas17@zohomail.in>
Date: Sat, 10 Jan 2026 15:54:52 +0000
Message-ID: <20260110155452.5532-1-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1768060494; 
 s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Egq4qxXS/INh3xFVSHBHdTD/D0HyJwyw1fdZrUwrdPw=;
 b=x2pyeU2vKyyOqNaJdqVJVR4AP6Von5yZ13uDe+8pS4k6sYjsJj4jIopfw0L5Z1Va
 +Eh+JGSus9H5AwqEe40GUgOKvemhP+z5IFB/UXKa7Ex1iu0mey0GDM6Htg3AoQ27LQK
 R6NLphYpsM1tylsJKTMVV1DnUrb9PBma8Ko6jjz4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.in
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.in header.i=preyas17@zohomail.in
 header.a=rsa-sha256 header.s=zoho header.b=x2pyeU2v
Subject: [Buildroot] [PATCH] docs: use https for documentation links
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

From: Preyas Sharma <preyas17@zohomail.in>

Switch a handful of documentation/website links from http to https.

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 README                       |  2 +-
 docs/website/contribute.html | 10 +++++-----
 docs/website/download.html   |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/README b/README
index 008e996f5f..143b476be6 100644
--- a/README
+++ b/README
@@ -3,7 +3,7 @@ Linux systems through cross-compilation.
 
 The documentation can be found in docs/manual. You can generate a text
 document with 'make manual-text' and read output/docs/manual/manual.text.
-Online documentation can be found at http://buildroot.org/docs.html
+Online documentation can be found at https://buildroot.org/docs.html
 
 To build and use the buildroot stuff, do the following:
 
diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 52c30d60d3..115b1fd8b8 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -14,22 +14,22 @@
       <ul>
 	<li>Reproducing, analyzing and fixing bugs from our
 	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a></li>
-	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
+	<li>Analyzing and fixing <a href="https://autobuild.buildroot.org/">
 	    autobuild failures</a></li>
 	<li>Reviewing and testing patches sent by other developers. See the
-	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
+	  <a href="https://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
 	  </a> or <a href="https://patchwork.ozlabs.org/project/buildroot/list/">
 	    patchwork</a>.</li>
 	<li>Working on items from the
-	  <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
-	<li><a href="http://buildroot.org/manual.html#submitting-patches">Submitting
+	  <a href="https://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
+	<li><a href="https://buildroot.org/manual.html#submitting-patches">Submitting
 	  your own patches</a> through the
 	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
 	</a></li>
       </ul>
 
       <p>For more details on these topics, check out the
-	<a href="http://buildroot.org/manual.html#_contributing_to_buildroot">
+	<a href="https://buildroot.org/manual.html#_contributing_to_buildroot">
 	  Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
 
       <p>If you need any support yourself, have a look at <a href="./support.html">
diff --git a/docs/website/download.html b/docs/website/download.html
index d1d92c8e6b..b2b4891464 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -98,7 +98,7 @@
       </table>
 
       This and earlier releases (and their PGP signatures) can always be downloaded from
-      <a href="/downloads/">http://buildroot.net/downloads/</a>.
+      <a href="/downloads/">https://buildroot.org/downloads/</a>.
     </div>
   </div>
 
@@ -123,7 +123,7 @@
       </div><br>
 
       <p>If you are not already familiar with using Git, we recommend
-	you visit <a href="http://git-scm.org">the Git
+	you visit <a href="https://git-scm.org">the Git
 	website</a>.</p>
 
       <p>Once you've checked out a copy of the source tree, you can
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
