Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA9CE7DEED
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A334640B41;
	Mon,  2 Feb 2026 14:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_7u_Lkbwnwl; Mon,  2 Feb 2026 14:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA75E40B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770041455;
	bh=HGuJ7Qv4Sg25/j1iIRYe3+hBBHngfRYvKeAli3N+Vog=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ijMFMRbFlzzUKROcjSK9Xgpfl51xRYeNuxWDIA9WsRpjeD24jWM+Oo0TyoUovse8b
	 K3kAHD7smh/0t2WsgaLn8JWLFVDTX/VlBq32gwBPfVoRsHH8Ar7/ChwN+KWENM3d3F
	 CIqt0+EfkscrZlnmoL+zu4ixOieL/7kDpxRsurqz82QIVjYkUAuZR0BIP8ZIei01eG
	 L/RvDMSmWUB5GGOR7irLKNZ150rXILq7zEk3oEN/o0JXaLBp10UIoBKmWXOww4LLQJ
	 IbFSdiIbeQvD73O7NtwzWd2rowJ553uEhLfL/YLDNrU79aADW6/sl60X+/9ZofIQBX
	 NkXYNdyEDfLkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA75E40B4D;
	Mon,  2 Feb 2026 14:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1655A149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED65D401E9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93_iePqhoJNl for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.147;
 helo=esa2.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FE6B40346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE6B40346
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com
 [23.90.104.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FE6B40346
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:10:52 +0000 (UTC)
X-CSE-ConnectionGUID: gCaRQ3lGTwq8O9HGpEwbSg==
X-CSE-MsgGUID: zC+x7U4DQXSa/0X6F3BKcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:10:50 +0200
X-CSE-ConnectionGUID: n4vdY1pSTuWT1aaESGwHJQ==
X-CSE-MsgGUID: QoWEmvzQQOmInOyV4f2puQ==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.6])
 by ces02_data.me-corp.lan with SMTP; 02 Feb 2026 16:13:04 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 16:10:48 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 16:10:45 +0200
Message-ID: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260119144010.1646792-1>
References: <20260119144010.1646792-1>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770041452; x=1801577452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0BCYCf2d6bNjiiKVDMOhVNRexq1VXGMj9VrtQ1byPC4=;
 b=Xo8HlZcTWffTvU8D5jgJQxUQ5tjMt5wNcXFqYTilCqs5U5x4upcAQ6GI
 I78AC4JKA7lGTorUBb6d4NMlYptC3tlg2cSsxaY9UJhh6ht3uUQRiFA14
 /p0SL8SIOlO38a0WSxgkL5q5vERyfqF/BUJX1p+U5GC43SOuGL5Niy4Pl
 xmOC+XDKGw5NR8IaRDTHHZfbU0RhtSwbrxXvG+umgld3VUd0kPxU77/u1
 mmx8DLNhDAKioGFlqmysakSoIYTLfvMMEpZuIkI6OUJyyxs+synx72GZq
 bLm9qGXZKvKf5+46WwxUZr7REEtxeUyQSF19lkVMXqYl0dmYa0r5VQzsw
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Python 3.14, the multiprocessing library API has changed:
> On POSIX platforms the default start method was changed from fork to
> forkserver to retain the performance but avoid common multithreaded
> process incompatibilities.
https://docs.python.org/3/library/multiprocessing.html

Since this is expected to be under "if __name__ == '__main__'", we need
to have this in support/testing/run-tests regardless of how this will be
fixed in nose2.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 support/testing/run-tests | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 2f670c03b8..1c4d2b4a85 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -142,4 +142,5 @@ def main():
 
 
 if __name__ == "__main__":
+    multiprocessing.set_start_method("fork")
     sys.exit(main())
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
