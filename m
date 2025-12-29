Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBEBE92FE0
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF36780E4F;
	Mon, 29 Dec 2025 21:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-g2bfKluVjM; Mon, 29 Dec 2025 21:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF74280D8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043344;
	bh=FH0y67M5EOk3m7m14QrFKJ64kvY3ecUV6DZ1HYCKt1g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UOoi9lxm2MsA/S5rtkDx3MtHEV0A3atZuBITA2afUHyD/5/B32Np6ZPVH32h27Ifk
	 VP/HPQyAR06gb+n7jZsD0BYv8L/5NI5E2fRLhDva6sLCsSnne6y/XTbAWLQI16PW86
	 hqsXWQQMt6hojE1KQzU6pHtFLq6eEXHRIOOp89qdnEDcnQcTzAa438EF101MADIoSn
	 W96ahrCeyVsl3JtPs4Uoc5/thmdmYlpb0wkMMOY4TaL/JQ47syVeNhkLJ5L9x4jTmy
	 q2nbhjKndO7UDtd+mdFRgQhz/Crrn1WFcU+uWnRmRdEpq5zAFYnlGlfMQWczmkua3h
	 efLyitKMi2oWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF74280D8B;
	Mon, 29 Dec 2025 21:22:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAA76177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D169F40679
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Orv-u9MnT3yp for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0CA04080C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CA04080C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CA04080C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so60104635e9.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043338; x=1767648138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yQu0m0SakSJk70StsiL/ZdP2969DMnQADX0uPdxYfog=;
 b=Dl1gLuqfmw9WasikH84nTjZJlqe5GueFbekj9u/BQNjSTkXC7d6JgHc2cZzv8vmKu+
 u6e3N6U1UHuV/OtSw4c0P3AipNPGtKWdrgHMVBCe1ZmzuhqNdlWa4SAJI6tBF1g2l7VD
 TNTz2/ScXtTtHckMWq2VEOxEgSeoDVedeDBGgaYiy0YNHaCH/CFXE38R+uWAHi7X4pL2
 1fJJ/FC0afVYNa6iibeUjhtmWwUOuRovrBvB6JCj9OhMYGGTXTm+Jg8wJV7EUkhe/M8Q
 GJ2lMwjCsph8e8zmbeyXw41E2uWPnau3NL2p5AsSMjcZ9sXa4o7HHZ7M3n4zc4ZBRuwW
 Jx/g==
X-Gm-Message-State: AOJu0YzuOBjGvBuRiVdtgZwAgVCnJVVbQJ7GVnd+GTcL7gg6c+pedBjL
 XkRxtfBGHOGqbotYBVwusPwgsEDSSGMH208CnZUqADv1mts6Gxk4ny0HtRLyd3ml/qJvS/ja7V0
 GaEqw8lA=
X-Gm-Gg: AY/fxX7V2ka2TRJKqTl6pElqCFxjcuDdMXmRtuvLvU2FLa6/Wa0tL3eycD8RY37tRGZ
 GhmPUHmejqlK2H3Hi8wcq5a/U9Jm0qAL3TvbD/nDn260GzEk8luF5opNhviImur3rva2zQUCRuw
 xq6kCUVbaxhWTEzhCrHeNgeXs8JFkhOdCIKuG7YdCjmydAWBYx63WwUMbMniJl42+TqRWmQMmgG
 TJFHs4/EJKG15mtma92A9egS40/o30qLErYPvj1uh+GUTD4B48sNspByS9wnGVK80FVK5qEnYza
 JbuaR/k943Xjl+mdgjQYeKFcnsUz5yqdqGwVKSbqCWS8mOrtFgLC8cSuNq0e5BJvv4zOnHkNcyS
 VAMWRTXxkuCmrPZ48/lpmJdhwNcfRvwOzVF401hpdmIGZOItHvJD2EOz9IRxcsVilRzHfFJRjgO
 8SNJ8=
X-Google-Smtp-Source: AGHT+IGLXpZVLH6LhMCpeKSeFu3mXDWIK9EdNhw+5riK+3v7o4rsaCc308oGC/xvCl9ELKSdVBqdxQ==
X-Received: by 2002:a05:600c:4e8f:b0:475:e007:baf1 with SMTP id
 5b1f17b1804b1-47d19591166mr348244685e9.34.1767043338383; 
 Mon, 29 Dec 2025 13:22:18 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:17 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:46 +0100
Message-ID: <20251229212149.167902-14-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043338; x=1767648138; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQu0m0SakSJk70StsiL/ZdP2969DMnQADX0uPdxYfog=;
 b=HYt7lLIWwUW9SI3xbf2bno9E8cFbPWYT4GiTke2i9ZAx53zBiyBQw0wL0DDTD7Bwez
 0HNVNvw7+aRYw4FopvgsxlHdDPbqEZ2XlhmJuuxWhNFQPIu4H4UuJUDkt/ptxdnOF2uw
 v5AaxOzNq5MrOVAs2p2btiWBCNAVbgY+VG5TlbKlM6c5Wx9fJ3i43DdtlwKeyF8ihBpK
 1qmU4cj5JEfGZ/fUjkQ6JNdCup2UrAh6UvaW8AFZ3cVffJ30TfNYamzlSVLqnszFSyJh
 xLF0Ekcp9nRNSOHXzM6XEhk0pYfSL2W4XqZ3zDLx2i/NBnteuqD4eOP/8d/73NWUd4XI
 ZS+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HYt7lLIW
Subject: [Buildroot] [PATCH 13/15] package/freerdp: remove stale IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The NVD DB is now correctly tracking the vulnerability starting version
3.0 (see [1]). The IGNORE_CVES entry introduced in [2] is then no longer
needed.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4478
[2] f741e8f6e6 package/freerdp: ignore CVE-2025-4478

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 391b9a4675..3a1ba61621 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,10 +13,6 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
-# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
-# the affected code is new with 3.x, was not there on 2.x
-FREERDP_IGNORE_CVES += CVE-2025-4478
-
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
