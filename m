Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395E6C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E93B260594;
	Mon,  3 Jun 2024 07:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJTUgZGXQZLq; Mon,  3 Jun 2024 07:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0AAA6063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0AAA6063E;
	Mon,  3 Jun 2024 07:28:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C92601BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F6D842D7
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFcfCLzeog1Z for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50B7E842D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50B7E842D4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50B7E842D4
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:28:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 351D12000C;
 Mon,  3 Jun 2024 07:28:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE27K-002GEy-26;
 Mon, 03 Jun 2024 09:28:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:28:28 +0200
Message-Id: <20240603072829.539067-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] Config.in: drop --passive-ftp from default wget
 options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fedora has recently migrated to wget2, which has dropped ftp support and the
--passive-ftp command line option:

https://fedoraproject.org/wiki/Changes/Wget2asWget

It turns out that the command line option also doesn't do anything for wget1
as it was made the default in wget 1.10:

https://git.savannah.gnu.org/cgit/wget.git/tree/NEWS?h=v1.13#n292

wget 1.10 is from 2005, so it is safe to assume that all supported
distributions use >= 1.10.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index b5a94325c4..bdf5fa8647 100644
--- a/Config.in
+++ b/Config.in
@@ -105,7 +105,7 @@ menu "Commands"
 
 config BR2_WGET
 	string "Wget command"
-	default "wget --passive-ftp -nd -t 3"
+	default "wget -nd -t 3"
 
 config BR2_SVN
 	string "Subversion (svn) command"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
