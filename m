Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D40C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4F3A402F5;
	Sun,  1 Jan 2023 23:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4F3A402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVBKFS0wuv5W; Sun,  1 Jan 2023 23:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 182E8405FD;
	Sun,  1 Jan 2023 23:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182E8405FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43DA41BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA81404C0
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA81404C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KggM_IJjrbp0 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71DCB402F5
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71DCB402F5
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:01 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so16560517otu.7
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGe8uXk2vCu0Mr2k6JO87yEiHXIUEBLxEQ51YqbSoKU=;
 b=n8rpl6CaA3juOxW3SyvTBLtWT4IqZPX6K8z5/NAE+M1PxZHsd5svm7lVCBgswEsC35
 rrMmKkhVCDPHkhcUiheqAnMmOiqE7+SRXdkJIbNbx/kK4kXVp1yNfPOgzasYJQEom7Y0
 o/EBzXIkITAN7euLgZktcNre+YFjSqywHXadMiOxzO7WlZOr+SgNDV/drTA31bcRAgQP
 NBFDh8pGQxzBuqzQTRt5AuJ7mqVEro1FRx6GUzhZMOG6r2exorYLV7NlwlTnpXXAZ+PN
 7VIxjBqmWoJqcEJqMKsIkYI8Dm7GRQ7TCH5y1jsQr6IL9ehoLS03eHNEfac/iUIvNKDu
 8gIQ==
X-Gm-Message-State: AFqh2krkDLlOs6uZwZ2dve/oQOUotfVPYwffghhZzrVViTI8eQYhDnFw
 HLObqDrv8dS3SEOBKWYMU14pgJSKBHo=
X-Google-Smtp-Source: AMrXdXtO8d4ymO8CJzKnwAG7uiEMmRYH4ogwQw7QOMFj0ATntLiuX3FiuMRRnWkDiljY3GtLP0T6Jg==
X-Received: by 2002:a05:6830:e:b0:66e:c863:ea94 with SMTP id
 c14-20020a056830000e00b0066ec863ea94mr19615291otp.27.1672616400585; 
 Sun, 01 Jan 2023 15:40:00 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:59 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:46 -0300
Message-Id: <20230101233653.487175-23-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGe8uXk2vCu0Mr2k6JO87yEiHXIUEBLxEQ51YqbSoKU=;
 b=h+7/5Vr5W733upQy+UTciWoX8E34CAT9eEf8iT//4ygw81iR8ExWrsZUn9+vEKagSB
 U5RaX1nabfzsmMIel+FZyERqWmqZo2eHOo1m1XoRthNprR/mQsN8Ovp9NIbS12Kxlu+u
 0XSiCt2hQ8CyWbe2bEZY2t6bKY2GVe0ybhriRYiqEWr742bm6/weaktYyB0rWWwwZLTY
 RL/anqstdPkGH7A64AwJsOdWm6kfnu7unaVQYuOu3wnjEB4Dy+7xu5cAqoLtBWeY9U8e
 S2uMRlpCmd6XryccVV2r7qS9TExP7wuta7jUYAzvusiXTe4YJTc+jD44IAAXjrnFEgc/
 dcOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h+7/5Vr5
Subject: [Buildroot] [PATCH 22/29] package/rhash: drop dangling
 RHASH_ADDLDFLAGS
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "ead2afda13 package/rhash: bump version to 1.4.0" dropped the
only usage of this define but the define itself was left dangling.

Drop it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/rhash/rhash.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 8c33de1862..1f7456e4e7 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -12,7 +12,6 @@ RHASH_LICENSE_FILES = COPYING
 RHASH_CPE_ID_VENDOR = rhash_project
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 RHASH_CONF_OPTS += --enable-gettext
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
