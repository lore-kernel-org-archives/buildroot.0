Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81943C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD5140659;
	Sun, 13 Sep 2026 08:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWMttHQWJ-xv; Sun, 13 Sep 2026 08:42:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3094440670
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789288925;
	b=Ys50rtTwInTmH+ueWBGGWMn1V+fNRkGk0LZmMJUGBM2LcgNaF5CESI0E5o6Wyp+68Zpc
	 XeyAXMFXm2Jbp8fymrIacDBvMIZl/aS1b5gG7K9KUx0jEr/mDuLZmtgbjBzeP2TgSju6S
	 Aq2+YNPLrchXib8S84dPrv+a2efLifc+EwgbEriIxJQZbeI03NGdC8UBVO0ogl1AeGFlq
	 flSOI946HoUBS/aObrtJZ6gTwCfOz+FxyJ56YQW761Bm9PuvkksVFAl/fuAEnClnVh6ZE
	 WQRYM+9PWcKvUyXP+U2tIC9G9euMB4Rfw2Zp1qKLz3SLsLYk6H7d+DvusbaP/fhMqIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789288925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UOIXDMrBmD5s4exjPS2YbiBlAMXxqZAMN1nggLP6Ufc=;
	b=EntpNcupm1VHU/WES+l1SdFPJlAAdi+SS2CZwX3fzSQ214zfvl6eojmWstFDVDXZvbi3
	 F8TiRhLDYbaSQfwVHURRcx+mUznocYC5LQSnlX52KmWHnHKisjEG0uqBGdYzFs8akjJ09
	 7LgGXWi1yF5hV/fRRbTqZy7K9EHKYru+JHxxpT91XKtqfd/mXkMhrtlEMlIzISMRIt/v8
	 5RxXWeOyWVHpO6ZYR+9dxYmd+JqqD+OllA1bmzCbHe6Omf2lyK28Kau3xcNKWyEgy0yIG
	 VGKG0ffPDRwTPK/DELy5kIaK4HwPRnwvxogVtoRNs4QlGdyNcTJbdAYP+UbufmMwn0w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789288925;
	bh=UOIXDMrBmD5s4exjPS2YbiBlAMXxqZAMN1nggLP6Ufc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DK6xqSTouxmvnXke14N6YOC0iCc2UtSWb7EmqSues9XwXhlHI3yFQkaq/Z32auNbv
	 pYoK+1zzgbCbyO44iX7GOaN2F+041RqtOI+LgBhLDbn2zGFC7FhIl1sQmR1vweChHD
	 urBn5wuaCJ+mXAcF8etDm0rlZVOeKXu7A4KJVk2XZqZZ4DjQnPTj1S04VvZ4qEfm4W
	 lx2COJM7ztaj4MTMIrosFAwbgu/4xSn/WrxT3sTGJb0pQyYEHEYb9soYBkCpIQNEEO
	 Gqw7gUVZbhbfXXgcVwYnLMWI/87J8Ftkg3WN1EoBNAtInmedk2y1iL7wwQQUjtoMh0
	 5he/jxhxLTBbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3094440670;
	Sun, 13 Sep 2026 08:42:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D2D701
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E42FB40670
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtD04-SARpUa for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:42:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3369B40659
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789288923;
 b=tcYf7eHe+GYIoL5bKspFN+ErzuFIMBK4x4juynLn5dBXffV40g3KhImbuOdqUbYfQPVU
 lNYVNbQrzBkEpcLEzMxcrvK6Vk5i9CifqxgjEglXiaq9tZImhqso1AZllzIYcXe45YNGo
 YLwqergoVL0Y5t8zCkjF/RfBLoAV3i1weqJKvhVawChrk79UCu15gbJqWavxgSYtbpIGA
 PkAQOzgKxpmE2uVaFLgNU4goCNwDAmDxtKYNK9l8dQ2wyylMRrCw8A4X9tO/wCLYUG7mI
 ISvjOyIrDg3rT6i0YDdf5kFeLgLooKnkNHpIDcsiFzo4b5LygqFEWlkVD3BeiJW2qAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789288923;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ywz5bKxtY4bEpbZzm6WYIWD1Ek1va+wFa94RTRUz6kM=;
 b=O6NSD482IFLJBJ+fbbAx5LJwJm9sC7PV4c/v3OW4Fm9xOpSdKOZsOaQpIw9/Npg1Tmc7
 H79EYmUhvzxT3lbfT6OqF+LQK0ZIR+U/ud3dD9xRC9/1ZBKhLtr+c8w4QcWIPjbiGzAxU
 47aJqpEHyzBP6QctafqVL5RBZXzqpykFP8xDTMHnU/hOxrcV9ARSuETLHOp4SRnmPo8a2
 K7QkuLIaS+BQRwnAtTd2tlqQWnS8J97FFBMZ7rL2KllCGG22vFD4bHC4/DIf4B6z2A+8W
 M8ZSTcX2XxQUY7HI05FLKkFjOA6DsQ1dFGUHtnKsWVaxQ/Y+l3SSec5hGr3dl2MqMcw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3369B40659
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:42:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5846F95B14; Sun, 13 Sep 2026 08:40:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 10:23:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c305370f361f98016beb0bf8381b2759db295e58
X-Git-Newrev: 4b8259bad9903af4b9de3ab8c67adacf12219818
X-Patchwork-Hint: ignore
Message-Id: <20260913084058.5846F95B14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: add missing BR2_USE_MMU
 dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b8259bad9903af4b9de3ab8c67adacf12219818
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump
to version 2.92") mistakenly removed the BR2_USE_MMU dependency of
udisks when dropping "select BR2_PACKAGE_LVM2". Indeed, BR2_USE_MMU is
a dependency of many other packages selected by udisks.

Interestingly, the Config.in comments in the same file still had the
"depends on BR2_USE_MMU" dependencies.

Fixes: 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump to version 2.92")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/udisks/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 23eec1d79e..8e772cccd6 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
 	depends on !BR2_STATIC_LIBS # polkit -> duktape
 	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
+	depends on BR2_USE_MMU # dbus, dbus-glib, libblockdev, polkit, util-linux libmount
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBATASMART
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
