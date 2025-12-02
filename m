Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE696D116FE
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 20:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2FA261389;
	Tue,  2 Dec 2025 20:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbE1goZaPEwj; Tue,  2 Dec 2025 20:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15F26134C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764706933;
	bh=BcPTOnxIkG8+Dv8yDu4CITbz7vmd0jKnNZyJOz6etzk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=V+e/+QCUu5N1qFcOvHBoVwlICB33B69zK+P5ntcbK23on66P/NfDD7w6vk0A399tj
	 dVYrGTlKggH7ozJ8udJaaR/k83Y9PmUWKy5VAyPldiUvBd6AyzBkHkqn2dM1TTcc8u
	 tCsJEeskMamef7y9gS0BqSRqdBwywoqefnOrPPDYNUdx/R0POrnnjiumQdDFZfMcUa
	 2bIIemWqWL8Gil05ayTysuiHB5lG1w8HiyP95rp/V5tYducBkmrSc4XSR/rSQzECur
	 ApyOGJp4Il0EX2Zpa2J50gLmUDqDWQiVtPODXwKDdehZqkjK098UE9aUja3+Xw8Dj0
	 8aWnz+amAi4ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15F26134C;
	Tue,  2 Dec 2025 20:22:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5B27E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C24B83FB6
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9n74ywtoaC7 for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 20:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3356883FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3356883FB3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3356883FB3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:22:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 56729592;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 02 Dec 2025 20:22:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vQWsv-0000000GI2h-3FIU;
 Tue, 02 Dec 2025 21:22:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 21:21:58 +0100
Message-ID: <20251202202159.3882548-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Z8HKKRgFQHXqcuRRkhFIFAqVYN0fdZmuQmCgUZMq1H9QMcrbInynlt9OZ+GlKtkCw2SYuL6R+KzQLS8M1eIYVhA3BtjMYuOA2k5W3k3LV+QUAkxKfKo8pYXSCkeJHCdCyf+3B6ycihrbmAoYslLOL/EWVZFR4QtVO7HFc41Moe9VfDpwgPfiVbrt7zXuig8cgVFN4dJ9o71W34kUg3rAPU30A3McJ8u4oM0UKUT1gDC4XV/NZlFMzc8ZordShKp9GNjZnrbOXTufU+Z5Si6j+7y6PmxM+kNPf1EtfTwsRMWLEJh7j1lSe8nvyn1u7uzPPvzzRlfQsBqSXX2F6fRVYg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=mKLdzpZHWjOBXB4Fk8wc8StLXAyrHPo0IplByhxvXPg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Z8HKKRgF
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: check_url_status():
 use HEAD requests to limit server load
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
Cc: Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gnu.org admins have been blocking the IP address of machines running
pkg-stats as the GET requests for the (many) packages with gnu.org URLs are
seen as abusive.

The resource body is not used, so use a HTTP HEAD request instead of a GET
to limit server load and bandwidth use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cfea179458..c659acb80e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -469,7 +469,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
-        async with session.get(pkg.url) as resp:
+        async with session.head(pkg.url) as resp:
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
