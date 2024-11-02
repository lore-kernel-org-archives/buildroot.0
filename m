Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C82E67816
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 23:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5277426A1;
	Sat,  2 Nov 2024 23:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qv9VzbZnZBOY; Sat,  2 Nov 2024 23:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB7E4269A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB7E4269A;
	Sat,  2 Nov 2024 23:30:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3203112A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 23:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1A00615B3
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 23:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXxIY7TlVuRP for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 23:30:00 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 02 Nov 2024 23:29:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04B07615D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B07615D2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B07615D2
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 23:29:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7NSCtksRTDhSB7NSCto53u; Sun, 03 Nov 2024 00:22:49 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  3 Nov 2024 00:22:48 +0100
Message-Id: <20241102232248.802676-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPPS/02i90dzDdB32gmj86PrMpM42NuEYXVdXU1I1dvrb6nwV1tw0lHCv6Bl+9szSeXywZI5hJw5/x2WMqgm0/EAFgbl68qRkU1cr8iZa4T6orlT/9IZ
 Uj2ItqlMiYXvjx8I0p65CMvOybmJz+iz4sdZxM0Jn5X0mAg4LFnY1NCaZeSdAYY8MpZ9IQac/MMpV67LBEzxHdC/QnHNASVayi5bGmr64r+BnO7LYyyRmNLk
 v2aaeRKxpFVPwHMXEOc991zDvnEseBW84ziXr9BCIsk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1730589769; bh=i6Z9Zyu+o5x3F6jCKAKNW9PaYhzdc/mrDrZvdwNJD/A=;
 h=From:To:Subject:Date:MIME-Version;
 b=K30eXlrpmRSBuY5ZujrKLPAO4lt/CEfoSplnHgDtNmBOT6xBYgMe5lCXr0K65PR9k
 4kwt3EJia7B1davqUW/RgNgJum37c73w5d18ZIK6Vl3Rbb2rnhQ+VmhG2xzkic6vMl
 btiOtrsjOeCnH5SaZw4Q/AxC34fJLzF6zOD+0laviFgT/HrlTIXP2bfHsHh+xzebVO
 GH/SuNX3MeVSZEr04FxgbdT/0LjfPPJ1ZJ8J9CzddqhbV1jap7ox7yPwUrJCF3pbXB
 SkvPhI3ioGo3tv73ALNyXitmlgZ0pwNsAOBhO6orarobYld5qQUN1Dm5GYQtJQ4G3+
 smiplwSujlvTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=K30eXlrp
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.11
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 05727f7cb3..5c221b7dce 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  add9efa968e8341459fcaa2d96f2594a6f871e1fb3f57c02ce1c8ba5424f3960  libnvme-1.10.tar.gz
+sha256  f6da60036b14e0427246718a32abff442228331f9ae3853f89160cf366d83dfe  libnvme-1.11.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 93de76e83e..b1039265df 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.10
+LIBNVME_VERSION = 1.11
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
