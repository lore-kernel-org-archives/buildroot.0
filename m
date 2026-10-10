Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B67CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF70140955;
	Sat, 10 Oct 2026 15:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFKi8wWx78Xq; Sat, 10 Oct 2026 15:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D83A34095D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645547;
	b=N5V6smExQeknwlM5JOUpbGtQP7jNT8qmYS0b9vGN2OBnQ44F83HBoHpjwAhpo4muG1V5
	 Lrem0j5U2z2WYYQPTIOA++uiwm4FLN+aQZ7pQYj9b1LgUCiydtTHtoANu/ASj0oPsU5bB
	 0Q/EvYXdicBcRh6IE0H/5nhMrKgh0aVrTvFZIP4lkuUt0EmaUNLH1Gtqin3Sm7yF0lMfc
	 TJMd+DqrAACEj9lkNxPUtyQGNBDVtRkgxQUdBmrb2Ks4cUI3foNjOqRCbt3P/KjUu7vjJ
	 yNRITA/5OUVBRwF+Te3+wxD5C2YYLktRpy24X1QGHZ8OnxlKe0gOshKQYbGbpHHM6Cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DkQvPnn7lqzy0Q+Kasd96FJyIhOEoo+j18UjeUm2iFU=;
	b=GSHt1tk3YoEXS2phNNtDiGKQIPl8PNNp0CEeX+4lxx4U9P/GjIPxS33gjaYbHdDvYSI/
	 sAzNTyi1PLd5gA15EX58nUBvUUJ8twwwrpGXlE4+4wQhn+w/YR+wAdIhpjKEhFbcg3Mb1
	 L3iOdiMT4DSRHJ54Mtbb6rZolDPZe04iV0eK445MdpKt3cw7OZyMXhfJwPRYt8wNiyneW
	 R8fj5l1NZRY2k0aCUO+nf4muY4uHqhzzJnE5+wtLpMCVlZNH0VonL6koD4KIHcIbBjqpN
	 pGaAk+cIwLIROEI4JJfwlDVTSU99I0aa4kzhpt5rsB/yiW3nl/ZstnjtkIIWqq+Zq3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645546;
	bh=DkQvPnn7lqzy0Q+Kasd96FJyIhOEoo+j18UjeUm2iFU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BiK6hLUuTKFlbBNP//2O0h9++bN67hgt4aRCE1itm/5Sne9ZbpmZqUyTVA7STjW2G
	 QZzEoafm252SlEc9ZYv72p9sgSAaxK3CCVZJg4k/lqVBl/r2JRCUTFrLcKTOo8nE9G
	 +h3bzwglCimd4JMVnpEGbGYAjLbkmtEK4zIfXMLIRaFIpR/i5nK9qNDTSXPzpdn25j
	 ranHuc5Gw/oPSDlifS1124j0ky3LT6xISVK0nn79MqgRXJXlfGZmL5daRBRbaLt2wM
	 1FS6Ev/fJxpdALQl/eVbEIUy+mndJYc7SzcQVrehNTsuL3lXvkOXWd/BNfWQlqS66z
	 WemOLarfuWmew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D83A34095D;
	Sat, 10 Oct 2026 15:19:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD8E317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18AFB8111D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrHvV7V30tnn for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 193EF81158
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=BE5+g3uMV7YGVGAUagv5TcHhmKfzutv3q6Jhh0XLYsroHZ2qQ2rT+VblqKNcWokSqnWv
 wXrhxqavWsvMoZOKa9jFswgyiZ4zCq+Fx+FO45nZuq/AoRcuorCZKY/DrqJhYpy4dlkzB
 fOVcOepYhTqRPpVPqsMqIYA/lV+HnavwepQldqSXtiNyXXf9dMMSlzaq0UHg3yXYXpWlb
 9DbZ2UWLBGwSnYuBM9cCGGcdU2IprvChLcdALSEmc0Ktmth7LybboKH/rsyjA7hmGMMS0
 EKRO2OB/M9Bbvhu3104ixii17wNtlzV/Bg4LOM+w2NaQVxofMa34z+OIkTYvyDyvKQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kBm9Gl9mhT8ZEdSZgbx2AHI9+Vu2SDdIH6xK5VAaXwE=;
 b=Ru4eaJKgn2KVTVqzg2ZOBzlA4URfiE6b9Hmqu6hdHyUxbBGLrN9B5hTU2iaUVNrkYxol
 lWy3airEizyadDMdA/7CkQyCtdiOk9sWwJvSN3NNbu0+wOHUDbPOQXMXvRrQSxXRKYhGH
 g95Uw/Yp3zwa5ziIXB0yr/0BthYWX1Qg62te+c5wGBoRD+5M1MEHB8nKABw4xOWI/5bkC
 Evb1aVI7j82ozWRdkaVZhm+suAHs8SBaDhst+xyPTNToubLIM7oM5rluZE5UiQzohZ50t
 A1zG2trJhZQD1f7T+6Cle9exWU2dLOfBBKmm3vC5radnnAkGZfczpGKtt57/PvDUCHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 193EF81158
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA51B9223A; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef0f032677d8013db9782029026b63938a6eb275
X-Git-Newrev: 6d335ea39f8630b75c1563ea0a2e676616e25bdb
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.DA51B9223A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6svg: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d335ea39f8630b75c1563ea0a2e676616e25bdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:qt:qtsvg:6.11.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2021-45930

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6svg/qt6svg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index c8d5e8fd17..6fbb492a36 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -12,6 +12,9 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 QT6SVG_CMAKE_BACKEND = ninja
 
+QT6SVG_CPE_ID_VENDOR = qt
+QT6SVG_CPE_ID_PRODUCT = qtsvg
+
 QT6SVG_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
