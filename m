Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73520D277D0
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 04:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDD3E83B98;
	Sat, 10 Jan 2026 04:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q97awZYZCmQz; Sat, 10 Jan 2026 04:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A0883B8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768018846;
	bh=g5fBpGpGuMm5jdmt6lVVL154B0ERX1XltYRagLF2KAI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TJkQU1SikvCo6W3MNqk0NGv/xy6fsWvHCU9ikoWQ+Vs0NKWRbDY7siz+WGPWVMHwz
	 NUvZqYO4HkNYu7Znojrx+tE9hbOJAPmXYGCNF8+V2qavIN/72tKKW9Bf5VUSqabvkV
	 Bnjdy4Pjjtnmay5zv/wzPkzKvrQnxps5dD5xiwcch9BbHv3zjtZ2Y8V6OFi4ps/eH+
	 D2ma+6gmRSM/SIpRl5dYxOjRtSAtu9ioj45E3Da/6ETT25sAk/9XqF5i6dXanpXpb8
	 s5ms9p5CcGjOnXRTjukBacUPfk3/Izl0UsPgxajoZlQ/mDIePSmiwRL2oPVbx5Imex
	 dHRCNnYhv+QDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A0883B8E;
	Sat, 10 Jan 2026 04:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0504131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 04:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C787783B8E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 04:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTr0gg5AT8XM for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 04:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C82B083B82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C82B083B82
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C82B083B82
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 04:20:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso18696695e9.1
 for <buildroot@buildroot.org>; Fri, 09 Jan 2026 20:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768018842; x=1768623642;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcVWdVZz10NZT7ItbBeUvY3S8Zn3+ru4Y7rpLOhA0QY=;
 b=IfKPA9RRzNbRzd7VNsxFoVp1ara/NDPEEA1pvGAx7kQ5BMd0CwuzfUtpbqMPxFl6aO
 26me/HpAx5KuBXs0+fo8L+KniVaQB5sEtNfgd+bG5QqmCSBBF/+/oBctgheWuYB1y1dB
 Uawy8nOkTu0wBiOlTatCY2nJmtc/wlrf/SD/h187oG1WYHWtbgazylfJR6d7EG+rVDdM
 dwTtRPLD+p2wOoREVx3USVHtAx76Eq6AonUNNpUI0743eIx1eMwiVmRltDVbxe5FhaC0
 Sxx/4fWUlR79KKlnL9F0Pi6boXqw/cwBiB69LfrTZ9DSJDE3c9wlMr/yCyTQQlsgDXma
 oWTg==
X-Gm-Message-State: AOJu0YwHEuodZzQh4Q0/geKvIPRqX0yrhULWMhNffboGU3zXrDbOErzG
 0X0B04XJUTcL9IauVHvpD2r5PXP58gCMbaCD8GLiMhG77g4pdYEYNJ364XDlaA==
X-Gm-Gg: AY/fxX4ycSlS0xIW4wl0qN7P3tfd78a0je1awyqaJW5XcalYN1evGkw+DfybDhtMyB8
 NPmuHpIa1I9CFCGeExs/00QOGQsOMIl/yBNPu4PYjOCSyYPTfB/dHjuuz+4VQp5F8GrZd6bQtgQ
 kzcd/6AXR+9N++fbkSiw7T+Tjb6Ec7uSGEcFF4CyYMt4c7qtsXys2+d6lW3iKXZVWuCakxHYQwM
 gCDOheXNk3VkJ3I5GdnAyRGLXX6eZv04T2mI8v6zEgiaNRJHpnoE/c9iddXMwNZGY162zWZ7kFP
 E8+4+bOHaUWVKwCAQQugaz2MnXNmBlScyIslYnzfgwdzGWjlXs4wLe62pfWe5N4dPmIt84mnB3u
 NdRkAI9NvufPc0SSqZ+kJQZlL/wjUu/jb0yafoCVmkzDZpbi7pPIXFk9SVyHZA01hCW2gLAS9Gr
 X1NCFXwKKHCWGuC7CqNQ==
X-Google-Smtp-Source: AGHT+IFMfGBzxSg6rtZlPQihjAJV1w3LzJJRDeIlq4qHWvTK0TDLRkhQnt1eCquEsiOXGwzNcJOZrg==
X-Received: by 2002:a05:600c:1f95:b0:47d:875d:fa2 with SMTP id
 5b1f17b1804b1-47d875d122emr134945575e9.4.1768018841542; 
 Fri, 09 Jan 2026 20:20:41 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0860f5sm25692485f8f.0.2026.01.09.20.20.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 20:20:41 -0800 (PST)
Message-ID: <6961d399.5d0a0220.d7d33.32aa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 10 Jan 2026 04:20:41 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768018842; x=1768623642; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rcVWdVZz10NZT7ItbBeUvY3S8Zn3+ru4Y7rpLOhA0QY=;
 b=N/GJib9yIQ9ihzKlUSTN3uxBVjbs4f9JPefjF+prc/PS5cFL7vLnKKLTNqKlBeDebQ
 s0L6ACLVnRyJJrk2zZ9thhc5zNaYm7CXMc0J0sjCVq1hJIxyrWfqVnyI1hsd7b/t4nBu
 bpDzskxUDDb+OmryupLW9d+32L4ITiaL20gy3oyh6G0OXOXVo9pkQqg2iWLfjiw5NOg5
 PV1VipGmUa5OokbX0uajiK60E8EvK0RAUpCctOQrB2kWmxsWdY6X4l31Hc3SdgdHr5xE
 nX/MXH/aEkYjPcpfrDI05ZnKMSSX2KCBDnzliz+eFUEPQ4baw9FfiVWHE9aIX5hxoxAV
 AAwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N/GJib9y
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-09
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

Hello,

Autobuild statistics for 2026-01-09
===================================

      branch |  OK | NOK | TIM | TOT |


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
