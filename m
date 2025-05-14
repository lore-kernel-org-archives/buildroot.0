Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606A8C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE0D414B6;
	Wed, 14 May 2025 16:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h79MW8S6nPE5; Wed, 14 May 2025 16:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F7CB41486
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7CB41486;
	Wed, 14 May 2025 16:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43FA8153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3591940B29
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JevgNpDvW8nK for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B17940288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B17940288
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B17940288
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:30 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a1d8c09674so2438f8f.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241908; x=1747846708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Aad9Ehb+NvM24EiCZebntcBCguNNQFa1o2pU5fZw9MA=;
 b=uaLgYn2hV0Y4wHLepyhEoxQDKOEVjG4hTfnVdtcOOo46lLkV6mVN/DRnHg3hwfA0yn
 oDHEqNleE9EUy/t/hbXYRmMdM0whvw1BhBScBHMFAoYdn6NArOSFlq4mvtQds2W9WrbJ
 CLKekK+ckys040IE9XYcY5Wo4Mga7Srq8g6ah0DszM7p/hqnJDPfWjNzIQwV+GZF4QCn
 Qo8s5ME++yqvZrwEQbfK4zaM+HsRcIN5qbUz8+krYRytnGnztfy+8+nARAhp6rpWaopr
 Ia2TOsKKpJgzRxCXWTI4M304wwtmyT/4Jy2O9rzuvgcCHwa+pTaMZFeCdyonieCo4mOJ
 qF+Q==
X-Gm-Message-State: AOJu0YyweVn36J2sHHjqWo6mLPqIA5Je9HGtY04aSgOpuc+5s/GOzaVk
 28tf/xRAyEWAISx7WG1z1LLTmWgHJiFey/DeobmxPa6YgllE5nO4LqyZ2Q==
X-Gm-Gg: ASbGncua09n0XxcmvqhrL62lQc31YUGFc91RUlJCvjHg/Z/r6fhHO12ogqRZx1v1PaD
 5ZRx62zLr5CeJY9lu3rtxnNGJgvXhYvicV7QP8Ib4Jc/YHg3B3Bd5NWFM2Hg8bQkImLIOnlRZTt
 DOWAubmlpSDCWWS78cZQoEBhPpoM0jWYENU2TYc20PZw83MHnpcB3dco2xhA/l3cOff/0S/RXzn
 qViKv/pgUECZlfkj+AJrNIhf1PSxsaKFiwLAk76HrZis7Jwf701Kr83+WFR/nC8Dmi/0ZjI6x2l
 0MqoQ0UuK/1Fw5e3ryNYqrQesoG1CW6jtgIB4Iagt35FkpJ+l6LIz1/0Tdab8w==
X-Google-Smtp-Source: AGHT+IEKs1rxeiaN0x1Hbw0rDeH4ru9Ea3SOKQ4jrd6zYK4tbt0Vmmlfa19JsVhZhAHOm8XIegpR+g==
X-Received: by 2002:a5d:5f8a:0:b0:391:952:c728 with SMTP id
 ffacd0b85a97d-3a349694210mr3541459f8f.4.1747241908335; 
 Wed, 14 May 2025 09:58:28 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:28 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:13 +0200
Message-ID: <223330b5594d5cf2be499bb693578d369fd890d1.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241908; x=1747846708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aad9Ehb+NvM24EiCZebntcBCguNNQFa1o2pU5fZw9MA=;
 b=UhZTGd020Tz1C/gD6eifXAlkX57PF03Fu5voxJAh78/GW6P8si+Pv3dBN3ULdWqeWM
 kzqodmwFcgNmhRqATPN8J6uuW+dVh81xEGcYl9ALM++zJxKS8bwqx9ZJq/Z6SrRyi5H3
 xovR7k86rXZWEuDCpzicKkNUIsdPyf8VWGJmEfKWmlQl+aB60POt/UOUe87kmGqCfvYs
 wRgd1j0rIT8ny2pDca8cPEHYb3T8uaImaiFBM9fGfw5BGBRwWk9K44SfLQypi0jzgWZA
 Aauwargg7ZH/38/8H+JYFa1O70UP6E6LVs9qGCtlEmo6OqTkuS7GcJBxwuNPiwNuxniW
 1Mwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UhZTGd02
Subject: [Buildroot] [PATCH 01/13] system: reword merged-usr prompt
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

The current pro;pt is overly verbose, and departs from the usual
terminology used to refer to merged /usr, which, 10 years later [0],
makes it a little bit difficult to find or understand.

Furthermore, we're going to add another similar prompt for merged
/usr/sbin, and there's no way we want to introduce as similarly
convoluted prompt then.

Reword the prompt for the merged /usr option to the explicit "merged
/usr" everyone expects and understands.

[0] see commit c5bd8af65e50 (system: add options for /bin /sbin and
/lib to be symlinks into /usr)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 8ff6c7213e..f747fdbc56 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -336,7 +336,7 @@ config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 	  Support extended attributes handling in device tables
 
 config BR2_ROOTFS_MERGED_USR
-	bool "Use symlinks to /usr for /bin, /sbin and /lib"
+	bool "Merged /usr"
 	help
 	  If you say 'n' here, then /bin, /sbin and /lib and their
 	  counterparts in /usr will be separate directories. This
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
