Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B81CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 08:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E4040DCB;
	Fri, 26 Jun 2026 08:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlmI3dOfAoie; Fri, 26 Jun 2026 08:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 531C240D1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782462538;
	bh=8llVYFl2kPt0jEG2hnQ2GC0xlu2NHw3vNg7/W078nn0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=INvapRhdizzujho4pQ9qDZcx6j8RSrABtPG2WDJCoKV7bLnB1b7+uC0zoyBUztpLM
	 +L933g7uUsv19RVwd2ei6fJhPPrmDeC4d3BHhHymrYyU3LGvCKARQTMZk3gfaj0aJz
	 GLRQypFXmf3GQFH1h9cbgo6zwbuxc01kxlDYDMO9dDgSBzia10191tyry+EmiekpiZ
	 vimerHflM8ibBjFF5z804iL9DV02WS3VMSSlN1aO7L0H98ITOOuZ7VBUx13JH0Y/ZI
	 KKSA6Aj2HM9brE5Rf1sSUwLSlP+zRQ/MK3zjhJZHWtTzq4dtwHIT/DcAT2ouSTGap/
	 Me/7nCgERlZ3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 531C240D1C;
	Fri, 26 Jun 2026 08:28:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5646C3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4535B405BF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbjU04pUHzyd for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 08:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34DB540519
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34DB540519
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34DB540519
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso6427715e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 01:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782462534; x=1783067334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9sJ057ZWMWceHiNpTBotqdRIQ6ZI+tShaab7bPL8MWY=;
 b=mGD/VfEyiJkfU62+97+tQrcu5doZbAvJbkd3iZhAEaiBpB1/X6Fm8nnx3v7Q268I4V
 CmfgC5FI7HQ7U3VUD7Rjq+bzQhxymzQK0yN3GRyJ3KKnd48CpcJd4ng+KON+kRZHDNZs
 HBj7wW4r77rZUEfTwCgPku7dm93SMjJbkIFZhhqsIWBoK4GfwuQAo4IWzyA9W0/zb0/e
 LM9uYHZYLpLMRXabLpPsfIC7+/suif2gMHwAKOVho6UbebByT8g+1G/5VOhCQTkcERso
 5stdvjLQTbJhlIZSkbj29jP3J2Oi5trfdXrsssPh/jbYiTIUxKlK8ntVq2nHmjG4ub+0
 7ypw==
X-Gm-Message-State: AOJu0Yx0BxCBHNBzmllpS8hqXFkzFykPGeoBHKg1MuX7dBgeWBhdVGBe
 iV9v5VnkvpKxezJ8N09cj/95u0WSGfLsbrFzQ8STuhY3ERBQ2txjxoyDwO7l2Y84Sr9nIGjcl6I
 RzgdB
X-Gm-Gg: AfdE7ckDGrz9IM+/1K1NGG6BfuCgCtLuWhD8+iRTPVo+DQ2jtDOG1feWxxgkTqjaj0A
 r19XHYLFm0RD5j2VqFNJTLGSIxEAiA2qEXVjT78tJkGBGnZLFvf1a7WVi5YY6I45aV0sJdoCF5v
 MAnuLOZdGNKwgCYNth9ba8Jo1MLa31HKEbr1cYqNITlcOm9u3IEIuqkXOAAOWppGVj3sUrSf06R
 baowv/bvVUSgH9qQ+lt/I4pn1MFaXpQHSyFWVJOnk17VHBUsZbP7np7qctDAP7vUnARgfzJKXAN
 5TURfzPAwsA5ymEUf8Y+CylM2Whza6XWGVEh/YynFtFd1CmTkZJZZsFYg9XuMCUrbtJkTBqCMVG
 2gZ+9UX2cnsX6Z0lfjGhHNpYXYY+hSEjD7KklcrgGw+2Qi3f1E8urABlSejZ4W8X23Jhy3Aydsy
 1YlvAy
X-Received: by 2002:a05:600c:4f8e:b0:490:ce99:d2ee with SMTP id
 5b1f17b1804b1-4926686dec3mr84299285e9.15.1782462533467; 
 Fri, 26 Jun 2026 01:28:53 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fe31b0sm67003175e9.4.2026.06.26.01.28.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 01:28:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 10:28:50 +0200
