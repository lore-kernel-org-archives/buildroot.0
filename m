Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC4C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB92C80C4A;
	Sun, 23 Feb 2025 21:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aAZPKGeLVe2; Sun, 23 Feb 2025 21:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA8B80BC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA8B80BC2;
	Sun, 23 Feb 2025 21:14:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3658943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95F9660B77
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmGSI0NlABuy for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A11060BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A11060BB4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A11060BB4
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso23872545e9.2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345274; x=1740950074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FM4Cti1+YyJT4/EUILExUsdomflGG6IHA7YzsZ6J7xY=;
 b=KTfQ+1vU122wASVRtqbNfbpwX5Qnm+mwb7Mm+l4IE5rze0F7Ysbpau9QOLzpOzDky0
 lcXhW7STv7PUtbGuh74I4AHilrzvnJOHnCmEXd0JYRM+AmPI8T8FQ+XFKz5Mf8GlCHzy
 xRHRE7nwXolGtXdx3Tp30rNdgsfvizFzLiZSNXVVCud0hUHRUAb+WX5O1h9t2JMe0r/Y
 uMMR24N0Vv/sOH0GIPbyY+r+isXq+YvVg/IKA5UnM0QYGEz1P7BdCp3s8GYvBQBvGSx4
 xxF7y45xHgje5mXjGdWqRs/G/ghZnyHKsTo25cfp83sHnV2pfTufZN9kd401lZmIZ4We
 gMMA==
X-Gm-Message-State: AOJu0YxeeE+lSzLN6lE6RMeEXBSjTLpKon9tQib/YaEL8W/vc/C+nfZM
 JI50EfG+glN+a24uzQLxXW/oVU7Hp340JQsCZnZqd4CfQittOrFkRoeU3g==
X-Gm-Gg: ASbGncul7YRvcdOOFAk3ss63wWgEXhRw/JN80s6EFiE9mcKrkDMQouk6TiFVxStzXHM
 MJxLGGEyImsUB22+Cj7+yjVjJq8PQTFRmopBU33pvDy4J8/UTz7jdVf84jG6uNVpOEIa+2vyV1y
 U47DnfYLn5WGf9RGf70yJ69cc0skD3irmV+PGKWN3+ixcww2PJRcApsEe4NE6LVg1/uVnlqcwLe
 pVIu/d3JQbVFJX4uIuFCjUXlzT8ph0NKinDczgUyWLj8Tj2kcxgx+RbmThcsng0Q14djHSDc5Kc
 xjS0lZ8QdcX+XVleDpjcm06QsxMN88kZM5od
X-Google-Smtp-Source: AGHT+IE2EqLUV7sIYOGwFf3lELRipR2brLliEeZtwSpgIBOBLbpmWVHsohFau264/oZnI3euVM17Ew==
X-Received: by 2002:a05:600c:1c01:b0:439:9f42:8652 with SMTP id
 5b1f17b1804b1-439ba176db4mr49767885e9.17.1740345273882; 
 Sun, 23 Feb 2025 13:14:33 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 23 Feb 2025 22:14:26 +0100
Message-ID: <ac0db0d8eca730ce7d8b0763e750e72fe4e3aa1c.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345274; x=1740950074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FM4Cti1+YyJT4/EUILExUsdomflGG6IHA7YzsZ6J7xY=;
 b=TF465Ds/hPnfUkbmb8+8i05zX8m0CD25yxh5JruT/U8mAdfV0/Mn35MDzOHhW7EW8n
 sNXOdaRke3+DJ4O8HsDZx81KdJQASMoyJip58kAn/5KYBc6cI2F5YXreDaJyFoaGBdxn
 yOz3Rnbj5QEQqUzVWeXvfFFwgpCDs+DUsf8hqW7hJvKU1/dzthIzlJTRznDmR6d6oPRM
 CzjONuM6dRbk16YDdN18O5oIPZOh70pkqVbiC5+LEug0YgUiPGtD7IAxlPOtozuUwEoZ
 hl+nWRjNcWDvLd1Pke23fphhOXv6OrVnaTbU5ut0E3ENv1pXSysZ9bN817hJlSj86W8V
 UO0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TF465Ds/
Subject: [Buildroot] [PATCH 2/8] package/shadow: install to staging for
 subids
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the subids feature is enabled, shadow will install a library and a
header:

    $ sort output/build/shadow-4.16.0/.files-list.txt
    [...]
    shadow,./lib/libsubid.la
    shadow,./lib/libsubid.so
    shadow,./lib/libsubid.so.5
    shadow,./lib/libsubid.so.5.0.0
    [...]
    shadow,./usr/include/shadow/subid.h
    [...]

Install to staging in that case.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/shadow/shadow.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index f0a2b57b4d..2937a9601e 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -46,6 +46,7 @@ SHADOW_CONF_OPTS += --disable-account-tools-setuid
 endif
 
 ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
+SHADOW_INSTALL_STAGING = YES
 SHADOW_CONF_OPTS += --enable-subordinate-ids
 define SHADOW_SUBORDINATE_IDS_PERMISSIONS
 	/usr/bin/newuidmap f 4755 0 0 - - - - -
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
