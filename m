Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222FCC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E543A6115B
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E543A6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC5C60764;
	Tue,  9 Nov 2021 10:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gx_78QcoOlk2; Tue,  9 Nov 2021 10:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3585D60732;
	Tue,  9 Nov 2021 10:19:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E92E81BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D839A402F5
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3uCWonf19L3 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:18:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBE464012D
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:18:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODNmOZij; Tue, 09 Nov 2021 11:18:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453137; bh=kjHdXl7nrCqM17+a9UNTbE4sN1hbN0lP+9vteI5qwb0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Pv40uA/RDbErdNqZRcOzj7H5VzStW4nX19GOMu2UIdlAqQl0RogQ19Na0ceN496NZ
 qU4aVBTF/MGP4MxToZL1ZKt2W3GIUbfuIOyHr136gmH+dDfDzxqyukNa599ANyIMsD
 pVCzyXtSaATOwT/g3qU7V0Lb0p/l/R9hMgkrhbjAe9UObR+7YXJeU/Bo+llegHUQv1
 cPer+AEOtAwH6zCfa73kYQxMRz20wGLkA9SbekKW3ltsMIJNIUO+PUi4cbVUMhwosR
 JH//zSMpiRJ3I5vobn+xfaYCpUVQxxE56uubdtI6Qs07Adin8JT3HfMaGpuIjz9gln
 nzLlBZgFmSsyA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:37 +0100
Message-Id: <20211109101844.1132067-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH+6lWEs7s2bxbZt8DhIP/cFopZ9hwew7oZcTSKzzho3GsyBox7p7f6g0PTRiSf10fWm8IS/ULLo7kua+zKfHuMBC60ju3DAxefq5HPPK2I5c6CTqcBY
 qTZCByMuHmOzqAn4/5g7rdG0hSfiftCPRK7Kc1/MgtXEyt+vUdDLmvfaTAFMbeOoSFV06nTX9uIKf13ed5bf1XN2kZHwme4FUvwXszWULrH5pteuQ1dDFqK4
 WgH6sXeM/hnpQtnVeAyEypxqnljWDfQAFwnhBIFeCMmAMXl2oxdDzH5Bk9kb126rPu48LaKUsljCWQdoYunln/nh2ZwHKVRd71dKeb6g01yOosxFhuiebc8k
 difwtRkIl8Hcvq6AmkCCa5/d06fAD5Jf+CtQeijvFn7/wH4VXXrWReZis4N5dG5H/ZAunREXPWo4QcheO689iwzgkuhzTzTfWrUatV4b1mWi9eLpvFyc3yOO
 Sx7kmzWBfSntigI0coFrJtZFb0VVwVRy1sVxppXp4ABc/7/zwXr33rUJvx6i94tGXFY8I59uQMQq2FIgD9FSziEbWISJXVurAVvRO+UvynfBn7VQtqNtRWk4
 IDw=
Subject: [Buildroot] [PATCH v2 2/9]
 board/altera/socrates_cyclone5/genimage.cfg: fix offset suffix
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
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency 'offset = 256k' must be 'offset = 256K'

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/altera/socrates_cyclone5/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
index 0af3f2ec60..d31c3838be 100644
--- a/board/altera/socrates_cyclone5/genimage.cfg
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -24,7 +24,7 @@ image uboot.img {
 	partition uboot-full {
 		in-partition-table = "no"
 		image = "u-boot.img"
-		offset = 256k
+		offset = 256K
 	}
 
 	size = 1M
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
