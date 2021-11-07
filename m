Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A625C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BDD61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6BDD61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E5206066C;
	Sun,  7 Nov 2021 02:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uh3tLQWBHBAN; Sun,  7 Nov 2021 02:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0840C60620;
	Sun,  7 Nov 2021 02:46:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE7A1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C53B400EA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jxan58DXW9Ma for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92656400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9kmR7HJ; Sun, 07 Nov 2021 03:43:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253020; bh=tkamoXkNninFL9c3bxEWh5gj5RT5C8zjllxTKGiITCc=;
 h=From:To:Subject:Date:MIME-Version;
 b=A+2p0FE1Vwy0F9osP7DSWTW4i/fiATixy+Uhg5ZiuqMxNj5CejdzSR9npD+FJpwTD
 c0obaMAb6Z6YbEk+XqA50W+8wSp5am8uEKAKf5TciZY2G3TFiBPNHtcMwYJOqS5xxV
 XShKqsSaaY7NWtD7FbjQlVNppb6rhY2r7+tQ6v6RZz80p0sU25ZRm/kI+lv48pt9yH
 La5Cu3G9w9ipA/fTl47Ro2lx5UN6I/Gmc1QnKbz0LKbcHcO+oA+bPHTzOOsUFKFcay
 NhyrVJl1bFfVn5zUKn7WON81klyPguV9LEMVfOBwkor3HejZ4QHlBQ0nCgQ/dBswD9
 dWink0lJxo1gQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:58 +0100
Message-Id: <20211107024330.3061378-11-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfN0rXZG7j2SwFflwHuJRIwTUHES2FxnsXddCHcY+4dXK3TaEecjip4kRzQo7M1eGQ1WYVvFRIi+MPUhjX/R1E4coESPVdTdHXE2DIkv9F74taEuEMR6W
 y0A7irYjbVdTvowZCbH/AFUYobnpbKb53olwtkar3+1ATka1R+lRCqYzvr6UHjU6mqu7894NeKFyhgAzuOMCGYh7HKCWN6NYdRLCP2AXzrss4jExcwoKjssg
 SuwAeo3sWVF3DHNCYL75JfyvIZFRrcmFBVbENIorNUk=
Subject: [Buildroot] [PATCH 070/102] board/pandaboard/genimage.cfg: beautify
 file
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
 board/pandaboard/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/pandaboard/genimage.cfg b/board/pandaboard/genimage.cfg
index f30033f023..dfe388227e 100644
--- a/board/pandaboard/genimage.cfg
+++ b/board/pandaboard/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"u-boot.img"
 		}
 	}
+
 	size = 8M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
