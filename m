Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACCFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D433C61353
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D433C61353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98CC34022F;
	Sun,  7 Nov 2021 02:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1esITb6hRm2; Sun,  7 Nov 2021 02:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11314022C;
	Sun,  7 Nov 2021 02:47:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE91C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBFE66066B
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stq_nET7tYhn for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id E295560620
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:30 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAYmR7Y6; Sun, 07 Nov 2021 03:44:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253070; bh=vmlpQWdqAI/ZGwGa4Yqbejx81LQkLKz/S+cYLa8TvAc=;
 h=From:To:Subject:Date:MIME-Version;
 b=GpE4/FvxK9+iOUK8lPAnRwXDj9HZJxs0HvWUE5pT14Bw+RhgBlPjM+D2qDNFPX7qV
 k5ZpH3q2GV4F2UAxsVqrbTevYxalpJycAPEvtNrJSpnZFyI7MZtw0Euao7IsFVrzuW
 Q9qNcf+qA93GMJ2mn6zyShoUGMJxLZrhC6OG6Bx8EJ76f8ZL+8/buOCHKiOlyDZLu+
 iolRPxvjpHOcDiv8xb6RKBNaOoQdX6iOWHKd0N/w6cFo8eiUljlydVudkJcEwlY/Sg
 zNxNnVY8r4dcPsZFxVNfGFp3jBcz/BRJF5Am4h7k8Q3GP7rQWE5lhCWFl0tVbsHW/k
 BODrbmljIdsbA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:05 +0100
Message-Id: <20211107024330.3061378-18-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfITklyYpTKpOjNjH3vg2xKDJc6bMAsJupjQjvMynqFW/LOE0SeOJ5Ic5kzcKYZ+NL+uxdiSdmn4SZNZJ/hL/u7TZdw+D4AmdoNbJgqI4gfTnXvJ8KmKQ
 G/msvBgyFCYsf2JfHVgW5KA3aoiwmuI2Jx2kWkRt8aaGQgUDpnAjfRJg6Kyvwub3ii0j+MgZcMw1O3o6JAFdy/fbPqTr4I+hdg1W5XoPtYSHDgz/aUExstOm
 88DeeF1rnXP1nKCwLK19TbW84/u/UcVgyrXQ9KGMHGA=
Subject: [Buildroot] [PATCH 077/102] board/qemu/aarch64-sbsa/genimage.cfg:
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
 board/qemu/aarch64-sbsa/genimage.cfg | 42 +++++++++++++++-------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index c75d9fcca1..0d916e6b28 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -1,27 +1,29 @@
 image efi-part.vfat {
-  vfat {
-    file EFI {
-      image = "efi-part/EFI"
-    }
-    file Image {
-      image = "Image"
-    }
-  }
-  size = 32M
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 32M
 }
 
 image disk.img {
-  hdimage {
-    gpt = true
-  }
+	hdimage {
+		gpt = true
+	}
 
-  partition boot {
-    partition-type = 0xEF
-    image = "efi-part.vfat"
-  }
+	partition boot {
+		partition-type = 0xEF
+		image = "efi-part.vfat"
+	}
 
-  partition root {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-  }
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
