Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF617C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8948961279
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8948961279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60C4E402C3;
	Sun,  7 Nov 2021 02:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHPGFUSU4Twk; Sun,  7 Nov 2021 02:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E22402C0;
	Sun,  7 Nov 2021 02:47:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1DC1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F6D80CE8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKrvYjNwh2oE for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B4AF80CDF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:29 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAWmR7Xh; Sun, 07 Nov 2021 03:44:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253069; bh=l/53av8CWqnanCpC4YZyWCaNr9AMPJS7tgpjRwZHoic=;
 h=From:To:Subject:Date:MIME-Version;
 b=iZUNV+gofJVpQgDRClQAwFmjhrAw5rDA4z4PT5C4+5iVl0Ioswc8joHQOykFUkczl
 w7J4C2UczZVvtqKBe+nvGOFrYS42lZqpfB439k85uT8a24GSkIUQewWZL1KAlLsWdD
 zTFLixgGpvVW4ghakKip1ofi+uF2/4eXmbel6PF5KC4ydMdg33h1iwkgv3S8xcXa/+
 xNFFiMMXkiA3agU6UjZ0IYnKt7m2GfxXqJ/HJkSctmIb8r+SVp6HDGQw9AcheSZEuS
 s1JgSJBO0qnhv2kxH2nklq5enbW0LdN0CYH2TBJu+GbHSlT8LSZcLUYGy7pac0tMgb
 mtNApFzFvEHRg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:03 +0100
Message-Id: <20211107024330.3061378-16-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNkciUgKVOz7h+K7spZ20Gdz002lNFrSkpfyfC7gVKi9QLduSk976hJ6IIafUrk9Z54mtkxvZsGGr15yXSIqw3caclzmeC6BuE2oZXkBvtkVyFbhGZU+
 O0A+z2aEDq1ZHiRBNmVS/XNsYln0dwIvB/ubMigT+6tggGothO6A0VpVqjIBWpkneAU95+w0dntVahZIvw/UAxkogwxkmgwiuKArTO9ATmiXYWjN0cJffDuN
 H2+ukFy+zuIKMliIzALRHoEFFARaDLKJtz3nIBNeQKs=
Subject: [Buildroot] [PATCH 075/102] board/pine64/rockpro64/genimage.cfg:
 beautify file
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

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pine64/rockpro64/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
index 0ba25c0eef..aa2095b916 100644
--- a/board/pine64/rockpro64/genimage.cfg
+++ b/board/pine64/rockpro64/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
 }
 
 image sdcard.img {
-
 	hdimage {
 		gpt = true
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
