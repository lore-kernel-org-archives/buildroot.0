Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A7CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0A6608CE;
	Sat, 10 Oct 2026 09:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iRjHuYMdASE; Sat, 10 Oct 2026 09:21:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BE3F6066F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624090;
	b=OLwgETtOKpN6h0Q0QeOH9Nz9L4uzfacqjSVYbdM0ns51P5NExL6tZzESu53dQyOoiBR+
	 PIMvxD8ZUVO0VA5xZKK7mDWo4K7mboz3NC8e3Hw+eN8bHwdjM+GgkIrcgZOirBioEf0BY
	 RqRmTYh5U3KPUUPxVzGsEcisn+HZumrc9U8ul+aXxD7Z3+1tV1fiDlLOKUSFUBTzSBlJy
	 W8ojBJYRvYiG1lrCsL3QXi9pWp2hwjcDLyFLTmO1sbP/orkAtqINMPgijCshJt8Xop7Qe
	 RGUXj0BvBI9LS6CVnPpH7z08YBESSET1IzgkUFtQYTPjnTOxmVxs7hsvY1HYrx4WEFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PDQNP/d4KBafAbBe2JNtSAC8dQ3v97vCEgOxscH9mmQ=;
	b=cCbW2clBbD1DN9oC+abWYCtFoFKU98LQGOCH0MO24W8lMcksgx5k//x0Wl1SGEQoZd5C
	 dZF9mNwm2M2c7StfHa8TfkaZ8uIoTVlvWqv7iJRKpgLvxy+UAO1GVgrxXBqZwOY//JpCP
	 piyUSFG/PMEKUIVte5oWk69S0nuh1UCLHFxwmZqjVcxUFBZXTdp/TnP5N836JUGJz/zJK
	 Ub49Xdr7nVlUN6JE4umtf6uPzCEaCyZ6EQakWCKmU0sbvhpP9iDfmDBCqn4BwxZ7o8bNx
	 2lC3u5r1pOwt70E/ID6FzgGfmduaRVRIMyVe3f8VpAATULjqJ49ivl/uZmQZhDk7hVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624090;
	bh=PDQNP/d4KBafAbBe2JNtSAC8dQ3v97vCEgOxscH9mmQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BpIV61cWaIg2iYzSylBRTzBPtE75Lm84Fb+xeuXPiRW8A/EnUTXqZY4c/5V5D0LQo
	 qj12VNZIq2YiKtLT6g5x3ywmyumb3itIo7Bpt6x+ZFYtkeDRVx6Y/u1SEFf/ilDKxl
	 GsoLC4RQcFChFAUKVq/YoyyhgeeiIRb4/R6s4ZxpqpIoK9VuApfCYekadX6yr8aGXk
	 ysWr4nFmwqaxb0pRyT5YnT0EMDHweyBDeerWkRhKreXkSsDuSo21iob6x76T3WmNu2
	 lDYraBDZPqJ4POlWLWJLeWAxGpz0BsEm8zdrVB6Ykxw4WKpXyV9C1ZACkjtbXKkB9E
	 EGhovu5wCF5wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE3F6066F;
	Sat, 10 Oct 2026 09:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D5E4A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A96D40949
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_tU4kJQr3cZ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A02B640942
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=I0qJoQe+hsgJAbXOAtNl0RW/5Wjfeq3RzeZw+kF4hLxol1XiwGUQ8Wus0N8cexQH0Mlo
 jo4//lC3v7rx9giWgsp0hMtQKjka5EIAJchCOT7qS/oTZP3Xk2PYiJ+pIQ2KXleNzBz5D
 3XSXEuuWZrXRUPyWkDgns68eIEN3k3ZVSCFHPgmIrPpYIjdDOhXIKFD3XYAIGfvySutkQ
 vx6277HnbD6378lMoCKls2In1wsigfnlHfJgalxu0NzzLxv66Pw0fI+bQtSFLSoWZcUET
 jevI2BY1sKlTWEtz7/9sghu3UVUTT69xNK146bT5noNudpcXEcvdLcFFXUPDaxQD2Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZxtXBGE7hHDhRFQ7aw+Lbfr/2/CO8zea2jaoaB6Tm5E=;
 b=ndQ8AWDFDkf7bD3P7Vik1R9Wx7cK3inkOoUhgi0YhKN9Ufm3X6K6Zo+jF5ZTfMT1AX8X
 Va8xLjWnfPY5OifWvAQ1GnfRP2umrzFa7UMMMZlSMtKeo9/QMmlBujQ6/A//hW8uL8LLz
 0hHA4UTOtGl589SShP7Fleb8e1UbWg152kyEYoxhgUvzFzkARQhFywMU0vkpwcWibg24Q
 agn5Sh/tlSqqwgBZvpZ4Wp7qCn0gg/Ue8RDrGRmJtV1jhEZyWLqC1pUiqgfiff9QQZWkU
 ZVv0LKKMk8X5jn42UgSfiFEXiETZrZBgjcfpQRwmzAPr5IUTmGjCnnsb2J97ZFhO+2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A02B640942
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A8CD8F0B8; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d27b7b94324c283d3eb3affb5c8598a28e599214
X-Git-Newrev: a6fb2719ec561c3e4b0f7f5a645e9909c4c49bb8
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.8A8CD8F0B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 docs/manual/common-usage.adoc: correct generate-cyclonedx invocation
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
Content-Type: multipart/mixed; boundary="===============1103896720790256653=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1103896720790256653==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6fb2719ec561c3e4b0f7f5a645e9909c4c49bb8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit e09bf9e9511 ("docs/manual: add information on CycloneDX")
unfortunately introduced a typo.  The make target is 'make show-info', not
just 'make show'.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit d703573765eff4fb658fb660ce9ab029f5ef1e77)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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
 

--===============1103896720790256653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1103896720790256653==--
