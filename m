Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05254C433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 15:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974AD4025A;
	Fri, 21 Jan 2022 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNBfKnKyfuCW; Fri, 21 Jan 2022 15:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C024026E;
	Fri, 21 Jan 2022 15:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FF071BF423
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B47840260
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKCceoaYlUVJ for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 15:43:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6D2F4011C
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p2hoc6wf4fOMQE3HFeuZ4m1UxCAwApvy5jOdpoKEbFA=; b=JXfE6lmxlXXwAyIReT+vBzEI1F
 8Mm+Nfoqe8IFm54vlusV5Fubuoy6CRL6RFyx9bPE1d491UWSYDnB8Ly/xesmDbaUGmftau25mendb
 FyTkiGTKGKz2dYY98IFPCi2V9dPLIsI8EB+IWmikPr6CFd0u7s9XXkOcRKXSmtLCoS59nTAr78hrn
 imW3kD4KPrz2C9Jqdi6H7uvySZWHI3548MiRUKT3N7Eyb+1C5X/tBQXlExNGJL2XRHtPn7SM4vcyx
 AGNf/Qzv7qUG6w+GQkehfq+d/mjALPypq+OMW5QLYADW07CQs1GWipnJF1uyxOoxRyz+v8uvKAAAk
 EzyFv3aA==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nAw44-000BD5-TA; Fri, 21 Jan 2022 16:43:01 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id db066d08;
 Fri, 21 Jan 2022 15:42:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 17:42:34 +0200
Message-Id: <20220121154235.798255-7-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154235.798255-1-aperez@igalia.com>
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC v2 6/7] package/libcorrect: avoid multiple
 rules for same target
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, Samuel Martin <s.martin49@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - Avoid CMake generating two targets with the same name. Needs
    a better fix sent upstream to tweak CMakeLists.txt instead.
---
 package/libcorrect/libcorrect.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcorrect/libcorrect.mk b/package/libcorrect/libcorrect.mk
index 0a84aa5c26..225111a64f 100644
--- a/package/libcorrect/libcorrect.mk
+++ b/package/libcorrect/libcorrect.mk
@@ -10,4 +10,6 @@ LIBCORRECT_LICENSE = BSD-3-Clause
 LIBCORRECT_LICENSE_FILES = LICENSE
 LIBCORRECT_INSTALL_STAGING = YES
 
+LIBCORRECT_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
