Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32130FCE091
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06525615FE;
	Thu, 26 Feb 2026 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXKbzo1ffHTb; Thu, 26 Feb 2026 14:27:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B466F61603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116043;
	bh=OPnT7VNueWez7T+PA4QKuKUMx9fReHxEPAc7uZd80KU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l8zPM1quDa/z7CPNGiwBU1IWiWGKc3oWfj/OWNjfFMZRpj8VKpKBNs1fEK2Xedtwb
	 D6ZuC+5MNRPTShqobSIMLgRgJowuycCeQ6Frf0ze5au5Csz5vItOwnxxCN8Fggvw5/
	 Bpyf0mNDzN9HpRUO/DB2gq1ElO7Dxb5wj4rAU8bBG+0eoDibWWWv4AGeKYDpISwXaw
	 ijtDXL0G4tncl6zqvi8LwS0VouSIWff4OsCx8oiTkfaCysGfpe/tWeweTbTq/afS9J
	 dS1XaASNRVKp+14gaWRoxCwXL3S7h1E0ZLA8IbRaWT8isCLfDdhkr0tn+CWlWGOePx
	 ZamQNVkXJ08Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B466F61603;
	Thu, 26 Feb 2026 14:27:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D00D323D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1D7D40AB5
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7VV5KTpfyOR for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF01740AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF01740AAB
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF01740AAB
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 5C82F5A0002;
 Thu, 26 Feb 2026 15:27:16 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2wK11d_Vgrl; Thu, 26 Feb 2026 15:27:15 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 524E85A0007;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:56 +0100
Message-ID: <20260226142700.1064999-6-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=63uCU48CybAA9dvy4JS/bl44wzuP53GWnTFQjfZX1Ho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wu9qiwZL/zgCZZGBTJ8rmEm0OWDVYg2I6vbe2kfimjZbdgjEyUPF1lu068uNY+sgi
 SWwZf2niXSLE18XqxenJnHX5ZcRwnXvAXTnFLaJ756ZTANVH6KqgIm6FgKz+11PRMG
 D+lFMK/07fyHyq2dW7IjqqF0zqA1zoFboOmx72qbX3YeLWN31HLvGUrCUoCPekBDVp
 Semi1J1I7XMhoBf1RrI2YGZbQiaHT5gI+fx6E1AyneiQekRjXZ0TItRvkj99Z6Fsqk
 MVcJdBE2zFDqqFLtU50NeMqjQNbopzEY0+bhyhXgGxAWqQXoyuBAGVF4ts3kYXA5pC
 KQ0aBqp9FLalw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=Wu9qiwZL
Subject: [Buildroot] [PATCH 5/9] utils/generate-cyclonedx: check for
 manufacturer URLs in non-lib package
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

Some lib packages have their BR2_PACKAGE_ entry in the non-lib package Config.in.
If no URL is found, fall back to looking for a BR2_PACKAGE_ entry in the non-lib
package. This fixes manufacturer URL lookup for the openssl and zlib packages.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index cb458ddf0315..e811e63685e2 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -342,6 +342,12 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
                                 "url": [ line ]
                             }
                         }
+
+    if pkgname.startswith("lib"):
+        non_lib_pkgdir = str(Path(pkgdir).with_name(pkgname[len("lib"):]))
+        if non_lib_pkgdir != pkgdir:
+            return cyclonedx_manufacturer(pkgname, non_lib_pkgdir)
+
     return {}
 
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
