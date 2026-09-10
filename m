Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCBAC79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1092F40B4F;
	Thu, 10 Sep 2026 19:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgBt9J2H4_wx; Thu, 10 Sep 2026 19:44:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D046640AD5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069489;
	b=nVvZD/4obdtY1cHSq+VuuZuIjuJyRynQhXfTua/GTzBf8ErCegbiWH3S+6uh75el3dOg
	 Nw1OXl2ZueV7ofjgPjyLyXxncyJOJNIbbLooBSJJNO4K8rbsCBbJnbIYcHZi+ScNZraPu
	 D+s78drbSq/xtatIKM9GgraRgdl79Rd9XxhS91fs0m9UElbzJVRb0fWJOqo36JYgyqldM
	 1g+5Un02lYSCFSU9pcOLgfROtn6DCC3xw/zUNYd/2+07EtV0JFnipVs2JAU9b7nRH92Ml
	 XoFerYfhcGH+5zXkhhuQRrT7BZGAsXyXahWUexKY4eqZfKCZHRyzVmBRL9yPUN9s6zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P95tM54wM7S8FFd7UyOz7p3vCH40Zf/5+0f5Uq/ATdQ=;
	b=Np3Qy55L+pBHjV/jA8oIPPv+zvjvTJsZ0vpwRavznQ45RYFB7xP5Z88x8I2hJY+bPyJd
	 LT4W6llKvj6Sl9iNO/uGdHlIeD9Q6gm/JSrzWShjLV40KXdoSJOlZkC/4JSBZ1GxyHys+
	 3E6PZZ24DXKmnFIMtQ92ZkiFuwNKAqeLohjKKNhVkU+piPjShXhs65yvPb00axGdxQ+qZ
	 GkhvgutYiuU++Qv9Cr52GKT58siqwcrzdOYv8tAdFItIz57SD/rXiglb8VpAL17+WPhrP
	 N5M5YEAZIb2iFhtxZLLgxLyR8Wu5GE1CXLXYYdSt4HMuYclR4VpOD0O4YzR1HbKGU4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069488;
	bh=P95tM54wM7S8FFd7UyOz7p3vCH40Zf/5+0f5Uq/ATdQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=emEtJKbaZZUbpv6oRCBdSGt9yb/amuF+30Puvmf0p0UkoP/rH2bEtEbh3YQx6GbqX
	 Y9FKRpmRpAV1cOcVx6k4S1mHN5w8fceaM4VlUtm5/16JfT8Lhg97wDFGNnuvguI1c5
	 5Z/18HY4nvsDNjYmtOp6157VobUw63xw67B1McOSfAEEDw+ejXosFCeIeDYVoiQQ7+
	 68XldI2PyR2J58GwKa+i1t//DCsMrs7mGQRfTP23HOK1MApdCFIrQ7ZihH7G9YqOI2
	 7S3/Ivpf8gKOK1PHAuOglje39DEdV+IHd2kMDQ+Iel04GRowfQcWSckv5VGCcwrEiV
	 PVbnR7vSPwoIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D046640AD5;
	Thu, 10 Sep 2026 19:44:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F504493
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213DE60BD6
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKKosq5Fhpnd for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:44:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6356360BB7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069486;
 b=gJqaePkGpiB3dt8Wk57T9l7K6hFjbj1F3qo4yo+EpKx/UQ2IYzT/JD73qTzwCbkvthbj
 Q1Sv4PtwyU8h9k343+9DUZvJqMibJ96+r/Ov7Gidk56W/kWUzv8VUpQ12qO9WMmEiEuZE
 1t4xYHGCXhjNhfmSidsJGYHfiNPtaE0OMfIufCG60URmkFrtVGLBw7Lffq41cpdbjvOZe
 9ijE7aZaxTVWAsb2Ng7PD9OygaODb14ubQoFacs+MCNCzBCKat2vnWSTuPTU2vAaRMkYU
 OHoeC8q4AE0NLreqhD95owv9A1i/dKQMR10fR8IdTfmR0dKyUzRAyFVEx6TYEtk0y7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069486;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FiHoAU+uzwvdI2+gJplbKlrYBFTq5FzmbjSi2U4ZTA4=;
 b=f8iU2i08Y+sIBAFT8i7zVo79pvbRBZKTINxvsQuehkZLSIW0hDxVx0lpbRUCtjICk9Cn
 pSwXoBmYqlr97+AqVFzOEkOA3xsBymurynbfP+vh8DCaaBuuOGLWb48p7Tw/WHa6wgL3P
 /fPFOw6PxNsE5wmW2VJrm3iBNtG4d/PYzuVqGyoB0hp9x+J4Ua+Gd7PoO9++hojpRY1JB
 lCDMxgybCzdIfsiOGX0e888BApLFCzTX+rnmaidjcstm/4lUzFcQaer5QKwgPLT98QgrT
 avbhCSlA0DWiFLDN7GxUppHGK9hyjMT/TYXIYp8rZ6jTrCYKE7iK4Dd+FpOjasHYXag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6356360BB7
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:44:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A18E995505; Thu, 10 Sep 2026 19:43:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:43:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b00ac4e34626eec9af5cf8f4f0a034103628d9bd
X-Git-Newrev: 3a22cd2d8433fbb6882228029f0e3bca9451530d
X-Patchwork-Hint: ignore
Message-Id: <20260910194340.A18E995505@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2026.05.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a22cd2d8433fbb6882228029f0e3bca9451530d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index aacb3f245f..d6f260bc77 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,25 +75,25 @@
           <th>2026.05.x</th>
           <td>September 2026</td>
           <td>
-            2026.05.2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.2/CHANGES">
+            2026.05.3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.3/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-08-29</td>
+          <td>2026-09-10</td>
           <td>
-            <a href="/downloads/buildroot-2026.05.2.tar.gz">
+            <a href="/downloads/buildroot-2026.05.3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.3.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05.2.tar.xz">
+            <a href="/downloads/buildroot-2026.05.3.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 928229c56a..b8f9e92852 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05.3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 September 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2026.05.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2026.05.2 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.3/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2026.05.3-announce-1789069201@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.05.3.tar.xz">2026.05.3 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
