Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF6EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BCE405B2;
	Sun,  5 Dec 2021 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjOYexbERvyW; Sun,  5 Dec 2021 10:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F8744058B;
	Sun,  5 Dec 2021 10:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF4D61BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB1C08176F
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djoG6JlAAstE for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:29:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A59E981064
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:29:25 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu18so18149656lfb.0
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JV815GlNQvg3tWOaTVHK68/Q2RDiaVBOnbDzD12Daqc=;
 b=E0XG8w4B1jzBDnaVW0HY1J+9lTvSKy6+EnU7xprp9ppN2KohQ0y1bxL+7ow6T3XpR5
 q8ElN6aTJDfCoXzgU4MEe62XdxAwvSvWIbA38PsUV++AEhozpOHLHqLh6+CbKmEKc+fg
 PXLfV7bUKpun8sEuWrYCUv0HvZkM/qmACQj2d3FOl/rPhzJn0CHI8Caumh8k4MAlfrAw
 EsPuyFHWwymSWsVJWX88Rym/gJ31OiIE7qTSCz66K5HKvg4aKIjWzFk7k45EvZVvkp4f
 dg5QzX8PbPXOo3+Hg2uECi6bEphLNbmq6GaOWb+9wemynfse1pyMoKlu1xpdRhr3FVcz
 UNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JV815GlNQvg3tWOaTVHK68/Q2RDiaVBOnbDzD12Daqc=;
 b=EJq4HmL/+hdM2zF151WbE7aOCOkN2BgsvmC1XdjgjtJf/151QSqf+YLH/CMWcd4xh6
 lx5N/KI48iRxuLbUK9YbDcWaTqLejxn6r138lfQyBwd8ePsDctnfH/tzXoYaXtvJyXf6
 7rnnCzi1LvTXw7Y3J1lfYNLqaCgpS5WasX/FfIFh4pf8wZqHzUL01wPsZHbEj3GvpCSX
 Jjv6xOrXqbGzLqeW/PA65FB9UA1zGuV0pmx9jERvd/3QeNIasokPDOftwK+7/UkjQBCG
 bwP7ZsEMK6JEvVU8xT9m5ii2gUGh/t6ppcWA1JpJfFBxreJfjyUPz7goZkR/2DV07CTX
 hX6g==
X-Gm-Message-State: AOAM5302tHK+5/HPShakm/e5asfWMaS2rt0JSo/dcxzUjaECHOsxuEnQ
 8F/VQU0MclTX6Bo37kAWsOLxg+UXUHg=
X-Google-Smtp-Source: ABdhPJzUSvThb23KOqMpUd4/HrqOKkPfnwY6SSCNf4Bfe9e8YIBLJGxond/drzi5qyhB47lLviL7SQ==
X-Received: by 2002:a05:6512:1087:: with SMTP id
 j7mr29064611lfg.345.1638700163505; 
 Sun, 05 Dec 2021 02:29:23 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id k22sm1047191lfu.95.2021.12.05.02.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:29:23 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 11:29:06 +0100
Message-Id: <20211205102907.2836980-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205102907.2836980-1-troglobit@gmail.com>
References: <20211205102907.2836980-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next 3/3] package/inadyn: update inadyn.conf
 example
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
Cc: Joachim Wiberg <troglobit@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Comment out iface setting, usually not what you want
 - Update DynDNS example, show use of multiple hostnames
 - Add FreeDNS sample config, free and stable service
 - Add link to syntax and examples

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.conf | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
index 1b29027606..3328ee2218 100644
--- a/package/inadyn/inadyn.conf
+++ b/package/inadyn/inadyn.conf
@@ -1,11 +1,26 @@
-# Basic configuration file for inadyn
+# Example /etc/inadyn.conf
 #
-# /etc/inadyn.conf
-iface    = eth0
+# Remember to change this file to match your provider and credentials
+# Username and password can be included from another file.  For more
+# info, see https://man.troglobit.com/man5/inadyn.conf.5.html
+
+# Use IP address of interface instead of external checkip server.
+# Useful when you want to register internal IP addresses
+#iface    = eth0
+
+# IP address change check interval
 period   = 300
 
-provider default@dyndns.org {
+# Remove of change to match your Dyn account
+provider dyndns.org {
 	username    = test
 	password    = test
-	hostname    = test
+	hostname    = { "my.example.com", "other.example.org" }
+}
+
+# Remove or change to match your FreeDNS account
+provider freedns {
+     username   = lower-case-username
+     password   = case-sensitive-pwd
+     hostname   = some.example.com
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
