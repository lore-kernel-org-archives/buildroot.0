Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4A8CF9C69
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 16:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 574DA409FD;
	Sat, 21 Sep 2024 16:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtUfXFfMq111; Sat, 21 Sep 2024 16:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DBA640A03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DBA640A03;
	Sat, 21 Sep 2024 16:33:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CF361BF373
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 16:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 401A76062D
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIdtIaRWYryT for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 16:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4899D60618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4899D60618
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4899D60618
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 16:33:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cb8dac900so28195815e9.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 09:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726936381; x=1727541181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NSmXAxHXsAfzUna/C4hgf85PDsJLa3OWQVgMQFn8S9A=;
 b=TkbcHW71Ou4IRZdNXn9x5Ifw9UC3csfoCZmlMlMgWBUotjN31r+BcweA2RulmSECkL
 PYhxNJ5VsEQBXE35x6UixCsJfzLs+RrwSJIUWLlDh1Cc4/TD8L2ID1zLyovoaQ9RjanB
 8pUnMPSsPjFbnBDEUkVulZFVwZiQI/6FUPDq/seCiWGKvWeZFm8OAfTXd0ua2zNCoYSZ
 FjCLJ0LCrS6m9WpWULk3JijxDDA4Xn7fi7w9dkgD697Ua9CNLYWuyfa3PgF4p8mGJ/7W
 2TnWl4LV8/yYu0m+vMPkQo9GZLmuqua996h/2jNp39ASCvoPEf7eGFBbruXhgtnYGuxd
 jypg==
X-Gm-Message-State: AOJu0YxujXVI65hT56KJEJ2hAuvpSPnnr6f7cIbL0gt8zaI+7ha6HGCa
 guexzxHqjd+OPUOtK24Txfr5Nkz0q+M2ohrYTGBVfePRTJLfglaCs4e5lw==
X-Google-Smtp-Source: AGHT+IGnCcVfkcFoV7af5QdDe8YB8fnzD6owf/ku3VehNg832hBbQaBBJCRM/2ICZfQk4+6i5JNwHg==
X-Received: by 2002:a05:600c:19c9:b0:42c:bb41:a05a with SMTP id
 5b1f17b1804b1-42e7c1aac98mr45224305e9.34.1726936380667; 
 Sat, 21 Sep 2024 09:33:00 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71f0622sm20364665f8f.18.2024.09.21.09.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 09:33:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:32:57 +0200
Message-ID: <e139f36a385a13ad3e53222f3f8b1da18d81dbea.1726936373.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726936373.git.yann.morin.1998@free.fr>
References: <cover.1726936373.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726936381; x=1727541181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSmXAxHXsAfzUna/C4hgf85PDsJLa3OWQVgMQFn8S9A=;
 b=b/zwks9ZmciwdmDYmJxtd6arM9inPHAOYqoHOUSCdr+nv/aADa+zcx3Z56j4fvBFlc
 hQJhJ8RbUf+t3+ykTPpsjKcdNyqaskotW26EHKlU63h+QgjcIuSoTIdbvsL78ZYjA5wT
 xzG4gw35VunO0MnkKUtCZB51SZbTC3iu35YO7Ha9uWCsb9RMINqhwsC9c+dHey/hOtX3
 F5hLb8HmnZtnnD8FdpVf/Q02hHlsqrOZSWR0O/dowemE2MKbY4DCNngaBP1x+50XZHq/
 aIjgR0v/hYQY94NoiVFxp/jWDSXNlmwCWe8wa9GfQjnKp8P7KN/GSN9vCC98RqqxaIb9
 iEIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b/zwks9Z
Subject: [Buildroot] [PATCH 1/3 v2] package/linux-headers: default to old
 kernel version
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, there is no default value in the choice for the custom kernel
version, and the latest version is at the top of the list.

This means tha a defconfig that uses the latest version does not get the
symbol written in it, and thus when a newer version is latter added, the
defconfig is then incorrect.

To kinda-workaround the issue, make the oldest, pre-3.0 version the
default: this is always going to be the oldest version, we're not going
to add anything older than that, so defconfigs that use that version
will not have it written but that will always yield it back. Conversely,
all other defconfigs will get the kernel version written in them, so it
will stick even when we add newer versions.

Reported-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 003c2f6a66..2ae4077ffe 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -113,6 +113,7 @@ endif
 
 choice
 	bool "Custom kernel headers series"
+	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
