Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4D4C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 11:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E660D80F6C;
	Mon,  8 Jul 2024 11:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CI6fC8vvFqv2; Mon,  8 Jul 2024 11:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A8280FA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A8280FA4;
	Mon,  8 Jul 2024 11:52:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 087161BF3B0
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C6680FA4
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39Yjn2jU146g for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 11:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82C8F80F6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C8F80F6C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C8F80F6C
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 11:52:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15A0F1BF20D;
 Mon,  8 Jul 2024 11:52:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sQmul-002cHp-2r;
 Mon, 08 Jul 2024 13:52:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 13:52:12 +0200
Message-Id: <20240708115213.623818-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/fluent-bit: enable engines support in
 libopenssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/c08/c08c00f52b8f42fd408a1e84e41606d75558c3ce/

The embedded librdkafka copy unconditionally enables calls the (deprecated)
ENGINE_* logic in openssl:

https://github.com/confluentinc/librdkafka/blob/v2.4.0/src/rdkafka_conf.h#L37

Which are now no longer available in !BR2_PACKAGE_LIBOPENSSL_ENGINES builds
since commit 623d3bbe43 (package/libopenssl: no-engine), so enable it to fix
the build issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 53284ee17d..697cb1bf15 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FLUENT_BIT
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Fast and Lightweight Logs and Metrics processor.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
