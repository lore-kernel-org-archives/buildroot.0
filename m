Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D185C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:54:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29E061261
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F29E061261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBE394040B;
	Fri,  1 Oct 2021 11:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lq1rCgfZ1ryE; Fri,  1 Oct 2021 11:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E36C440218;
	Fri,  1 Oct 2021 11:54:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4561BF5A7
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A97480F14
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUSY6rTfCnXs for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 11:54:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C174D80EE6
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 11:54:11 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 rm6-20020a17090b3ec600b0019ece2bdd20so7040241pjb.1
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvSibW9+R/w+6Mm1+jU9sLRT88GCNfSbhAhsPtPrJwY=;
 b=PPQkLeaDGG+uf3DAgEp9pka0ye35a+/DnkW14cq1f6BmisRu5glS9RDKdp4KzD6FTu
 o8U+WXXMQWuYFV36IvnXkvqQ+s/y1VmCKqCbKN7THRwMl51haeueIPRicel2SIFI3Uvw
 qPIVeBVw/nw4ofx7P+cGEEXWipxcUBYnUx2gUeIWywLI9mH8+8q56RmM0DlE9KTwVjzK
 AN49+KmzAUvECFjoUxPRJTK3UqHeFMN2tvE310PwMzANNQJb0uxHpKe49bh7xeSSQi2/
 +oXUTlvwRdEZFgC0YkQ/2/npaQi9FvuuW+HJLakc5rywuAwtcSOMZTRuJxd74j1hahsK
 bXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvSibW9+R/w+6Mm1+jU9sLRT88GCNfSbhAhsPtPrJwY=;
 b=0C4RFbfXJg4MkpQemkrpwDdRDj2/J43WZxPkbcsG1KYPv7zROX36JYHJChqNz4y4kl
 +WaWjPMuGtpYLnGdSbBLMiS0x5fAP+Mh2i7AmxvadYIqkHErrkWMRfYZaEGogxLuTCNJ
 6dGtXoFO5CfKG0T7m0aBn2k7mZWS7WP6kZ3DCycgyS9/QDgsk134MHu7m60Uq4tS8Flv
 yPUaKOZ+PLxNU6aU3oBGsvXZdUKb+YrC8x0GMIFttQhMpNC6TyJX8NUaG3khTbZRo/jX
 orZDvqIOfP/VTtpUGUTu7lj4O/usrMopkt/+zeB/TN0OhxvxxnAqobqP3vCMrOHAu8FV
 a7Gw==
X-Gm-Message-State: AOAM533AW1/MOP9ke5cs+jzV4AyEi3CTeYJeECd+BTZ3qxVgnX3KKN2z
 tiEV5MNImUUkYk3/EUkSy27W9hR5scE=
X-Google-Smtp-Source: ABdhPJwiTK2PBB/lYOpiDoy4dDk0vFr7RicCNtcdOnw/qkX3rOGi0ojG4s2M6hihZndG9cH2HbMz4w==
X-Received: by 2002:a17:90a:bf91:: with SMTP id
 d17mr3189723pjs.158.1633089250879; 
 Fri, 01 Oct 2021 04:54:10 -0700 (PDT)
Received: from localhost ([113.92.196.248])
 by smtp.gmail.com with ESMTPSA id l18sm6515097pfu.202.2021.10.01.04.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 04:54:10 -0700 (PDT)
From: Jianhui Zhao <zhaojh329@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 11:54:07 +0000
Message-Id: <20211001115407.3229128-1-zhaojh329@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump version to 8.0.0
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/rtty/rtty.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index b2e9db2436..1b46aff47c 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802  rtty-7.4.0.tar.gz
+sha256  b9c555005b76c1ad0f5af891964375bbdf50ee22b9a9f53ddd48d2cdb4e53b49  rtty-8.0.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
