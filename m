Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C698F34C5E
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 15:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 577A042550;
	Mon, 13 Apr 2026 15:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmGO4FN6YySI; Mon, 13 Apr 2026 15:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44C1942295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776093168;
	bh=ndOI3LPbU5OaxJXArXuJ3mQbKXq+BF4HdDs4ayiGrnc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sE2fzt/U6lwxj6PuRkqnNQHGDY1QbPGIgwOYr+S8FyIQJ/8EM0zl/yfvvfgW8sRtT
	 k7FSHMg73/ZSUUL0GGN5YQxsCqwV4zaAJ3N7+XUFFIcpxCa2E4qbccG5wXUBYpnqFL
	 fGFeWosaOOmT1icXerIAMpq5ffML7RNy5QSycNeD7oE/Jsnn+dIR+QqvyA070EEVyj
	 +1f6QvtwZBCoc2UBZyJ4o6x2jQy/zrsTYURhgUxEBPs+UE3BxyxfyyvFUeq6mnuAhI
	 W1LemKwHTWQYEsdYX4irLR/7YnZ/VIVKPuA5acDng+ZSNmbi5DPyIQqvz2DG3lyO1B
	 vwysw4vidrQtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C1942295;
	Mon, 13 Apr 2026 15:12:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD7BD237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF2AE402EF
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkuS1wUKmDyp for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 15:12:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4B32400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4B32400C8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4B32400C8
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso49086155e9.1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776093163; x=1776697963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tKuVKmr/7S2CIlHy1fiapU/1GPiF/8wp7HNgANXO96E=;
 b=BYxHRZzC4ZqRBG/k6Q12G1QU2mtAaZS54gZ72u7xGJ6i+7+Leb9as/gyPpO6pRPbWZ
 b7a/2texz43VcTdb8uzpXb3TuV8CI2VWK8GaQEaTnrYaGFgUb0hqaRNq388EansVO1oJ
 BJvbCv0H2HCyqW6BrRuGzGWmVyu71ZVcvWAusqMXknCbQ3VNRxHAO9uwLcC/OOgSM3kH
 9H9KGpCPoLTPZ2oGOEKvWsmd9DP5VmE43aK5WkC2fmmIxcaGJpPwPgwPyUnSU1vGUUpj
 vsJ+B7ev/yly4PYJXRlA+0NOyXfF4UfR5cYHJ1auDwg3k/rQifL/PE9uyfdTHE1XgWEm
 n+gg==
X-Gm-Message-State: AOJu0Yx87YFG9lC8XRPkw0FbJfYimQnPI9VO/YdOpq5Q+ttg2f25frKP
 fpynQhVeXzowyZJNwKuW7i5htxpLv5Sueo6TEQ6IfWH43i1Z7YsfcCx5I0h3Ng==
X-Gm-Gg: AeBDiesYTqhEU/8PVziqo54kPoxnJgKf2gt5bOdd5L4kWT9EsrYyNt0HwruoIj/w/0V
 rfhlb/8bm12xL7HXn8ODkYGnXbQM1fMQ8/Tx/rQRHXwSbN145OIo5wCC0FgUz5OWOtnz2w5GOHH
 2KZVWVaC/PovkyoBo7OonUaNhug3yoyJfMspMQk/V9i7kUzTJ9zVOY7jTtzdlZl4PYgzVCjdbIT
 p8DstrxXArhylrzBbbPEYX54x6ntBkyD3mRiHW3/NUnRnDufBgoQA8h+2BSb67ghtHI0jPDrySL
 S6QZp7VVr971AvrMLOdn1/5k/UNbUKtXhh5X4NpNmWVCRdc6VLSUXCHwTWx9gJ6XOeBpmTyrZw4
 uT04VoG9KgRzwRiWDAAWfMAXlQE0Y9I967Dkb+m+4zZpvHL3e0Q0PyLkbdjY/zgEjSrE21AvAIL
 CNRSESZOB0CLDicn5a
X-Received: by 2002:a05:600c:796:b0:488:e7e4:8425 with SMTP id
 5b1f17b1804b1-488e7e48437mr23588145e9.23.1776093163511; 
 Mon, 13 Apr 2026 08:12:43 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:e29d:2bc5:1d06:3359])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d67b128dsm161210665e9.2.2026.04.13.08.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 08:12:42 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Vincent Jardin <vjardin@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 13 Apr 2026 17:11:46 +0200
Message-ID: <20260413151148.42226-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413151148.42226-1-maxime@leroys.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776093163; x=1776697963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKuVKmr/7S2CIlHy1fiapU/1GPiF/8wp7HNgANXO96E=;
 b=FgJMdDxJQtI/5XsTqKqubEGff00F2gQnSi9Y4rCQQH+q/TOP6Hp5p6o9bEps4Z2/Us
 n8u2ptWmuHPlzD4q4PSCZ54Xlg/dT70Y1VjrxviLN0h0GU/E+FxnmUVuHacobAzTSn77
 RD0yernMdOLeTfjeY3obBtS07boTfLR28dtn/1bSlbGnuX0JOECs8KN1DuP5TEclWx2G
 NXzGw4MXoVNkWttPs/htDV1zWol19eouw8+Q0mUKeyPIxkh0bvF5f1spBmnwt5P4qSpw
 As+0yLtCGCmGkfNPy1jebIeh3t1T++cTLdM1k2XtV8ZNAfv5YvymiWSwzWa7l0g2+wES
 vktA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FgJMdDxJ
Subject: [Buildroot] [PATCH 1/3] package/libecoli: bump version to 0.11.3
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

See the release note of the new versions:
https://github.com/rjarry/libecoli/releases/tag/v0.11.3
https://github.com/rjarry/libecoli/releases/tag/v0.11.2
https://github.com/rjarry/libecoli/releases/tag/v0.11.1
https://github.com/rjarry/libecoli/releases/tag/v0.11.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 4045c7e19d..882f01fa99 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ec359850f4f338b607d05200d508736b14eaa30fca8aefdfde980a283afd789d  libecoli-0.10.1.tar.gz
+sha256  25ed9638452fa050749746c863574dfd47df95bde98347d210c9deedea188151  libecoli-0.11.3.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index 96617a1689..5d4b3993f8 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.10.1
+LIBECOLI_VERSION = 0.11.3
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
