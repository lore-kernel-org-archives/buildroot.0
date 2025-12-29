Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522A4D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2642A4080E;
	Mon, 29 Dec 2025 09:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixvFTkAh1rGf; Mon, 29 Dec 2025 09:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FFD407F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999268;
	bh=8iPALeE4asQRXgfsgzZb5SYD4IqXtugestmQ9tI+LqU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HiRxSPYETe8ne97AVVcwiZTeOB32Sj/Ecy7vmO3ndq+C9KPyU9HGmJqXcOhJFcTW3
	 KF69h+bUkOeMZbb/C12dyGxvVQUAsaSkKXBhCqG4nVa5pP+4Xco2LOh9XV4+PLBVOJ
	 cs7ZN05O+ZL0S34DVgKwDr/WmEjm0opy7MvOCXtMUTvXRZ7MM56PYZ0UpOS5xjOAro
	 AagCnHwbzFo2roOb0dYOdoEYi0WtOCdCdZgBIvz5/42GYh1clJ7BbJuCeAhWeoL2ub
	 bHnevgzNUz8aYs/r8Y+0VjwOk875Gi9FbMOhEPx91g1fpNdgkMf9HDNu+YqH7iJy7W
	 9Xd4PkQLxaJwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57FFD407F7;
	Mon, 29 Dec 2025 09:07:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 358F81E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11A7B407DD
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsUdPRuKTHcJ for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9799407ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9799407ED
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9799407ED
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so53414045e9.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999259; x=1767604059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xEhpcuTqBAFtKFOLLwSbviBXygy5wglykqAK3wpK76w=;
 b=GfMI9dqUZee235+dhBtBy77qylJXuoxcXhGMQ9PuHzrh5FN8phQ16xcl7X5p2j5LU4
 R1sNWHdPDlwWMs/BxfDz0/0RD2oN8OFzmfKuWnj+/EaOQ0OluS8rx+kw9KExqKH82G9v
 JIIhf4E6eJ4vlxXx+X1eUs6dsL8uQ8nUFNAPpGC3KvuW2oejPA9fLt9/POdzvtfkR833
 qT1LlSYCZYfypvuWX/aeTslYgCORxUlSZkNjTWOZc9ET2g/IzDDIipvpUd3HTn4ysg6m
 KNnztZYMkfFYBk9i4RhU8I7ZOcy8vGBuX1W2vjhpW7YvljWotPZ744rXeiLm0sSIzz03
 V6iQ==
X-Gm-Message-State: AOJu0YwkOF5DgxzkZxeDAdVcuwzAy0tyuXq3MDtL6Z/Xcn4HjvupgAvN
 O4dXIV1Q6SQJ8kx0urdq59hPNLq/ilt4yCTEiw6UTdSUsJ2OiiPBRGmb3yG9aFY7wTQdQSgUHmi
 IUFDko1s=
X-Gm-Gg: AY/fxX64PVgFFKmCwZaN+MbQ4IOXn77aQh8Zdgg3QPYe3mNIhHz4X0ZfaD76FzZlnml
 LK4izoYU8SwjIUfhHlKPcOs9cULDzmy6MXTX1bzNJ00NhyCRFUntDIEfp3uEbYK3wKXzFWZ4MR7
 5TzMBMExX7dcSYSeFfwchO8axAHkF7GYixU/oYVmw4u/t2PR2TZEYa7i/sU4tO1dxNlxWkq/4J/
 zXt6nPKZn3D24UNrF99Y3qyrxfYs2dKFOUyL79EtHT3qetmRsddUcdvbTEgLqFnhzR2LvAO6FTR
 hNMDoV1KjXpHV84w/Rk6nRyFfIiLmg1L6jWlTUrGEKIMnGkUbFmjULjqe0iHTTmozB00o1PNdOY
 upLeF1V9t/Izpgf0VVm3Sfkcbs9xAmLN0Q66nIlgzTqZoOxkUniXFWT7CMpWiQzNIblRuCBg2Og
 kXGXBGI+8bSCDMTx1dpVhIlIChb11kVe3ZtYjCbJUNzD/oGfkewYiypYbB3NfkztCkRjvHLKhG7
 A==
X-Google-Smtp-Source: AGHT+IHIdjkN8Uu9UZ2unoADVQaCOChzBWpioGIKiHtBStnkoczeBrAh1v608nyxYRYgVskm1G2f3g==
X-Received: by 2002:a05:600c:4506:b0:477:79f8:daa8 with SMTP id
 5b1f17b1804b1-47d1957da6cmr357546965e9.17.1766999258726; 
 Mon, 29 Dec 2025 01:07:38 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:38 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:19 +0100
Message-ID: <20251229090719.13291-14-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999259; x=1767604059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEhpcuTqBAFtKFOLLwSbviBXygy5wglykqAK3wpK76w=;
 b=YfuHBfxs4qaoMm4n2V6bCjJHYNCdiXOKnbXD1x3gClxj58K8FYiM8dqdU1lE7KpaA5
 xXvavt/9RO6BZ6T6XanMBh4GzD3GB6VpaRdTq4dGd+Et/N4cafTwqx0RVVj0i+2dPPoz
 LTt471aas8j+aJBlWL1boA0TshVC3VrYApIMAAZ7yKbTV2XVu8P4NY2wi3aYSqUqADkA
 Z05qThjbHYONpf8bNQYGasV8pM07z+RQ3Ne+cbuwI4jFHOMoghg2Fpr6CqYiSsokfAo2
 vaY8AodnMPBa8tjAcD3zVpcikuQF5E437gncGpCYLTeWAr7aoSyiDyIncSNwE1csdFKi
 hTbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YfuHBfxs
Subject: [Buildroot] [PATCH 14/14] package/mupdf: add CVE-2024-2425{8,
 9} to IGNORE_CVES
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

Buildroot commit [1] removed the IGNORE_CVES entries for
CVE-2024-24258 & CVE-2024-24259 because they referenced a patches no
longer existing.

Those IGNORE_CVES entries are still required because the CVEs reference
the exact mupdf version Buildroot is using.

Re-introduce those IGNORE_CVES entries with an updated comment instead.

[1] f2e442a14d package/mupdf: remove stale IGNORE_CVES

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mupdf/mupdf.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 9eecb84232..57501ab954 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -21,6 +21,12 @@ MUPDF_DEPENDENCIES = \
 	lcms2 openjpeg \
 	zlib
 
+# Fix is in libfreeglut, but CVE applied to mupdf 1.23.9.
+# Buildroot libfreeglut is >3.4.0 then is not affected.
+MUPDF_IGNORE_CVES = \
+	CVE-2024-24258 \
+	CVE-2024-24259
+
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