Message-ID: <20260626082852.96329-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626082852.96329-1-thomas.perale@mind.be>
References: <20260626082852.96329-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782462534; x=1783067334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9sJ057ZWMWceHiNpTBotqdRIQ6ZI+tShaab7bPL8MWY=;
 b=XoAJ7RUJL+qd367YToXuVsXcDSY5WPp/hkDrI5TnwfpgXYoCPL4YjiWRbkMBdXq2fh
 rdW8qYS2SjRZkDpcVv2SEzC4EyBnfxEKoW/R6xioDzAvbLf27lSZyx0L41P7Nuiotrpe
 iQi3PBDhigYgCQ+mve/vzlLaBLmBjug9Y97w6XH/yQaMbQhAkXtW90AQ4/tXaEMt3s9u
 TyC6usXoeiH2CM9xSOj65aeH9oUGuvj06lpLhoypUBZHFJsNzSbyUfUGg1IC8d7v8D57
 tGFKeLkO0cmLjtjFTMVD5ZNxUNIjLG4iNYF2rkfbike9GDJFLZ+6CxFOJflsx8r/UfB+
 iXiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XoAJ7RUJ
Subject: [Buildroot] [PATCH 2025.02.x 2/4] package/squid: backport patch for
 CVE-2026-33526
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-33526:
    Squid is a caching proxy for the Web. Prior to version 7.5, due to
    heap Use-After-Free, Squid is vulnerable to Denial of Service when
    handling ICP traffic. This problem allows a remote attacker to perform
    a reliable and repeatable Denial of Service attack against the Squid
    service using ICP protocol. This attack is limited to Squid
    deployments that explicitly enable ICP support (i.e. configure non-
    zero `icp_port`). This problem _cannot_ be mitigated by denying ICP
    queries using `icp_access` rules. Version 7.5 contains a patch.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-33526
  - https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/squid/0004-CVE-2026-33526.patch | 34 +++++++++++++++++++++++++
 package/squid/squid.mk                  |  3 +++
 2 files changed, 37 insertions(+)
 create mode 100644 package/squid/0004-CVE-2026-33526.patch

diff --git a/package/squid/0004-CVE-2026-33526.patch b/package/squid/0004-CVE-2026-33526.patch
new file mode 100644
index 0000000000..572a0197cb
--- /dev/null
+++ b/package/squid/0004-CVE-2026-33526.patch
@@ -0,0 +1,34 @@
+From 8a7d42f9d44befb8fcbbb619505587c8de6a1e91 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <megamansec@gmail.com>
+Date: Tue, 10 Feb 2026 19:58:49 +0000
+Subject: [PATCH] Do not escape malformed URI twice when sending ICP errors
+ (#2374)
+
+In this context, escaping escaped URI always produces incorrect URI
+because `%` character in the escaped URI gets escaped again. Feeding the
+result of the first rfc1738_escape() call to the second call is also
+dangerously wrong because the result of the first call gets invalidated
+during the second call.
+
+No other cases of such "chained" rfc1738_escape() calls were found.
+
+Broken since 2002 commit e6ccf245.
+Upstream: https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165
+CVE: CVE-2026-33526
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/icp_v2.cc | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/icp_v2.cc b/src/icp_v2.cc
+index 2a4ced3bfab..25f7b71d25e 100644
+--- a/src/icp_v2.cc
++++ b/src/icp_v2.cc
+@@ -490,7 +490,6 @@ HttpRequest *
+ icpGetRequest(const char * const url, const int reqnum, const int fd, const Ip::Address &from)
+ {
+     if (strpbrk(url, w_space)) {
+-        url = rfc1738_escape(url);
+         icpCreateAndSend(ICP_ERR, 0, rfc1738_escape(url), reqnum, 0, fd, from, nullptr);
+         return nullptr;
+     }
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 4a56e32e59..e072ec6137 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -21,6 +21,9 @@ SQUID_IGNORE_CVES += CVE-2025-62168
 # 0003-CVE-2026-33515.patch
 SQUID_IGNORE_CVES += CVE-2026-33515
 
+# 0004-CVE-2026-33526.patch
+SQUID_IGNORE_CVES += CVE-2026-33526
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
