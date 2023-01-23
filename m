Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24320C05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 05:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 732C0408C7;
	Mon, 23 Jan 2023 05:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 732C0408C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0DNi1fbVf7c; Mon, 23 Jan 2023 05:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A6EA40474;
	Mon, 23 Jan 2023 05:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A6EA40474
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 240231BF5AD
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 05:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F347E402EB
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 05:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F347E402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvEjA4ccz8jl for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 05:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B522E400BB
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B522E400BB
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 05:18:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id mp20so27488675ejc.7
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 21:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tyQv4yfQNJkEblwzibmzXnTQntcLE9y0JdqU0MAZSEc=;
 b=SZiyqpESVowO6X/On5HWk5MlKFaCi/nwfFneDe0r8Pr3IqOgneg+st5ubya20K719z
 8D4jACFrmCw5/H5gQquHk96+en4L3rHWOtkMeijBi8oZA/VubPldp3PEVdgHng9ksd63
 37wcN/ttxK3YhyzdentarU8xygu7MJ8RLYTU8Q3HkScmdnAsfDYjX2mZrCzbrwvSaHIU
 ThKtnEq6W1Rd+AtDBgboHCB2TdLEBKE5nUHoA2CwAgevMm+gkdsqiUh9nKiGpfSqJT+w
 UrhXVAWMkDMN8GYNPrQ+M+DxToEJd2lcrMyFZLMtdgad1ZJy4mNIGGiL/4/bFLf4/f0k
 JXmA==
X-Gm-Message-State: AFqh2kooS/zm6lKdq8SPq+yfc03ry42vBzl10Y7Zx4pF6kAja+cJk4gn
 9b+atBjau9TD6db4mVJ5CbeK28P2Ick=
X-Google-Smtp-Source: AMrXdXtC6YgALjVmdBbgVLcrOsjgFj5c6LdnbTb6QW8cvzSpfVA6jUHdNnE6iF9Ge0J5grlQiWN/Qg==
X-Received: by 2002:a17:906:81b:b0:869:a799:1f85 with SMTP id
 e27-20020a170906081b00b00869a7991f85mr36811168ejd.76.1674451091609; 
 Sun, 22 Jan 2023 21:18:11 -0800 (PST)
Received: from luthien.lan ([98.128.186.71]) by smtp.gmail.com with ESMTPSA id
 kx5-20020a170907774500b007c14ae38a80sm21443943ejc.122.2023.01.22.21.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 21:18:11 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 06:18:07 +0100
Message-Id: <20230123051808.2213859-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tyQv4yfQNJkEblwzibmzXnTQntcLE9y0JdqU0MAZSEc=;
 b=FVhYtPodb9Nny8Jz34B2RDxRPf7WfYLKXZ0Q7dvFPkmWZ7uA63mwHII/BElVajKtfr
 UOwrTD4il5PFewshmoXqn02dC0aokzBcM/5kefudk3Ng9sK2gSeyhtX1g7IJMhOpaJU5
 yjwUIbgZdxMglB0mbTRqGwwzR72uDmbd1z+ckN8JXR6OtiAjh8tLq1+f2HbnUGaNbd4L
 dh7ei93AhffNK8LRMTOea5O+SObAo5hMvOMnfbu6OIAOaTq61nDbA6QziBrFdd/CKQQ2
 1vNzDUY/nkwMLBw5Z9FkCz0yhIuv/DWsMbC0lhMwp/fVImuyzl3dYgcxtf2mlBwK/r91
 6e/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FVhYtPod
Subject: [Buildroot] [PATCH 1/1] package/ssdp-responder: fix misspelled
 define directive
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/ssdp-responder.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index fd7b1ea44b..d40f6f8c57 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -25,7 +25,7 @@ define SSDP_RESPONDER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50ssdpd
 endef
 
-define SSDP-RESPONDER_INSTALL_INIT_SYSTEMD
+define SSDP_RESPONDER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/ssdp-responder.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/ssdp-responder.service
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
