Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBDCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 12:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42EB61251
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 12:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A42EB61251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D182843AF;
	Fri, 24 Sep 2021 12:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JZJfG2d1Roa; Fri, 24 Sep 2021 12:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C648D80E65;
	Fri, 24 Sep 2021 12:45:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1ED1BF479
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 12:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E94D60667
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 12:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zy1GGSz346fM for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 12:45:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D8A1605DE
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 12:45:42 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id x2so10242195ilm.2
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 05:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Lf7wB3soc09CDfoKGZEustPgKPaHJbMf55ddaT4iHc=;
 b=nzTpN/732LzR0lphx8Y+/A/6LFn74sG4+FIxUqdy3/ZETtlyvmn2hA1iHXHcRZgwIB
 U1E3UuxkrEDWOL4ELmyoAt1KnX9TZarhh9dcR85ipOnzsPhCu5aYQw6nvQhkjIerc4sh
 /+MvHZeNu4oPraj0rCpnIeXbRrbe4DUoKaov8ZPqL6VqXvCdT9ObXq13vou9bv3N0+S/
 D0ibORSMqCe+8oCVZd/ei2+NvWR3vhKwSxeHHuQ3yLjpG9fELKk9vh/9boyV22nbuevC
 Y0KqjgO15c66pT8DtQNRY9PKDg6qrQS8moeTh1oVoIWjFRKwsMqSdIOB/Lu25IetAg7w
 jfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Lf7wB3soc09CDfoKGZEustPgKPaHJbMf55ddaT4iHc=;
 b=6uIGJBEp+gQDbUTpmKFJZkq+r/0evCG7565uu6n3MNvq2InRsddOoY4+nZ0acFfLJs
 CzfWp1yDPg2vdQHukY6DQs+hCV4J1OXjzpg/SSI93HLoX9AP/j0tQNZxC6pNAXd6Cq1E
 y1HaZsjReqo6z4r5WhNJ3nA9f1pSQhQ73c147cQ7Ecx018GU1qzL8h09MYBN7sf6/e6Q
 yX+pjqr7rv3jqKix7qNoxjuZfj3u5eXGOXIMoWvbR+vfT6YqFr5nDX9DS0jqUkNCzFze
 bdqEWRWohMqRCQJxf0KMSNNZ+KeoDhckgmzvRiwZWTDDjK5hZjy+xTZGtPRXT7r9CBiH
 K4gw==
X-Gm-Message-State: AOAM533Egt/CGkkcwNDpgnIGyFLrukWLoGUdbPZbfKwqgEXUIQ0SLWaY
 yW5FQTa2BUk+Cod3r0i382YnSwq0qlg=
X-Google-Smtp-Source: ABdhPJxGpxfsP2qvEBdy4NymlEUPJDDUIuEGP6hKy82oVgCQZKHJIENrJ/uXtBhUrt++XBy2gUcyqg==
X-Received: by 2002:a92:d2c7:: with SMTP id w7mr8048548ilg.71.1632487541342;
 Fri, 24 Sep 2021 05:45:41 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id c3sm3952692ils.61.2021.09.24.05.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 05:45:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 06:45:25 -0600
Message-Id: <20210924124525.168298-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: remove gst1-plugins-good
 from dependencies
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Philippe Normand <philn@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This is only a runtime dependency not a build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpewebkit/wpewebkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 5c5e6625f8..50714b4366 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -39,7 +39,7 @@ ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
 	-DENABLE_WEB_AUDIO=ON
-WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
+WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
 else
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
