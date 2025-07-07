Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444F0C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 13:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1018613A7;
	Mon,  7 Jul 2025 13:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdgheOeNH9by; Mon,  7 Jul 2025 13:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3558960B98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3558960B98;
	Mon,  7 Jul 2025 13:59:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 225B31BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13C398188D
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pDVKscOlZ7c for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 13:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3F668188A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3F668188A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3F668188A
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:59:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1662805307; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Jul 2025 13:59:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uYmNj-00FoNY-37;
 Mon, 07 Jul 2025 15:59:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 15:59:40 +0200
Message-Id: <20250707135941.3768551-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VLctVZHvIFF7lhmwZdiS2fTowp6qxVcwTrVZ4WKu9jIsu97KCKrBMUA3NAE8gZVzumP2CuAnTCD1J/RI+UPsm61rXkG4+++Lu2TYSFJsOAed2/PU4zxKZ7aifNj/nsTd0SPOxPCn2y1M9Jqhqwh6eKQnXhF2gB6HNNbSNMOmGaYi/RkGllQo/bh7PCsDVwIAUJFGmTEDMU8hTmFn7pOJlXZYGRjuwDhD8ZFFCV1yaO8bmBHC/c2UhvD6aTmTrZd2fzAQrrPpvC2ZHuABw6OcOcSpbEPzRNnMTunjPCcjODXZqTXa1qzm05Xsg1Rk3vDDYjDpdh7U++DcBwOIH4DlJQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=XNwY9tNW5Xu3kunxgPVtA/e5lPOmpRUIDwhAv8GSEFU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=VLctVZHv
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: correct
 CCACHE_BASEDIR comment
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1e97b2787331 ("ccache: support changing the output directory") added
the CCACHE_BASEDIR logic, but added a comment (presumably from cut'n'paste)
about compilercheck instead, fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 4dde0362b6..703d2fc042 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -526,7 +526,7 @@ int main(int argc, char **argv)
 		}
 #endif
 #ifdef BR_CCACHE_BASEDIR
-		/* Allow compilercheck to be overridden through the environment */
+		/* Allow basedir to be overridden through the environment */
 		if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
 			perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
 			return 3;
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
