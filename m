Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D088C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4506F6187D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4506F6187D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0532A40236;
	Sun,  7 Nov 2021 02:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kaj8AnxDp6Ed; Sun,  7 Nov 2021 02:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 517164022C;
	Sun,  7 Nov 2021 02:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9BCC1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98E844022C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74WzaNF-9aae for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFD7F400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:29 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBVmR7vb; Sun, 07 Nov 2021 03:45:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253129; bh=vzi9Pjp/og8iEdDeWztyTIwURtKTLTGs3g1pNlmZBuo=;
 h=From:To:Subject:Date:MIME-Version;
 b=eBAI7UMZAWAS3JbKOpDNcGl/kh6lH/y8ADND8cFawc560gxpCBfPk74hfEXqjb5xb
 IfJXY307IUPyjsXuyqd+CljV+JOHp5DheaGkxNnRDo8BtJD8C3zWPH37Bt1VvoU28x
 qR+PJiqHqh5QvCKpZC7b0265TLUJo+Vil0vxqWJWf56sBzxW1KkTTKewLAEPlwntJy
 KGJ+1tX/IZP41ERs6zE9EKjLZAIjUmAMKjL6fdbB2dUeVzWQfU5kb8sxBaVL6MAofV
 fCYTl1d/NW4hw8znuvD/gPJmPp3e02Vu4Tu9EqH6AfcBp+l5BJm0/lyKV9mMuqcJjP
 CI7kzxV5JnrQw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:30 +0100
Message-Id: <20211107024330.3061378-43-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL20zccSk/nEEPd99fs7r1sdomq998INZvYcUXsHPoyXjSGgZAVGzPCeXdVCtld2tKSLhqg8UrYMpF9W6FVJkOIMHr0KUxN265fA8Hyj2lUKy0CbAnuI
 WAOWmE/uU8TPaNPykiZjuaYvSbDxXdXX+XkuDg9zziZXFpOw6kiEIVvKzKEoWb1mnB9YqahVG5VQ17yKbrqQd/qd0KgMhIQEsiWsBqZ55C2sXIp5DqUssbwT
 Pc9N9yjw264JuFb/7VpE5rxDhBzHpzBcdEJOBq06pis=
Subject: [Buildroot] [PATCH 102/102] board/zynqmp/genimage.cfg: beautify file
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
 board/zynqmp/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
index 30be086d7d..ed202f4550 100644
--- a/board/zynqmp/genimage.cfg
+++ b/board/zynqmp/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"Image"
 		}
 	}
+
 	size = 32M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
