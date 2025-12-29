Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF06E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2432F80C30;
	Mon, 29 Dec 2025 09:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iY6KVkotyqlh; Mon, 29 Dec 2025 09:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC2C180D5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999266;
	bh=pofty049FwstEEQLxpkGw56zH1a3gQizQ6hyiuI+Hl0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=TaWBjCRbloDcnCOcPJuw2STno1FYrLThnEptx6oICHUqUsw3M+S24eBnM/tj75IEI
	 I5mqgKFzwI0xAhXwL0bABriyuGO43Jh35wBf2lyqO0uNKmdcqOo/U/FTCUFPoXO+ui
	 CFQ1f3etpgYvTLtXOeZ79FrmRxqo+b7HHmcqGxoDEtXtgd+52/8gGUWQKEEe7CvgXg
	 +/Q6njyPVwL3A5UKt58CNK9G8kcwm4ocw6ucVrnjM5SH4V+v+LvA/MSNYdzMqDtTsO
	 xFGfcLh/NVTJse+XBtVhZNoDsdKcTW3Bmtp+2Wbq60IPVQ/BVDDLQFG7wyql3brIi7
	 oovDrOzK0t0uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2C180D5F;
	Mon, 29 Dec 2025 09:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C197B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E95280D3C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIVXU1gX4tbU for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2443380D58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2443380D58
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2443380D58
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so51442615e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999258; x=1767604058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GwP49R+Jqx9UHprGrnwP/Fu/gS8NDygYkmP5GO34x8I=;
 b=UDbm7YveWtKUctO4UwI2tKYQ7QSgjgxuHv/0AZ7StTLC+vDW8lHAJl9EsX4sQW6w4b
 HlM3OWzTkhBWYrBiDmLi9Rgh5N4OrHtWzAhPPC3vocuThOzGfSDLbI/LIj3s1mHQ9pka
 mvBC4ILQ1Gn/vHeqlJxmtBXdoPJVQQr9NEHBdGG3Bf9tvTW3xI5TmUduZO5ILcFxhpB/
 4m4PiCtq2tZ4dpD7v99RVy9KH1VDCN0UR42GzIN7EACMI0hhyow4RaGg5SaHmzcu0oq0
 NePYP4Q6e9Aa2zJjB0Xw5A7zlEuWWXO1cueU2g/K2NE3DRUxJysy9yg0TBzGDRdCROyQ
 mzIg==
X-Gm-Message-State: AOJu0Ywg7kDlYB/rTS/SVVvlK5IMCjRpBpT1CurdRjLGV8b/fkS8NuTg
 KNJIO1QI8q8boegPesXWlqwkwBrAYqPpxwOkUAw/4iC22Bf8MKTrafdzq9rob3gxC6LYEfvYE23
 FdPcm/uA=
X-Gm-Gg: AY/fxX5cGMoaHgwJ2lSjU9MGKSn4EPPeBpa69bL2L5cUydXueBPL4zJHG2UNSGb8Moh
 230EbbIQImcxn/MA0gKAM3V8r0T7BOcnNIVyiD8Qc/zLPorAPLKOP8KghbuMpyKdQZD+x4EQUPz
 r/rbMMQbmkLGFvZ1mX5F7FGXtTFg19oeCk2+NKxTFwRkmw70LJ7halos4bUdYyLKC5Czcnnlizp
 WYFtVE7rcHQtlIjpgsuaK2CP2DUYjSCmSVxgXgQxPwPRDQLbptXI9nyvgW7+FPT4pbbfvAxhK0l
 RX7VQ/7pvob0GO+7opj8J2XVAQdDx1c41BtKb39H/XwuvR2Bm8Z7DqKv1tJ2ajJ7EuQvLTuPdR8
 oVvL9tyi7YEysWRDa314XTel/+k/VRJp3901ywQjup/MJnqAoWMctu9Xh8MGFBn3yZUIRXEG6iO
 vQ+d2EdJXXebwsLuQ7pYgGKT5OmsmBAyyzBCkP+q5yadSQDME4ba6zTLiI7qX2tMvncZMAF7jyt
 eV2KgJz9/CM
X-Google-Smtp-Source: AGHT+IGsZFpEiDJeQoU/O4ycS5lH1OGGUCOTvqML/iklG38FATKTkfJTYx0+AdwhFkqz+PTHO7Jh7g==
X-Received: by 2002:a05:600c:4e8f:b0:475:e007:baf1 with SMTP id
 5b1f17b1804b1-47d19591166mr322612395e9.34.1766999257915; 
 Mon, 29 Dec 2025 01:07:37 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:37 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:18 +0100
Message-ID: <20251229090719.13291-13-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999258; x=1767604058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwP49R+Jqx9UHprGrnwP/Fu/gS8NDygYkmP5GO34x8I=;
 b=CyleFuVV+jsla+8NyDkSF5zSDig/ghNkbrqXKHYTPupfiLI1TmnwwvbVHVDYP8MB+l
 57t6Y1BiplyMSxuor6yYTW8p8a15C0DmSCjck2daTsNy36T7Gk2gM0p1qVHvCwBXIgQP
 CBs1mXINW8FtPYYLCDTM66c22uMxEAkJHb8oatLXWtpMMPLRJdGbAUKuI5ke/Vm+/CoR
 9tLWCRrYmOiSp1cXaKnpsYIiExqXrEVOMK5r/jj5qJwcChOBUbYhjRsuQ2iBMHL632Xy
 dtVr6GtPIdEC5hrwI5u/wxqzurUxMru5B5+FKV96JLfNMgvCLevimLJ2Ow7O/HYkUOWE
 gDHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CyleFuVV
Subject: [Buildroot] [PATCH 13/14] package/pixman: fix patch reference in
 IGNORE_CVES
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the
`0001-Disable-tests.patch` patch reference
was removed in favour of a build argument that disable the tests.

This update the reference in IGNORE_CVES accordingly.

[1] ba2fb599cd package/pixman: bump to version 0.44.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 87d973230f..63d9ccd10b 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,11 +26,10 @@ PIXMAN_CONF_OPTS = \
 	-Dlibpng=disabled \
 	-Dtests=disabled
 
-# Affects only tests, and we don't build tests (see
-# 0001-Disable-tests.patch). See
-# https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
-# "not sure why NVD keeps assigning CVEs like this. This is just a
-# test executable".
+# Affects only tests, and we don't build tests.
+# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
+# "not sure why NVD keeps assigning CVEs like this. This is just a test
+# executable".
 PIXMAN_IGNORE_CVES += CVE-2023-37769
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
