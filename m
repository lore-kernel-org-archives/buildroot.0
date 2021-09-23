Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0FEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3497661029
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3497661029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082B08413E;
	Thu, 23 Sep 2021 21:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIlD9WyD_9-p; Thu, 23 Sep 2021 21:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60AF9840CE;
	Thu, 23 Sep 2021 21:06:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8BB1BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B8636064B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hxpr4nprfmqz for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D22760643
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:01 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TVupmYQ7NiqGsTVupmjV3F; Thu, 23 Sep 2021 23:06:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632431160; bh=rds2jeV2v/WcTC0TTCXltjbqkw750hJwHeqfAAISFUI=;
 h=From:To:Subject:Date:MIME-Version;
 b=f+tZzB0Ni6W/i9cfMTOdv2yABoALsb6YMFQd4zG58gkwzk8MNQpJ8u2r+7PxNlzZ1
 IuvvmvBfsTS16+cNcNr4jW4IDXIgCpbQUN1Eos5xFH3xC7YdyPNqjIJLNZg0ivBbWq
 Zj4o3FcA+ZHGmsZIRKPYPy/enQV+jgxwWnT+fRwyY4rAFDJV1Wg+tImI69vZet7/D/
 aAyqGqinHFYIeCNESeljhBODwujQCmvxpNZV7CRjfXQhXHqvAkz9ROcRhln9EDssOP
 35C2sPs60aGsP5kd/ubUTfqpwQwX620836Kmh67naAtQJolEq6dE7NPREloo8ngqp0
 DjHWwrvoGvXig==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 23:05:57 +0200
Message-Id: <20210923210558.100459-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfK09vUBa75DoJ/UPoA6g4dCKYiR+RLUG8iJxb0CmAHuHA+70drbvmLedyxJ4YErxog45tWgPxtwzSn7KHRu/4YWusH32MqcJXq3eis1xxVdtAOGs+azi
 uzzZjEfgpV1jwkWIVlZBnBrEZe99rFEFQ1IBcH8NltOQxC2Gyd2eQ+Yjx1N8PXeyauaI/lRQOwO+RuXoKT47QUu/k50lwZZBYMV5mRpH+3DD6IBCy2rwRxmG
 1KoiPKYb5B97zWXwCmsEkokB8+PTJS+NW1IEoFJNkjfbFmBwTPQJ8MteXjPfDnMbRI5ZpxS4+1NpmbRkQk3hi47KhV3eatVYQv5RmMyceHkw8OcpkZER/zlp
 vEBQ6GIoVHqsBCib4zCoIpJNL8iv2Q==
Subject: [Buildroot] [PATCH 1/2] package/python-uvloop: make hash tabs
 double spaces
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Make hash tabs double spaces according to Buildroot .hash files style.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/python-uvloop/python-uvloop.hash | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index baed0b3e58..13bb3b7ee9 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5	c97447b8b386971be5e6f4328563be42  uvloop-0.15.0.tar.gz
-sha256	1a503d5b49da6e3dd5607d6e533a5315b1caedbf629901807c65a23a09cad065  uvloop-0.15.0.tar.gz
+md5  c97447b8b386971be5e6f4328563be42  uvloop-0.15.0.tar.gz
+sha256  1a503d5b49da6e3dd5607d6e533a5315b1caedbf629901807c65a23a09cad065  uvloop-0.15.0.tar.gz
 # Locally computed sha256 checksums
-sha256	2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
-sha256	9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
+sha256  2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
+sha256  9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
