Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E2C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 07:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8BC2406CC;
	Tue,  1 Sep 2026 07:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzklmnhAuPna; Tue,  1 Sep 2026 07:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788246691;
	bh=5+CFT2IgnXxz9Ewn9L1OFa/crwpzX2ap3XzEWExTUpk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=auok9s00YvgQfp5IaM5Xavt+dGi4Epu93SOQP6/AGOvyDlt+i4JOBr6Zbk62PcW9B
	 T9a9FoiO+veaiWWdXZdJ1AFXjOzhIvbh3VKuhQA7LMfU7Rtq5Nn03C58seFk4QZk5K
	 NQwC7mvSbdElKKRVh9AoO2PMR9wfje5hwMXu7fV9Z8/aLekkcq1NP8VmnDT/d0F3+h
	 hhBs3Nwnt9IrvWRRK6qG/aLoFBSfqZx0LjeYCiebXqSMIdvgPTJ0Jc4jOtUdZNYBmb
	 DSYclYpkSD4b4O3/fMWjQJsXSPDODqGQAq8Vlp45lzfiOd0Rvevv3pCsQRCMgP2P+G
	 gnDlUi6BZd4Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6615D404E9;
	Tue,  1 Sep 2026 07:11:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 660721D9
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 490AA605D2
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgozttTphdaz for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 07:11:29 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems.org
 header.i=@openpixelsystems.org header.a=rsa-sha256 header.s=google
 header.b=PYkZY7IH
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBA8260720
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:11:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso22455175e9.3
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1788246685; x=1788851485;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=atpxmnolXwDbze9owOdoiXrdvQRv2DP+QfdCLyOjFQU=;
 b=PYkZY7IHhm/37ngT8ByQS6AHOa6U/KStnQga3uIjBG+CsXVsh42o98+3k3O6Z7DeU0
 4VDQ4OJzg9P0nuamjZvH+sQ9DKRCMHV1rHX6+MRRVtsUArVQDic6GbILGct3UBNRnKGO
 9iTtWsAAHTEPU55pxqhL/nIifBobdZl83QcrsC1sr8qe3Jt+CN5Fdq8TLOhyUArnaw3D
 21/xZo+7mBqhKXPxF12Joiu7+PFH1p7c1cG9Z4g90nd4KCStf8SgOXVR85bpsprjQG3E
 UFVYAI5MbFDoKlBNc2h+QlgcsjCYykhf1aiiuU7nCGkcfFJXoDalR6wQW2ObHX3Pf/KJ
 t9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788246685; x=1788851485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=atpxmnolXwDbze9owOdoiXrdvQRv2DP+QfdCLyOjFQU=;
 b=NrXYQU5S1Z5p9TTTGFcTU3lkH7NA73XXH2ZnybLIAf82qWtLCZxiALqc7WmDIaOBlO
 0rOXt8+R5eWxbnBjKN9RQUQOjFfu6pC3TXaXDbXoIq37MKsmmqTF1LNQeYW3Y6wj0+Ub
 +Rq4IujCpulq0HTcZCLDomeMy7kt7F/T3ADHjoww2QDW9AXsoA7UZRKX5hZkpFgh61iW
 oooq6BkB4UU/sqdSwKwq9S1psmNFvpFdurNg49AEHVbH3GjOGPLpxW6VwSKtl9GjUWA9
 +KADz2ygy8yGAuVKLs+cMT29n8Z7MMc1xuT3K5Vcgxv28Wap60Qop1v1DlkvUiG/ThKi
 ZINg==
X-Gm-Message-State: AFuF++l8s0/lrqL292/XrLojcZgfUWSdN7Zz8/r1HAcv3QDgR1x1VaBb
 f1nKkbtsg4zIY4/pAIjiOIdyVwYdGrajF+TAF0M9zSgiHn3uPu+6sO+czej4B4Np97UJLoQAwrD
 uGczg
X-Gm-Gg: AR+sD10UDP1M6UNTVoP9nMA6NqvLJEX1o8HqUx+aszOJNXGNNxcrxKmGk7ZimlWg9Rb
 5rCxdcleIVayeMQ/VTwfbooOHM9n/9ST4m940C85q419AUdrg4zmc8/OStLGuqe7U+XIV/o6E3l
 6dROmADT1bt5ipiAomfY1nnBTZR+eBfGez+wbyWuRfxZrNvAHrK/sV957p0mC2iHNyCmmNuD9CN
 Oc0nczcNS2MH1BWgFkS7HRgHw4fRLq8pki2U/F0r2dWFkz/B7phvXBepibTGFfXJk2h57QRo4VX
 88QdsiQ+acKsofP4p8zKASVKV/xVt1X+wLXyJ/cogWQgp3bk/IAZ/U/3Vk62011TsGQfTrG6NgA
 nUtQIMoWL9LNegDGYaOvDp2P2WGck56QAsMaxhBU9T/VnjRL6ePxiIqd3Iib4djoK/uMvRxC0WC
 uTkG8Z0qf1X0WK3BhMgiJ4d6ZOLo/boeFKCt/EF1Z7DJf6qaRZV7M9vAMm3e2iibUP1NAerE/d6
 fe8YYbe0OOcrvho+4A0k8MxouMdNTJcHf9bU16PmNwYKygX65zjOzPnbgWIMmD+
X-Received: by 2002:a05:600c:1c27:b0:49c:cfae:34d2 with SMTP id
 5b1f17b1804b1-49ccfae35c2mr303127515e9.4.1788246685298; 
 Tue, 01 Sep 2026 00:11:25 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d787b8sm3040192f8f.29.2026.09.01.00.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 00:11:24 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue,  1 Sep 2026 09:11:21 +0200
Message-ID: <20260901071121.834356-2-rhidian.dewit@openpixelsystems.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901071121.834356-1-rhidian.dewit@openpixelsystems.org>
References: <20260901071121.834356-1-rhidian.dewit@openpixelsystems.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Avoid double-free on x86-64 systems with no
 cmdline set
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

Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
---
 ...i-slot-bootname-to-avoid-double-free.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch

diff --git a/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
new file mode 100644
index 0000000000..d8a429e06f
--- /dev/null
+++ b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
@@ -0,0 +1,43 @@
+From 240d8ae22adea51667346854e6f863b558dfc470 Mon Sep 17 00:00:00 2001
+From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+Date: Fri, 21 Aug 2026 16:37:45 +0200
+Subject: [PATCH] Duplicate efi slot bootname to avoid double free
+
+Upstream: https://github.com/rauc/rauc/pull/2028
+
+Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+---
+ src/bootloaders/efi.c | 3 +--
+ test/bootchooser.c    | 1 +
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
+index 65875c9f..e6eb0351 100644
+--- a/src/bootloaders/efi.c
++++ b/src/bootloaders/efi.c
+@@ -632,9 +632,8 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
+ 		RaucSlot *slot = NULL;
+ 		while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
+ 			if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
+-				return slot->bootname;
++				return g_strdup(slot->bootname);
+ 			}
+-		}
+ 	}
+ 
+ 	g_set_error(error,
+diff --git a/test/bootchooser.c b/test/bootchooser.c
+index 43c45397..c35a78f1 100644
+--- a/test/bootchooser.c
++++ b/test/bootchooser.c
+@@ -970,6 +970,7 @@ bootname=system1\n";
+ 
+ 	bootname = r_boot_get_current_bootname(r_context()->config, "", &error);
+ 	g_assert_nonnull(bootname);
++	g_clear_pointer(&bootname, g_free);
+ }
+ 
+ /* If the underlying 'efibootmgr --bootorder ...' call fails (e.g. the
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
