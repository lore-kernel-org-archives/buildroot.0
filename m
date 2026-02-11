Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396E9ECD6D7
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 18:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E6E8409F;
	Wed, 11 Feb 2026 18:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tagfT44QXCSL; Wed, 11 Feb 2026 18:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A27FC8402E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770834658;
	bh=/LXsBcZtuBuPr/spsHRMw3VTG2t6zaa/y3iNin0aGEw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=llrE346AMw275ujUTjPfPxlVRHETlavgROIQJNPjvpwOsmevhX7sqegauaVNFJh59
	 HZoSSEY40Bvf3NDx39jjTr95hMQ96k0szuSsUoaYVmbpqvgVTOdT/EAZ95DjXq5d2E
	 oIqxP7zCedj3q3X3nCdMLnnVEEavA+kgdLv6MAuOUTTDfcNCHTp9XD0OCuv9mIx+kL
	 JrwiL1/m7s2vJCwr78PDIkFBRXk2iYomVvRWCAI87bjF8Yj6OSho1OUptjqBCDhVg7
	 9G2gIwfAN0wT2pg4VJB0GK+qVB+yyU64jG6l/pJ076r1qpZsRd54xjtqj1h/5CFHUo
	 Fn7TyFseI/rHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27FC8402E;
	Wed, 11 Feb 2026 18:30:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 809331F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D22461125
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVPrZ1IWM7nN for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 18:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85FC561115
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FC561115
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85FC561115
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:30:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 98A9A19F5AF;
 Wed, 11 Feb 2026 19:30:51 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 11 Feb 2026 19:30:47 +0100
Message-ID: <20260211183047.216472-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770834653;
 bh=l7laK+CNmYFkumvrMyTL9YSxhhz3bxUF04fQuYY3olw=;
 h=From:To:Cc:Subject:Date:From;
 b=b5LASumAt6lSWZO4jMpFSfIFWtTran3u/Bf5JHc5wXgIJaiqfADGN3tYJ0ASOliQT
 ooa5nt9/AYzIG5+PWt11XlofIwb2/HQZOxnhi4pldU+xX2z9Xqu+XYd+/BM939EMS8
 JPm+PUx76fEbWvt8/QepOKSpkas5+8hk7SLXXbp2fTQsNFED9n8DTCsfQkjtQM4raO
 BAwyJQrfMRk3oneihI4xhLnMwqiG7XgPEXeBxuO5YpGaBDd3nbDRawaF0KlFG+pKko
 04V2eik9ZQvjBBG2JzHWgb6SPZN0lKa1KllKvlFpF1yYmbPRttaKSjC2SOxzGgkHOk
 qFQUu3mBxTybQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b5LASumA
Subject: [Buildroot] [PATCH 1/1] docs/website/{download,
 news}.html: fix date and url typos
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

The Buildroot commit [1] introduced two small typos, while doing the
updates to announce new releases.

The version 2025.02.10 release date is 2026-01-20 (and not 2022).
See the original announce [2].

The 2025.02.10 archive link in news.html has also a missing dot.

This commit fixes those typo in order to fix the website.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/21dda0665e5de8ddb2a09f199679b2c4be1384fc
[2] https://lore.kernel.org/buildroot/9b9654f8-6cdd-4108-b932-79509e455148@rnout.be/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/download.html | 2 +-
 docs/website/news.html     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 9078194355..6221cfe871 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -79,7 +79,7 @@
               Changelog
             </a>
           </td>
-          <td>2022-01-20</td>
+          <td>2026-01-20</td>
           <td>
             <a href="/downloads/buildroot-2025.02.10.tar.gz">
               <img src="images/zip.png" width="24" alt="">
diff --git a/docs/website/news.html b/docs/website/news.html
index 38599d66ef..00bb718940 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -42,7 +42,7 @@
 	  file for more details, read the
 	  <a href="https://lore.kernel.org/buildroot/9b9654f8-6cdd-4108-b932-79509e455148@rnout.be/T/#u">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2025.02.10tar.xz">2025.02.10 release</a>.</p>
+	  <a href="/downloads/buildroot-2025.02.10.tar.xz">2025.02.10 release</a>.</p>
       </div>
     </div>
   </li>
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
