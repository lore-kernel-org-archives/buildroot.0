Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49A6D20691
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B487846C4;
	Thu,  4 Dec 2025 13:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u59jm2EXNn0l; Thu,  4 Dec 2025 13:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 556FD846E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856093;
	bh=iZQMDezNJAgJcCfFzB6umL/dX0senQIZAzlDZ6ibY8M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlDXexFwJVk2emGoyFYWsn2yq8x74swnAR0mVtetyQ8XuMz4WYtpNE204LsCiP3tg
	 DUi/SiiEeAVSqFK2iPxEkKvezzHH8IF3qClWcI6PoErQhudGGvJgZpNR++vg/eZGPN
	 yd7WkE0vo3K3XKmtZF/97CvwN54fs7UZadV8NEsxiqD4iFP7RJ+GXLeRf+5OF6gP8i
	 LJ4prv14nN84bH6Qqoo9ykQFOa9hl/Mj8Y2pOtSds7zApjq272I0Z92PSujXmz7N6y
	 vl80+27MO7MB8ex2gk4FiBKbPtkEbRkCWBCIxHQYObyHPVj01i9eSWEedR5EbxZuli
	 9ZRwTNWpZ3oFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556FD846E9;
	Thu,  4 Dec 2025 13:48:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E746E7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E9B40C72
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBNiczizBibE for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7DC5040082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DC5040082
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DC5040082
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so11181835e9.3
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856089; x=1765460889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ixc4NWlehgb3n6VrPMcpW7bWWGKs0m5jWkSZoqP2mK8=;
 b=JlULRbrOfoQ0fLkrDfOoeE7iEx+oZS3jNyASpSr79shc7g5KzA1CEZgwHyjsLk1Akn
 wBj1UH9QQ2jtb5gyfbt4U9BRtg56TTla8EoLl2g1rqJoOwoI6HjflasyO2ZKM9nBXuAS
 Zywekj1S4ChFSkAPRwBO6kD5Ds44Qly0CRno3SECcnTFjkh3lzq7xPZa8EBiE22ziI6x
 BeHw3SP4PQQ7iaqn5rFI9MCS7BYU+Q4I4hd1dhaXztftA7eGZY9pH7JRGpvLmT+8oDp6
 OhVHU+O1INxuW+o2x0nW/TXDPV+tFAvYNG7s0ULRbWHq7NEBZresaTeuM6OMazt20CX8
 zxnQ==
X-Gm-Message-State: AOJu0YxSbhEWNWIbdtuo7ozwQozNTPTYDuRnYQpuFUQfo7AU7W9uRy6q
 GeoByFZUxpjETcXXLYgRlgPshrLjWzmIRAnNW7UJrAx/xvIeYCQBs1Ow7s/mtA==
X-Gm-Gg: ASbGncvwnJ+8uB4lkECxzn2ENGViGPekPJXzXRVfFv0IFt/BqnAr7YLKuATtgVP2FaK
 pyIRFT3O0/aZzy3NC6ImrHIvoZ5AuJ6ztaXIE8LU8OseFrdsXxlZ+L9BQRJwc5xCQsZnHh9P2Fp
 6AAPaMzugp2mRUoUSdfct7JSBWAugyMpzQdCTQ82eRQyg9Mx2NGbW/ZIarwP7ANqGU0593NYtQw
 PogFDlimfxrCLikxUTkWw8cPAm7knjC/baoFvGHGl5+C0BaOAq1Izs98loYLitTw8Lr1hrwRWfm
 k5VDXe04X0KN0dR+UxDyV+TrMbn9oWtHZiGZkiqB/MBh5WbO5cG1NphLm0wx197j1iP2EUDKFO2
 l3YuIW+z2CxTsBKyMxGJ4fw2qV8caf9gSwQ5HEX6R5hN2HgdEZaoPhw5aeSAyM00wtMSgC9L+Jf
 3pQgnoS29NRPAXxA==
X-Google-Smtp-Source: AGHT+IH1G3LZYtzQWDGDAlW2U+syBk3bJ32/DLKlC5+nBcJTbd5t3IhZLx2CWmKIO+nbpPhyAGV8VA==
X-Received: by 2002:a05:600c:1d0d:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-4792af49480mr58341305e9.34.1764856089452; 
 Thu, 04 Dec 2025 05:48:09 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:48:09 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:41 +0100
Message-ID: <20251204134742.406507-7-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856089; x=1765460889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ixc4NWlehgb3n6VrPMcpW7bWWGKs0m5jWkSZoqP2mK8=;
 b=ZVJMCYEHzmJH1WrqiSKehDVbLzQg1EvFywKjpADE2eGaEEh/Ns/nh8Bw4D/9zllcOa
 BoY536/Sh21ryJ2WYyUJEuyHZjhUud2l0m64p644a7JQUaJbC6qJUWstDbiS9KwYExcC
 QgfNNvxdCddfJd+ZNtYRHfPUp1F+AYdPqPIPghjCMXP69z2IuAnkWEzia04uNxEVk70/
 MWOihj24wA+mGdtvwLqnYbvIqWkdWIf87tRkTiubYRu47SOyuOdEQc2hbfLVyI7QEE+Y
 UHlOQPt7uX8lOYQyePhKM4+8Y4BMWzY0EhuB/3hHrqxMsvDqTLU69NpHC0OSxfILNYTS
 I6Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZVJMCYEH
Subject: [Buildroot] [PATCH 6/7] package/grout: link against DPDK static
 libraries
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

DPDK always builds both shared and static libraries, regardless of the
default_library setting. That option only affects how applications are
linked, not what DPDK itself produces.

In Buildroot, Meson libraries are built as shared by default, and fully
static linking with glibc is not supported globally. However, linking
grout against the static DPDK libraries provides better performance.

A new Meson option has been added to force static linking against DPDK.
Use it in the Buildroot package.

Link: https://github.com/DPDK/grout/commit/ec9bf5a12
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/grout.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 56cc68d1aa..05a2433239 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -11,6 +11,8 @@ GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
 
 # Avoid using buildroot commit hash
 GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
+# Link grout statically against DPDK for better performance
+GROUT_CONF_OPTS = -Ddpdk_static=true
 
 GROUT_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
