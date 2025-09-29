Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B12CAC5B5
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 12:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B7380A4B;
	Mon, 29 Sep 2025 12:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hstdlLa4sg8; Mon, 29 Sep 2025 12:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08092809DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08092809DD;
	Mon, 29 Sep 2025 12:50:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A720412D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 12:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9967760AE8
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 12:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hywPwYcGRouU for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 12:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC18B60768
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC18B60768
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC18B60768
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 12:50:05 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-62fb48315ddso8369895a12.2
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 05:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759150204; x=1759755004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+hrgtB7fr2Y21GA9w6cXuEep7vMqd3vljD18sqLkw8=;
 b=KoS587+4u07u551SpHTclmS8j8FHP8aDG8AxqJOFJWHGPG6VxB7EAccTlLoosgzQxv
 5AiSWuhZtnr2ybVCoagiEVrC6X8R1+Sw35ja01mXPadOMlBKN/jiaDpD2y9AKMRLEgkX
 qUyJyATZ/DxeRVa0kNg8dO+xbwA/HEDbrsrLQDFz3lZ84uvPXHdl9ixaBZhkhiiC7TU7
 Wynhbda417fr5wax7rOrleKJP/TlopU3heSb+bjU8ubR8rdqtNpUeCC1EkJYxZPqR3yg
 4Z13R1hWl1TJ8QpGSADJoOJgZ4FBPD1kimu2j9kqzfeGUuCPscK34uhi4pIxs/QuKuWW
 Ib5A==
X-Gm-Message-State: AOJu0YyqXUqQsVRFDVQI6D4XIn/xa5o1KxUydjgAxctl++Yc71CisuNJ
 D+xpbqDaERK6scmf+bZnAkY0KFYT4ZsxHuRQN/KGCkqjFcKmG7COLLh4JyhX3xl6lyGegZzbhBa
 Rmo7R
X-Gm-Gg: ASbGncvWcDUysZA7dNJvymfgX+7CQrdezXHusjtQDOdDmIBd51oWBrL+unVHdXlGVZ1
 32A9/Ci7Q+CC6jx6rug8ZsNfCmO6ndzDGxzEms5/xOaCRZHFceElDGN4jbtLm8kep3DM0rrGZYs
 tjGxJaOhNyN2x0yDF/E90BXfN3+GszVPArHuS1zLmbuvslyhqR6xlO6tmjEGygsZvepjerqajwS
 UxzhbgJPZYQd7fQF4sm/t2KPlnWcrXT4+aYnFK/A8dL9Y6cMAraeaX5NFwuEo+EjkuJ4v4xaSm3
 7GrbyXVCrV/ZN6/aFM6Obvp3yd1G5Lxu8M/EGw7mGW6Kj9WMW8FznFCMFRXN1AQ/xdUCi5MBAV+
 sDzRckg+ylPA1N5k3pOP461pLDWh8tMcWQCBC3g0q1Dvkkt+fsfnCkzVtnCAoDfeoMXciD6xa67
 uuLAr45uUhPgE=
X-Google-Smtp-Source: AGHT+IFhBe9P92oMLRy4KN3zocljT4GkOvIsryFVLfciBGRRl4U6dNMUNsBlYhWq2JA48ifXUOwr7w==
X-Received: by 2002:a17:907:97c2:b0:b3e:ac8a:b1aa with SMTP id
 a640c23a62f3a-b3eac8aced4mr393836566b.0.1759150203258; 
 Mon, 29 Sep 2025 05:50:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([176.201.139.243])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3b0c9c9e8esm451378166b.59.2025.09.29.05.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 05:50:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 29 Sep 2025 14:49:55 +0200
Message-ID: <20250929124955.1295473-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929124955.1295473-1-dario.binacchi@amarulasolutions.com>
References: <20250929124955.1295473-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759150204; x=1759755004;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+hrgtB7fr2Y21GA9w6cXuEep7vMqd3vljD18sqLkw8=;
 b=eSrr826ZAzdAp6rjZ45roGUg3sRMLkN7iD9r62keGRvRnbC3+jnwqdBBTEkbQRPQfJ
 tI64EKcVo7lA1xOJEQZJgPKzF2lLxO/aR/M0XtnrwCv3XrQTwxARGKItz4GYkBIEudLX
 kylT0ZRPgYBRDwEbhkktlLwu846YIijDtZZGU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eSrr826Z
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for empty
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 71a9b1a15749..d3fdbb49a0e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -805,6 +805,7 @@ F:	package/babeld/
 F:	package/bc/
 F:	package/cmocka/
 F:	package/connman/
+F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
