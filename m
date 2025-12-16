Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E63D5CC8D
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 087AD8231E;
	Tue, 16 Dec 2025 09:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEUsv4F4W_X7; Tue, 16 Dec 2025 09:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD1180FC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765877746;
	bh=B+9dCqgQy9PJv8gQbeNI3DZVnhn/FCswy/FQsN8VlPg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DO9He1v9EMZMXlC54vNpSBFiFsdbxUZ/a/bjIQLh8zbvj9+Bx03j0TOx+G397ApgI
	 koPGbtDq4WEUSJgFy8cTpjUHRnZmtSRtwuV21rq+YQA/y84u7izOuOo0tipiz8wx/x
	 rkEVvVrpyCY4UPyPIQ923Utuk47fkbVJIncAwBVJ1kTkELoKMP87wxqMUyBYvan2Vv
	 hiThpJn7l9eyE/29P3Y7CnylqjAUCoP9unUOOnis1DjOxFzc0hBuVHZRWhT4eCS+EJ
	 1gp/pyqkWbH83UzrJ1hakObnzVuDA0p7ExTRBGte3OhsT1ZodgXUd6Hdko4KRVwXyV
	 l/x49bM3NapxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DD1180FC6;
	Tue, 16 Dec 2025 09:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C868372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DD2F608EA
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5NkMQWyZOQX for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50BB360895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50BB360895
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50BB360895
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:43 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-595825c8eb3so5100740e87.0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 01:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765877740; x=1766482540;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iPcy7+E17vQEn8xQhidCvSrwG0VPfvsWg84vCM8+mXc=;
 b=mWwjoOpytiPEYi1sSiQGJ0rBNSGM97r8M3G4ODIxAcUIKFvOU+oGaLjZTweX3XYRbv
 sgTXk0ALElEYC6Wfd5FDy7C1Z3HeuRKS+T3PkcjVxpS9gCphhcmBmFqN5RDemJBkBMGw
 fP5IA1O7HpEzQUEtvASiaCoXHaylVFP18tjIuU65Qv5otY+r+KSKiwFBauFuS6ZSljKC
 JvZE64+Bsqc+sPYOKvHqIjr9d1tLwEjZ6+vrCPBgYkU24L4LU3UcFb5BKtJyLYBJksUV
 Ibh7ucIT+bs8OEXiIuXzAzoXYBS0jC4or6ZkIFPK0Il7+Q68xtoGVJjJMU4xtKw7fkcR
 e7dg==
X-Gm-Message-State: AOJu0YzVCN9VBed4gcgJI38gkB22jlUYLW4tlLHPlnGBGlpqGM3mYNbp
 bkVVkZmwF0dr/LlfBXBI3LRoDyCLUyUxT+adNJNdrm7BEmuiKrLaTUf6RFMW+w==
X-Gm-Gg: AY/fxX7mMjtseFoy1GY+NbvuwSRYcbzbP1pDBNfo/gEvbtWuSnzOXyK2Y74XLqnwOVm
 GwTTrO6Kl1pgtsdkR0boQml5f3ahG8fodCG16N+wz4p3LZOtTlmZcIGu/Rlvgv4fHNwXn9iw+hh
 vKcV+OZpwBV0Uhvh7x6l+4sC822an4R0ob2i6Gdmzy9MCVo2JTYtxqe3cjwiOAX6658Ke4AkBYW
 0HCNHjlEVJ3YpK+V5kSmwtB+jUBPnN3plqN5dxvUX5Lua54O5fcRtyO8KHLmA7r0yqYaNSvZDVt
 0zKLunk3kq4Q5v5F0SJZMq3U9FmdEZGNjAJyftHWurngV6D+/4c5pa16gWk/kwQ0a7wY/yHKUVl
 6Juw0weAGLscqTuOeKRgwHQ/bYymO7OEqkAlJkT9kmHpLaIAbVcrDWyFP4b6sHZ1ljj7+RarwFv
 a0LfMFNQLuEjr5oXDl5UenLvhEt967oBcuK6281kMxh6spT862
X-Google-Smtp-Source: AGHT+IHjDtXMCOyz2mxN91bOl/kLJmh5qjXP/cmqbs76Qof5+NQyx/2zKhEclech2UcwEQkk6Rr92g==
X-Received: by 2002:a05:6512:a8b:b0:598:de1b:40e4 with SMTP id
 2adb3069b0e04-598faa73d4bmr4405105e87.30.1765877740215; 
 Tue, 16 Dec 2025 01:35:40 -0800 (PST)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da11bd1sm740828e87.3.2025.12.16.01.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 01:35:39 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Tue, 16 Dec 2025 10:35:33 +0100
Message-ID: <20251216093534.2558659-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765877740; x=1766482540; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iPcy7+E17vQEn8xQhidCvSrwG0VPfvsWg84vCM8+mXc=;
 b=iNGhMmWS8w0j0Cr3htgzV5blid0mz+q6IichmWYrKatWeJXa2zLzWwWIzLtDCVVkDS
 oavckKFp8rHk8tOWtNja+VAcN+tMoMmkWQ3RXAv1QNlYxsGz4MyWAm92/kcfvdbxyH1A
 vbxSs09sgXjRQ2LEoGhEPlbZ5tW+OojDLooVg1L+wIefaCekTf5Qg7EjisEgGK/nBRyk
 HjZDPDQsrJ7YJRRNaSrzbeCA0dZgXAKrIajuLOfGnkRw4pyon35rtHc0ho7WTkM9agMH
 QtvUU2AUcEA7wjcYaRVq/rI8Yxi9hgWvN8bpIC0JS2S4w1+1ECGh4Mjnk93vfhWOwwpT
 fNxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iNGhMmWS
Subject: [Buildroot] [PATCH v2 1/2] package/libite: fix missing deps,
 requires fork()
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

Unfortunately, parts of the library is not very no-MMU friendly atm.
The below check fails due to runbg.c requiring fork().

$ ./utils/test-pkg -c libite.config -p libite
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: FAILED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK

The dependency was introduced in libite v2.6.0, so this patch should
probably be backported to v2025.02.x.

Fixes:

 https://autobuild.buildroot.net/results/6c6fd2ae410a82c44da54ee13a09a38a7ab220c1/

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

---
v1 -> v2:

- Clarify this is a fix that applies to previous versions, including LTS
- Link to relevant autobuilder failure

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libite/Config.in b/package/libite/Config.in
index 80d29791db..516d1bff98 100644
--- a/package/libite/Config.in
+++ b/package/libite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBITE
 	bool "libite"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Libite is a lightweight library of frog DNA. It can be used
 	  to fill the gaps in any dinosaur project. It holds useful
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
