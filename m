Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102ECE668AF
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 11:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA92F81779;
	Sat, 20 Dec 2025 11:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IyO5FjvjDEt; Sat, 20 Dec 2025 11:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD80481A27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766229465;
	bh=kgZXm6iYQdSvP09as59xv7fCudKu9XSyYFJSsnzNouY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qlXSg2cWudnAQN4dd4ldcCnfyVdN66u94m6Rnn0zZ04lxCxli2lHKv+17BdlvJ4hm
	 Cf5+lTZzne3N2mY7ESPjXzwVySPiYFJNr/Z7SJlMtbP6Sgmc6c2YcdQx0LgzWoeN/z
	 WQmXm8VzHbuEPBQv99LMzQWDWHmf5AHJwhKfcEpm6G7UB0t+M1uCUHFX8wqAUdj1Wl
	 Ou21GKDujBl8Djzp4wh3jpDSQ9IVOQimiuPBiZ8+V/+jxMwo1KY7WKkNK/HsmGS9kX
	 Ru3AHexQIrrGmxPTeh7ed59dq4rGpPcLdmgGoPbsOXWXESnagb5nfW80aQedNQ77RA
	 R/MfT9ryCb3sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD80481A27;
	Sat, 20 Dec 2025 11:17:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B82119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD1340937
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4u95F9ywAj6H for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 11:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=169.148.134.94;
 helo=sender2-pp-o94.zoho.in; envelope-from=preyas17@zohomail.in;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 762514092C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762514092C
Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 762514092C
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:17:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766229455; cv=none; d=zohomail.in; s=zohoarc; 
 b=ZyUNiNIva5AhVxXGUo0k6BOSUZQa9oLW8rLUE6G9pbuVkavFtkb0LybjCncwfOloNb8ASrBy1MyxL7LJThxSnVAWAWXIoVRCXriDJABmLw2Z04QzClHMjWzx8HRE38D4ujbTazULvaiZUPl6AnR5W4Mq863chiPJmSAFXu07sqA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1766229455;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=h9fCERFwfpNCbo+dfL5JHhH/HdZTCLH0CWzshy533CA=; 
 b=WeVSwNor1IXW7aQqIfVjv7vyRhZRjMb/IcRJmABVYWVWXYjXmzC8KYSkUdTU8sRFsPfXbqEbKJtmZDjY8KILGA2NaplEWX2wPtYXXKO7EzeXJPGLqpqvR2rF7hNWnvVaB/6SUJDCnv2LTZUmp+N114Uz1FqmrAUtNjLakZ9k62E=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=zohomail.in;
 spf=pass  smtp.mailfrom=preyas17@zohomail.in;
 dmarc=pass header.from=<preyas17@zohomail.in>
Received: by mx.zoho.in with SMTPS id 1766229453594930.3739213638781;
 Sat, 20 Dec 2025 16:47:33 +0530 (IST)
To: buildroot@buildroot.org
Cc: Preyas Sharma <preyas17@zohomail.in>
Date: Sat, 20 Dec 2025 11:17:07 +0000
Message-ID: <20251220111707.59273-1-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1766229455; 
 s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=h9fCERFwfpNCbo+dfL5JHhH/HdZTCLH0CWzshy533CA=;
 b=Dl4GdQGT+3jXjTylwEeV8QCjFrF4eJ7NOGIhpAP1Zw6YSUX4PJnR8s01XGRnfdBP
 8jT8dqhOFPio4bqr2LVYdlV9UevRxmEWPPP84VF8xTtWp6pPeKEnpwylwuDD4v5zeSz
 eIBPRRsH0qi5+zIrsRFxCvTXjSm/xJJAfx+y1UI0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.in
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.in header.i=preyas17@zohomail.in
 header.a=rsa-sha256 header.s=zoho header.b=Dl4GdQGT
Subject: [Buildroot] [PATCH] docs/website: switch HTTP links to HTTPS Update
 outdated insecure http links to https for buildroot.org, eLinux wiki,
 autobuild,
 and git-scm. Also fix downloads host from buildroot.net to
 buildroot.org.This reduces mixed-content issues and keeps references
 current.
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

---
 README                       | 2 +-
 docs/website/contribute.html | 8 ++++----
 docs/website/download.html   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

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
index 52c30d60d3..1b6b3d6110 100644
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
 	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
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
index d1d92c8e6b..46e5fde824 100644
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
+  you visit <a href="https://git-scm.org">the Git
 	website</a>.</p>
 
       <p>Once you've checked out a copy of the source tree, you can
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
