Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084EBD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE5B407A9;
	Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ouYER9uMwIcK; Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02D83407D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999259;
	bh=WP3jyGn/XyXWaCZ007L/h/4IFsn6BYfMLvBhCuy2c1I=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Qtn2cktmi+3jaeFA3fnMR93Mre5qj6bB9arvDBZRTrLMTwyDtOg60uFKMdFjcAwO0
	 5ZEjluwnQqQFYK9c9rIyJ4vK5TYnWXppM1LydzkGa+vhtu38MtrcmJWs5M+YELg8b8
	 QzT+Ko2dgiNVl9iTTC6Fv9QChkzdkIWzOUIJVqou0RsIGP3olQL7ljY9vQbkHZRaPL
	 Dh9yO6IbCoY0qYSxly1n3/Jv6ry0BEVUbpGF/m2ADUQik4Iwb8Ldkv0juUc3QqnBF9
	 f+1ztiVknYThPXgIBND6n0llGyTbOvkUsi5HRC98io42ZqCfYS22a2GXY3i2Khj0I/
	 o34IfGuxduVWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D83407D5;
	Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B7F8B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E35C80CBD
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjkKEuNHK6Mg for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 562EF80CAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 562EF80CAA
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 562EF80CAA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so93578635e9.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999252; x=1767604052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EC9bnUdtiuykTgVS6/NKjXbDepW7KVz6srGve0Lc2v4=;
 b=om1s7kMy2P8QHxbKq0ejmiLjSkauGXsg0RqGfirQfTqCjh3oRV0kG7shaMLhqbEM9V
 +JeCdhyH34xTcdK3xx9E2lhZB0ydcWtTOPlPwHIZnzjtUphy4dFoNCfcKjKVcyvBSlX7
 KwMHoLarn6ILs12wGXCOBD+rjKMiLk3u4vjNxT1pVhPzVlBv6eExMQmMtY9WCzOwRwzE
 ZOTfWWpvcURWWIoCvSWVP4X3Rn2KXayWnVUMWho3xBYp3AzhtkesdNogRi3ekkKeKclP
 rLHd4nCdTN2J0Cc9haAPxAHGGPlDfpIFuTXL/qD8khF4MVt+Xf3HIWKBcFrQuLPgAddJ
 fEYg==
X-Gm-Message-State: AOJu0Yytjkr0grfibxlOWyRWqjs/kZXIt7MMx/Tt6+JF4RO1mmEqqGFA
 LjR0UGbuRJ8WH0s6WfuVKI3Nq3FNrklOBenUxxuxWXFq6idPFy0r82GRPx7jaThtHf4ztQXuons
 D6rUWmaY=
X-Gm-Gg: AY/fxX435LwleVmEcnqCuEogrtg4tu+lWLPyAhEzk00GzJo7VhyeGV38fpGikG0b7JE
 PE/pN24iQlu20JC5gQHLdguO39VlYHoNoP+UUq0a9X72E6x0AoSVgqnziOkSzkx6eihsgXppHTN
 yvL4L2Y65uI5iXq0KRE01MUp1ENSvaibBWPhQ1oVZgEeLh5hUdXpdLF9Sp5mQsRNDo7UL7b1jR+
 pHA7x9E+Wptn17AUb6usz+fObHm+6JIceAi5EQux8xksKyc40hYTqZypiq3JYTl1qTA4S6Wa0ur
 2VAMpKpVf4v1VTo6EzdmFX8I3chjYjn8bWQ+Ur7tSH7WzW1fB+EDpRkoRqjBAxGaUUAR9kj53Dd
 YYf6cHHpUwHTzlmVv8e+7OaPz2BHJ4uu9n/q0uvtVcidmtiARmY/Ox+sIa+zaYmay3y8MOAeGvB
 Tip/KmZghZ3t1CdrX2YNopRUS/vxh9pWyDP0AlNocpftW9i54PQ+Ra/5dMpTYTAtzmYRbS+J6Hr
 w==
X-Google-Smtp-Source: AGHT+IEwHzKK1NWjc45c7w1xFKs8a9bMyHdcRloTs3wAZv1e85ay1W944ZiBzQmyAQ9A7ysug5G7QQ==
X-Received: by 2002:a05:600c:4fce:b0:47a:935f:61a0 with SMTP id
 5b1f17b1804b1-47d194c659emr313437585e9.0.1766999251959; 
 Mon, 29 Dec 2025 01:07:31 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:31 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:13 +0100
Message-ID: <20251229090719.13291-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999252; x=1767604052; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EC9bnUdtiuykTgVS6/NKjXbDepW7KVz6srGve0Lc2v4=;
 b=XIwTNK5LauZQsOi3DU6KpWCVfdg8kdwY9/6wrIOBJR8OwIGD6rICbZSqrYHZfXsjGN
 TkuhsIJ3CazyHq/9dwlKyT+pq1irU4f2VhNTCCSxtpdRrv58oVgvgP/L3YhNvZdqsF0A
 Pvuxulvj3yZpniNU9gHkn45EfLOdUpHrNVXOQ06Bkl+tXs/04PO2+au90zexwxBi1mWJ
 /aBZgRSgkinbDZbnMaX07JBNlqYVo0QR3fVtKqOKHLeCJudUjJEAh6Ux38WyhAqInCIB
 iDXPzvZOFZHB8EVEDHgniYN4PQEkTTP2Re1gzBkDWfwIRxICnpqld5lLvBzMPH8otThd
 u4tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XIwTNK5L
Subject: [Buildroot] [PATCH 08/14] package/cups-filter: add CVE trailer in
 patch
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
 ...-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
index e527b20f91..fbe2bfac4a 100644
--- a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
+++ b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
@@ -32,6 +32,7 @@ In addition, done the following fixes and improvements:
 
 - Use "static volatile int" for global variable job_canceled.
 
+CVE: CVE-2023-24805
 Upstream: https://github.com/OpenPrinting/cups-filters/commit/93e60d3df358c0ae6f3dba79e1c9684657683d89
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
