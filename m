Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C883C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 14:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60AC960E8A;
	Tue,  7 Dec 2021 14:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRrZY-24D7wC; Tue,  7 Dec 2021 14:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4AED60E82;
	Tue,  7 Dec 2021 14:34:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 576F41BF304
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 14:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5050E4056D
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 14:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgzVV-523sEg for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 14:34:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A576E4057A
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 14:34:48 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 14so17315173ioe.2
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 06:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHasB59jflQQ3qXAje+vXpKGp/XHz5D+sytJMLwsilA=;
 b=nxYayVLJa+AobhEsJq9RSG4+N99ENkuo2pJ8lumnWNMnx/fQ/lY/XhBhD9DmWsqpil
 JnDrs0U7F1SJjU9mg23ZD0JChDr3N1wgPjX6Hr0w4UuHtVqxt9b0NCuK8yMZmJ4Xm5Yc
 IV9moU1+s390sT2xkp67srLaEvmfUEgwkrNu7iLT8lOcmUgwLM8Ce52+JqOdfES+cz0J
 SXFONQ3v7u4aDoARdgfeyttRR/bIGXPh4ix2c/OqWbcbJJ3yXeloFEMGAo5bAD+W3HvZ
 tGWw+a5oEA0t10dw/jUYARVbEs5FuMwD3KaOqwl1VjXJC6hR7Ff62r3W3t7qBHBacBG5
 jp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHasB59jflQQ3qXAje+vXpKGp/XHz5D+sytJMLwsilA=;
 b=PauKgkn2wUA+x0/0yuRiD08pkZor7AQ1d7Qx890IbDZbqXvYpuZ86G416KJldy6mZo
 R5o+DFg1ZiDUcwdHN4bB+eywRNoiF6SWqLIFES59Oe+wVAYs9X9OxyVeB+KAb/LuSUFN
 e6LY20mJ9YhncP17hpQr8wu9v+o0q6VtIPou48NyZH76t0CaEA/2Jx++5y76cB2QtSg6
 xJj5jN7WqTM7kryeSNn5rLJsYyQ14XU6+6+pDSqBJ3ZVjgvtcF3dU6lr+X+Y0TQflCAH
 Of7gkp8oxDugvBqiBc8G2X97LnnDX0PUDAGfvpJ/EeyVA1u1rLM8jVy2IjUR3P9yraHw
 Eutw==
X-Gm-Message-State: AOAM533VeVg3IUYzApzQXnNJPvjBXeMcC9NrSYQKQHdXQNaaK0lTfwHe
 ComT+iUjOpzZGyVWXFZhNCEWcVhQi8o=
X-Google-Smtp-Source: ABdhPJyfSFt/FEYDd8kWz/LVoKdQPBmiUA/lstTR0eDgNn3PG4Iu+JT6FTg3R7aDE7o1ilIgRUl7iA==
X-Received: by 2002:a5d:8896:: with SMTP id d22mr41589814ioo.141.1638887687562; 
 Tue, 07 Dec 2021 06:34:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id h11sm9628270ili.30.2021.12.07.06.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 06:34:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 07:34:29 -0700
Message-Id: <20211207143429.2821436-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: select videorate when
 building with media-stream support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
ERROR GST_PIPELINE gst/parse/grammar.y:857:priv_gst_parse_yyparse: no element "videorate"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 8357051e93..36523bdb41 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -109,6 +109,7 @@ if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 
 config BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
 	bool "media-stream support"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
 	help
 	  This option enables media-stream support.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
