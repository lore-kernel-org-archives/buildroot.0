Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79146C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 195E54163C;
	Sun, 24 Jul 2022 09:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 195E54163C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lH8sdEM5XsXL; Sun, 24 Jul 2022 09:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8A141644;
	Sun, 24 Jul 2022 09:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D8A141644
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1890F1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E520741739
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E520741739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 250Y-5x4-R1j for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E8641735
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96E8641735
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:10:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v13so4208141wru.12
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jkfgk+m7Njp4MW0jslqyA83j+1JopTHkMfI9d/2ZT+Q=;
 b=K5PKGselZ3JofP/oNiQLpM0Yf/GNgMTndstqLdrxrpXqleQN5gdCH2Ft+4OAO19qX4
 om4c85/7Roi+CC/3oAxVZaRsEEMm5fcuVERu1SAKZBm76zzITMaDjg+xbxtalmvvMmN6
 9TGu6j/nQSgVTadtZi+1+ZMjn+T393g1wf1ujKcd20XC6QjfVzQq9ykhWmZlae3x+VPK
 uq2tLX+5g9D9VTdMIzcRr2n7Jt6Le//bDQBx18BmqnGWQACn+DiYsMifUYwspkXEGnUB
 SnNlKZlVfe0truu1BMHdNclBX4/h9YMD9sMhnPX0nNNvLvVzjL2QBf7Mu0WZ+5W/WyIZ
 twJw==
X-Gm-Message-State: AJIora+2xU2m9G48dKISPtFHo6OEJAAz95lBl0thDBhnlIuf4sAPdXpc
 wMtFqZLjcmd/0mPLrjHd1P3PiixGM24=
X-Google-Smtp-Source: AGRyM1tRkaglUlrNFMjC16u4H25BBzl9rHRGhAe3sHQAtyfuDq0i+1gocHamx6Y7QhLZXMgTYQf8sA==
X-Received: by 2002:adf:e28c:0:b0:21e:660e:26aa with SMTP id
 v12-20020adfe28c000000b0021e660e26aamr4660609wri.345.1658653842254; 
 Sun, 24 Jul 2022 02:10:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z4-20020adfd0c4000000b0021d7b41255esm8862976wrh.98.2022.07.24.02.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 02:10:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 11:10:04 +0200
Message-Id: <20220724091004.4810-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jkfgk+m7Njp4MW0jslqyA83j+1JopTHkMfI9d/2ZT+Q=;
 b=DQ9rF6EG41XSm6UuRQ31PZj1iC5C21W0aqm0Pztyeg6WQs55G+H5FlHmOfntax7HcJ
 qn2zX8lGvyCHvV1ZIBKbvBa1OtCX/om85liooG2J8pj0miLH551aEFgxN0DQDDOtVpKa
 omqsjpw451vf3J5n6EYODciKFKXn9etcp0bpfGIz4J6kWi+ZmY/CjZMkAZsvZr0PdJKr
 I3fwGGRtCwsUfqxvWbU+xCrvA3tA8VxOAj9idnkPKrN+kWIJ4I9YmH6LeFQkNoq5h3hM
 RGgkaOBKevRDfS8nqhN5oNoPva2+h8mrzXyOkOlXEQQ+K7KWUraQ1RsvAXWKmmKHGj5f
 3b6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DQ9rF6EG
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to version
 16.16.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-32213, CVE-2022-32214, CVE-2022-32215, CVE-2022-32212,
CVE-2022-32223, CVE-2022-32222 and CVE-2022-2097

https://nodejs.org/en/blog/vulnerability/july-2022-security-releases
https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V16.md#16.16.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 716becccc9..12ae449ab4 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v16.15.0/SHASUMS256.txt
-sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7  node-v16.15.0.tar.xz
+# From https://nodejs.org/dist/v16.16.0/SHASUMS256.txt
+sha256  145151eff3b2aa5ebe73384009c52271a83740ae687a93c98c628cd7d52736eb  node-v16.16.0.tar.xz
 
 # Hash for license file
 sha256  6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index cfd9295d4e..3154dcd7ec 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.15.0
+NODEJS_VERSION = 16.16.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
