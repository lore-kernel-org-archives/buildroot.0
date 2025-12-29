Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E25E92725
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30205407ED;
	Mon, 29 Dec 2025 09:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npIvaimKZQiq; Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16327407DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999260;
	bh=VO0NcuB1B6G53Vo8CMDSyBIjCADFVlvjFMmr2VaMbb8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=SJ3y89JkZeWzOn/jMH/T6QYWBY5AitVZXYBQVUfPBdraewPgAWSCWVg3y3W8cVL+y
	 Hxf2/07fO+Mp9JFTgkALceBwaDbClAR9xCN1eme8lSAnkgmWVrjQ3Jk/qR7S/1QUoI
	 m6uke5rZ0rWw85VOpwHjuMKA5ziMYEn4VIVA2wfZ2uF/SFBQZuaKx4DAMn6GpT+r5O
	 5onicGJRlgHXhzIaXJDPJDPHsE7nFC60hUcDd8NzwmayJfx0qy9qqpvDXOz9BH0QCC
	 v95ZwDcOSAOqSvTNqCa51uWO7Aapgj5tB4iyZl6yeW4+4/3KrGWuS/OnM/vpUvXH/w
	 y6tIFRv00N0Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16327407DC;
	Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBB21E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D6A40131
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIWzuO6Ugroy for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A80E400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A80E400A4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A80E400A4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso55766155e9.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999253; x=1767604053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6YNYs8cwlk6bO4GwUin1ynUsj8ZacrNx7soeI58P8RM=;
 b=MxpmI5e4K+F53ti1RZpHaAXlJax9eWHtPzTzQWy3HGpGDOtMu68XA2owFNBTvqTO5s
 vYISKAeQb0uDfF8goDKZrrgmoyJyr5Zylo2gPN8IVrEc28sU4sGJ4i2THh/p/A6jLeak
 YJIDeF/GeQXYdvkFFWUXTT4oeJeOkdE2d4xRKAnX/sfHBqr5vsZvFHOPmO/3XN/XMiPM
 Yr9fkB2MQFyPa4G8vHE8BwPatftBA1sye+ewnVe10jQntz35T2ThRrn7pqJWmhLJnpN+
 lXGEZlqE+zw9FM3fw9/F1iwRLXTgBIyH1+2fPNVsPy4vV/sIxiddkrO57miX4TJW7jeg
 nBPA==
X-Gm-Message-State: AOJu0YwvzHQhiz1E4mAUbLoKTGNqY9aEq7cn4z4MxvcFx4PJDmdfa//8
 mpmJe36V6AuC9NxrsCk6WUhbZdTOhl5YSNXERB0/EzWwIOGqHeveZWS/6QWnwJPCXeXox1qwONd
 ziMlaHsk=
X-Gm-Gg: AY/fxX6XCPFVQTKynqMpfJTCNchCFaNwCfSqcUkX+FZ8y1HJBhRARNqwv/lxHRdz99F
 kfTpcj+ix3cCtfRfsWvBmb/jNP+adc1kM5hhJok/kdUvPQgquHuqX0oSe6Tn1p/BDD3HIp+vONa
 I96fGhRX7qybCo3C6XWISnbkBt5y4r7dC9TKu5i9tUJ8kjT8wXg3/hL4LDiGFKmUw97PpCQSsop
 7UiDexPv8Cv1r2VldIyPaFlk1uin7fU5GoFWVlzH6+qHMb8ycAk1ZWwElMcAZtJxMe4OzsX5ySU
 vhMkENkj6LmfEI7O41N2JnpoQLyHIoE598dZuxW4jqntTgqM3wUMUV03eJnhf8lao54xELcgKQU
 kjur49/q8TmDlFziSBplSoNX2EAmBr/RRMBJNoQd6Kjc8c2JicDu7LiEKH7WQsVQ3D+ZAGm4BQ1
 jvHqR11WoZn2gl3unDeVCo1BEyZvdUnoWO/RPVReQXr9En5J9HtIeuyoIa+KYC3GnVaeoQCV4iX
 w==
X-Google-Smtp-Source: AGHT+IH2BcfG0EMvmmHpsqQAUltfcsiinYyZBa7HBbbsT4k4kufvjn/kLgMAZLuZ64YwxemRBnY4hw==
X-Received: by 2002:a05:600c:3b1f:b0:477:bb0:751b with SMTP id
 5b1f17b1804b1-47d20423ca4mr323535595e9.27.1766999253343; 
 Mon, 29 Dec 2025 01:07:33 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:32 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:14 +0100
Message-ID: <20251229090719.13291-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999253; x=1767604053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YNYs8cwlk6bO4GwUin1ynUsj8ZacrNx7soeI58P8RM=;
 b=df7pPw6InVNr24bQccxkaivbRfl9tHFCYBIOAlaXytoDAFk9ze6shIMHbRxS3MR0vf
 HAwPuflb3Dfpnb3MifhaLEpkSnAd8Cu7nmyX+ignlY+jAigZf/mrEJ7mJGE6ZoC1cm2L
 317gzCpFSDD5IEli09IpYm6tzRhrDDD4AgSGEETKaKoCucNMk6rpAPGJ7Pucn9NVV9Hs
 CjJtOdzrOoAzj8CDpowiNaF67gPCHdiApqMBU/wgdt/eSEz8vvn0lf1j7jedY6nUnSY3
 YP6jFvAuTRh2dJiHsuQZ8ta9Rm0PrXLSrl5pgNU+K4Pu9Ouks3H3i8be9J5Xf0ZSFwgE
 zgaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=df7pPw6I
Subject: [Buildroot] [PATCH 09/14] package/libconfuse: add CVE trailer in
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

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Fix-163-unterminated-username-used-with-getpwnam.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
index 9ff3f5ec1c..4c2aa114aa 100644
--- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
+++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
 
 Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
 
+CVE: CVE-2022-40320
+Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
 [Retrieved (and backported) from:
 https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
