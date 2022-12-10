Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA27C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0ACA404A1;
	Sat, 10 Dec 2022 21:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0ACA404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c5DAdpjpF4th; Sat, 10 Dec 2022 21:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC152404A0;
	Sat, 10 Dec 2022 21:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC152404A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA4431BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B24D3814B8
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B24D3814B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpLVuZ3F5QMr for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:46:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD9898148E
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD9898148E
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:46:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h11so8439446wrw.13
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJUBVBzgUToBL6NccbD8oMdjamcdL3iOr9dnQX9RuOQ=;
 b=QAXbx2IuPIA9pnW7zGl2Fy51P49nai92ZzZLBJTkacy/YYxGyIdteiiFfifU/mKr9i
 odTPmm6hYjhfOBFowgQFcvQM3vkijtmXwWoCAnS7WNTFT/yWg3GEeQ1YLjpwXw/7XSvS
 O1LCoMOdawEiJHQIaKOuPOFAET9ke0I6C2lhUINqXF70PH1HDjXGjfgfRdxznOmMRXyR
 sIyu7QrlPZQAtfZwiI9IdVMn3q0lxg2GVAL5a6vu5cxo4ue+3v//L7ipn58h5zc/s229
 FdbOsiifxe0dNC7sYWVPaHRoC5xFJM9MtsjP4MscewD3K4iy0YNF3N3HuFs1uA7MWtEL
 7dKA==
X-Gm-Message-State: ANoB5pmNs1JlPcCzWSU4/1IOnauU99dyQYIMDHlmqvhdNXF/AkW89U+c
 5iYoFs2zFbj+R+CQL6S3RiV2F7vnJ/s=
X-Google-Smtp-Source: AA0mqf7yDo3Ah2+TQsP8kx03eRv5GcR3V2Gft/XZbYiJIeyYmxS4k0KWVl8VkwF0vuaBTGLtz0zdoQ==
X-Received: by 2002:a5d:690f:0:b0:242:2b3c:c7e with SMTP id
 t15-20020a5d690f000000b002422b3c0c7emr6868878wru.17.1670708811636; 
 Sat, 10 Dec 2022 13:46:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r4-20020a5d4984000000b00225307f43fbsm4707364wrq.44.2022.12.10.13.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:46:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 22:46:47 +0100
Message-Id: <20221210214647.40198-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MJUBVBzgUToBL6NccbD8oMdjamcdL3iOr9dnQX9RuOQ=;
 b=Q4TY3U38VS5yem+Qrb8boNDzGo2cKBew7TG6XuuiUQmvek7PlYYMWsOlnVaagmQQqt
 QCCP7RunoivTRJ/mB7ISDeVNq9EVY1BgLbwOYHQ/nwxf3ry872ryej16ZspYJp7q3ALr
 HdIPuJ4KJZ62F9E/l/fTNeL7sbwn2V/moKMEC8sKlKQrB4qDbHbTIHlNGL6QxEdKhc1y
 NNuD1j80MZDqjSRJGFI1WYbtFF35msD1GG8dRxveVsdqYswzCrlsSxla46M6Kp2Xnxh6
 11+Sica2Zo5RxvFdx9U/p+rC7wbdWShwMF/h4m8cGKPPMQRPPKDESEqDNz/HNdwSNvDO
 rc4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q4TY3U38
Subject: [Buildroot] [PATCH 1/1] package/smcroute: bump to version 2.5.6
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/troglobit/smcroute/releases/tag/2.5.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smcroute/smcroute.hash | 4 ++--
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 642a1f62fe..b472dfbc04 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,5 @@
-# Upstream .sha256 from GitHub
-sha256  2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3  smcroute-2.5.5.tar.gz
+# Hash from https://github.com/troglobit/smcroute/releases/download/2.5.6/smcroute-2.5.6.tar.gz.sha256
+sha256  0be38f617e322daafaa941c02423239f5c117b940cf0f45bacadb6733c4b3916  smcroute-2.5.6.tar.gz
 
 # Locally generated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e6114c9a8c..0c4f88ab1b 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.5
+SMCROUTE_VERSION = 2.5.6
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
