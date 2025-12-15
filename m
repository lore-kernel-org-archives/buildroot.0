Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7CDD5B872
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2036D81E35;
	Mon, 15 Dec 2025 22:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuNtPkhPHZFZ; Mon, 15 Dec 2025 22:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC0808193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765837862;
	bh=Nra92paxzFZpUAM1Z5oUu2wCDuDcjSBkvBsUK8RXk+A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOCz/1ThP0G8R6dLXQRva435+/Ur8ObYA6W67fIwCbmqGGf1mu6lIM6bpSROD8z/d
	 TSu7QRzwbQCN61D63htNvNtlh5is13nYW9AsG1WWk3m/1rLQdEHGaVh0goaqzMpxRX
	 jDYPvWhmB0X5cWy29xyOhtJoRq2A21BpZVKYFDdEGyp/ZZk9UnypzeEIYf/79vz5Tl
	 kCe8q9kRwM6EcpeokrfwSBkCNY5sYJ/UsNNm5UgzUlknRwmW9hhVrZfYPC6Sk0Hlyu
	 Jg3jVq+QWR2PFKr8Lpu12r+HaYYSR+N0+XVwBGCwYYeon300Utq1S6nhEyhZSQZt3i
	 UN26wyzn6iUxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0808193E;
	Mon, 15 Dec 2025 22:31:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE43151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81F0440573
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGVOXBMBjB6L for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8CB440176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8CB440176
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8CB440176
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:31:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-597de27b241so5047231e87.2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765837858; x=1766442658;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bIb7tcOSWPNtdlOOMZkzL0to2UQ9SZ6mTgDKrkac6Pw=;
 b=VIYrECtRYoSElIz5Pz6J7XjBrKoICM1jA9r12WYFlcLkCz1dP59RAd8rW1APJ33nHj
 W6p+9yab2Lo6tq6Q36fiGKzbEDpv/iSR2RuOaiuc/XV0xGei3+GzhPBJl5+zXpidoGLn
 rvQogX4gvoL9JBHxhUdZQAbezTomvDBFB1mII1cKoE9A0AkfgHNJ7FxaUk+JqbDmNB8f
 vXbS1ctMCe3zFSXU8XKKA6FmSyz1TEFwmR/ClRAT7CwiUfYBtuR4r6d+g0KMOttUh88Z
 yLJ5uiT3qQq3nTK/9sNo2OyVamMbj/ck0PCMzP8pLzlD13hJAcdTMpp5CMvkTqX/aA4N
 XrJQ==
X-Gm-Message-State: AOJu0YzsMdMI25VX4+Mh5cdgoaPGobOH1i2x6VB/8MdHJgGBxZelbMal
 pnzf1RJ6XtFgwKziN+MUSmIYqZqdWviJ9eFGfE5pZ++9BTa3EMODfrj2sYKaSQ==
X-Gm-Gg: AY/fxX6h0YQT9PeMNST9xDtstXmVAdXdM3HIcPGZ46uhOXxGxPX3utWp+Kc+ObbV7NV
 lmSZ47gX8KU7OoXVkPKx85JfVkpn0YUStGY0us7/AjkHg5Dp3JCT4c1tt5x1zch2XPOFBBlGlm1
 HBF3NUp0BhcbQTchG+I36ZAcTepz9Np/YlpPz/arMk3mMEps7DkoqpQaON0JlpJud4vurJE11/h
 W8HvELWG51OnIUz49VSgZxe5WCPqfdfQa+sr7gOipPH6BeuTsh0wxzihWeqOuHTbBkkcIVK+Lai
 n5PWs6lXN/uked8zwOIv3cIFg4CjTyHqjGr7HMntqgVmrX/ASYaLlpxL3I7iezNq+PzdVyvHTEq
 7WjvJOozcwcRIeDU0T5E8XOqmZdOeu151oEQF+/sE7uBltySKvBP67tFL+Xkx3fGEolnrLPtHfS
 9SkDwE0cmZ1AvK6sfx4kpQRrQgI63Gs6HeNk9d2+js0VQ=
X-Google-Smtp-Source: AGHT+IEevaj9ZW7HJZk9qi3fHCCPQijyUkIPjd92oxWejrr/FggSSbFm0SmioZi/xwOfDKrcdFR3pA==
X-Received: by 2002:a05:6512:b8f:b0:598:ee60:8aed with SMTP id
 2adb3069b0e04-598faa14a8cmr3522651e87.1.1765837857798; 
 Mon, 15 Dec 2025 14:30:57 -0800 (PST)
Received: from gimli.. (h-158-174-186-51.NA.cust.bahnhof.se. [158.174.186.51])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fdeda15a3sm33515291fa.35.2025.12.15.14.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 14:30:56 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 15 Dec 2025 23:30:50 +0100
Message-ID: <20251215223050.2231782-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215223050.2231782-1-troglobit@gmail.com>
References: <20251215223050.2231782-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765837858; x=1766442658; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bIb7tcOSWPNtdlOOMZkzL0to2UQ9SZ6mTgDKrkac6Pw=;
 b=Et1YHc6Jaa7kpTpeGkkFhdY/fN5cmKH/Bfa/nwBJGSQVvN6+6L+gB4DL0ZU76fXlpu
 jLMbfQ95UyDHIeOamJQCMfBaoCYlLQTHtRMCiTOTgddps+bJEQHUDU4TRcnHSxY7CG6l
 lpwGdE4SFKqbjol6vSlIgI8J8Vgtn14JR4RIwr1ZShiSyw5DBFK8+YsY8khXxk4WrbJw
 BZ8bum2k1Et3UBTj2dh8q6zDymADlC1MPr84go5D0zBK3N31IGRkEAQVGoX/ZS6Pcom4
 tFPpFH1IddaWy6JCmQI8OLBbeWtUD+oLrA/CjsMrGQ8101Ciyr6UytnU6WfwmMKqa2Ev
 QzRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Et1YHc6J
Subject: [Buildroot] [PATCH 2/2] package/libite: update deps, requires fork()
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

Unfortunately, parts of the library is not very no-MMU friendly atm.
The below check fails due to runbg.c requiring fork().

$ ./utils/test-pkg -c libite.config -p libite
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: FAILED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libite/Config.in b/package/libite/Config.in
index 80d29791db..516d1bff98 100644
--- a/package/libite/Config.in
+++ b/package/libite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBITE
 	bool "libite"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Libite is a lightweight library of frog DNA. It can be used
 	  to fill the gaps in any dinosaur project. It holds useful
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
