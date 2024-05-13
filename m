Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD3C25B79
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A0A6416B9;
	Mon, 13 May 2024 22:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSNwLo8Rb_9P; Mon, 13 May 2024 22:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B92E2416AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B92E2416AF;
	Mon, 13 May 2024 22:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11FD21BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F29B4812F1
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtP8VdMw1RHQ for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:04:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E206812E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E206812E3
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E206812E3
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:04:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so37661451fa.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637843; x=1716242643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a1xod2PvMaNb4Y1r96kdpq3NkTrY9nOMMh/a6KuYdnk=;
 b=Jm7mlHX9yky62722jygFjRPL9wnnJk9mnzzb06CX1yN/sgHbyDYz3xe+aqPTY3V81w
 yPNyZ3KARVrwoZnMXNhDiQcLT+8SZ7zHTXJHHYY47Df6oFm7w3RkfUceTe7DndVQAhFE
 HahVTXZ0uxlzXgD2EEcqCvun877+XyBZu3txLiEubVTeUfMJZJ1WG1QpQd3laeS1EulX
 weqZ58XImg4CiU+UzPUTk3FnwKpIbKL/c1PO70zlYj6qoJL240O24b5KxPzWANJ49nao
 k3FhcMcDz7F1+I9iR3eh0SGDg1ERvvnLlvdXd2ucd+DE3Z9vIccGGL2OU+X2ykDzMaPs
 XgTA==
X-Gm-Message-State: AOJu0YxhR+QfsWKRZCqLMX/k1zrgYsp40lgrLMv+JiTwLF5FwTnGROlo
 y38uNkaAefdHkavTuDo9zPT70ytViYNe84Rq/tcsvhO8ZqOP13QZrbZKBsTp
X-Google-Smtp-Source: AGHT+IEmi9VmDMWvwa1oBXoUeFJr8FYcOKOPLKwf6Q/IV6sO0GbmGEWedF7twN05ZyYh1SzpTDHzgQ==
X-Received: by 2002:a2e:a555:0:b0:2e1:a8db:2bca with SMTP id
 38308e7fff4ca-2e5205e2972mr88763451fa.48.1715637841042; 
 Mon, 13 May 2024 15:04:01 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:04:00 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:12 +0200
Message-ID: <20240513220328.1085629-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637843; x=1716242643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1xod2PvMaNb4Y1r96kdpq3NkTrY9nOMMh/a6KuYdnk=;
 b=TX6wQWZYOlJTBVJBvjhDthqoXVIPnokn8H42t17an9DAZwYHsP9qR5qb5P/P4xuW4u
 w0rkqc3GflrDAbWgVbzuMzP46+x+aBWbs/+9LH2qL0KY3QoDEbdV/JOlq9ncCMvaFg9R
 hWLz/TaCIj7vIuvGaVTGZCRH9f7nKNMkJegDujCjzzVhemZ1EYlCBc90HNY/z5BFk325
 N/AMUre5kEspjbK6ie3umR83XMlmNkFa8oXbHxjT7ByF9YnplywN9xcZYBxoNvko04W0
 rNRzgA4/nsKAIPUP7Xp+Sh717+IcYTBixQo/fSaoQ6JHjt/Y29cOA4kfgVK3eUyCt39J
 pjTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TX6wQWZY
Subject: [Buildroot] [PATCH v4 07/14] package/qt6/qt6svg: allow building for
 host
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6svg/qt6svg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..a9d7eaef51 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -37,3 +37,4 @@ QT6SVG_DEPENDENCIES = \
 	qt6base
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
