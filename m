Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09206C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 19:50:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62ADA610FE
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 19:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62ADA610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA2024021C;
	Sun, 14 Nov 2021 19:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzqlFlACDnN0; Sun, 14 Nov 2021 19:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E2A2401F0;
	Sun, 14 Nov 2021 19:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82F791BF5DB
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 736D680D03
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0sQWWBJ-_-r for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 19:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43FD280CE3
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 19:50:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c4so26273160wrd.9
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WysokAV+zdtNVMzZG3B3ONf/HJxpB/lzGe2UwPj7Kh0=;
 b=QBuMvWL2tMVgeJHai/m5s+/u7PuJDmuqMaKE5FF1pxEI0KcfJtn2BUzEK5ySG9i5+x
 UxvclZ9LpMxUuOoccGcmeFv1JMv3z2u+tgqOv4uogt+IdGQSDgkqIYjQgmCkgy/C4Opf
 oUTXvXG47h4YTS3HYl0RUe+j34o+G18VL91BhSDRY9g5uf/3lu5rkRf2PudTY5lylTG2
 hib3Rrr2ombG4bClH0lwLrW4wkupla3fcVTnyDW6MPca4ADAjT7FnNJHqy3eAMtk8qr6
 x4PjgNbyaKdA7JUtYcLkFZS6hqCKYSceZzDo9MyADra0H6a7g819hsr/vEmaQTOOlFtV
 HpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WysokAV+zdtNVMzZG3B3ONf/HJxpB/lzGe2UwPj7Kh0=;
 b=DyZrjK3Ar6SOUYnxloKfRhKhU8KzVw3ATfwM/ZMEICL2jHuz2TMsTw8qiq6fZSa16S
 g5MyFmSrSyRZ9VmiUVCSebSmbe6uGN3sc5Gmym+Zi9Aj8t0GSwlPcWM2fy9rR2lEugub
 DEwav5GW23PChA8e9DS/8smyoutWRdvOTEmiBR8aZHC4i6PwEq33K9dv1am2L/c1pJWx
 VX/VkQ6r/PZ4MNPvV5HfjU9SELfnolfsU+uA9BnNIkVXocVFmgkLZ7dU/TssVzXq/HIJ
 v34Ov+R/hlFNjDTfG0ZD1nSyal7QLGmSnP4ivCjJVTDlLElqzQtRMG2GklSQwqlg5BOX
 bUlg==
X-Gm-Message-State: AOAM531oV16misYshC5pjtFSu/krX870oATaZzVZNEV1IWActokW0RcO
 dPIDo0huy/0kEwXi3Buc1vhvr6r05So=
X-Google-Smtp-Source: ABdhPJyT30KIuoB1XeyzdfhKBQ94c93bOqCXU+7BL22oBTY5yuSZ2vbDrflYJQ19pF5aFvzRCJ5PMA==
X-Received: by 2002:adf:f042:: with SMTP id t2mr41375934wro.180.1636919400080; 
 Sun, 14 Nov 2021 11:50:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id f19sm22613605wmq.34.2021.11.14.11.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:49:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 20:47:56 +0100
Message-Id: <20211114194756.3137351-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luajit: fix LUAJIT_XCFLAGS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
d4e6e1b53b07b05d51ebfb70979608c144ac155a:

/usr/bin/make: invalid option -- 'D'
/usr/bin/make: invalid option -- 'U'
/usr/bin/make: invalid option -- 'A'
/usr/bin/make: invalid option -- 'J'

Fixes:
 - http://autobuild.buildroot.org/results/92a5188ef7f9dda3e417d3853b0c4067415f5970

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luajit/luajit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 89b164c96d..3367336899 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -47,7 +47,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
 		BUILDMODE=dynamic \
-		XCFLAGS=$(LUAJIT_XCFLAGS) \
+		XCFLAGS="$(LUAJIT_XCFLAGS)" \
 		-C $(@D) amalg
 endef
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
