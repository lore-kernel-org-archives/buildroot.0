Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74DDC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B0680DFD;
	Tue, 21 Jul 2026 09:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_plh4tYGXNj; Tue, 21 Jul 2026 09:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A198D80D32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784624772;
	bh=NyaaQ6AeJWj/Rr2FQKxgwyqYW/RxEHTDM12f+2mH8eU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bd7SbZmqB+bTRlaWLxXu8maXw3szYxT7zvyRUaxlJBcCSqX7SKfYhIalapB+jraj/
	 HGXsBmAklM06OmY/PPVTRBs4+OVkAl31FSIZl0c5TcfciXSRz1eo8V0sVR8lVnRMMD
	 8nRc7uOLm3wLf0qLeBjIL0lW4kzDecOPWMIb9srS7JvlH4VH9gsMvtWPYCT8WHdL3F
	 6mFBizDSlRGF7+FnQH4/RhHClDBArQhdf7KGaQa92zA7Wa7PwDyaNJoTirrHwRke9T
	 W3U3Mdhj7P8NJMw3cskMpaCVYgNWPbUZlopriHAQLOuTZnjXH7flE5msSgLkwNjsd6
	 7H6ovVX9eARDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A198D80D32;
	Tue, 21 Jul 2026 09:06:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AEFA109C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C2A1405CC
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-J9_ZUUfM7N for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:06:10 +0000 (UTC)
X-Greylist: delayed 913 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 21 Jul 2026 09:06:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7300F40435
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7300F40435
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.242;
 helo=send147.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send147.i.mail.ru (send147.i.mail.ru [89.221.237.242])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7300F40435
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:06:09 +0000 (UTC)
Received: from [10.113.42.149] (port=56284 helo=send197.i.mail.ru)
 by exim-fallback-7c89cdcb84-h4nwd with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1wm6Bh-00000000C1a-22NN
 for buildroot@buildroot.org; Tue, 21 Jul 2026 11:50:53 +0300
Received: by exim-smtp-77575cb4cb-cjf2j with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1wm6BU-000000008BT-0NLX; Tue, 21 Jul 2026 11:50:40 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 21 Jul 2026 11:50:38 +0300
Message-ID: <20260721085038.1157693-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9C2A6B03AB739174CEA3DADBADAAB58A75A055AC2D80DCDF700894C459B0CD1B998BB270691B2CF6CC7A4B249DE6549FDB36F2285596EE781BAE0B2616F9FA9D44DF7BC4678047644
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72CF0C6E1803AE708EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F88016AB904663428638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2A053661C8A07F4242E070BE324C7D3C4CFEFF25BE303A44EBB0A4F435E46E6718B35066C979671628AA50765F790063793270F7220657A0A389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0B882963B8E9439758941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B603D88DA7F5FEDC25CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE79E9721B410A3B6ED731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A518014F8EE0AD74355002B1117B3ED6962A679E208DF2F72A886DC9BC01168B20823CB91A9FED034534781492E4B8EEADABF80F987DAEDACBC79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659CDF099A1F7D55AFF419D386CD78498F177AF23E965B7797E4D26E1D73027D718E4CFE954DF477D21B8341EE9D5BE9A0A1FAEA3C56B7704863803ABC8B3F03B814DFFA27BFD6F2AB08CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEt1wnql82eKSN+iqSRFRanlg==
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE20BB0E8ED3E9BF802F66B9D3B0D0820790DC50F1EE2721D6590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4F59E3A2FC996838E9F1558C88480FFABBF34012245BAF265049FFFDB7839CE9E425DAA193FC560F4D14AE177F6F6318387134916F7F0264C5D7588800EF44D1AAE629EED70A6AC17
X-7FA49CB5: 0D63561A33F958A5A4A8F6AE96B835AC5002B1117B3ED696D798CAE860A7E75F286CA238A3D8E3D802ED4CEA229C1FA827C277FBC8AE2E8B0F068EB0F7B02D21
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZBwjlcyweVOj3VmZQh0A0eg==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=5QRZSD1k/688q2M/f2zQKFQ5BgmI0ICs/azNh7B6eP8=; t=1784624769; x=1784714769; 
 b=DOvbujc/1gx58xAglY6BqqrqG+X47yuCr9rSwjJBBqCTWV6ugZXiRsXUayH8ALQJgpdkUE3s6Ml
 Du0N1DtTnxFWGwagOFJ9x1pgYpguq2eUjFyuIDXLtB9ERWm6l/QcwwRz5eOT6TDu4mn6J+zcV/MCw
 398blgLsQTi2RdNLHxGhPQo4P0BBFGg2CAg9sgmb0/w9DrhmGfemX1F0rgAUBp8NlD778AthDiEEw
 T0AUG86kgIiOaxPr8Zeu4hunPCA/vtbFljyIGiH4FGj+jN/bfHvX7XJ/ePylu46rgfT5bYOsqfi0u
 9xf1rxXl4uxPaQIaeb/6uyXyK4AzQmludddg==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=5QRZSD1k/688q2M/f2zQKFQ5BgmI0ICs/azNh7B6eP8=; t=1784623853; x=1784713853; 
 b=u3nPQ7swtqNQGDDVNC5pOTRUnOY1hI9hd/NOsx0tzhLaUPJ5nm7EcYJ19yNshZhtrcrd40UvMgs
 tlJ2v3jd+FtSE4sMNl0LALwrZvRGd9zOyBZNj8nW1T7ZIUdntaiPM3GWdwFUBpDrZJAuC26+xgs7l
 HBQgqqm7fUBKJzzfReelWnQk2qI+PlkMCMxDvz4/EOjBEis8nUqCM5XUYGKJHBWD/EYASDzjkOYoo
 fza3oD3Hp/z6JirYvEw3pCkEa/VUtKbaIS81cBIRoVGkv3P8hMbCxSQ1rfoYcDa6mSsWmIpftj0if
 v3IZyI/sqQsT+eQ4TkyS89MnktR7ZmHHwibQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=DOvbujc/; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=u3nPQ7sw
Subject: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.8.2
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/protozero/protozero.hash | 2 +-
 package/protozero/protozero.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index 917746af35..e67771c3ea 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  6c7a896f1dc08435e8cd4f3780ff688cd0bfce6890599b755f6f3cb36398dc25  protozero-1.8.1.tar.gz
+sha256  68d1df951b4d8397355c8fc9ffed40d9c06282a877fe847403feac6edcee3ef1  protozero-1.8.2.tar.gz
 sha256  254c0e9f18d261bfc55ff277cf12e3c1ca25839d56af17fba65d142396021466  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index c5c4285955..66bc0dea0c 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.8.1
+PROTOZERO_VERSION = 1.8.2
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
