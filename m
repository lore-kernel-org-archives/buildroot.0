Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51795D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24B2D80D6C;
	Mon, 29 Dec 2025 09:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YaEi4oUTQre; Mon, 29 Dec 2025 09:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561DF80D58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999263;
	bh=+k1fJD7Xv9Xqe/KZl2Q/gpVQXVjPunDwrLljOfzQ6DI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IxNN/I0n7CqY+CAz7G94YfIVVa7JWm7TzaI4C8HHJFImQpDXqp6+aHjsYLzks11Cd
	 EaWLzFiosVHAdNpzKI7W5Q8JH6BCyeFcmkFkkzKRSMtUuJ+/oGqqUyQy6zIXN1WX0d
	 KUSnnMKviOUcpIdaBvkQVCE0HVZktPqeAIn2lG4MJDT1R1ajzLgvMtsCEGKn9IhrNX
	 97iq7ui27ezI2mgJmrpjo/DDb9aBR1I+1/JMNPKNIRFngSGlgfHJmkbcAr7VRxsJWo
	 NmkGRSbpifhPrjQ4eX8l2J6TddnLsd+3oPRGUDxfQK2iCaLK/ciEfrYTsrLl4BR7uW
	 GvnxXUtfv6OaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 561DF80D58;
	Mon, 29 Dec 2025 09:07:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F635B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65E3440131
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH7xjVozPuM6 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 853E0400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853E0400A4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 853E0400A4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so9877105e9.1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999255; x=1767604055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nw2yszoSPXLmhjNNwwhnwYT0Y0K3m87HnDiIDhybELg=;
 b=a/QOItZ5DqQ71gE0Lj43pb9o3ZDf5VYVZQPT/P890TIhhYbJHuvYMwDCWngsjqNkfE
 6TXeLLSrvvmWz0x6Dkv0A21YuxFejJuT9KemkORBhvCpo5jwipt9H5oo9GCfqz81vUmy
 VRfq4cGgaNY6h+0dg2aIAiFIcXGYsUMwYS9H6GPrTLQvXuSSA5pBiff6BqzhZbEjfzvq
 P+DwT7Slh0lvkeM/p8KFKMDDSvQ2riDpA91A6gQsjIr1AW2PMZHXdnOhbVsyifNtCoAR
 uFrLu6PleJLLFKYpmWW5CtbWJidQYNbc/zfDI28Bd3pmGWBgXMCLTZeRC2oyIpo3kJCe
 0Jrg==
X-Gm-Message-State: AOJu0YxJTzmOmJOsj8HFTwCnFkCz1k1eQ7iEDFY7O7Ez8HPFBp8ldbyt
 XSReJT/iFyFg8HV5I2Yp1VuQmN784Z0dHWoqm7elXhFl3H/vnUxpfgfMmg47T5P6bQ7W952eSjX
 OVSSR75w=
X-Gm-Gg: AY/fxX7WT5wZ3B3VVbQIVgLTNd0MpaqrLP4TUtqbhzjlc3O/6ZvImTuzT0LcqlCz/wy
 LOLSd6Ja4d0+X3y8xOx0uQqiA6LLOcbs+L6nGiyW2h2MGj4RfNIOHYqnsVeewLPnjHk8E+HlySC
 r9FCv78kKM5r/kso5VNt9gshNIucS5ycTPOZ2m2PBd2syPMgeh1KHXfMBFkBiEx+WFWPzDhot4L
 A1eRdg7HxQiHDTUzDnNp7i6k8LTetKaLj9LWhdhvgN3ISUM6JKJIQTB6W01x1w93L/rQXnldXA2
 BpYXYJMA9HdA7LEYmRB4oAl9j8mNk3p725rzgYpMMWUDlsre7xVxD0tVtV9eCrsjDbmkmneh66c
 CeLoxrUY8lspTeRCZiSy3QpAZV5OgeKne+4vM9H8FgrDjvtF7CEN4+v3X1sXG5XdwpIVtigI1Jw
 3W2+VYfTb/IL/RfBwYrZk/VIwsRUF9WrXfl2/nWGhnglCN9k4gLRF0cWNQ3mdo3zqj3JuLnQq8U
 g==
X-Google-Smtp-Source: AGHT+IHQUkvMA5tcAtPqfqwThT0vn1bFVbijvcdLFUVhIylZtZW79dSZLJWvbjVukp0U/HDeGhh+Xg==
X-Received: by 2002:a05:600c:1d1d:b0:47a:94fc:d057 with SMTP id
 5b1f17b1804b1-47d19538d98mr270551695e9.2.1766999255343; 
 Mon, 29 Dec 2025 01:07:35 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:34 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:15 +0100
Message-ID: <20251229090719.13291-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999255; x=1767604055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nw2yszoSPXLmhjNNwwhnwYT0Y0K3m87HnDiIDhybELg=;
 b=cEOroM9ST7P74VHAdHsxMUEfWB3u970nOL5lEXPo3U49ltPFgoEwINruUMIQrCQQCD
 RoLJdMRgonuDJoD9TUSX/KwzcNEz3K+oqvtFGR3Dv7meZb+3ZomedL1us4egqzgbXOjg
 t1uU+X1KK3aC/rX+r79RZ6hlOt5WnYmRImArg/7L9pXl0pcevJBKLOMf2nCYLwZk65iB
 MbusvlY3TXLwet4wG107yAZjhh4pfG3Ycj2ocTjUDR+GaTV3aB5Ix43EooBle0KFu2CF
 fC2r4YbZuREhizy5qKjmHD/7ImyCQ7m3kyWvphUb4Ew4ampUhrOq6cYFuS5gOtKXWFYe
 bFSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cEOroM9S
Subject: [Buildroot] [PATCH 10/14] package/libtomcrypt: add CVE trailer in
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
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
index 91e2145853..adf5020049 100644
--- a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
+++ b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Fixes #507
 Fix a vulnerability in der_decode_utf8_string as specified here:
 https://github.com/libtom/libtomcrypt/issues/507
 
+CVE: CVE-2019-17362
 [for import into Buildroot]
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
