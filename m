Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A805CD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 16:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB0A81003;
	Wed, 17 Jun 2026 16:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXH2xfyqzn3n; Wed, 17 Jun 2026 16:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545A680F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781712823;
	bh=rEzLud2CrVIq5nmh/x/+/TSwcyADiYudjwiEg1KpVgw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qYMzJkPnAcn0VDvtXoW9t22OsNH2Tn5ruZuFNzfvJsvO/fz1MKAbonmcWSOOGKNm6
	 nU6YBQYLGT0GqykdYYbk17PVPEFrS0xcthYN9fAt69M0p5jqR2VOnt5Jwf/9F5O7Os
	 HLG7PWUd/gr0u91JEjhKtdFTR3YPjkjryIZTamXMunlo7llcF5qc4J9+Tx5QEGj9Xc
	 XRtCkskRRs0bHSXCzO2CfahSLNYr3uizYfzTvazEcZfAd/2hVb7ww8DClWU+VsqbGP
	 3EW4pF2IkBm0o/GbrtgyThxeL9pv/HQPPKPwBiicnig/rViM0KurhbpAr/yDglxCqC
	 gFK0uxNMfYQKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 545A680F64;
	Wed, 17 Jun 2026 16:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C8BFD8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 16:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ECDC80E5E
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 16:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MOBSswL7oSh for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 16:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2184880CFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2184880CFA
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2184880CFA
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 16:13:39 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-695737cf38bso1213959a12.0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 09:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781712818; x=1782317618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvO3zckQY9DT9Tg13APMm/Jtc9XK7cEKRriN1EH8Wtk=;
 b=mv6Iz7vUlxvHRlZhfkkjBKPhpiW5LhT205mkCtX+uZuZTzoYrkCM5ySRiNGyh+/dpd
 dPQ9zlJMRaYqOH3trowMKXu5Ywg+jfsTLJPe7x62jrcFmJtWjJooK5tqa6klMfGWP+P/
 sh6zOjRlxhWsx60YqHF7W3eXXz5BWmWpd8j/sro6zf9Wov1xM/2udkkGHAMnnCWWA5Vf
 SEBcOfS1Qhp9iCbJGBy1QpCxJa2Np6xUTzdCv9ggqV9KR+KRKBReMfDApwIbI+ZqzuqZ
 IYGD06f0j1jYgCSglpI/UV2G/Ga9PPrKU1Hsw9veZm91T+Ylrfv+VDe3kZxdC9N/zZfs
 AjHQ==
X-Gm-Message-State: AOJu0YxUlIJDtU0Vd3FEZnmS6uh1XRRThvehB+qhniE73gjhMNBrQ5Ee
 BFoxE0p0fTMHfVBSTwsJtuYleap3w9GA4Tvu4Rdd7q2043L4IFpbOmCWNjc7
X-Gm-Gg: AfdE7cnSiYLLn39Duea1WYtAS8+3pllxXClrNZGLJOt0XBFJwg+q2jzXmDvOjPYZcHG
 oY2GQHQCYFeTyQSlIeSKd0lhOQI+hw/wL6f39SSp8S71gIn4ziVL7KLSzomGNGUjpjfusC6jmSF
 LHvy8K1ElqPhQRMYJydZnbL8xxuQDAzvRtWAqsfwpDSOBclEECE3fZSnkFE1N8O3+qqn9qKzugA
 BDI2AiLqsMfXv0SUUYggahNPabVu9lDCXVa+wAGA7tMXLxoengqgK9G1xmA02VVJFHO3Da8kL0E
 imYO5zkPHnlDTGUStGC7std1ybOfi4OftnBMOCdd9E+XpTNZYtvJs425tGymupSZMSR/dEVLwGN
 fGh+OqbsNqy+YLb333P9TF2vChGsrOmRN0mWKUmJAE76vujaf5uIGDMcUv1ERpqbar67Es3w6hd
 w9DpYOUzYt5UNkQi9FdMWJdW7frUM=
X-Received: by 2002:a05:6402:4150:b0:67c:a6d1:c48b with SMTP id
 4fb4d7f45d1cf-695471eb26bmr2828746a12.11.1781712817658; 
 Wed, 17 Jun 2026 09:13:37 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-695647013acsm1099736a12.11.2026.06.17.09.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 09:13:36 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed, 17 Jun 2026 18:13:11 +0200
Message-ID: <20260617161331.141666-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781712818; x=1782317618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NvO3zckQY9DT9Tg13APMm/Jtc9XK7cEKRriN1EH8Wtk=;
 b=mRHi/Y9MYbjmDWGSl+AnOO/nhDVMqGrBQ9d738EmdphjtMFjn31f9y6eyJyh/vRZ8I
 nkzQjNQJWdAly7fX8pZStYpdrphVwGnc4fZV1q4/1zxVif9ydNCV24fblCAohydd/o9W
 K0Vo6LvhcZqomZnk/lTmp9lTM0I+Fi+e3p0gw++XfxDg6fcYWsHRgilfwIa0pHJwx8Tb
 DCrZ9HSpKoj4GJpDRNWwkZR6lmEw4JkHgwjXQxTUu5UrC0NKHFLZw7i+n4faIqK5FwbG
 8sVnImsz1/rnxVb4o/5imlG8y0WA/4K2VbtI+v9TaHAM08LewX6uCW66AldhTKLLc9Sh
 BpZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mRHi/Y9M
Subject: [Buildroot] [v1, 1/2] package/aichat: require SSE2 on i386 target
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

The ring crate enforces SSE/SSE2 availability on x86 at compile time,
leading to build failures on targets where they are not supported.

Add a new dependency to avoid selecting aichat on such targets.

The failure was reported by autobuild [1]:

    error[E0080]: evaluation panicked: assertion failed: cfg!(target_feature = "sse") && cfg!(target_feature = "sse2")
    --> /home/autobuild/autobuild/instance-38/output-1/build/aichat-0.30.0/VENDOR/ring/src/cpu/intel.rs:26:9
       |
    26 |         assert!(cfg!(target_feature = "sse") && cfg!(target_feature = "sse2"));
       |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    evaluation of `cpu::intel::abi_assumptions::_ASSUMES_SSE2` failed here

[1] https://autobuild.buildroot.org/results/c38a21c80490d5012c5b7bd926e778b406b5f26a/build-end.log

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/aichat/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aichat/Config.in b/package/aichat/Config.in
index e1bd177076..f828f4b1c3 100644
--- a/package/aichat/Config.in
+++ b/package/aichat/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_AICHAT
 	bool "aichat"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# i386: needs SSE2 for `ring` crate
+	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE2)
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  AIChat helps seamlessly integrate different LLM models,
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
