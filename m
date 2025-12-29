Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06E0E9271B
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A18840797;
	Mon, 29 Dec 2025 09:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwTlywv8KgyX; Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B765407A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999254;
	bh=pGIPEZwL6cWH0Jh4JJfta4CPsWGHeamAMrN69LMBKto=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=M4RISgqHmU/mXM5BjrTF1ODjQBrol363lecJV2eP07HJEAxDDVB0ZFf4MGGwAYwXy
	 5yzUG454zLInIb0BH1vzPYY/Nte1OqmQo8EtvJz9jj6Ahr8tR3aLn3fhP3CU0+1atz
	 3sqbIHxBduk9Xnt+BF10UqmTV2OaB1PxwSBPpXc/K0km5cgty0Be76/lQD0rRNrw6g
	 obEGAcGuAhFLYaWDGk1RoYXgQsy0oezwyeWA1NYj4i5RYWa2ahaO4XYgW8fKFEVDtw
	 rXAOUig722uV3ixkW+IoaOceKsm0oadMuz/XvHczVMquyGO1ZR464tBpiR2H2/rs3H
	 8biIU8EfLVPiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B765407A2;
	Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B9B5B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F7504076D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNSxNIt5kzJR for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E63940766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E63940766
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E63940766
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47755de027eso52423155e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999248; x=1767604048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vXnY2LN49GWCI1xropZWa4v4m7hiM6S8z4+ThtpuCeA=;
 b=VtkSs9gzcxNqIZ9NfJw5izq5JawYpAcMEJ6afC3EAolYFh2TKeYcd1Z07mfFERGYPd
 VkD4CilyAXh98wmNeCNlAxYBbYzsvQ3sM6qhP1/u/xuYZafAkUk8Ut8QhlwO/dGr73RF
 pqypH2MPzk54Gz7zjdWVaoUCh+ohNjtJ7HV0zY5uJkfPm0DuKhCS1jf4TcsKax6dkbB6
 7N9VZit+yc5CtNZlYaKHqDd9JKkDcnyiuYkx6reG6BwBdFlCsPF/VqFcqL7YRTTM9WmE
 f/WmM/Yt3ip8ssfHPBnxtTuj3ZQzKfFiVx/6ERsqlUG0AhZX8UZiWOp+2oRP4h2p/ZZP
 wteg==
X-Gm-Message-State: AOJu0YyiQfqiWlPVofiUb8kI27lPaLX9hTx+Gs+FcFAFSRca2Pvj7vI8
 OixI55r+Fz45D5eZogXyeyUQre6cTxzm22BI2FosVm5oo4l9mk4try8OheKi+bsHZIBEnIhsZ7z
 LgW+9KxU=
X-Gm-Gg: AY/fxX496CNQ8el6Sqdh1MY3UXtMnSarbDFLCVZaDfYmYdAfzEM0mH54tMy2YzsNzJE
 95obNAxtlOfQ58XB1ADLJiyE/jFep05rh86kozwljmnC1DOPfLXtvoRoBLjYeFRE1p1RzbOeJgb
 QVM2CIc9TrucB78R7D2Mwigz6pQeJVX6cWsMRvIdGA+SrLEH/gkPKAF2EUrTYk2mkDX4DYI5Vb7
 o1m/zkO6Af3DR8hJBVgYxCM0Vod+FlnB2Jaa8ylyu3c3QFmVnuWxMQdJpKAyFuHXE/Yjaft13hJ
 E6ApOBx4FN+p1h+xrUvoct6JWOK95g53D2CvwEmGtliAvCQHLk47Rw4o8f4DDvHvYvF4zy4dxBU
 uZeDthSbSxIpIAGSQNegCzIWSSrzPgUZRgam9anU+NQ6ISps935GWr0YLSS8JR7pNia9ii3ZQSx
 OvLAmPdlNCrLVDQhb7DFBA4t4CqGaG1SRMf/MQgpiPGW3F5rvcqKz9tuRstDJF+uK7B/oZqPDS+
 g==
X-Google-Smtp-Source: AGHT+IGJ862gLHyxjpHIptEdPYN4/XYJmH0xWhv4ZiIMCIjQdHf43Bd8vua5OfUZ1VWGXMr7ILu8/w==
X-Received: by 2002:a05:600c:19c6:b0:477:aed0:f40a with SMTP id
 5b1f17b1804b1-47d1957f4b4mr349116595e9.19.1766999248143; 
 Mon, 29 Dec 2025 01:07:28 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:26 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:10 +0100
Message-ID: <20251229090719.13291-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999248; x=1767604048; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXnY2LN49GWCI1xropZWa4v4m7hiM6S8z4+ThtpuCeA=;
 b=U3adhcDySJMxxV7EgJnbMOX/rOfEH35V24Jjc5s549rKTXorimuu8wACJFfKIpOSVy
 sQimhtiOrK9TZpc/dgOZCVn/HR8OphkLwj7lC8f6NQVc/yxOHxWddh4U6tiMTlsRK6/K
 Orrr7UPC+eiczYkjQzYHwbNP3Gemgi4vUps47PLZ+oROSZAZHh71U6ZVNNif1fmLju4c
 yRQKZH2ISdJiy1dcSX3vmKF/ElZmZKQ/ojCk5A5R5vggo5l+hRffVlcSDKDSOktRcr61
 3Kq1gTjDEidQ6Kd2+zCQLWH4uY4D1f3xZraMyR7b/s99s0JVWb/QzCOg349AIPbizGqO
 NG5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U3adhcDy
Subject: [Buildroot] [PATCH 05/14] package/lua-http: add CVE trailer in patch
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

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...01-http-h1_stream-handle-EOF-when-body_read_type-length.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
index fdbf5243f5..7672ff3794 100644
--- a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
+++ b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
@@ -8,6 +8,7 @@ then return `EPIPE`.
 This fixes a potential infinite draining loop when trying to trying to
 `:shutdown()` a stream.
 
+CVE: CVE-2023-4540
 Upstream: https://github.com/daurnimator/lua-http/commit/ddab2835c583d45dec62680ca8d3cbde55e0bae6
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
