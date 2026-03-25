Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAF1106B53C
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA9AB61361;
	Wed, 25 Mar 2026 13:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqK5_q6dQz0a; Wed, 25 Mar 2026 13:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27DBE61386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774445640;
	bh=lrLNVjwW4zLhm2xaDreZ428jtbm9X0N/flOnAQoFcEs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbwBSmHrud+3XkDQrzURqB5w5uAXK4TDBW+avkDxx3r6Gzl81sTjTFJlbSmKJFv4r
	 M8vBh+7lu86lmO4YA38bmmpJ2PNaRwi5DfmxQusNJ8ih6/5sU2BNhVxL/QFrRk2Z0N
	 Eac2cnXazZy/wTVTH6OXFhTOyACibWEhIyBfxj+2kb2SeTMQ28YYSVgZGJt31Dbqd9
	 +hEfCZm+q5nczPHEjyhGFwBIcSrOSycuHo/A4nJMQbkRszJ+jZXcRAEvOebqMmfwt+
	 3TzM6edV93QSh4HQe1aEP8Z76b+V3lrWVJKkkxCUyv5i7u2fRHDTNwGXRzpiVFzbl8
	 OaCacpHanTBNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27DBE61386;
	Wed, 25 Mar 2026 13:34:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05098F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9EE58224A
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJmzFe2UwcG7 for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E42728387D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E42728387D
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E42728387D
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 74C7D5A0005;
 Wed, 25 Mar 2026 14:33:49 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IRCIZTLqk4M; Wed, 25 Mar 2026 14:33:48 +0100 (CET)
Received: from zbook.home (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 589825A0006;
 Wed, 25 Mar 2026 14:33:46 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 25 Mar 2026 14:33:42 +0100
Message-ID: <20260325133343.1008245-5-martin@strongswan.org>
In-Reply-To: <20260325133343.1008245-1-martin@strongswan.org>
References: <20260325133343.1008245-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1774445626;
 bh=ixONAypPBzyyZRjrUCWtj4/qkow6sKn6rP9vuiQhnrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FSm0TrmKQfigginpDizc+yKKH9o8YMlVARpW9hiY4QTsjnOu4gm0GCPbqfXOHbQIK
 3fyevZ3cALdMSIouzcBsnHA8XRThya7Zrm/oSnk3i7IlZnW41oSaq7N+dnFbaFrdne
 +bSkNQMtYXJ/Uw6VhKkzu3V9FaLoa/iuHCpI6Gp1Eko3Arw9b6jIGOU+0aQlFNtJqk
 5a27h+dILR20pxrdxMn1DRKi1M2WyZKXVIb9cwHDY8iaKqgjSYEFuP4gKcBTrcGTL1
 D6ABbH8IPWKtgnxFgLVYwcqI6xaZJrdPpsThB/u2ooM6znSjwjbirhyhUI6PTpW7Hr
 Rnz0KfWaEka0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=FSm0TrmK
Subject: [Buildroot] [PATCH v3 4/5] package/pkg-utils: add 'hashes' to
 show-info
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

Finding the hash file for a package is non-trivial, as they can be in a
<version> sub-directory or under GLOBAL_PATCH_DIR. To allow other tools
such as utils/generate-cyclonedx to find hash files, expose this information
from show-info. If a package does not provide a hash file, create an
empty hashes array.

Suggested-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Martin Willi <martin@strongswan.org>
---
 package/pkg-utils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 211e681e8f5c..17b0aa176045 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -197,6 +197,13 @@ define _json-info-pkg-details
 		},
 	)
 	],
+	"hashes": [
+		$(call make-comma-list, \
+			$(foreach hash,$(wildcard $($(1)_HASH_FILES)),
+				$(call mk-json-str,$(hash)) \
+			) \
+		)
+	],
 	"patches": [
 		$(foreach patch, \
 			$(call pkg-patches-list,$(1)), \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
