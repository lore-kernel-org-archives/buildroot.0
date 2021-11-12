Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E739C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 10:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5A260F55
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 10:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D5A260F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AAF281D2D;
	Fri, 12 Nov 2021 10:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRQ0AA2l9mev; Fri, 12 Nov 2021 10:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C827382404;
	Fri, 12 Nov 2021 10:55:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85F1B1BF298
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 10:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EB5D4057D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 10:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGvKELLaYzQG for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 10:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D8E540575
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:55:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u1so14724897wru.13
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JjDgZuflC4qsMCMfP+Bu8bBCSjq7fnw6UMAxAf9Yq/k=;
 b=itIGtu9KU6p0HTOjcZPwmEv6D5Op6znzXwL/WVxHNmUMbl3x9HEPpIMdJ/idtfBHLh
 KQGRU46cDau++uJYbnxZbXZbk8iDJq9DXR2yLuusN6QWFrDm5A8Sy4AU5zHV+OGYQiD/
 sDPCl2Ti5sx43qZ+nua+7TbxYieY0Ds1hb4HZcLBX04GaCE+a4uRUh4sqqB0Z+Oz/O19
 RjrevbvQsms0YryIkGcwSkuNXRty0/ee7T2v3ed7CtKgGAB8YL6fd8bHrFv3RuRw8AoP
 LMRa6vJo5gqW+rcUEd1M6YJS/93ndqu+zVxl1+DwBEkrp+55bQicTzpRe/lXFQJbMogj
 TNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JjDgZuflC4qsMCMfP+Bu8bBCSjq7fnw6UMAxAf9Yq/k=;
 b=wPjezdfJ9fjVvCKkt1KPLEXexs2M2tjU9n+txjE68GLCn5qY6/zsm9sd6tY0tnRryd
 jkaUaIr/hKJ7VowTNtO+rcqVwr/IHUnQPHHaa0CBuXCy0Uh1ShdNAdqD6yAwAnH2jWzv
 Ct5cqA4Q7aoIjXYYx1/qF+WNeujqhnYOFZBQkwFzaDfbTztLCFIw3YaWmhEShCNcggRr
 fx4NPOEt5Xa4ydRl14g93QMUOxRNTdtdKvVZsVJBw55YElmCuuauV1lba7ZjestrhHhu
 3C6uPmIDSVIZ7Umb7MTdeqM7XETrw7/yJeoZ8kntxhM+U2yE+9736Vv/u3WXsjz+BPjU
 HyZw==
X-Gm-Message-State: AOAM533y9L2Bzh3fRLcLuEjT04Ozrc4oxPw24jNCgXgJBK+BcX+x8JLa
 KgGxOclVBkekpg/dt7WyDmHyAsmW194=
X-Google-Smtp-Source: ABdhPJxqhEyY/HLUIhtfUexrQXCG0Gw+NpGD8yK6RrsqRr83LwnmoFZBWVCFPH8c9HDU70XNAnh2Yg==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr17607590wrk.225.1636714542261; 
 Fri, 12 Nov 2021 02:55:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id a9sm5218276wrt.66.2021.11.12.02.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:55:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 11:53:44 +0100
Message-Id: <20211112105344.3313393-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bug fix release which addresses quite a number of issues

https://www.mail-archive.com/haproxy@formilux.org/msg41404.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 2e39fb4aa5..c29857cd9c 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.7.tar.gz.sha256
-sha256  52af97f72f22ffd8a7a995fafc696291d37818feda50a23caef7dc0622421845  haproxy-2.4.7.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.8.tar.gz.sha256
+sha256  e3e4c1ad293bc25e8d8790cc5e45133213dda008bfd0228bf3077259b32ebaa5  haproxy-2.4.8.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 145a8a214c..d79d6e9c9c 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).7
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).8
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
