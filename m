Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5ADCD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A084226B;
	Fri, 29 May 2026 09:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8qMxBcDlZo6; Fri, 29 May 2026 09:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C50D94221E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047922;
	bh=h0giluayTZKYcrYMQdo1Kma5/G0v9CMgn7m19fNQk3M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Om2mW6lJ8doP9hLHAKDv1pkUu2GPZmuf07LVVCigGpfV0OxrukTV4nfuLlJOmTFOx
	 1sz3h1bbQkupil9VeVVxceCvmtUgkDs0JOnSMC7QDvVSfxlYCy67gvXUCOQOgQqqdA
	 CBVD9zKU19YplvpxdwZfEYYW/G9pfQ2zpNJFNa3tw+GFSMQl1d6sHUFcZRofKjbKs/
	 F/+KEpj/yL98hm4UvyRSlmVMyYOVmPHHmj6rxjTOQX/S5XrUMqGzjhrxlJ0rIJFbi7
	 wK5BdiDzqxHqsyy4ob9g47T44PkUqViRb3ELwmnX+3wB75YNIbcs7E1VgQ8cKw6IG0
	 ghLlbolLSBqiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C50D94221E;
	Fri, 29 May 2026 09:45:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 481B8F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8205F61398
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOyUSy2bNVmT for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 791DB613C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 791DB613C2
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 791DB613C2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so91790615e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 02:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047916; x=1780652716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mx83CmXJOU1Jgoba9PvcIyauUBWaqu4LXWScyYA4wfU=;
 b=Kr+DflwXpS6t+g53U4ca870Hu1l2mTsc16lQ4ewr4UCIY8L6nORsUoFKL6xKt8l3pA
 IXS2G4aSihvRwlFhTsB3dgZvWer6rMhIP2nI799PEOHXX8xPv//m6hMErJmOu2viQ0Xr
 c4XmfmMCwAUVE0HPY3bd10piQIkVK9kzYW6/6TeFnGy45Hq9NHbrX2C9GsPSfx1FbeOu
 b5WdHR3l1S4MAETAJUR/e5mYJmCpnB/nDyBLD/0V2Q03VRvAl6IHiZI8nn57d94sVs8e
 k/ACjPdIEpwZgtNG6S2qeSht0mDwFnKRintMaIZALalfMtC4Uf7jWYaJDs6QWObv3ukS
 PI8g==
X-Gm-Message-State: AOJu0Yy4mXuxtY55q05s/3D1shLLW641/rLqhpLWxhl3ocdci9yjUf5T
 UyNGdll2PDldsfb4UtbLxN16J/M/vPJtD8+z8s5RxIf2OIE0gQWGM5lsggueMPwjV7jnApk+AYR
 w4FlA
X-Gm-Gg: Acq92OGPbIaSb91AiXMtzzMqBeEGaFgWyGhTHw6pat/8B5oD1JgkhUXeVe1djNRI6nP
 hbRF79q3AP9+8IYA81g/UsAtp/CHqoW0yTVWgKN9gjO4dS1MO4hX2SL6tgslhc+CpFaaBeyih6N
 MkB+/Cs/s0IonHgD3oZIQoVF4g9AOBgZvSxyArYuw40aPqw54imI+RHFScajCFmSWs7j3pY3Qts
 cTWR/aHiDAR0rqtmmAsK/ioufp/4XaUNMkGBJ7WNtrF37CYu4OZQGTQyDqSWl+nyPpogr3OLcNs
 l2AvZq2JFGMJO3LfYiA+pZkHabwI0EM7RwAGBuXjpDia7ZN7DTUqgp9W9UXbnC9prQeMUTL9Vfb
 qz24xk5RArnPzqHNLAjQmagP2sKoqbodiIYMpEk7YbPy888ndvtMen1PrDoi/J2kJcjqv/VS7ML
 twLLelk3NNxMGCgOFVmxE1jQh7wnwBJFfo4oLmJzT62mTU0OlCnMLXV90l1A==
X-Received: by 2002:a05:600c:6c01:b0:490:5149:a242 with SMTP id
 5b1f17b1804b1-4909c0916a3mr26787065e9.5.1780047916400; 
 Fri, 29 May 2026 02:45:16 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm14349985e9.5.2026.05.29.02.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:45:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:45:10 +0200
Message-ID: <20260529094514.178266-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be>
References: <20260529094514.178266-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780047916; x=1780652716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mx83CmXJOU1Jgoba9PvcIyauUBWaqu4LXWScyYA4wfU=;
 b=du1EHLv4n4fkYHpyKIx0HePPHL0OIUTo7IxlJkS9AOHkdjKq3MwnA0y/1KRbeOr4vt
 V08xClYo1ae/Xz5zH1GC4PSQDuyQQJvQyzqA+I8N3qFhJthVxmfWR+sbrWOb+bV/yvp8
 gpM6BY28/OitZzzRo32SGuFMuPD3uGFPnx2C6vHAc8xqOEvFZNo1twh7HXFttx/iU5PO
 RxS+DKjNWG6GxNQyv/xiOxJaOvMI74wtpwBaczPLUK2NxRQNT0CdkB+JmCqxrMLEOxLM
 fPQYDoUNRUlPu6JTOeyUvbCK+yanNVOjkqPzu0n1mkrQBXQk3L5/9nohXz+eF2mFlUig
 nsKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=du1EHLv4
Subject: [Buildroot] [PATCH] package/redis: update CPE vendor
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE "cpe:2.3:a:redis:redis:*:*:*:*:*:*:*:*" is valid for this
package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/redis/redis/security/advisories/GHSA-c8h9-259x-jff4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25243

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 6ce9933029..9db7226675 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -10,7 +10,7 @@ REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
 	MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = LICENSE.txt
-REDIS_CPE_ID_VENDOR = redislabs
+REDIS_CPE_ID_VENDOR = redis
 REDIS_SELINUX_MODULES = redis
 
 define REDIS_USERS
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
