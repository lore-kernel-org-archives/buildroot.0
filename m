Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7254EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0BB61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E0BB61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA11E402CA;
	Sun,  7 Nov 2021 02:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DugmZnraKqWq; Sun,  7 Nov 2021 02:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D680402C5;
	Sun,  7 Nov 2021 02:48:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1381BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69FD56066B
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWDTBovBFKey for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98598605F5
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:33 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAbmR7Yn; Sun, 07 Nov 2021 03:44:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253073; bh=fCsF7D9x6E7UKLjtW1moNKgAM1SMxOKXssdP302zmxc=;
 h=From:To:Subject:Date:MIME-Version;
 b=G23COpNfvuJtQ77rYHzz3o4P/RI+WRMnuc+YcHsyfLWMfwaEjAwfejkNuEuPgVtcE
 q5Aw2Wn4ANBEk7bw1qFkLq5cyHxq1q2ZmL7rLBOS6/xdy2akDTs+TEvQQ7klYdhkpD
 ozjI9nvcFPVPW0n7/31YdQL65sG709MeGYf/hx1ZS9v5FZBNg/ZGN+w4kacjdr7OON
 bTbuey21om9IAO+U0Gto6JVwHsZ4P6H560r4IIFC+W1d/n9WFMPTlWAyVzfTpgktkl
 Hqc3gUSg2MiAajYUxycYiHou5Vf0gs1ZUjbFudG2SEi49v68Pf7zQywqWTVIXdfpah
 k9QQZOOHbf+/g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:08 +0100
Message-Id: <20211107024330.3061378-21-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH3XmJPxz4Nc8lU4KN+uLy4zfnw/4HD/7yR6pwfFGHyljrm4/PK6apSOXhxFvGytEvdDrgmD1kUqaxzrA8uCvyzCyH+e8C51THA1riUeqoJ3+vlWbrg+
 rZLQ37zLRQTx+uwnJaS4AhvrO7wSWnMWOPaDppIcJ3qxiqkhGt2F1MXpIeQVi3ItPt+cOg7HM4DdSL/5x9DpZMzcSRmBKyaS87/8QUhZ959xPT/hazVqDnCQ
 68TNFPn3HUCbu0gzENSdBaPzjbFZtMLSeXuR8JdmjUs=
Subject: [Buildroot] [PATCH 080/102] board/radxa/rockpi-n8/genimage.cfg:
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
 board/radxa/rockpi-n8/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
index 88b55de376..3329576b76 100644
--- a/board/radxa/rockpi-n8/genimage.cfg
+++ b/board/radxa/rockpi-n8/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 16M
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
