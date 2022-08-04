Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D40C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 20:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EE3040364;
	Thu,  4 Aug 2022 20:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EE3040364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BToGsYW6co4n; Thu,  4 Aug 2022 20:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C5C440232;
	Thu,  4 Aug 2022 20:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C5C440232
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE9C1BF402
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04EA783145
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04EA783145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeCT4X2_AmVa for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 20:50:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B8683139
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B8683139
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 20:50:58 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id h132so898545pgc.10
 for <buildroot@buildroot.org>; Thu, 04 Aug 2022 13:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=CgjoZxclDglihJR9Uu6HFRbqyoKkCYIUBi6wHjhUVfg=;
 b=NrR/1nCE1TlqSGu3ui4VjpUMx+nTLpX73oOLgAqwsiZMt+e/BY3k/1gG4yLz4QQDKW
 7zffVF/7gLX8EiuP8dlddxEVUcYaW3ioMPY4HcIpv+uB9GnWmUYOtuMpw2WgUeNgg+oM
 llZ46rGq+VUWIMMQfIyHQ4vVATOEfMp2mjUedjQLJPzCsShDBeGJBnSJyKW/HcgXbNIJ
 2RDxT+9HWWBW8wybJYafW8zBb2EHvcj6ZSBLxfNl60Vn7j7hYdVUB1jwesogrzWPleA5
 4uIP1aeO2puKgBZYCT0YO9MNI0gzaw8yDfFT8o/ER9Ba4DqCWG/PxLZXT9CehYbF2nm5
 +Fpw==
X-Gm-Message-State: ACgBeo2iD9+qle5CmtKnIHKdxLWPlU8kxIIHwtsDMwE+DbK34XVFmgP6
 0RLjvCzyUTeyA8ARI598kz1LSsk5JpU=
X-Google-Smtp-Source: AA6agR5PM2qU36vyGzAK/vTnE3xCnvILkeDYMQQ6CHCVM4kUFd4AbL+/ZW6x/O/KFCQ7vf2l/7Jk9Q==
X-Received: by 2002:a63:5705:0:b0:41a:f0ef:12e4 with SMTP id
 l5-20020a635705000000b0041af0ef12e4mr3039937pgb.218.1659646257330; 
 Thu, 04 Aug 2022 13:50:57 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 x14-20020aa7956e000000b0052ad49292f0sm1423448pfq.48.2022.08.04.13.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 13:50:56 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 13:50:51 -0700
Message-Id: <20220804205051.4159-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=CgjoZxclDglihJR9Uu6HFRbqyoKkCYIUBi6wHjhUVfg=;
 b=kcXN3j2SSbjVIN7Nl+DCzhFCUJ0qQOG7H3DuvpTuEOEyVhniynRAqga2Dr6JH8xmVg
 aS2U29Un/20zZBImRrNIQo8Ch3zWT2g5FqZ9b4S+ZyEHXyzWh5XzJhRQXg8A4CiIdWmS
 Z3xaNQs7/WIqPaHBzkwRO8NOglp0E7xR/Ql56cuoHqd6O1bY/QTe/u3ZB5t0ANkyOchx
 yPkbhu87V1SujdM3ptJX3i9OwFoubVI0C3sbC94HreJMZ6HIfcgtKjaBKpXorAj9mQBt
 fBzK8J41c6cBWrU+UJtLyIpgiQKtExQShY3O3GwAPqIu3T4a23ovn8mBRDXaCGBQWmtc
 7kPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kcXN3j2S
Subject: [Buildroot] [PATCH] board/broadcom/northstar: Fix defconfig make
 target
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, rafal@milecki.pl,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The readme.txt contains a make target that does not match the actual
defconfig file name, fix that.

Fixes: 1500b7d5c818 ("configs/broadcom_northstar: new defconfig")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 board/broadcom/northstar/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/broadcom/northstar/readme.txt b/board/broadcom/northstar/readme.txt
index 18c9b03c1334..523bb439e37a 100644
--- a/board/broadcom/northstar/readme.txt
+++ b/board/broadcom/northstar/readme.txt
@@ -25,7 +25,7 @@ device setup).
 How to build it
 ===============
 
-  $ make broadcom_ns_defconfig
+  $ make broadcom_northstar_defconfig
 
   $ make
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
