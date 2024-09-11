Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80AFEE4983
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 09:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B98F406CA;
	Wed, 11 Sep 2024 09:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MuN35skXahg; Wed, 11 Sep 2024 09:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F4C40D87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F4C40D87;
	Wed, 11 Sep 2024 09:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEC081BF3E5
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 09:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD26B40C28
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 09:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73hoRhVQT8xJ for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 09:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8E85400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E85400F6
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8E85400F6
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 09:38:36 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 8134F3F989;
 Wed, 11 Sep 2024 11:38:29 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id B1B2C5F497;
 Wed, 11 Sep 2024 11:34:26 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 11:38:14 +0200
Message-Id: <20240911093815.2915609-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1726047509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ybn+NHEO9s+3IYjU8NvtFq57rZLgpD9r5u06PSBsNjk=;
 b=WR2vIcTPkMBkf8p1ZU3cZ0kPtwBM33HPKBQ8/bBDzMPEWbv6JQyg4Ge/KOHV/Prktld6X8
 RKR4wrrfZVUTnUlqwM3Y+OgCYG6ecos6RDA5HJJdT/VMx6iQuAqcW4fUEDZ6/7aR0sORbC
 B0WSNED4Fkaqpwafj2PWdjYcSCxkWXuVISGsYcYiIlAjFBOuVwPajvxTrkUfAlz1jetxhK
 Zzx1dXbxwj4MDPqUrYw74m6JDwAsKMfjRWBA9VhN1XTgoBrsuqGdjxM8ZU04F2dzNI74q4
 cOnpwukJN//6A2IbIVUpFu1IcWqJLWedXN6BfqpB6k2B3+L+9lwkQoXrOjrcKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=WR2vIcTP
Subject: [Buildroot] [PATCHv3 1/2] package/perl-file-slurp: add host package
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
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
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
