Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F2FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:19:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7F860524
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A7F860524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA64660AA7;
	Wed,  4 Aug 2021 01:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EA2Is7dZBfJH; Wed,  4 Aug 2021 01:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5946060AC5;
	Wed,  4 Aug 2021 01:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2B91BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0919B83AC0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDUE6bVmdRVg for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:33:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42EE0832C6
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:33:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id u15so15751wmj.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sLK96N2RSEWlaxeSX5OCxApePCM85PZqTFRwFOvQfQg=;
 b=Y61mP8rp5+ziHpksUDHvxL4A0lINSAWyBDAx8GnecRRz5IRwqtL7McqreCdCrLaE3B
 vDWct2Tyz9RWryrM5iyOjYBEV+TehLdIGXmwZs2BmSRHY2yxcvY3fNi0mT4oNUfotG8n
 ab1/Wu4jbR7Il2RJc2BIBn/67ObRICxyQmv0cyyyQXxV2emZMe7lTXryTBx/ZAUSdv4d
 FXhN5wa1Mq90cCKKNJrvu88mOUlLK4ZuHnOdOknHxC4mRPnnQMbp/43N5Hpyft5cElkq
 QXAH1dNIiHYU1zaQaMJz0vhSosDB6slOvuaV8dFu1QX5THUZcq6nie4p+b+u1ii21Yc6
 LfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sLK96N2RSEWlaxeSX5OCxApePCM85PZqTFRwFOvQfQg=;
 b=U7fJL3KicYOg7R7RAyWRrMjdv/TyEVMe/dob8dXF75Vf+JqnOZpNOEj3h5aJOi82/p
 xH2do3WkpKJiCvnHrlb13GEnPwobMc54M/BZyh1ewupFj0AagJPe+rwkQKGiVPw7ZVg5
 MxfamSDhw/Ej4EZxy+F+6hp2MdM8XKR9KKvF13zHKYYff7XS0zW8iWNtaoRAP+e4HehI
 nklRYKUluEckkCKx7lHYbdF+S21ZRv+z6/AGxU//FOx0kGws8V5bDpk2IJokPL3jfpop
 q1GqDmi8Js7C0ACm4rwiGGnun73FB8DoCfW0Y2mXzoCZnHyiMwgicLK0KQHsobCO5MU7
 UiTQ==
X-Gm-Message-State: AOAM533gQJxGFdet/jO6LuFQiPJtmEOEB4XfzFG3SBd7rF7VoBREvMsZ
 bkKhK2M0Vk6DSmb77RjbcnlEIbJ1bDcD/w==
X-Google-Smtp-Source: ABdhPJy+Qsl7g4sprdd02P9bIM5/3MtVTXC80FmdipjRimSSnU0MS1TEuK0sFxB9QqMi8dz10hP4Zw==
X-Received: by 2002:a05:600c:41d3:: with SMTP id
 t19mr6304937wmh.157.1628026410169; 
 Tue, 03 Aug 2021 14:33:30 -0700 (PDT)
Received: from kali.home (pop.92-184-97-75.mobile.abo.orange.fr.
 [92.184.97.75])
 by smtp.gmail.com with ESMTPSA id c15sm90301wrw.93.2021.08.03.14.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:33:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 23:33:20 +0200
Message-Id: <20210803213320.346159-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hostapd: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for hostapd is added by the services/hostapd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hostapd/hostapd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8820254f89..e988999d3e 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -31,6 +31,7 @@ HOSTAPD_IGNORE_CVES += CVE-2021-30004
 HOSTAPD_IGNORE_CVES += CVE-2021-27803
 
 HOSTAPD_CPE_ID_VENDOR = w1.fi
+HOSTAPD_SELINUX_MODULES = hostapd
 HOSTAPD_CONFIG_SET =
 
 HOSTAPD_CONFIG_ENABLE = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
