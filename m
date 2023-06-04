Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8982C7EE29
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 11:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E04341B74;
	Sun,  4 Jun 2023 11:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E04341B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KO-DuSvOhWX; Sun,  4 Jun 2023 11:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4559041BB7;
	Sun,  4 Jun 2023 11:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4559041BB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0B11BF2B1
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EEC641B74
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EEC641B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5Q2NB8pSf3W for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 11:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364C5418A6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 364C5418A6
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 11:06:55 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f5f728c4aaso4164872e87.0
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 04:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685876813; x=1688468813;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3bF+Pmd+XbJED8J39UGJM3tXdmf95DiN6gx0Lv+SOPo=;
 b=XsvZqfKAOdlDMYmcnU1XvE+DHFkwm4tkCKEYwt+lLQhgjUmbKxFINVfn+vH8RHn3BO
 8dp2MAshyO9gzUpT7dHxz/DvhU/Tl10nGfa/JdrmFT55FPj0bH0qZ9b12qr7RjY0zcfD
 k+MGa8J+7WV8Uxlf5i4YKv0tktLa0NCtEdDKa/1fYACiQBtUuoZCjT+NxQx4QkG8zW9E
 49S0BIyCSCvv14X3osya6r8mqjU1vhAT9TgjmGsKoQ3bD2aKxvqRBRSZcz6yVEtqGKL6
 za5pBqFASN355BPGrAxpGO3Aye0pHjYvoLl3PiKxZwsuai54Z2EG4/7+5vWt4lyCCYGD
 FeAA==
X-Gm-Message-State: AC+VfDy/dc9Pe4nTuDW02Km+4gWEyvs+SRq9/PCjU8H3YqA8JfYvAfX8
 TC1baNHRWWfJCyIZNfXtaYkSCdld+EE=
X-Google-Smtp-Source: ACHHUZ4AetE5n1KjOJqxOKT7C2qfQ50+/68B8Uf34gAbU+ZnWUoKsruEtZIoCEoLj4FAFGA/V4/QCA==
X-Received: by 2002:ac2:5325:0:b0:4ee:fdd8:a536 with SMTP id
 f5-20020ac25325000000b004eefdd8a536mr2312587lfh.8.1685876812652; 
 Sun, 04 Jun 2023 04:06:52 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 v6-20020ac25606000000b004f39bb71ed2sm748799lfd.138.2023.06.04.04.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 04:06:52 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 13:06:47 +0200
Message-Id: <20230604110647.3418706-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604110647.3418706-1-troglobit@gmail.com>
References: <20230604110647.3418706-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685876813; x=1688468813;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3bF+Pmd+XbJED8J39UGJM3tXdmf95DiN6gx0Lv+SOPo=;
 b=JWskXT29jLoDmOlKZ6VGvAwPPI4yfwPRO2+coiM3ouhF2DcwFGOdKgisQNXfzj5iBb
 6zBl6V5Focq5pE44NyusmBw+qmGy9ZPI9GeZ0zto5itm76AmU0GEozPU7PD/m5OxO0zz
 8ZGNL4m4MiOv/iB2IjWAJq29j3gZIFBP69VdM4YOqgEgkCcxzwHpyvNx8TAmDd9sWoMz
 6+2EQe+E7ywnXol6+ingtNxk3qtPm4/QaLSPLmLdKGB9/vNwvGaaK9lAIDTC0ebvqS3z
 aYlQmTg4+mP9k3X6mWbioz/DjME/kMJCV27bCv38w3WRwwEmVjrOnkk5+TpaAvNv2Yze
 FuYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JWskXT29
Subject: [Buildroot] [PATCH 2/2] package/ssdp-responder: add /var/lib/misc
 for systemd builds
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

Similar to dnsmasq, ssdp-responder saves state data across reboots in
the /var/lib/misc/ directory.  In the case of ssdp-responder it is the
(per-device unique) UUID that is generated on first boot.

Workaround only needed for systemd builds, the sysv skeleton already has
the /var/lib/misc/ directory.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/ssdp-responder.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index ddd87bc599..bb17641a9f 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -25,4 +25,8 @@ define SSDP_RESPONDER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50ssdpd
 endef
 
+define SSDP_RESPONDER_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/var/lib/misc/
+endef
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
