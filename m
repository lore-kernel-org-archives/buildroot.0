Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350ABC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22EF6108E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A22EF6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED0D605DA;
	Thu, 14 Oct 2021 21:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ys8j95CBQlho; Thu, 14 Oct 2021 21:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D264A60823;
	Thu, 14 Oct 2021 21:55:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4B9D1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D30274046C
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI051ffvTKF7 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:54:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77D724012D
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:54:59 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b8gjm2mFRumo4b8gjmr1e0; Thu, 14 Oct 2021 23:54:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634248498; bh=gRdd73kSUBauj2i62D0a86TTltrPAP/u6qX+FQjYkc0=;
 h=From:To:Subject:Date:MIME-Version;
 b=F7Iv59bVZoJy5iNHT+Fuee2Knuvfl6PWyWnPBEbroeqxM0stbXTupbSdheAS6oZF6
 8UklkT97KtHcVD83mQs7J6gn7It9q6INPeFbOFSC/CifxwlzqGakizhgvpXONFso32
 I3A6NJJlyumCjEEseCFPZGwT8Wt4jJUGnI12WfXAMctz5inYDpu8uLVT8dd3Xk31D1
 YGZHn6Dt13GenUr2Hx0YnVj5mZyEFA3eDTV6KR5XpMT+ct1uNEQwO96TSDwEe7o5v4
 L6N82MKiqspisSIRAVYfVIgpewku8nQZSRnhLbdsWlElfGbykqJwQf/zo9gMMgBGIS
 ElrgKTzAlo56g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:54:55 +0200
Message-Id: <20211014215455.2444205-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
References: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDybMvyGpScRLvNy7nvQ0TZSd5FWwI4GbfddtMYj1MtyHX4i/gnk2ijt4pChfCzEm+PSt+PswIhVy1c4/e8phZkX1toZk7IZ8JKbXSqAeOUq1sDvY/6q
 1pc8cXhnC2HOCeER4a/BgMVGhgRDXvMwTPqULFjKQ4rgQrDziSi2huwzUWwfhFhJyzWmQTJFlN+jp/5Lzd+Kvcrq0i18JePurTO6SAKrB1fsT2tU2/d4Jzcv
 1J4LHJ4LnMneWOocnGlnypQa9Xn7t+3s3ZTFZxBdA6XwlotyxwYfV4JzKMaRs0gyCerdio4Jrl/KBjFvBYT+3Rapk7GzuYeEHdmPfzYvFlM=
Subject: [Buildroot] [PATCH 2/2] package/erlang-jiffy: fix build failure due
 to lack of -fPIC
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Will Newton <will.newton@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package erlang-jiffy needs to be linked with -fPIC otherwise it throws
linker error:
```
failed with return code 1 and the following output:
/home/giuliobenetti/br_reproduce/60296a48210e7ffc6bc9fa50ee586441a8957e85/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /tmp/jiffy.so.FCaOXC.ltrans1.ltrans.o: relocation R_X86_64_PC32 against symbol `dec_destroy' can not be used when making a shared object;
recompile with -fPIC
```

This is architecture indipendent, so let's add -fPIC flag to LDFLAGS in any
case.

Fixes:
http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index cd94632962..25e7227c39 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -11,4 +11,7 @@ ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (tests)
 ERLANG_JIFFY_LICENSE_FILES = LICENSE
 
+# erlang-jiffy needs -fPIC to link succesfully
+ERLANG_JIFFY_REBAR_ENV += LDFLAGS="-fPIC"
+
 $(eval $(rebar-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
