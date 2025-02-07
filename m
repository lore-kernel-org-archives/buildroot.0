Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3483DC0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C85FA60877;
	Fri,  7 Feb 2025 21:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kE-ObRrZroQp; Fri,  7 Feb 2025 21:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3796FB86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA3796FB86;
	Fri,  7 Feb 2025 21:54:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4C3DCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C43EB42CEB
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHquaENlP2c2 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8771A42CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8771A42CE7
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8771A42CE7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:54:06 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so431369666b.2
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 13:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738965244; x=1739570044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rB4Il0+hRyj8OLYLDYRBhqzTfq389BUKaSK5JrazVCY=;
 b=HpBzeR5Y04Y5AcJa5XUcwCmqJNCUvPJNWoTs+rMs4XXLh2s5WnSwGugSJivTPpUGI0
 Gr5AlDP34kOqvh5FPPSDCcqeSbI43x9jBSZ5T7NzMLPImjnzJkZQK7yZjyg8yAxMvpU/
 wB7Xy3K+TAWD6C9QeE6CcKcD7LwqTSjem09WDGjOlqbq0PXxqEZQCyQ0uLDBQYeZLfEf
 7zzW4JDFCYYDAsuKr+zZt6y2fVF9kur5GVmCmx0tNl0IDtlAtVhPGpir9ON26v6Eab5h
 CbO9V92tvXwhhtPr8UGUIRBEFnZsAccN5fHWcoDDn3bzYEvJUJEgDSvSPUDYTw/1xarZ
 ZosQ==
X-Gm-Message-State: AOJu0Yx5rZd/ajSyNo+a72ZMy7FDPcICkUlGKkiPqKfJZT2onKrYMFK7
 qKgOWrPOspK3ZD9dqgLa9WBRr6SQoF1ivrD5e8ToHUeuSPosXm6R7uYtTxBWIAtrpzRUxhpbYWp
 BXpY=
X-Gm-Gg: ASbGnctQrX9zIPmqsKafDkN8Cz8EUeYLrhijyevw6oyuh/85NAqcNJZG/aVINdbH4yM
 BKjVF7S2lYO2dEsrPf3fGO1KC4tK/dX4+5daqmW41UqGvbOwFc+E7MfSZAk8445AHsQCU2GBO99
 3tPx56Wb+0TBQx97GUN9cTQlun0KCqMP/jcqqyXW+HXBGtl4mGQUgYEWX452PvMweYuLcLODLXk
 t4LV03CG50GFmyLOD0+U7OC9B70Cn4Q0Ajura1XntF0KWx8kAFQ8Lgx0owzE9yhDrn+MYi0NKaa
 q1nUxCZDUFdi6r/g0eOrtCIRAPoOEx4=
X-Google-Smtp-Source: AGHT+IFQzSQ2d0mLWQRqhYwxAQoJF9agK5V8IwTaxwgCYPshxSCLk5i7+h25qEqiGl5MAniUpxwjGw==
X-Received: by 2002:a17:907:1c9f:b0:aa6:5ec2:966c with SMTP id
 a640c23a62f3a-ab789a67bcdmr561905066b.7.1738965243409; 
 Fri, 07 Feb 2025 13:54:03 -0800 (PST)
Received: from localhost.localdomain ([79.132.233.153])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab77bdb5b93sm295881466b.171.2025.02.07.13.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 13:54:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri,  7 Feb 2025 22:53:41 +0100
Message-Id: <20250207215341.2268859-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738965244; x=1739570044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rB4Il0+hRyj8OLYLDYRBhqzTfq389BUKaSK5JrazVCY=;
 b=aqEc//GVRymu5DCCKCqF1UOdVSsHZopTuGRrtG4peT83P4bpkLTVrFsW9cz8xx7q2Q
 WOSrP/WNpoA3fDsKl7BAo1RHbkMT0BOGs79al1eWgn+gj5AzwuOceRaT5o0h7BJLeCeC
 IAGs9ChK/ZXXUBRT4NAeRxHAXXkx17nyS2JceIa4LVTtKHsMavPmJqFFifNhrOCbFD25
 aRNUHW1OwryywYpKFTV8rBjFWOoJ0UzU3z9f5Goqowxv4AOm77zjiUcB0pCBVkMOIoRT
 Puhx2gFKLyPTld6rIAE/B/4E9fqjJtDBjcHgnw5KsweDrz7uWrilGFBQSZHDKp4GPLXi
 in3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aqEc//GV
Subject: [Buildroot] [PATCH 1/1] package/lynis: add wchar dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the introduction of the package lynis in 48bce6ad8f autobuild
failure for the gzip package started appearing on configuration
without wchar support with the following error message:

vasnprintf.c:355:38: warning: implicit declaration of function 'wctomb' [-Wimplicit-function-declaration]
  355 | #   define local_wcrtomb(S, WC, PS)  wctomb ((S), (WC))
      |                                      ^~~~~~

This error happens when building gzip without BR2_USE_WCHAR dependency.
The gzip package already depends on BR2_USE_WCHAR, this patch also apply
this dependency to the lynis package.

Fixes:
https://autobuild.buildroot.org/results/fbf/fbf31c8c09496cd3fe02e8ed55939dad5c1cbaec
https://autobuild.buildroot.org/results/560/56083310acedba31dccc1f6594f814347bf21caf
https://autobuild.buildroot.org/results/1d9/1d97e3f0c626421fdae45e794f02c560d1b9080c

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/lynis/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lynis/Config.in b/package/lynis/Config.in
index 2757e86a2d..e97cb0bf91 100644
--- a/package/lynis/Config.in
+++ b/package/lynis/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LYNIS
 	bool "lynis"
+	depends on BR2_USE_WCHAR # gzip
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_GZIP  # runtime (zgrep /proc/config.gz)
 	help
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
