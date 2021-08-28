Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F52AC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:06:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8BB460C40
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8BB460C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B257340019;
	Sat, 28 Aug 2021 15:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4NSuDztdHT4; Sat, 28 Aug 2021 15:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03EC840101;
	Sat, 28 Aug 2021 15:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2451BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E8006065C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmZaqHTDvKYe for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:06:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44F8E6066D
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:06:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b6so15153646wrh.10
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vs7vyn/KxHvcd7jx9nCUst7uqt3rtEirGFckDgJPkvQ=;
 b=NJF01bHQPLA2SrughFz007xI22FV6rRocfd2wLuRJah1hmYYi1aVmpsACzPNPxeTuY
 wpBxa9+D6mvI+dE04wfiKWEmXcqLEQ5XG1N5JOltagnStBIDkUWxYrw2MNRt0F4qAK5J
 XUmnVbrg7t84c1V2EYG5VMteYminXLq5q6Pi/l8Qat3zlEEwLQb46ylW+Q8IQTBVvXQ7
 Tl2xBHXMn+8Rva+j9tvO7LaJr2yVa0tLwxtnand0I/S2c9fALyC46v5XL3PSHd5Y034L
 51iC1KlCxfL5pHX8MZZZQpnkCu2GLgsF1r7sLeVu+7iVbC8qVP1NwDjQbMGkNpwIeX/0
 ruKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vs7vyn/KxHvcd7jx9nCUst7uqt3rtEirGFckDgJPkvQ=;
 b=Idg6n5Ppht68vfQsySoj3PWK7zuoAe+rWqI02ZF3FwEXQYi9ByCffZ3QfN+ZTMKZvz
 BxExhs1zsYDQmCusoEQ5mQF9rZwdlqV6kt0tWlZp00T2Rd4vzRiXT5Yn0bPcR//IA7dg
 UMGYu5I3wHVyNATSMPOii1aI3nKYY3JShfOx/PHtGzk8oqnc71ls+lWMiK3a07uAMahS
 vIvaI2CA+FjU6qmxe1bQOFpWaxYn10QBJDxS/TAtanUa1YVWCF2zBL1Qr95EpFN3pArG
 IaQv3rR7kJRdSRFlgo/DwcVwe8DyG58zpQhp8hgfNefb/Go8S+ct8FSmAkUp2UmGAvW+
 7VRg==
X-Gm-Message-State: AOAM533jSHDv/z3nyntxGoACQJ0QJJ3zf3CZ6+re0osvc7wlNg71Kp8Z
 UtO9gE88k+yQbEoCMLjbaGmDgTI/+NdQow==
X-Google-Smtp-Source: ABdhPJzRHycYA9CfbHl3GkmQXsU7X75MQiB54cwqNmc7KKn6sWUnck0avKeeyitr9UDxWZH0MWaLVQ==
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr17109451wri.250.1630163180301; 
 Sat, 28 Aug 2021 08:06:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id o26sm4089504wmc.17.2021.08.28.08.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 08:06:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:06:04 +0200
Message-Id: <20210828150604.946236-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
References: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/c-ares: add C_ARES_CPE_ID_VENDOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

cpe:2.3:a:c-ares_project:c-ares is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ac-ares_project%3Ac-ares

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-ares/c-ares.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 761aa73280..71bfa110a1 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -10,6 +10,7 @@ C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
+C_ARES_CPE_ID_VENDOR = c-ares_project
 # We're patching configure.ac
 C_ARES_AUTORECONF = YES
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
