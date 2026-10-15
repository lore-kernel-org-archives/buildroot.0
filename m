Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54C8CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CAFD60EA7;
	Fri, 16 Oct 2026 13:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyCPftQWZvEM; Fri, 16 Oct 2026 13:11:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C864A6109E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156290;
	b=rTX94TaoLyx9cEQn7Gm4uKP2KkWNFOmNwuinYWIV1fgTD4yPCqQbIo2fYHKtXKRqNWP8
	 MeOxO3BB4bKvt+C1vMgMFH7O//uU+MaqMRrgR8g35r9p2wfdlvrQjemejs+8dsvSLTNLh
	 VSuClrdPWqJWkJjKQIPSN4pDCeeIjwiEoOV992wOem+EwbRax0ylm4vyB1RQ6zBjwPU/a
	 DJtQtZqgLyLgYhPXboIGkDpPAVDf7whJZ1LoucAo6u6fajXQ0gWIJQ03fFyqkbSeoPF4Z
	 yyO76HgjDKkPC5GCKkjkz4VPxRujQPN/B6IZZgu1//Zh6el6nn1KsSSiq6w6BHGwsPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=FJpbJ0jQnP/pilz1hc01n4Gsz6MZaM3DNyIsJEIqJBs=;
	b=n5IggdERd8Pf91oslbWz3uDzWA/Rl3+jBEhycPHEJ2GxCE4JlXKXPtKnPzo0QAcU84nI
	 1iu8YZQqdMGJyP9o+4EJeQX7tOgzvZv29M/ujARrUtfQh5BQ9u+0yPwoL2hgjPyl3wYoJ
	 56XQTYNvOo/VL+fhlW9mCzh8SNPl6dL1rLJWMTIzB7wyVlcxoXCRt9c2fpaA7+C7R+Fg0
	 Y6O+iHTuj0xGqwBK2GP7zrjzTQaFjEBxca0ug8QmHiA5MHN/UNg7eHdmnfDzPjsWIDGpW
	 r4pWnT9dNvsjss7Dj+jHvZRkJ5omHoZgksdyTMU7/2fRcPbDhCNTf6pN5rTKZDvLMMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156290;
	bh=FJpbJ0jQnP/pilz1hc01n4Gsz6MZaM3DNyIsJEIqJBs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kqOOTKnsw53fe+/C5WKXhiGA8vm7CYRdyzellDIH2OIyWeeu1Xc4c/LxkkwPr1aJR
	 OfgUC08TWusB18HCCZO5gMNDFIxkEokQHqSZKN/KPYUo+8cWvP1uQwNr0IFJluaKpq
	 zZW+zaKPmW2D+albqQ2vBMc+d4ZxUeUKmi1YVR3LIVNmooyQo6IzYTvQzhQ89eMUsv
	 wKQsYT2p0HWIgq1xTTPNSwClPqLLwbXG9QImiin33igj0k4Nu12Z9J8XRXnHkV2Pj3
	 a+pGDOIy+vYsM34b5DlGsYmIh8z24faNYBTcMpBBgSBJyhFRh/Dt36Qcq8aBq5FYVQ
	 fAYXG4iVaqFRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C864A6109E;
	Fri, 16 Oct 2026 13:11:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 891BB920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AB374048F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlUUG9CcBqrB for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A2C0840042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=BHnNazVA0oT39oMlxUtvpG9fUxeyCT9uczI5/2VnzLz+lHQXREMHFSPNaeQht/erGJto
 0hHe1coqZWDPDTyXm08cGeV7Aft55c5xroVR7Zsh20W1yh9Nxx3jkOYXPthA+TXZRJoop
 B51uXNWEgg++n536XLwQ/Oj0xaA/q+sQreIWDqqGMewL3+YUXWXU1/82IFRoZR9ube0uS
 Qk5AA9KyMgEmDGYdekmDRIsF0FQnp85s00uaCcTecnorXpWQyHmMHDO7gfjiVlyyrMPro
 9N/yzqUlrk7arLqaPqsrEsuzBcyDoTEgi9SV0OhcbBOyaG3jdfCI7Aux52iDDqG2CiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=q79XgHORyI0IBZsskYFBJkHCEAHixNCKPlEl3UqZp/g=;
 b=KDUydSN4hQ1lIaFcBVZkoKnZA7z1dFQXknE8ijl4RYAdOz5gR1Evu+OxXnPaLC/Eupl0
 zExbfN/KHDSrgkHBlRgCezjjAIKBZyh56rE8opHZ1t2ugkw9Un1OlDwSuN+ZDL7PV3fFT
 zvbwwbxQmmC18aleJjQ+u7O5Q4JZ2nJbkqR4XV36vtSiG6msacqi4zZ1waeOaz8FCvcjK
 mX9YnVc4Cggsap3+DzIQ5bhXpm7Rv9CHhjyXZ1hiWdPPV9/E89IUUbsTpEOXd7HLK4gPo
 m6ZxW7nBBO7R3mlLeIUAT5tcPKWv5Uz1C2y79Q4JJ8SGQWeND7QwNwkbG8Di+bR0r9g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2C0840042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A05960DA; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:35:52 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 83eaa5f8b6f63d4e38ab4b0a584d5a93840b97a0
X-Git-Newrev: 30122f7a1295dde3d6780292095f6b6f2dad8984
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.92A05960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/seatd: add CPE
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5586422293960927753=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5586422293960927753==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30122f7a1295dde3d6780292095f6b6f2dad8984
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:seatd_project:seatd:0.9.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2021-41387

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 763dcabf6d09605da81515562162ce7c595e85fd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/seatd/seatd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 69be691cf6..c317d50016 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -10,6 +10,7 @@ SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
 SEATD_LICENSE_FILES = LICENSE
 SEATD_INSTALL_STAGING = YES
+SEATD_CPE_ID_VALID = YES
 
 SEATD_CONF_OPTS += \
 	-Dman-pages=disabled \

--===============5586422293960927753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5586422293960927753==--
