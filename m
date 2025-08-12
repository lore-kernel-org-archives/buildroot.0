Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F851CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 07:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3331A6140C;
	Tue, 12 Aug 2025 07:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPfS4o_X2fSv; Tue, 12 Aug 2025 07:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A33861429
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A33861429;
	Tue, 12 Aug 2025 07:48:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 545FF158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E62E741E81
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nmnfNdCDXlT for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 07:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D37041E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D37041E51
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D37041E51
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -53644735; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 12 Aug 2025 07:36:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uljYu-008h4M-2j;
 Tue, 12 Aug 2025 09:36:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 09:36:45 +0200
Message-Id: <20250812073645.2072147-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250812073645.2072147-1-peter@korsgaard.com>
References: <20250812073645.2072147-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=W/WdFlwrGBOnBi+eMLrxtzpU3bxmiovjOsCkLIVHEkXX5fSWhFOFKkMD/ywG5Fxsaw8X0UMclny19eErfuiVaHiDZtg5sCTOoZyy/RE6MzyykJsjau86Sro+0EzyRYESFv0EJ97JwpzfinX+EGsfxbqA79c9ITUSKyZxUD2onhD4u0upv1OY81MQF0d6qAktMzGqQexlFBJZudofwgoxURulXPs4DnwEDLBZH3AYFmxdc/PnEVokTtvaybSdoGRnk7/u2Vuf5ssKLdJ1udPHEq1bqyVvZkmuy0qtSpnAk66ekgpfGOu37x9L+WtNY2m9cAf+d6/J4pHHYm9tiMiRCw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=US9Ln9ttQUkEfDuUkUCwyDcZBZndDA/5JHHqAJms1wU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=W/WdFlwr
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 3/3] Makefile: release: make .tar.gz reproducible
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

Drop the timestamp from the .tar.gz to make it reproducible, similar to how
it is done in support/download/helpers.

Notice: .xz files do not contain a timestamp

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index db2f522c7e..c740c6783d 100644
--- a/Makefile
+++ b/Makefile
@@ -1255,7 +1255,7 @@ release:
 	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar --owner=0 --group=0 \
 		--mtime="$$(git log -1 --pretty=format:%ci)" $(OUT)
-	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
+	gzip -9 -n -c < $(OUT).tar > $(OUT).tar.gz
 	xz -9 -c < $(OUT).tar > $(OUT).tar.xz
 	rm -rf $(OUT) $(OUT).tar
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
