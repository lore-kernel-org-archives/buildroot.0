Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B77CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC24983B56;
	Fri, 29 May 2026 09:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wu1PT8eSEznF; Fri, 29 May 2026 09:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1FD983B43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047921;
	bh=whGt8MndtQpWfWC0ExU2OHKiu5J5aT3+MCngIDKzpcE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=BTCcO91qK/2I6tiejfaJFEf2bLwQSehcxOubpITOREvd1exod1b9MYwVZHjzEAqgl
	 vjKHyCg2bBSY9uChuZ+z9bpqMQPqpTn9xnHAmaaYS46ovvfy7q7cg/qRmFCyj9pBy2
	 29NIIiXbdARKUWp8Y6Nw2+/9gUPvc/lnFv0PTh/W/PDnD2GvbhLE4OOoNJ8HPmT+4U
	 z1xkVXjb8n5+QSnhoo9TddzXSiOfd9dXx8r8HcelNoqszDJeTB/HzVRm7h4zOnmMCC
	 zT/Szl5xU3AK5Aebq+/Z5/tBOV4h6DbusD1xt0//vjTxEgMKc+k5x/rAJ/SDb1EdGG
	 T1U9yJQjm6QPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1FD983B43;
	Fri, 29 May 2026 09:45:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A067AF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB71F61392
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBhWdsDrl6pw for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2E8061398
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2E8061398
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2E8061398
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so66075685e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 02:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047915; x=1780652715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iWdcSo/i0WigjPJos8e9hRt7cFO/auIA07/Oq61QhF0=;
 b=g9TRWhTamqgp8YrRFdGkK91xZ70lNaeG9dwM2K1bBzKK2BfBT9i8wMLSm6FU1oHz3D
 D7xifsR7pg4YiF2z9tUNf0DU3E9ztQ3GO1zoafDT7MIWgjVH1h3ktMh3iGXlcKr4NR5H
 5GNLTHlMHeckIJWvnfe5Z7ed9m5KlORJAYb/GjBMomqgA1VXdXsYdkvJwf/oEG8R3bkb
 D5o7Y2iQmeBffUmK8HzEnWBinRWzgcKoDutjedmyk257ghTsltBTEiGUksAN3y3mAH2I
 B3DsYdlgcH8PCg4RGkNy8cIo3TLaOxZS0FvnbSz5D9l3KKlfrbtdLtVn8d+6VNArpA2Q
 I/yw==
X-Gm-Message-State: AOJu0YyuouoU/2yAjkVtCVCP1XcuSUw/BD+c1XXFK1MVZx53rLDaUUiS
 XNDQMXz9CYtAyitNJKkcFcG21M/kmWSELAhdAgLPEIG4+d109haYDAVDcD0Cqq9Nyrm1G1auuv6
 TmG4C
X-Gm-Gg: Acq92OGF5gGfvYGgTVngqi6NFlztOm8XczvQDa+ncW3t4SNTnd6vd3UI8LcP/7/R71t
 He835AyinFv5YbNvXNdmtYjsHdxBoWKwofKlQA9f+qYFj516MEp31B+R7qE+AbvQhNld3LyXS95
 0UrlZMwiPDBaDMSQL5ckv3DG9zJaKw69zQopckxB4kJJ24QLUuP1l7NuW0XmyfkDP6VTKaoO88L
 SpDzgY3EaqTlepIgAXg7MpvLFrhgXMDeQZpQ0Z8IY1p4qJNc4rKeepzVSf/Qd52pAaMadafoX1w
 nQ1DIx/HHm3nQ9GyOIY1THdxKHq3+rripmbho1MXodlb0f937X4xUFbwzMAT2uskOC+0i9rYm0D
 x1QTC7mlyM9OO7QBUSsoXtMHWd3V3r54Hr5eYp1TACAJVwFme7RPxjcnILlIv2RcQmSiq8xTQHY
 M1rggAo77wEALquKfOs4y6+q0cpjnNdBylNGje4er45goIqMTmkLQqr6oXog==
X-Received: by 2002:a05:600c:528a:b0:490:a1a9:4ffe with SMTP id
 5b1f17b1804b1-490a1a9508bmr7443045e9.12.1780047915632; 
 Fri, 29 May 2026 02:45:15 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm14349985e9.5.2026.05.29.02.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:45:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:45:09 +0200
Message-ID: <20260529094514.178266-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be>
References: <20260529094514.178266-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780047915; x=1780652715; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWdcSo/i0WigjPJos8e9hRt7cFO/auIA07/Oq61QhF0=;
 b=ZGnqiEefEeAT4H6o3yZGcJhcZZpJcashJrAYZDXnlouvL0mDaAIJhXL4Ej4RdeJwqp
 rT7vBm+u5BC0O4DhmmKumJ+Vl1L4f2JRz0egEWecLHgpdLIfNxfBli53HwjuNErZ62Zm
 RkJwxC3/4OBGB/NpcylBQS5fsIEIsgttxlbrs2CuxK1ii9q4keN1i0Fr+CqilxAbHkGN
 C18RQmXKnX79b6yTrJ3y8PW1hXiuo3rWrZmK3i0x4dX9nXkrwbHEXHa9ay/6sxXGRLW5
 UXBS+B+7ofndT5dpuAiSAaMmqU8xj91CsZ97u34SltFDUDX+8MQh/1ok1kzBsLKV7hDx
 LxSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZGnqiEef
Subject: [Buildroot] [PATCH] package/hiredis: update CPE vendor
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE "cpe:2.3:a:redis:hiredis:*:*:*:*:*:*:*:*" is valid for this
package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/redis/hiredis/security/advisories/GHSA-hfm9-39pp-55p2
[2] https://nvd.nist.gov/vuln/detail/CVE-2021-32765

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hiredis/hiredis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index f7acb2f131..33a87e7780 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -9,7 +9,7 @@ HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
-HIREDIS_CPE_ID_VENDOR = redislabs
+HIREDIS_CPE_ID_VENDOR = redis
 HIREDIS_INSTALL_STAGING = YES
 
 # The package is a dependency to ccache so ccache cannot be a dependency
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
