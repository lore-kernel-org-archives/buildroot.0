Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F06E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6631407D4;
	Mon, 29 Dec 2025 09:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cGMN2nMo9kd; Mon, 29 Dec 2025 09:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93AC407B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999256;
	bh=//6nwNhozHRdfO6V87Ffu5LJN/YuUWdTfdMGyQMdBtU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KOIVmo3Q0x7dVMjzjDlcI+E1rJJV8bwCkXilIGgNK9wvIDnkZk1N+cWJzoAdBT2OM
	 VkNTX/1RcDBdeUW1zTGprMAHcuVLpBRwKi/CI31Zqb0CV5uqi+AH9skMCAUo1lAIV6
	 /aXj6tFVgVHbuKe/Eq7qDO1xJJkbanJO78ptwX9Rpj+PHN24QmNTE6lHkFbaXOWuEU
	 DSM0mtDa3y+39keeP7/BrvyFjV69W6H3VePRz2m2mgsi3hi7WyY3TxElnqZQ/yY34P
	 juYzRkGuIBOzGW1S/sS/u5r0XX+E+WX2SZTi7Ui6ZhSkf1NAsy8VMuowmwG9Zd85UE
	 BKThVE5TgIC4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93AC407B8;
	Mon, 29 Dec 2025 09:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F4B1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C22860AD0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cba4XT-gRqUo for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9179460AC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9179460AC9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9179460AC9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so56776565e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999249; x=1767604049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UQiFn+ZFpwmiLUPZy1iFVsmIE9n4I2pSB4rouL4Pn8g=;
 b=MIJwcFQdOxC6nHCvZ6ZdUDIq/h8L54JxZGNIlRjMgAX+lCbmESO+q45Oif0wr8vKsH
 ANVvCNXQshW0LeBdWSsOeh9Tt7Bng33S+0tNz+J/DgfU1E91jhQ79B1A+ijxhaCPZ7f0
 60Yy2eHQOv9cwPUYL06cSo62yRhv2TKoedhDPHNYJQJnsLKVSdGBDsbDo0kJ9fOH7L0w
 IeoZm0OTowc4piRkX4KxLedBcqHy51g2L2qOzI0/OgB4DKF+KboLlZ5SS2iGAzMQk35L
 xYcIxCKng4Il9u3NYKxZdDuChUeJ6ErP1NJX3mUT/NwoSJaLF0GadAAB5ZCOn7wTlgnD
 T2XA==
X-Gm-Message-State: AOJu0YyE1Xcile8YiFsKNpHqmfyzOUxfRf6t9bMYdeZN6l2PIwvFRu7A
 +GHYQK/X6go29rl5IuuvbyEWsENJH13AVxxGgxz45WNC0n7JcUHUd59lkp5sjZQD2hbwLZNQ+gv
 ZHkUBwT4=
X-Gm-Gg: AY/fxX7Tcuad3s2GMYSc8PluX+qJ3+OA57pc/PTkGwy/4XDleboGhwP9OmBC4DzC9tB
 Iw3nowxltpftGvZBOuW3c/a/qni9o1lLhCkTFAq0gGAGW8MUy3jMfxR6oW0DMpLEYoFgsRfBd5x
 R1x17ohn9mAo08VMNp92wGgx+OqIAVPL+Dlf4o0jN9NwZZ6ENCEc8udkZMWl2YxFtbYztquga3r
 kpw8uV4DGyhYyOT6/7s+oz7ikQbmiCDuU3OtxNQB4gGov9RF+iCJsJ5bzqIK7qZXeZ2KsT46v/p
 n7CfzISwfO6zbpRoSors2RW8BxWchfBwQHBIr4nBsi1i+2VafWSlye4bGRK8q6lnoJLP34Fg+MZ
 uNoe+8uvl3CGZcBm2EGN/nvEh6jGGER+9ddCfUzKuXF/mV8vtWHYtBsmOPZt7aFYowBlnfOH5m9
 8iwFM+qOcG37F6IhHYxB3W1+VmJvJoSg+YQ7sDOho3Ec3AJ/k/kfuh0DwSFg5wRWhz/DFRM1qqF
 w==
X-Google-Smtp-Source: AGHT+IHhSBfqlb2auS3dQPSUjDV6OqFMH8k7bAveequ/zec2Q0/ABVrDsivIJr2iPlNXxBaw/ni6aA==
X-Received: by 2002:a05:600c:1c13:b0:477:63dc:be00 with SMTP id
 5b1f17b1804b1-47d195893d6mr334431485e9.25.1766999249349; 
 Mon, 29 Dec 2025 01:07:29 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:28 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:11 +0100
Message-ID: <20251229090719.13291-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999249; x=1767604049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQiFn+ZFpwmiLUPZy1iFVsmIE9n4I2pSB4rouL4Pn8g=;
 b=ILKlatmM4bOFcQiKYQe0bp8fRVaMHbyxhm7NrwjA2PBzO8uTdGlhhSA/huyS9JuJEs
 NV92+pNtUweXqb4AsL0kroYYW36ndG3i8lEGehggQcHFdtjmSjYqVy4fqHjUlaEcrc08
 6nSuhZ/PweUFOrEdAt2HlgNPI36WXWzyRI/FLsOBQUS8FN9io5PajdO2CCv23QOJ32EO
 DdMw3cQXO6TG2bvSfjCnQYoFt8kZd3zEMph9x/OrXpR+EjmTv97Vc/SzOH8Qw46n1W8G
 ibqVeTf9x4hcwUduX9zLgqw4Y1/5xxbTvrJaCaC1U8g4WaF8+mb68i0DfL0nEAkrFlqK
 XWtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ILKlatmM
Subject: [Buildroot] [PATCH 06/14] package/dovecot: add CVE trailer in patch
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
 ...01-auth-Fix-handling-passdbs-with-identical-driver-args.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
index 04b8f5392a..99a2b83563 100644
--- a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+++ b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -12,6 +12,7 @@ Fixed by moving mechanisms and username_filter from struct passdb_module
 to struct auth_passdb, which is where they should have been in the first
 place.
 
+CVE: CVE-2022-30550
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  src/auth/auth-request.c |  6 +++---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
