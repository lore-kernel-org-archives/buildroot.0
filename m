Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E79FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 18:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD81D60B05;
	Fri,  2 Jan 2026 18:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMfMoQE6aFH8; Fri,  2 Jan 2026 18:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92505608CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767378297;
	bh=4C/pcu6GUtPaUDPhU0PH1YPLra2N9ZhgV49e8EZ+T/c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IGp0VgHyQoFfqiysLfbxx9A1zOr5Yp9Z7OYPmpk6pKJIjYPdlDACsDB/87EssLHM4
	 u+2NRKRK/nKlihLDRLtjqdHm1DFZq+DUpik/xFG5k8GGhfYqBxQtCMJNNbcBWSTIcU
	 WQzFWAXJqYE1K7+IZ0O6EWd7ZUVokl6C4jE9OiH0ZwB+WtYNl3Gr/1cLhYD9YQ/Nod
	 /wlp0oewLZ+DSIIddSyc3tdJolgwlSK6Jc6JwyODuZ/bw1ySq7zDcMZzvnCjSWcTG6
	 3VkcPb8PBmFhPNvwEaDsfbeT/3Cay4DKWd6VSw/79X5KUfYkBYEL/SplMvvzC0WRxw
	 qOuM+WKtNCw1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92505608CA;
	Fri,  2 Jan 2026 18:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 284D4351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 18:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2001340205
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 18:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnJlgzaI8UcI for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 18:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 275D8400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 275D8400B7
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 275D8400B7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 18:24:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64b9230f564so14755968a12.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 10:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767378294; x=1767983094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKLf9zYwrGliTExgirt5HVQM5OmCAm8T76Yhr1e0xmw=;
 b=Xp/DIz21+plfWU5McBVVbDclQOcKmNRDlBnyaW/QJt/4V3ldIyjnr9SOBdFHj+ihQn
 XgBb5eQvi+gbEZSUjW/P16YSI2JQyueiP3VnuYWQ/h5D8SW2G/dqFWnUwibeK87lRF0l
 ziYGZEOTrCBIA74Xjg+wNpIDr4LMIJzxqW93DihB9du8ubWUGTvUhCFY3aWw1mvxXTRi
 7ajFYk2ne1YINYBQ/MIyHtzIK415UE4lg1dkah/B4njk3hHMVA57JcFI9S57Fi0n5rVg
 2Q8JXOwb07F8NrJie1NPHEBoUxX0xm772cDT41ldxj2JecbClVPpcfWUxQtm4Z4Youw/
 0G9Q==
X-Gm-Message-State: AOJu0YyO1IlouU1hy2a3Wa/K399EqpZEisPH8zgoq0JyFE0Vlo7aA6Ex
 aZL9ayIrMdzySUNgZavWj7Rkai8ra2Gk7lXM6U58G6ROIU8om6iOreh7ib8Qt+sRPyjYiZmdQCy
 xGgiX
X-Gm-Gg: AY/fxX6TuKFeEia9JV9UoXBJdzRdXF3sUeb7zls2xkAfPLfltq1UKbyh06ssQZMsHA/
 LKcdxRqSsRWGF2XSLPMry0hV5Jk0xaUMivoA/7k7+uePL5IzJ3bm9wKReCUDv/hCAKPS3f1zzAb
 2x5AKNvG5n5hHOIHbKcNT0SZsKxH9iwhBZGU6rFy2Ef3iw2N1Xk8/WWAf5132wh1N8G5fuje7ns
 Rl+JUK4XOpliRzqkKY7JzYPaZO9eS/IBmsILKKPmXk1DyzMmD3HKBuOl+9LqZ8kcpuqgOYk8DPy
 RxIIlrLMorePR8fyDlBAx85bPEazdAmQXhnxalLQhUHTWFONv0OGI2Tpf4iA2a751no9+nX8Alv
 YAuyRIqvQ2Z4zd/504m4vqXapjkLJ9UBw9FOO+EmEBKSXz17GKTI6t48cEwBGeysmizNNFAjTG+
 74JHDWGo2rXGnKokhdBiyC2eJ5BwUtdfnNXNJlCUanQWQu8nZi5YHN2GpM+pN0h5OaGJjfAa/zl
 75Gstk8ITFRYqfnyNVDkfaJ7ar6SxM1iu3UoqCgnefdKZM2UdJLc3Em2E9LR+BLYhGqq7E3uEyx
 wby7L/2gTMY=
X-Google-Smtp-Source: AGHT+IEMi4sIJo0peBszCDyJndX7hDRLGUidt0ea3JFGd0wteMLFWNDjAC9lH2/Xi5jF/TcC6NXM9Q==
X-Received: by 2002:a05:6402:4311:b0:64b:3b80:a902 with SMTP id
 4fb4d7f45d1cf-64b8ea5fea3mr38008584a12.5.1767378293654; 
 Fri, 02 Jan 2026 10:24:53 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53c51sm45296375a12.3.2026.01.02.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 10:24:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Fri,  2 Jan 2026 19:24:36 +0100
Message-ID: <20260102182445.365668-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767378294; x=1767983094;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bKLf9zYwrGliTExgirt5HVQM5OmCAm8T76Yhr1e0xmw=;
 b=Tdoz+wGAtDPAakyUFpHTFgSwmpILkHa1FMPVbN2v65j2G8e0dp00AUWu64CkGf2xpy
 RzItPEDcf0iezHMi7GRRW6VqgKt96MB3/IlptGzTt/E/LWK5i62kJCQDgeLGWkbbdLDb
 TGoiDh0hj2aGX+unNAWPcanXlZ5ZIr0NGFae8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Tdoz+wGA
Subject: [Buildroot] [PATCH v3 1/2] package/jsoncpp: add host variant
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v1

 package/jsoncpp/jsoncpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 9915907ea8cf..319944abb7d6 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -11,5 +11,7 @@ JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_CPE_ID_VALID = YES
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
+HOST_JSONCPP_CONF_OPTS = -Dtests=false
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
