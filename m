Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934ABE7719E
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 10:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 418CE6080F;
	Mon, 13 Jan 2025 10:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpAgr8JqVJtF; Mon, 13 Jan 2025 10:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BD0660810
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD0660810;
	Mon, 13 Jan 2025 10:51:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 217CD940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 020616080F
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6qli5LFkW2t for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 10:51:53 +0000 (UTC)
X-Greylist: delayed 528 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 13 Jan 2025 10:51:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E66D1607C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66D1607C8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E66D1607C8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:52 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 1C3E83FF69;
 Mon, 13 Jan 2025 11:51:46 +0100 (CET)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 41BC75F497;
 Mon, 13 Jan 2025 11:37:36 +0100 (CET)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:51:31 +0100
Message-Id: <20250113105132.890144-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1736765506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ybn+NHEO9s+3IYjU8NvtFq57rZLgpD9r5u06PSBsNjk=;
 b=dG+8Kq1114GB9W1IECUfH95WmERTY/2FRsaOx9vAO2PMTtn7nMUrDLie2ql+Y0q+zjaHE0
 zEsmVCPo6v/ynwYYo914D1qsIj8pddU8zj2qiBPQJ8H/BnOFztKTqRyWv3htwXb16BMB80
 ccPRYBX8JwYWsfGQwULuw3woQHkI3q/n1lDP0FJGcGoi59Iq3ln2BVfD29J03U9+jgz7+9
 iuhF0GV0s+YjaZrwee+jlGT2S4idQk5FBrHDqgcQ7FYd2VWW0pfVUTqnWWSoQBmBOsTP2u
 M9OFheiN87kNWHxn0Nl/LnLXWktnSeo3Z6DDq/x9+dcAMTBaLmkEdW74PYaYhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=dG+8Kq11
Subject: [Buildroot] [PATCHv3 1/2] package/perl-file-slurp: add host package
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
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christopher McCrory <chrismcc@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some project like efitools requires host version of this package to build properly.

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/perl-file-slurp/perl-file-slurp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 0d4ab94034..7cada58070 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -12,3 +12,4 @@ PERL_FILE_SLURP_LICENSE_FILES = README.md
 PERL_FILE_SLURP_DISTNAME = File-Slurp
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
