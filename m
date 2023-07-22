Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0CDEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 03:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9367781E4B;
	Sat, 22 Jul 2023 03:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9367781E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6MBYqyp784W; Sat, 22 Jul 2023 03:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D84B681E31;
	Sat, 22 Jul 2023 03:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D84B681E31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DBE81BF28D
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 03:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61063400D0
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 03:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61063400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrU1spVoy_TV for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 03:23:38 +0000 (UTC)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C2E84000B
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 03:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2E84000B
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-76571dae5feso239222885a.1
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689996216; x=1690601016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9l041dGVLnETUU8Nb/JL3L8WxiJ9Ry52m6O4Po+caI=;
 b=eC7WspAi4owLa1QaX44qqg2oTYwRdmxzQXObx+JyJWQ14fxbcrprW1CUx0OgmCbfuE
 4rK+x969V4LGRfgcYXo/7Ay40n0Q84vXyrATV4fkLyw+PTBMM30QAHx+eEOcdiIWELZr
 hw5OMdYYwr2PvwIauj5gYjnkx7t8E0owEhVzl1hyR8zeEn5s1WlExIjgAi8PeNfTQrZc
 9Q3DM1rx72F5v+tHfWiFy3uhh/AM9IjNt7tQ7wilmhTUoZ4OqstAdvsQXDJdD3+Awy4b
 lD9q6nwDambQQ9jaXq0nFt74qFCF1BAUOpr8Hai9wBeFfGnRGuIUGFy9hZL+/i/GOJs1
 c8/g==
X-Gm-Message-State: ABy/qLaHdR96ieZd9teG6aKeF4H+vZOYjawXU0b0piEdbHQ1WYbQJQTR
 e5HK6oww0tfOEighSAOfbq7ev2OFhi2fcw==
X-Google-Smtp-Source: APBJJlHBKuzC+Y8b7if8zmij7ywnlZl/j2sz8Qmq4FrhJsgM9Akg0WZdcEYkKBiwjunDT4pgPTsBLw==
X-Received: by 2002:a05:620a:4309:b0:767:f49c:1d67 with SMTP id
 u9-20020a05620a430900b00767f49c1d67mr2237246qko.1.1689996216477; 
 Fri, 21 Jul 2023 20:23:36 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 jm24-20020a17090304d800b001b66a71a4a0sm4257569plb.32.2023.07.21.20.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 20:23:35 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 20:23:32 -0700
Message-Id: <20230722032332.3960-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689996216; x=1690601016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s9l041dGVLnETUU8Nb/JL3L8WxiJ9Ry52m6O4Po+caI=;
 b=k23JiqmirYlIf/HUd/XchveazoV0VVCkIe2jj1+kzltLAI2ToiyooF7GUwlej3c1rR
 ar6tQp/Hg3uqwmFZP2/qIOM+0XUEaSorbUjlPrhuWvi+DEm95hpqEOznxfj001rlhPme
 YvJF0NylKHwnEoNqbEYvNf0F00lYY8TJVC/nIRgELtnFnRuionI1oqjl4cT+09BRBUd2
 k+ua50gdISUJ1wGuhDr/lJFPRG6vdKNJN+jDy3UH/khobIlQyqxKDwqwWe/uzwxq6niI
 waBgdbgRSh24VC6VCGdBhyyK9GTaictvwuYyw4J9vjfFCjx3mZCdK9qmA2nsKXgm3mAl
 8AGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k23Jiqmi
Subject: [Buildroot] [PATCH] package/linux-tools: Disable libtracevent
 detection
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 marcin@bis.org.pl, d.lang@abatec.at,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream Linux commit 6898e60f709b0047206110d3ec9f4612210e3ff7
("perf build: If libtraceevent isn't present error the build") present
in Linux 6.4 and newer, Linux will fail to build if libtraceevent is not
present. Since we do not currently have support for libtracevent in
buildroot, pass NO_LIBTRACEVENT=1 to get perf to build again.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 122c7cbbc42e..ee308a85dfd1 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -27,7 +27,8 @@ PERF_MAKE_FLAGS = \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
-	NO_LIBBIONIC=1
+	NO_LIBBIONIC=1 \
+	NO_LIBTRACEEVENT=1
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
