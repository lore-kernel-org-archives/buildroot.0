Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E4CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 09:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA85581150;
	Fri,  2 Oct 2026 09:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9W_3PYtiFK7t; Fri,  2 Oct 2026 09:15:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 06E778115D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790932508;
	b=CGjkZn4HLTHOCMbk4CB7KZGPqV79YHFrRUTH7XO7yds6FHhxa5veP8VZ/L1oyeKJ0mtF
	 bvUnLrfRwKqohGDhJzNMmpmBS0zewR93lKi83yaZtOnvDFmIWtJoo4Op2Hay8YnurK/Vc
	 5b0vzF5fuAxmYQcQT09Fbh7Bi5udPrA6eL2nC0TSR+skFp9s+WCiOU8ftDQRMnWR6AQBG
	 Y9Om9xzIMSKu5wIZ0F6HtJnTf7fyXMR+2sQApWgsx1lhHVp7mGa3yV0/SyAYkyozgEmjB
	 baROicxrSbuIoAhPjT0KLUcs3jRPQG12vhGUH3/hYBGwWikXmwqEbF8/rP5VKhHQKmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790932508;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LLRrMpRCvG1Qn3S3c7aL3/7eJhl5RqKCFNigGogIWKk=;
	b=pH9P000tNMdVWGw4eb4MawUpicz8JAzz09PgZZspSf3d2BNw42bHpHQRayfMGHLk1DAp
	 1gkeEihYjA5cPPRBegXGtg82di6+KCPdaTUuUbfEV5+orN7kb3VtPRk1IzzeG9rpH64KK
	 Y8g+Whd1yn5wzGiWS6a8lOZbUvtvvKOrBgqoQh0+BSWV+4ssQdR42W7Hc0zYcg43/cO5j
	 nrtfl4ZBCVixAiFT7nnFnsGY2Qo07pcnXWAJkKQsHhTINvSEjL5VndG6sMOE60iujma7h
	 9sPpMapTj8iwX72+ZgNcPcuIlomX3Gk0qiX29HIQh2wYQh3zuKWByM6bjYUMmgSx2CA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790932508;
	bh=LLRrMpRCvG1Qn3S3c7aL3/7eJhl5RqKCFNigGogIWKk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KdCQ89Z9XWRdTO/rCPjUNQt/bTp9AoS0LO6TD7dubx6scRkpPhur8npFELiFzrWxK
	 bycwOPmjs4ZZfYofk4eIJ3Qf2jFiyRjsmSeqbYvtcCajL3BvVCePMvY086p+irNUpJ
	 rtPK2NfEWN9rD2b8SBi43oYnhhvL5d2by4w8fvfL7oPNYn07HTgzztBHQihequtwRY
	 8VAnM+++QCJ0cCn1EdOF2um0NsLOjbtcIZTw+wtda7sKyiChrUX828lXD3ysxKJqmw
	 qqrZTTp9j7bVIdonN4mbuUAiD8ZCCsPi9SDf0Y+Fu1efTPmXdKIoJXD1hjmzp6MY61
	 AvzK0EVwRfGHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E778115D;
	Fri,  2 Oct 2026 09:15:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D94E74C2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF3D6400B3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Hm9IcTeLYtI for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 09:15:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D03A740382
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790932505;
 b=br6Rjopqh4mr+IZxZbzvh+W5iWi6tDuui1TRx3Da/6P3KlioERRZbjYiLWpDtb2hJ8FJ
 r6w/FdUy/b7h17swbimrMSI74bmJwNSlJWcI1vAuR39bx8SBNB/hmBoQzz1IIpJaPTQ32
 7kOHGuox5iNVRKK6VCgPkOisItl8+pWStsOCDjMB8sOZm9A9LcN35kcM3vNrJ8xONbjwM
 TKFfFMJxALrkzC6r7MW46QXvB6JxXT5pdz9dr7nDKfIVVfwGNwOEu4lNEABdvwVKJPxVT
 hWUiPwLvmYPdjRiSrN+t0R/dcXC5qKpyWNcQw0GdfTfZndGf0HmNdWJZptZh/wWp3Gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790932505;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=T9M6NeKsqWrhwRYADtJGr2cE4MPSZzv4O5nGCWcF4Fc=;
 b=T+vhBUpQnoD/U1UDkCzX04l28YKUJtaTWxHQJ68+j6MEvbwXe/5rsmI/i230sDgafHsv
 Bunkydoz4a1MWQL0zDJCLqX/j9kPpqhkuohN6X4S7Gh+8h6CGw3Jx3ycYzIsBDHPuCX6Y
 2ex+3OTifNPK5y2CsnlJaNfcia/Ab1ewSB3MpnkZFSqPXHNb5h/GojPL2x1945tgdOFF0
 4NK9xsXXkz8cueJ8gh5NXLyNAL+c1ApTSd8si22/TXI6CZagtL6yliraiApndGiSGbYjE
 xWgenc/PUUtA4qzI1f8Z8WL1O93qjolEBVNzK1yeTYpJEVdf9A2nWK3Y+pOe85m2asQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D03A740382
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9382C8854A; Fri,  2 Oct 2026 09:13:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 11:14:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fccf3a91eee92f084f1d453647c0bc7b4fc5c2f
X-Git-Newrev: d703573765eff4fb658fb660ce9ab029f5ef1e77
X-Patchwork-Hint: ignore
Message-Id: <20261002091351.9382C8854A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/common-usage.adoc: correct
 generate-cyclonedx invocation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d703573765eff4fb658fb660ce9ab029f5ef1e77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit e09bf9e9511 ("docs/manual: add information on CycloneDX")
unfortunately introduced a typo.  The make target is 'make show-info', not
just 'make show'.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 docs/manual/common-usage.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 631c2f7788..67c3e06567 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -214,7 +214,7 @@ Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
 analysis from the NVD database.
 
 ----
-make show | utils/generate-cyclonedx > sbom.cdx.json
+make show-info | utils/generate-cyclonedx > sbom.cdx.json
 cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
 ----
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
