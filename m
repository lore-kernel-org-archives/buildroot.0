Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9323ECD5BA3
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 09:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EFB60A41;
	Thu,  5 Sep 2024 09:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id df472-JQjN0P; Thu,  5 Sep 2024 09:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 937866090C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 937866090C;
	Thu,  5 Sep 2024 09:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4B781BF20B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 09:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92CF86090C
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 09:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ut5niZCIoylZ for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 09:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5FE1608E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5FE1608E4
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5FE1608E4
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 09:49:21 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 8F2071FBA8;
 Thu,  5 Sep 2024 11:48:45 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 801E85F497;
 Thu,  5 Sep 2024 11:45:15 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 11:48:27 +0200
Message-Id: <20240905094828.1313494-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1725529725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ybn+NHEO9s+3IYjU8NvtFq57rZLgpD9r5u06PSBsNjk=;
 b=KbxzZjNWYcwBp0+NVjQ0pJFns2APiZtmxjyPaY9pP2GgtXKdpcaYik2jJegqMNpI3QCJks
 qpFPpkcJsbAOEiPy/ZNyJz5OFWlz7W+TZJZOai772H9f3eJjDMIHEV+KPDYro19iuakTYC
 zueREUmaUBf9m+gcGPZthD3pfzqXOpahVekzY9zyZIGnigZmQ01wPoo76A4FevvaioHTWh
 QcM7jI23WYxfZp2YX76geIdAyqKCtrKE4ostHfLa05ylj2h0F9Zjkje5Y2bHbrAbDE3zwC
 6VIJwuCV/x3m3EblO/qhPuo8JX9mBJrl+1pfstE/+2z8zkyjnrsVI4tVDqwilg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=KbxzZjNW
Subject: [Buildroot] [PATCH 1/2] package/perl-file-slurp: add host package
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
Cc: Christopher McCrory <chrismcc@gmail.com>, Sen Hastings <sen@hastings.org>,
 Norbert Lange <nolange79@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
