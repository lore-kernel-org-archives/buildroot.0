Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8DFCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74B8615DA;
	Fri, 29 Aug 2025 10:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esavxdQEzLLB; Fri, 29 Aug 2025 10:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8123615D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8123615D0;
	Fri, 29 Aug 2025 10:34:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04F326C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0240C41863
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 390qK2sMrykf for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3953541867
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3953541867
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3953541867
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so271785266b.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463634; x=1757068434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XOKpCajb9F3GRn96JQYw9ZubhBjqGY7qUtCvQZuSS8=;
 b=IhoWl7ZKWtYehM/B/crac98OOeK+SW7F2YW/Le2yn3SNXw5w7Z5IyHEQLiS/wcFDoc
 +D51syBEY+YdNZJkTyvRd6hdZZ+niiRQ3lJD1f5Aiyazjq3e5FBrgx3uJM5gfCWye3In
 /ZEpuPuzwJPyOxsEHmHAp/HuqUnWjTCtN+TRYBDPNcZLeRDuBORgaqIXb+vklKPAf+fn
 Cca21evTI82fiqRlr3geGwAZ5/Wp+YJCXIt6urFHeoaM4KSjH+02DS0YzmTeSDMply2E
 Eg3wnYGnx/AMr9SBbo62SmtA4OHk/hPmoo66HYkKbjf6QGVyQTdgNVmEUf5LtUKt2aoT
 9yQw==
X-Gm-Message-State: AOJu0Ywha4PBGCm/RecJDuKTMjjevQNKIWrqQ6Nl9RfB/5E1Knf/EehH
 zLNmyNQa1+num+B0u6Ex1zPjQSoVax6A0GJTwfrC05Z4jDOeKD29m7lXJ6ZW+LNl1yR6ur9v/j2
 K/2iOVvs=
X-Gm-Gg: ASbGncvSCQGbcVOu5x/J7c+F3CAvjlRhxSPYMMaFWzMfbPY0fayfbChdHVZeAiebt8c
 6iKgkj+Y+F1TF2ByjxonIsAtVz/zgBHP9BFetbgTiezweJj0TFNOz8iz3E20MubLMlXLvFgE5Lb
 llTlSj/bAk6iFFvQL17QPGAryKzIZsUau/7FvJEJiDs2a4ey795xgSXQ7bosegq4Gnx+KCVjTU1
 3AWAlSaZlhnA5pmFgQPCyg+zE9NFAgldwSm1p4LglRXF3WxNaejxfBdz99ddlbnXVlT9JpqDvcy
 4IaJbWCFyfeEnmwjrSPvmWY5OoNB17PwFfddH5s6iAonS8ZQZlfG4kzMEzVQjC7vX3zySMk2ppc
 sChVLDpzFTEIhmqwXs0jsDR1X4wDRq6z2AM1JCiZwKk31USZXFsv5LTHNPKxKUg==
X-Google-Smtp-Source: AGHT+IHn3+KVlGqGnJZscwq31SpsOT/lzimap1u7G2rSgbdg8Y7QDHm632j5Qarp0rRJUFkC6D1t9Q==
X-Received: by 2002:a17:907:94d1:b0:aec:65d1:cc30 with SMTP id
 a640c23a62f3a-afe294436camr2316944066b.44.1756463633627; 
 Fri, 29 Aug 2025 03:33:53 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:40 +0200
Message-ID: <20250829103340.158873-15-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463634; x=1757068434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XOKpCajb9F3GRn96JQYw9ZubhBjqGY7qUtCvQZuSS8=;
 b=RNbw12Zgc3MO9RRrp1PGzG/yP3IoCTSqwQJysk6K7htxfNUixihBNqJSs1MpQI3dGy
 DC+r9ZZdN6RvnNUugI5GzGbAYe8WtGmRdHKbCAiwqMma8EkG0dv12s/hfDxcq7GlAGpl
 4nmZ/6nihY+8aFEtz/4dZqtAtxR57+F33B0ZRwvNOyeZldmxLYLngIT7uXx936FNL0ne
 vIbjW+7vZAN27+3SRU3Jcbr2O+gihAXTou7V26uD8nnKwkfbzqsTEcnXjh/4fQiyqWHx
 MXFTVRfZyoT5rlCPoebz+Ghk4S9uieUhkD6ofCl1RudCaQr6aSnvZ/i/Nr/gC0u7uEP6
 gMhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RNbw12Zg
Subject: [Buildroot] [PATCH 15/15] package/duktape: move submenu
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Simon Dawson <spdawson@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the introduction of duktape in [1]. This package has been present
under the "JavaScript" sub-menu.

This sub-menu was mostly used for JS libraries and programs so duktape
should have been under the "Interpreter languages and scripting"
submenu.

Since duktape is not the only entry in the JavaScript submenu, move this
package to a better suited place and remove the JavaScript submenu.

[1] 387ff26b6d duktape: new package

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 45434f411a..ac4a96788b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -673,6 +673,7 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/4th/Config.in"
 	source "package/chicken/Config.in"
+	source "package/duktape/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
@@ -1890,10 +1891,6 @@ menu "Hardware handling"
 	source "package/urg/Config.in"
 endmenu
 
-menu "Javascript"
-	source "package/duktape/Config.in"
-endmenu
-
 menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
