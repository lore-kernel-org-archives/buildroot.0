Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892DBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 21:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0EC2604AC
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 21:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0EC2604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4231840404;
	Tue,  2 Nov 2021 21:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ye2E7uX3A8ih; Tue,  2 Nov 2021 21:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB067403C4;
	Tue,  2 Nov 2021 21:42:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C369F1BF3F0
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 21:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2724403C4
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 21:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPOXwy8wIsMP for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 21:42:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id A639440346
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 21:42:42 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id i1YGm7uhSueW5i1YGmgnkK; Tue, 02 Nov 2021 22:42:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635889360; bh=e0KINq9ZKNkhpOyI49HR1H2YNQyViDwodEoXtUTu2M8=;
 h=From:To:Subject:Date:MIME-Version;
 b=UE12JFAGtTDoC81NEVUg1zoy8O8lfIFRx0tmXCRWJKkVuSwU6XGCx5B6DKsL8iroc
 dSgcvwxZbLDehk+N5OADr+Lj34D87t8ArhaMWMjQbZADOSaJowZEWrDN6UjzV8iDbL
 E1ixHZhmbrjqW6+nesEo4QJIYgFsVMs5oQqBwOhWtv9rVsPTegGSRjhCx2+MZ+Prcx
 CJ7zxeyA2iST9Lr4bQca8/OVp38iTU+HPvSPozMkac2OKUO0aS5dAo8K0h3EEdJr2Y
 T+ZQelLzLPPQjloHFScerFs+3SjtuT9QpLeGiV3Thvr9ZpP5MKoceiLssfooU+Z7u+
 QLEozrSqOE1Mw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 22:42:31 +0100
Message-Id: <20211102214231.579246-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102204304.1e6b0c09@windsurf>
References: <20211102204304.1e6b0c09@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP8gR5D/16gLl28r+DleH/E1dfU6SUYhdtMyWhWqgEdieIn49g+eDnzsE3Fhu2C9ij2FpgQIRLF+5t4Rq5FcXKg5qcIx895ll8uyWAgPlGs+PUXa7uOZ
 NmjgGTPLOvoVqfMxc01qg1KVwJQ9bgDpc9IdJzIw1+/0436+JeYV6z7swcxo+KPWw0rhOD0SKJ6dbyf+au5sGmIt0e2ASLNrptgnfkfCIcJJH8Of6SCzcpqT
 OWnl7FaITaJ/zIr8IuYi7WgzHdqor9z49WSL3tTe8XU=
Subject: [Buildroot] [PATCH v2] DEVELOPERS: add Giulio Benetti to all Olimex
 Allwinner boards' defconfigs
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Giulio Benetti to all Olimex Allwinner boards' defconfigs since I've
recently updated and tested them all and I'd like to receive possible
build failure from gitlab CI/CD.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add entry for board/olimex/a* as suggested by Thomas
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65240615b0..e5a9e60edb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1050,8 +1050,10 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
 F:	package/erlang-jiffy/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
