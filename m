Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3D3E9272A
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E182360A65;
	Sun, 28 Dec 2025 18:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTt4l6Lgxe6i; Sun, 28 Dec 2025 18:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFD4D60A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948214;
	bh=qCnWl9BePBREScXGMluWbtrK/VqbtWxOcbqfAI4NO+0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M24bxG4opMCyznyoBnt3uPTUS3osnSIwGaaw9NwmG6jV8KWnDbWsivEZr3iONhlod
	 WmMWOP0lk2p1SmPj/qnRci/uCrQOd2+AMcX5lweBQQH+bm6FyGiCDx+4f3wg99INvb
	 qBZhFOVc2/+rXn99AyojuEariHAX6eMSEDJR0km4blJgwt/ARA6aomqj1LPNEdVJWs
	 HfykN5s7G6MVzw7te1TdAAn8JjwfI6rGWCOhd167gMCr405FzmeH9ReY43cLI6k8zl
	 NNPV5FwfeSHznNtivkF+U222jdlTI7R7Gbkg1EPHNsd44hWq4WZNUcnWLycY37o8Ld
	 E6ZQokeE+xIRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD4D60A47;
	Sun, 28 Dec 2025 18:56:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E70A1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FE0840566
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDoe9NOA7IYn for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 504304060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 504304060B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 504304060B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so50602415e9.0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948204; x=1767553004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oP/la+vrKu8TmIZFxJzV7E+IgBG00OBbsIap9rCm7v0=;
 b=CbpNxIu6Zp7XQV5xD97UQCfvTmCiYGCZWP8t42a50MHr4yO58N+yvgNKl+IBcQdtK+
 YQCir45REJm9Vp7RBiGRtngY9ngyOQjPJ2nWLklnbaRijn8+d4CIa7UI0hl59eeNa7jA
 UlHFGyR86HYqbbdHgH3/rRFJpL5HBIzbdMziCx+awyGZYJ0x5Ou8QVHb0hxbe3+lqwCk
 vsbkOCsZ622jPXoN+9PWQzXqI86L2FeorZ6Hi9ShD191+3Dqnrzaz4/X7HUZlBtT+X0N
 D+Xn4xQbr5OVeUWCM6cl56fp9OOuFY7imth6syU9i4Pl8Iet33bZvAMXKBL13EHiF6oX
 jRkg==
X-Gm-Message-State: AOJu0YyRjrUAjaJkNdAdzzc1b/FtZh6yTd5Xo1rFM40hPu6UjpLp1jA+
 wdqhTtzC7SnWnGN8rA3nhDiS9FkluFF/XZAWFG5bsISYrjER5foNf8NWt5aOa/DLIaXsH5JaaKS
 LR6jFs8I=
X-Gm-Gg: AY/fxX5CzN+4F+wdgYahBnIg42tgq9F+evn7Z8S/2oWwn6hTmWEENqP6H1Xj2dwgl2T
 W0i0SL3gzWAptlpAaX1sW4SUcouNoiZrkSzj8yUWMPxXDCPImcpFAppSRALkRU08sR8myhRTnX1
 E8FQYpFmyIDLhGCKWxZSLIBb7gGgGFeOGZCGtYJchJs2s3UWJVWbZks0uKsVMftJt8LVRjHSYk7
 43ulTkdODffqt63a5jefXawaWISudy5+nyH32Wv6udpj/WcidUJbjJzw0IEQNUZrbOxXM7YMF6a
 V/5tgyjz+XIZlET4b9C/F4tqYkxqZKwvJrb5WZES0B4cfiw1vU5uIr476pCBLQSHKI5KkAX9THY
 sV3v0mNoKWZNZfnQ3vbXVvF58bZ4al46NF/1TlNJ5No22QdAdVuhSnEslPb2s/SjRAdLKIpMV1A
 sR8SRXPTKIRBjASb0OSEsgEE4gllmM+jZcODs/HCWRLUSF9YXtVmCebyVvIiVZfricNqi7YX32
X-Google-Smtp-Source: AGHT+IEgF3rYthEm+HVtfASXzgRlCggh+8e6biAH2wPJIcGt8M/fyE8GhMLaOWGGDnereh9E0TBzRQ==
X-Received: by 2002:a05:600c:638d:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47d4c8f4972mr87655395e9.21.1766948204075; 
 Sun, 28 Dec 2025 10:56:44 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:43 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:33 +0100
Message-ID: <20251228185637.58072-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948204; x=1767553004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oP/la+vrKu8TmIZFxJzV7E+IgBG00OBbsIap9rCm7v0=;
 b=MChQLo4UbclkNVRmlF8IX/jf3dXg8vJhdwpakKfcYkkf5Q8zI4Eu6etYrg9bJ8XEIT
 hobwl69qCfnS7Od53zhBt4loRivGdInVmgFZfsIG0h4rZsXap+kUng3CyC4iWFtvyeFD
 fuEhTpHqv0h8W5rddXqyc3mQoMdMe4NRPxOtbcrZOtcQ7F82CWdyQ27MZENWd7KylZdp
 rl3Z+CeBQru8CDzCBv6dQ3V8RAHJ8o4OjBGHUzlV1y2IP0EsygHFALChs4ruRHNxbnL1
 bjUUOwqmYaoy3E0sKKGQ8wNLY5KiAtA3LTqTk/4ikAmZvWU4fYmrCAUX8lXlENO6hYhe
 yboA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MChQLo4U
Subject: [Buildroot] [PATCH 08/10] package/libsndfile: add CVE trailer in
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
 ...14-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
index dd9f157811..cb73d370bf 100644
--- a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
+++ b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
@@ -3,6 +3,7 @@ From: Arthur Taylor <art@ified.ca>
 Date: Fri, 15 Nov 2024 19:46:53 -0800
 Subject: [PATCH] src/ogg: better error checking for vorbis. Fixes #1035
 
+CVE: CVE-2024-50612
 Upstream: https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
