Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7405F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 18:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDC8460F91;
	Sat,  7 Mar 2026 18:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ti2bOW0SG4bS; Sat,  7 Mar 2026 18:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B71560AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772906868;
	bh=Bb3zm6Gor4Xpuaogexd3k3l903WZRJWi7DuKqsvCu9M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IzYtSAK2f8/Yjcy5mfjYRQkMx/AIdWCiRkrL/U9ze7miSSK3pX3pnB0m5YghUKUFS
	 /tBQy3tf1MCtiM58v9AQ4qQVv8Bt2RqS9INOT7fLERMS1RMVvEkzrK5iSBOXRdTavY
	 1p9nvoTrrS0bL36lOefbe+WbLJhC9n/E1S3gVFP9xIGrcUApQt55AOO9/mcAFbEJFH
	 UCsK+IDhFP88TY59zqhPxgBOMIjGIZHqhT4eaNzQvjSofu8A1G3vn7k11FiNEA73Jh
	 7Vjso1hfn7JgNutwwicC5REFXi3xGjWbHKu+FtwNM+PrSgwX4xMpjcMMhNLp2OrtTj
	 ciZyU59dKDOvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B71560AF6;
	Sat,  7 Mar 2026 18:07:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD8F223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18F0A40708
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brwTNDbeAJOZ for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 18:07:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8420406F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8420406F1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8420406F1
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 314AA19F741;
 Sat,  7 Mar 2026 19:07:37 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 19:07:09 +0100
Message-ID: <20260307180711.1025866-3-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307180711.1025866-1-ju.o@free.fr>
References: <20260307180711.1025866-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772906863;
 bh=X1q2Cw9Y4eWLr/OR62vT2Ps3k/d9vfCJdbnouDg8Zg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nm6AdQKY4jeYBpzDD8Hz8ISN2eDOstQj0b89YckYnR4hie04QjlwH5dS1P6nRh+IH
 BBZrf8mwFK1w3Z8oBVK5rAPbB9FApJ7DfmI6s23oMUYN6NDXc+Ru+UFBNsdQ06wSsA
 VKDwyPMrmSW0ciXhkeqbOqXzA1XHRlqU7voD5qBx/OJ55xm1OsKQsO8a0oX44aUZgl
 /CzwPzCqO/vkgx93oVDVZvL4FvBrpLBacnniajAT6YXWZY4w9hsOrQRKG4isO1vvOu
 jcofjZHe4vbDhzlbAilE+OMoRzD/MCO4EcUvyEBO1AHrzEuYZT+0w34tnYc2Efz60G
 Lt0RtENfXZXqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nm6AdQKY
Subject: [Buildroot] [PATCH RFC v2 3/5] Config.in: add
 BR2_HIDE_SECONDARY_TARGET_OPTIONS
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain <ju.o@free.fr>, Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is needed with the current kconfig version in Buildroot.
If kconfig get updated with the series proposed in:
https://patchwork.ozlabs.org/project/buildroot/list/?series=490997
the current patch might not be needed.

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- changed Kconfig variable from string to bool (Arnout)
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index d730f2034b..0bfe6d1ab5 100644
--- a/Config.in
+++ b/Config.in
@@ -15,6 +15,10 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
+config BR2_HIDE_SECONDARY_TARGET_OPTIONS
+	bool
+	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
+
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
