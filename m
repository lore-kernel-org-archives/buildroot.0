Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AF7E92FE1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C2EE80BCA;
	Mon, 29 Dec 2025 21:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNdJbYp4fnLz; Mon, 29 Dec 2025 21:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564A580BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043321;
	bh=bOAQeufRH+TshPUxlBV7/AEkRSAajpCjMlNkTsNjzbs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Np7nO1UVZjuFhxT3g+mCbFKbrCJspHO8Vn5ES1ZPURwyxcy7Tgqr7K6Sx/6lzms0/
	 sZKpdyNYY41MSd3gb2ahbTQ3lvLD+ja/tByi5Blcea9ERAWuz3+m98b5OqdW6PPQHn
	 PCxXEu5lU+0QGYqXKulmhT1mZ9oqL/V6aZ2bTscVgPyokXnGxFrsunoZHR6g959uWW
	 8oQuno5i6t4iYwz8GoYQLcJQpKTLPk5a7goN41VCtMkaCg2VQHgVUSYgXlUho1g9xJ
	 /pFU3ykwRuHCyJ3jFFQakuUsztrvvrjy6K3+WHrXwaJXKHF+c5546qNIo7onJ8T/4x
	 p9DNVhJN5o7fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564A580BC2;
	Mon, 29 Dec 2025 21:22:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE1A35B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 520A760AEA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpsOj3xx3nzj for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAADC60AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAADC60AE5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAADC60AE5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477770019e4so79497085e9.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043314; x=1767648114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZkZMToTM6EU9AFVav3hVrFO4z3/UIPH+1vE5NSOjdB4=;
 b=h9a4p65pdlBnFFWIuqF+DBJVGX2a1B+WmNTjJH+JMDmXimMiYfsE0ZGMXfcfClsujA
 zgtVmc7DfMlfHYPTXtBeYLxtRaddDM+e3dkMSTL+ADT9gIJ47mijNZ1PaeQmk+YLngIs
 s/IsmMI48L2MlXUTTFcfdG/Tj0KU9GhmKbvcpWZooW4imeEIjBc6lCACNDeZUc9i+AkJ
 PbqZG7zPl9y++fam7MdAzGDTXXq9/rO8bcYNg3EU7nu9vfJ/jCxD1qLXmoMT+lx4LfwW
 NllLnAAoY8EhQb+uxZDhCA8+4ereEY6djmU/a9xPCxMZPmQyIemhSVtQa674rT1grzhT
 iDTw==
X-Gm-Message-State: AOJu0Yx+a+rUmautG7Ag69FMQLo90OFTjCeJpDTIuMDKj54YALiq5+d5
 pI+KFDXvcUs+2y8YKA0a6Rfex0ijHo6GKzuPusE8wdo9pRz1yyc6hEC51nQA3trjSi4Y/r+DfaG
 gt7gFfls=
X-Gm-Gg: AY/fxX50ceMfh+7a92Wn8fUd+Hn3Q2hwKY6fiMJVoznKj4C2+iAX1DeeGSUeJl9PmfT
 /x9hEMZf1nt4oxHlMxvbA2BGtWRT48v77NocoJkOKanJJWccoCaUDlCSBaRRJacWBXTJwSk7Ydf
 meo2Ns/v7wZK0B8iJGw2X7P5VrdNOz4S/lsZJbn1BlIhfMPo1Ax7zdPRZVUOtIqeY1i7JhpD7pD
 j1LPNtzVYWy7k6SqWqfxpyikUMjeGHLhgBiNGRZEyG3yCcfdRbxYKrIfKbjxn1ys2gp9tP/kBls
 FyjF0u8BxLs5WINGCLcsWPAmoSyd3uEj6+lXVvUwN+T95uacvaj6e+HF3WuKPs3dkEVlxodPbyT
 QDRgt+1XAGCyXOoywrsPGWaVMfyuYI0XT9WOh09shw1AJ53POqtNrqAekNfrq7lbosbr1A6/Rmy
 Dx7Co=
X-Google-Smtp-Source: AGHT+IEi8lQ5WCM+lTOvsvLiyCCYEYlc4YePVtcHAYaoC1ZGO41I35xIkUK2duMVUlOIm0cRwfkHXQ==
X-Received: by 2002:a05:600c:470e:b0:477:9cdb:e32e with SMTP id
 5b1f17b1804b1-47d19549856mr381878005e9.9.1767043314070; 
 Mon, 29 Dec 2025 13:21:54 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:21:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:35 +0100
Message-ID: <20251229212149.167902-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043314; x=1767648114; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZkZMToTM6EU9AFVav3hVrFO4z3/UIPH+1vE5NSOjdB4=;
 b=FgmaZRn+qsFcvssmH4j5QzoK2sFplET4EqIvwgJ5a8+hXVq5Fw6VJBNVLoIygd7Rtp
 PV/sX3MjGGseVkmt/WXypUUDRD3TDb0kUjSXaAu4rDZUstkXJZQWiPy424Z3WfcO8cQo
 OwJ/JZj/hJ64o7wovFg09V3+csoV+ZLtWcyl8Y8eqyw7lgoX/51InWwmkHmtQ3pkaQVh
 z4/dNjQGFVpUQ0FPhXr1STck8OEgIQRxV+Q/LMDUAzFPPD1jJxjmY5UIB0DsOGOrjzZh
 Xcn942/4CUVmQwuE5CPwMm9eG3Hl2HE3K1F/O5HuROjvbmsDdDiwOR2vWTIDvYVIcl3a
 sjaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FgmaZRn+
Subject: [Buildroot] [PATCH 02/15] package/shellinabox: add CVE trailer in
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

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...02-CVE-2018-16789-fix-for-broken-multipart-form-data.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
index 4b15f419e3..5067833056 100644
--- a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
+++ b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
@@ -4,7 +4,9 @@ Date: Fri, 26 Oct 2018 11:51:15 +0200
 Subject: [PATCH] fix for broken multipart/form-data
 
 Malformed multipart/form-data payload results in infinite loop and thus denial of service
-[Upstream status: https://github.com/shellinabox/shellinabox/pull/446]
+
+CVE: CVE-2018-16789
+Upstream: https://github.com/shellinabox/shellinabox/pull/446
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  libhttp/url.c | 3 +++
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
