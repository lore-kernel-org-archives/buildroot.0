Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CD1EC01C8
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91A080B48;
	Mon, 23 Mar 2026 10:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHMk_5eYnBLc; Mon, 23 Mar 2026 10:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75EA5809EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774262501;
	bh=C0okWZF64fCHzw1OavgQJknycmTj+ESkiTK5TsaBuFI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dikyk3o/vo59mgDbAE2uP4qeISyP1dIFTSPyOt1NuW+AhsN+ww9CrzQt/gC0Lfd2j
	 N9Ot2Su5uZBU3b6lvMCLpbF8qUmFWNsAHbSqXLFGP6s4VXxkd8Rn/5+XG/AQOxijAL
	 tEnVq/7W/JNHBMkIm1LdPdPTXmnYjaKOGMrKTZ7z4VhrR75w9Q+IofCZJOeYsPlowI
	 OS2UBqsq7vRkOzHq0uTxu0CBeIGg8it5qh/3CIbWT8/vwC0nYGMAQZ+eVfABO9F6QJ
	 I4VqGNwdS2OLfJtW2LIO8KN9gRXv70mecG2R5ubXwtnjA6fYPIWJdYiLf+a4YxFy2d
	 KcZUrUmrg0jDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75EA5809EB;
	Mon, 23 Mar 2026 10:41:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BF031D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D67B40CFD
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HM2LpcMj9Eod for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 10:41:39 +0000 (UTC)
X-Greylist: delayed 415 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 23 Mar 2026 10:41:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA5FB40CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5FB40CEC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=51.210.94.139;
 helo=smtpout2.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
Received: from smtpout2.mo533.mail-out.ovh.net
 (smtpout2.mo533.mail-out.ovh.net [51.210.94.139])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA5FB40CEC
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:41:37 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net [79.137.60.37])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4ffTps3yxzz64sQ;
 Mon, 23 Mar 2026 10:26:13 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net. [127.0.0.1])
 by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Mon, 23 Mar 2026 10:26:13 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.118.150])
 by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4ffTps231cz1y0P;
 Mon, 23 Mar 2026 10:26:13 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.10])
 (Authenticated sender: mooz@blockos.org)
 by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id D4F5B7814DE;
 Mon, 23 Mar 2026 10:26:12 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Vincent Cruz <mooz@blockos.org>,
 Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 23 Mar 2026 11:24:59 +0100
Message-ID: <20260323102609.711228-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 1532631249080994663
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGk6SRYITzyWNt6IpIDry7AYvpCHNIQTY7DRmSXNDKqI40MgID5hRyIrgo0WmcEM6H15UKvOByzft9Y6/3UjtQsA2+36hw21FqZU2GExXVctuN60Z5YQLUdd9f6hK3KhaGXydopuC8Pe/G7EkuTxuoGdbrnTz3HbuZv0j1Du671OEOsFVjP00dwNFKk+eqjyZ7X5T0y7n9wIgvYWLPt6884bK/5TVD/nu9d1GLlq9ZUQgeqmmdv+nfkV+94OiWRuMQB/ILTH+dHRD5OBwwdy11V2CZMslC+RSoqpXDgkERjaPdHghkJoSxm+Pr7bQhh3VsHP7g7GuMB3pIEI1DyiRw4T67tA9zdEEppKhxTuP1E6sz932QUpcdRGSCw+1o/a5tBt2KuBM2mddtmyfE5i9rVqKR4TmtYu6756dxrf9AUMex8lphkGmAnheEOO26iQ/yqCuHxUFJky6pzIUWUtbYtR5fNmZxBbNQdmFBa5YnPOF25WfyrZ9GFxDv8ZXknXuLjbOmIgCQzZutcyEvgGgtCNd4NmS93pY6tJn/RL5I5aQctkBrGY/HVN8cMM6wjtdBKPHLib6cNPS68nqKmcXAt7ei3vShYwcR021cRXcrGdyVyVXA08uq58lotnevZhYe6tvF0eh7ju0y57UG6JRjy4eUqvjaCA7Nnw6Pd22Dhtg
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0062ae81871-4887-438c-9918-1099547752b9,
 B96BBED5B883732238E7412D88ABDF21B2506028) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to 4.5.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 1466c8d9a2..6d708135d5 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  472e6cfa77b6f80ff2cc176bc59f6cb2856df7e30e8f31afcbd1fc94ffd2f828  libwebsockets-4.4.1.tar.gz
+sha256  d08df7634da0a377a4e077400ed6b2d1d25cf0b239e89397cd39432c5eb437ac  libwebsockets-4.5.7.tar.gz
 sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 2d3395c5dd..3c7e778ccc 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.4.1
+LIBWEBSOCKETS_VERSION = 4.5.7
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
