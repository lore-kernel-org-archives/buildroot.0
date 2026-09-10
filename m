Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78585C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A1E605CB;
	Thu, 10 Sep 2026 19:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5L5XYREmE-F2; Thu, 10 Sep 2026 19:21:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D56E607E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789068077;
	b=OPW2hvMNahMV/9yZYZmOn7SA+3JrLgAPuoDllu+mvJ0SBm8eI+53jMZ0etPeBDPWp7V/
	 v5WLAspc/Kg4EErvauMKnN02l6rXgZ5L/ttW0ruas/9KWi7Pz6HfUZNnHkqVvanDtV0nB
	 CSGVGTovTD5gqt+20qnmeUCNkG3GEgP9weacpNLwCafIWWlAfW4/jd4iPUzCTLdp++52o
	 amslHPso21I12iLPET5095RFhOLGHMLT9kuEKy557iWJZu64W7+YECwGkeUUMR1cjWv6C
	 6H90ETPiZkEVCDEe1bIDQoqqAiNNOkxRIVF6wwGM6TRy36c50n4IXstoLicRh/RCDCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789068077;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ONMPRnWvWt+0F6BREhMmXg6gcTb4ov59rzu2h3xEu7w=;
	b=AiR6CSASABf6iIrGffazomqEu1cBqB6g3QB+yZzvWlkK46DHjAHqK1i+bmyoSour1CM1
	 ZpzPmyFhz1ANpTp2OutgetughdZWQxQ4qZPBO9N1yspZB46Zrzcm643uny/BcvTk61h43
	 9fo4bYC2birl3HGHLKA5VNEpzEqt1kGmw9cbZIOo/IVjYQw6YlbBkXmu9jrhQCa8YGdWu
	 AdT/vpm6+70bQ7aUbCxHPnUaMPP7J7p3pphW8ekHycoIemf3g4Tinl5GCXarCXS2feHdh
	 WlMongOXXprwPu9ok/7vtib6UUHf5CeDz7yKvoWX8oEQ7ugSBb+z+RdcJMrQJxVBTyg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789068077;
	bh=ONMPRnWvWt+0F6BREhMmXg6gcTb4ov59rzu2h3xEu7w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kWRjhtJa1G0P25k2ljrhaxfDDZeyFmtvet5NJzbHK+5TZQaUDlsBeLc/as7bluP90
	 2/Y29CxaFT41xnwvYsRCZ201p9gYdhzX2aQxddePdLTBI9b2aWm1cBKxd4GCy8su/1
	 XRCMEeWz2iSdvojosBfQgAoEWiKdoBac5ZDmxeNmLeIJLS+ubth7tJ4LQ2Ft0yEQXq
	 VGHkjujmx9aedrOpb/yIXiuJegUb1pR46E3zE2/jQlv075GlCUn+a8Wit3URAyVV5x
	 hCfzyDxmaGQw8TkW32uDu4VDtnVY1wjO+wihjbOsRmTKLz3Ktz7nLCUPYPMQSv4UXO
	 Xtxtz4MoQG6yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D56E607E7;
	Thu, 10 Sep 2026 19:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B462769
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CE5F40647
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQosms7WcBeN for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:21:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7A54840637
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789068074;
 b=Z9nTE5+hB9J7MjgaKcwWIpzIzRUb2uN2vicwmJciWij1CUa7RprjktPpMhCgTLK9MtKy
 d23Q6H5LbAtVYwr2Dz+O8aPm/+IXNal9xCEQa86oY9aLV8QB5N6RCO5PIBdH3c6yjtxl9
 Z1ZRm3/ilklC/FHrgTXQ1B2x58uhYdk/+Dec4QwSRyPKg1G4HvxauI5SoJetxQsT6JE7c
 i3J+Y3wHsoEkwr3mah+2ewPxmPjIDTyO8k+OZnFmhrJ0Wot6io6ntqNGqnHvT13ypWLIt
 G0sR/Urtd8cWLZq2MDrEkqZAuxnRTF8whtoMj1YjjcQNU715yUKWJ0yO3HTM0BhHklw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789068074;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2vjyS7HPL6rks58LqS1vkGVs5qBCarswP0ucmiGrzzs=;
 b=WZ67X6an3WQVCtXeskMo01f9Ba/Bi0GlGZmdrrO8Y43RqhVPLd0EpgWfLvEMNp4y52ei
 UtIKoXUeTYuseyemWf9KnSyyfVFG+qZjLPylV/aDHhsKG7lCIv0uBU2N11iwmONgZ/3ja
 77ZLAZZZsTm1vzvGhiKwYE85nKKSIq+q7QGEgyeI+TZ+amiBoe4lmcYVwv4fQduXYymPy
 1L9ljNI4EKuSIOauDDGQtJg0WuMm0De8MogoAJ7bMugJs6vj9H1K1RfHhXGen0T2+W/Sm
 NqX6QCUNAq6QvVESCz/3V7rG7zNoaocShyCnewbmnn3GyAS8I3eq9D9UUX5LpHQuo1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A54840637
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:21:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5045937B6; Thu, 10 Sep 2026 19:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:20:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7458d2323aaacf504e0bf8316c8413446a41aa84
X-Git-Newrev: 3c4238b9f121301464ae23b265f5da2ccae283e6
X-Patchwork-Hint: ignore
Message-Id: <20260910192010.B5045937B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2025.02.18
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c4238b9f121301464ae23b265f5da2ccae283e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 8fb2277bfb..d3f010fe07 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,25 +75,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.17<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.17/CHANGES">
+            2025.02.18<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.18/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-08-23</td>
+          <td>2026-09-10</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.17.tar.gz">
+            <a href="/downloads/buildroot-2025.02.18.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.17.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.18.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.17.tar.xz">
+            <a href="/downloads/buildroot-2025.02.18.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.17.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.18.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 71f9a73dc2..928229c56a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.18 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 September 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.18 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.17 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.18/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2025.02.18-announce-1789067743@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.18.tar.xz">2025.02.18 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
